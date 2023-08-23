package priv.cqq.goods;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.loadbalancer.annotation.LoadBalancerClients;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import priv.cqq.goods.config.DefaultServiceLoadBalancerConfig;

@LoadBalancerClients(defaultConfiguration = DefaultServiceLoadBalancerConfig.class)
@EnableFeignClients
@EnableDiscoveryClient
@SpringBootApplication
public class GoodsServiceApplication {

    public static void main(String[] args) {
        SpringApplication.run(GoodsServiceApplication.class, args);
    }

    @RestController
    public class GoodsController {

        @Value("${server.port}")
        private String port;

        @GetMapping(value = "/echo/{string}")
        public String echo(@PathVariable String string) {
            return String.format("Goods service %s %s", port, string);
        }
    }
}