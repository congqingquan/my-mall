package priv.cqq.goods.seata.tcc;

import io.seata.core.context.RootContext;
import io.seata.rm.tcc.api.BusinessActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import priv.cqq.goods.seata.GoodsMapper;

import java.util.Objects;

@Service
public class GoodsStockReduceTCCServiceImpl implements GoodsStockReduceTCCService {

    @Autowired
    private GoodsMapper goodsMapper;

    @Autowired
    private GoodsStockFreezeMapper goodsStockFreezeMapper;

    @Override
    @Transactional
    public void reduceGoodsStock(Long goodsId, Integer num) {
        // 只会调用一次，无需处理幂等

        GoodsStockFreeze stockFreeze = goodsStockFreezeMapper.selectById(goodsId);
        // 处理业务悬挂
        if (Objects.nonNull(stockFreeze)) {
            return;
        }
        // 1. 增加库存扣减流水
        GoodsStockFreeze goodsStockFreeze = new GoodsStockFreeze();
        goodsStockFreeze.setXid(RootContext.getXID());
        goodsStockFreeze.setFreezeStock(num);
        goodsStockFreeze.setState(GoodsStockFreeze.State.TRY);
        goodsStockFreezeMapper.insert(goodsStockFreeze);
        // 2. 减少实际库存
        goodsMapper.reduce(goodsId, num);
    }

    @Override
    public Boolean reduceGoodsStockCommit(BusinessActionContext context) {
        // 删除天生幂等，无序处理幂等

        // 1. 删除库存冻结流水
        Long xid = Long.valueOf(context.getXid());
        return goodsStockFreezeMapper.deleteById(xid) == 1;
    }

    @Override
    @Transactional
    public Boolean reduceGoodsStockRollback(BusinessActionContext context) {
        Long xid = Long.valueOf(context.getXid());
        GoodsStockFreeze stockFreeze = goodsStockFreezeMapper.selectById(xid);
        Long goodsId = Long.parseLong(Objects.requireNonNull(context.getActionContext("goodsId")).toString());
        int num = Integer.parseInt(Objects.requireNonNull(context.getActionContext("num")).toString());
        // 处理空回滚
        if (Objects.isNull(stockFreeze)) {
            // 新增已回滚数据，以便阶段一的 Try 中可以以此判断业务悬挂
            GoodsStockFreeze goodsStockFreeze = new GoodsStockFreeze();
            goodsStockFreeze.setXid(RootContext.getXID());
            goodsStockFreeze.setFreezeStock(num);
            goodsStockFreeze.setState(GoodsStockFreeze.State.CANCEL);
            goodsStockFreezeMapper.insert(goodsStockFreeze);
            return true;
        }
        // 处理幂等
        if (GoodsStockFreeze.State.CANCEL == stockFreeze.getState()) {
            return true;
        }
        // 1. 增加实际库存
        goodsMapper.plus(goodsId, num);
        // 2. 修改库存冻结流水: 冻结库存为0 & 状态为已回滚
        GoodsStockFreeze goodsStockFreeze = new GoodsStockFreeze();
        goodsStockFreeze.setXid(RootContext.getXID());
        goodsStockFreeze.setFreezeStock(0);
        goodsStockFreeze.setState(GoodsStockFreeze.State.CANCEL);
        return goodsStockFreezeMapper.updateById(goodsStockFreeze) == 1;
    }
}