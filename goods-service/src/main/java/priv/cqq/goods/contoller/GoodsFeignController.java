package priv.cqq.goods.contoller;


import io.seata.spring.annotation.GlobalTransactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

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

    @PostMapping("/reduceStockN")
    @GlobalTransactional
    public Boolean reduceStockN(@RequestParam Long goodsId, @RequestParam Integer num) {
        Goods goods = goodsMapper.selectById(goodsId);
        Integer stock = goods.getStock();
        int updateStock = stock - num;
        if (stock < 0 || updateStock < 0) {
            throw new RuntimeException("库存不足");
        }
        return goodsMapper.updateById(new Goods().setId(goodsId).setStock(updateStock)) > 0;
    }
}