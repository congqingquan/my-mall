package priv.cqq.openfeign.feign;

import feign.hystrix.FallbackFactory;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import priv.cqq.openfeign.common.R;
import priv.cqq.openfeign.model.vo.OrderFeignVO;

// @FeignClient(name = "nacos-openfeign-service")
@FeignClient(name = "nacos-openfeign-service",
        configuration = OrderFeignServiceConfig.class,
//        fallback = OrderFeignService.FallbackHandler.class)
        fallbackFactory = OrderFeignService.FallbackHandlerFactory.class)
public interface OrderFeignService {

     // 模拟订单服务
     @GetMapping("/order/feign/selectById/{orderId}")
     R<OrderFeignVO> selectById(@PathVariable Long orderId);

     // 测试契约配置
//    @RequestLine("GET /order/feign/selectById/{orderId}")
//    R<OrderFeignVO> selectById(@Param("orderId") Long orderId);

    @Slf4j
    @Component
    class FallbackHandler implements OrderFeignService {

        @Override
        public R<OrderFeignVO> selectById(Long orderId) {
            log.error("降级处理，后续进行补偿");
            // 1. return redis cache data
            // 2. send mq message
            // 3. return specific business data
            return R.success(null);
        }
    }

    @Slf4j
    @Component
    class FallbackHandlerFactory implements FallbackFactory<OrderFeignService> {

        @Autowired
        @Qualifier("orderFeignService.FallbackHandler")
        private FallbackHandler fallbackHandler;

        @Override
        public OrderFeignService create(Throwable cause) {
            log.error(cause.getMessage());
            return fallbackHandler;
        }
    }
}