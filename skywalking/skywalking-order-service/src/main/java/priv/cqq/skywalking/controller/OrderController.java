package priv.cqq.skywalking.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
public class OrderController {
    
    @Resource
    private GoodsFeignService goodsFeignService;
    
    @GetMapping(value = "/order/{goodsName}")
    public String order(@PathVariable String goodsName) {
        return "Order successfully. " + goodsFeignService.reduceStock(goodsName);
    }
}