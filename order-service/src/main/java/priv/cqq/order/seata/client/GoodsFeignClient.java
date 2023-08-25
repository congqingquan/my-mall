package priv.cqq.order.seata.client;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@FeignClient("nacos-goods-service")
public interface GoodsFeignClient {

    @PostMapping("/reduceStock")
    Boolean reduceStock(@RequestParam("goodsId") Long goodsId, @RequestParam Integer num);

    @PostMapping("/TCCReduceStock")
    Boolean TCCReduceStock(@RequestParam("goodsId") Long goodsId, @RequestParam Integer num);
}