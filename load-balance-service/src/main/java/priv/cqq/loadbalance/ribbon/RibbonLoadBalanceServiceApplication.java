package priv.cqq.loadbalance.ribbon;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.cloud.netflix.ribbon.RibbonClient;
import org.springframework.cloud.netflix.ribbon.RibbonClients;
import org.springframework.context.annotation.Bean;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import priv.cqq.loadbalance.ribbon.config.GoodsServiceRibbonConfig;
import priv.cqq.loadbalance.ribbon.config.OrderServiceRibbonConfig;

import javax.annotation.Resource;

// 对不同服务设置不同的负载均衡策略
@RibbonClients(
        value = {
                @RibbonClient(name = "nacos-goods-service", configuration = GoodsServiceRibbonConfig.class),
                @RibbonClient(name = "nacos-order-service", configuration = OrderServiceRibbonConfig.class)
        }
        // 也可以写一个通用配置使得生效与所有节点 (注意此配置会覆盖对于不同服务的配置)
        // , defaultConfiguration = DefaultRibbonConfig.class
)
@SpringBootApplication
public class RibbonLoadBalanceServiceApplication {

    public static void main(String[] args) {
        SpringApplication.run(RibbonLoadBalanceServiceApplication.class, args);
    }

    @RestController
    public class RibbonController {

        @Bean
        @LoadBalanced
        public RestTemplate restTemplate() {
            return new RestTemplate();
        }

        @Resource
        private RestTemplate restTemplate;

        @GetMapping(value = "/ribbon/load-balance/{service-name}/{string}")
        public String echo(@PathVariable("service-name") String serviceName, @PathVariable String string) {
            return restTemplate.getForObject(String.format("http://%s/echo/%s", serviceName, string), String.class);
        }
    }
}