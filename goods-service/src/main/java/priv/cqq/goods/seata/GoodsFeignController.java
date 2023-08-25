package priv.cqq.goods.seata;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import priv.cqq.goods.seata.tcc.GoodsStockReduceTCCService;

@RestController
public class GoodsFeignController {

    @Autowired
    private GoodsMapper goodsMapper;

    // 仅为测试，不想写 xml，偷懒写法。
    @PostMapping("/reduceStock")
    public synchronized Boolean reduceStock(@RequestParam Long goodsId, @RequestParam Integer num) {
        Goods goods = goodsMapper.selectById(goodsId);
        Integer stock = goods.getStock();
        int updateStock = stock - num;
        if (stock < 0 || updateStock < 0) {
            throw new RuntimeException("库存不足");
        }
        return goodsMapper.updateById(new Goods().setId(goodsId).setStock(updateStock)) > 0;
    }

    // TCC 测试

    @Autowired
    private GoodsStockReduceTCCService goodsStockReduceTCCService;

    @PostMapping("/TCCReduceStock")
    public Boolean TCCReduceStock(@RequestParam Long goodsId, @RequestParam Integer num) {
        goodsStockReduceTCCService.reduceGoodsStock(goodsId, num);
        return true;
    }
}