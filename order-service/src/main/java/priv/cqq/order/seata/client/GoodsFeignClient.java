package priv.cqq.order.seata.client;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import priv.cqq.entity.R;

@FeignClient("nacos-goods-service")
public interface GoodsFeignClient {

    @PostMapping("/seata/reduceStock")
    R<Boolean> reduceStock(@RequestParam("goodsId") Long goodsId, @RequestParam Integer num);

    @PostMapping("/seata/TCCReduceStock")
    Boolean TCCReduceStock(@RequestParam("goodsId") Long goodsId, @RequestParam Integer num);
}