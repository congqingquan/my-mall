package priv.cqq.openfeign.controller;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
public class OpenfeignController {

    @FeignClient(name = "nacos-order-service")
    public interface OrderFeignService {

        @GetMapping(value = "/echo/{string}")
        String echo(@PathVariable String string);
    }

    @Resource
    private OrderFeignService orderFeignService;

    @GetMapping(value = "/openfeign/order/{string}")
    public String echo(@PathVariable String string) {
        return orderFeignService.echo(string);
    }
}