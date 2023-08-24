package priv.cqq.order.controller.client;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@FeignClient("nacos-goods-service")
public interface GoodsFeignClient {

    @PostMapping("/reduceStock")
    Boolean reduceStock(@RequestParam("goodsId") Long goodsId, @RequestParam Integer num);
}