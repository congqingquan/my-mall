package priv.cqq.openfeign;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import priv.cqq.openfeign.common.R;
import priv.cqq.openfeign.model.vo.OrderFeignVO;

import javax.annotation.Resource;

// TODO 1.
@EnableFeignClients // ("priv.cqq.**.feign")
@SpringBootApplication
public class OpenfeignServiceCoreApplication {

    public static void main(String[] args) {
        SpringApplication.run(OpenfeignServiceCoreApplication.class, args);
    }

    // TODO 4.
    @FeignClient(name = "nacos-order-service")
    public interface OrderFeignService {

        @GetMapping(value = "/echo/{string}")
        String echo(@PathVariable String string);
    }

    @RestController
    public class OpenfeignController {

        @Resource
        private OrderFeignService orderFeignService;

        @GetMapping(value = "/openfeign/order/{string}")
        public String echo(@PathVariable String string) {
            return orderFeignService.echo(string);
        }
    }

    // 模拟订单服务
    @RestController
    public class OrderController {

        @Resource
        private priv.cqq.openfeign.feign.OrderFeignService orderFeignService;

        @GetMapping(value = "/order/{orderId}")
        public R<OrderFeignVO> echo(@PathVariable Long orderId) {
            return orderFeignService.selectById(orderId);
        }
    }
}
