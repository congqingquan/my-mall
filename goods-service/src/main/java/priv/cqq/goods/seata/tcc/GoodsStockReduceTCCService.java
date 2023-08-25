package priv.cqq.goods.seata.tcc;

import io.seata.rm.tcc.api.BusinessActionContext;
import io.seata.rm.tcc.api.BusinessActionContextParameter;
import io.seata.rm.tcc.api.LocalTCC;
import io.seata.rm.tcc.api.TwoPhaseBusinessAction;

@LocalTCC
public interface GoodsStockReduceTCCService {

    // Try
    @TwoPhaseBusinessAction(name = "reduceGoodsStock", commitMethod = "reduceGoodsStockCommit", rollbackMethod = "reduceGoodsStockRollback")
    void reduceGoodsStock(@BusinessActionContextParameter("goodsId") Long goodsId, @BusinessActionContextParameter("num") Integer num);

    // Confirm
    Boolean reduceGoodsStockCommit(BusinessActionContext context);

    // Rollback
    Boolean reduceGoodsStockRollback(BusinessActionContext context);
}