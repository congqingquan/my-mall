package priv.cqq.skywalking.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class GoodsController {
    
    @GetMapping(value = "/reduceStock/{goodsName}")
    public String reduceStock(@PathVariable String goodsName) {
        return "Reduce stock of " + goodsName + " successfully";
    }
}