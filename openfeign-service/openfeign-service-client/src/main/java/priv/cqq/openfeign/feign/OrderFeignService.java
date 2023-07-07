package priv.cqq.openfeign.feign;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import priv.cqq.openfeign.common.R;
import priv.cqq.openfeign.model.vo.OrderFeignVO;

// @FeignClient(name = "nacos-openfeign-service")
@FeignClient(name = "nacos-openfeign-service", configuration = OrderFeignServiceConfig.class)
public interface OrderFeignService {

    // 模拟订单服务
     @GetMapping("/order/feign/selectById/{orderId}")
     R<OrderFeignVO> selectById(@PathVariable Long orderId);

     // 测试契约配置
//    @RequestLine("GET /order/feign/selectById/{orderId}")
//    R<OrderFeignVO> selectById(@Param("orderId") Long orderId);
}