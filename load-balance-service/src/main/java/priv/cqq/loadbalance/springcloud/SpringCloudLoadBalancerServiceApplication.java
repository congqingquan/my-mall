package priv.cqq.loadbalance.springcloud;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.cloud.loadbalancer.annotation.LoadBalancerClient;
import org.springframework.cloud.loadbalancer.annotation.LoadBalancerClients;
import org.springframework.context.annotation.Bean;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import priv.cqq.loadbalance.springcloud.config.GoodsServiceLoadBalancerConfig;
import priv.cqq.loadbalance.springcloud.config.OrderServiceLoadBalancerConfig;

import javax.annotation.Resource;

/**
 * Created by QQ.Cong on 2023-07-05 / 13:13
 *
 * @Description
 */
@LoadBalancerClients(
        value = {
                @LoadBalancerClient(name = "nacos-goods-service", configuration = GoodsServiceLoadBalancerConfig.class),
                @LoadBalancerClient(name = "nacos-order-service", configuration = OrderServiceLoadBalancerConfig.class)
        }
        // 也可以写一个通用配置使得生效与所有节点 (注意此配置不同于 ribbon 不会覆盖对于不同服务的配置，反而会进行累加导致运行时异常：根据 service id 找到多个负载均衡策略的 bean)
//        , defaultConfiguration = DefaultServiceLoadBalancerConfig.class
)
@SpringBootApplication
public class SpringCloudLoadBalancerServiceApplication {

    public static void main(String[] args) {
        SpringApplication.run(SpringCloudLoadBalancerServiceApplication.class, args);
    }

    @RestController
    public class SpringCloudLoadBalancerController {

        @Bean
        @LoadBalanced
        public RestTemplate restTemplate() {
            return new RestTemplate();
        }

        @Resource
        private RestTemplate restTemplate;

        @GetMapping(value = "/spring-cloud/load-balance/{service-name}/{string}")
        public String echo(@PathVariable("service-name") String serviceName, @PathVariable String string) {
            return restTemplate.getForObject(String.format("http://%s/echo/%s", serviceName, string), String.class);
        }
    }
}