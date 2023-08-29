package priv.cqq.goods.seata;


import io.seata.core.context.RootContext;
import io.seata.spring.annotation.GlobalTransactional;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import priv.cqq.entity.R;
import priv.cqq.exception.BusinessException;
import priv.cqq.goods.seata.tcc.GoodsStockReduceTCCService;
import priv.cqq.util.HttpContext;

@Slf4j
@RestController
public class GoodsFeignController {
    
    @Autowired
    private GoodsMapper goodsMapper;

    @PostMapping("/seata/reduceStock")
    @GlobalTransactional
    public R<Boolean> reduceStock(@RequestParam Long goodsId, @RequestParam Integer num) {
        String xid1 = RootContext.getXID();
        String xid2 = HttpContext.getRequest().getHeader("TX_XID");
        log.info("Global transaction id: [{}] - [{}]", xid1, xid2);

//        Goods goods = goodsMapper.selectByIdForUpdate(goodsId);

        int reduce = goodsMapper.reduce(goodsId, num);
        if (reduce <= 0) {
            throw new BusinessException("库存不足");
        }
        return R.success(true);
    }



    // TCC 测试

    @Autowired
    private GoodsStockReduceTCCService goodsStockReduceTCCService;

    @PostMapping("/seata/TCCReduceStock")
    public Boolean TCCReduceStock(@RequestParam Long goodsId, @RequestParam Integer num) {
        goodsStockReduceTCCService.reduceGoodsStock(goodsId, num);
        return true;
    }
}