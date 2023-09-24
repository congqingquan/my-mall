package priv.cqq.skywalking.controller;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@FeignClient(name = "nacos-skywalking-goods-service")
public interface GoodsFeignService {
    
    @GetMapping(value = "/reduceStock/{goodsName}")
    String reduceStock(@PathVariable String goodsName);
}
