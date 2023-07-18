package priv.cqq.openfeign.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import priv.cqq.openfeign.common.R;
import priv.cqq.openfeign.feign.OrderFeignService;
import priv.cqq.openfeign.model.vo.OrderFeignVO;

import javax.annotation.Resource;

// 模拟订单服务
@RestController
public class OrderController {

    @Resource
    private OrderFeignService orderFeignService;

    @GetMapping(value = "/order/{orderId}")
    public R<OrderFeignVO> echo(@PathVariable Long orderId) {
        return orderFeignService.selectById(orderId);
    }
}