package priv.cqq.gateway.loadbalancer;

import com.alibaba.cloud.nacos.NacosDiscoveryProperties;
import org.springframework.beans.factory.ObjectProvider;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.cloud.loadbalancer.core.ReactorLoadBalancer;
import org.springframework.cloud.loadbalancer.core.ServiceInstanceListSupplier;
import org.springframework.cloud.loadbalancer.support.LoadBalancerClientFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.core.env.Environment;

import java.util.Arrays;
import java.util.stream.Collectors;

/**
 * Created by QQ.Cong on 2023-07-05 / 14:16
 *
 * @Description 默认 Load balancer 配置
 */
// @Configuration // 注意，此处不能增加 @Configuration 注解，这样反而会使得下方的 @Bean 方法形参中注入不了 LoadBalancerClientFactory，说明该参数是负载均衡配置类的处理类传入的。
public class DefaultServiceLoadBalancerConfig {

    @Bean
    public ReactorLoadBalancer<ServiceInstance> myLoadBalancer(Environment environment,
                                                               LoadBalancerClientFactory loadBalancerClientFactory,
                                                               NacosDiscoveryProperties nacosDiscoveryProperties,
                                                               @Value("${spring.profiles.active}") String profile,
                                                               @Value("${test.server.ips}") String testServerIps) {
        String name = environment.getProperty(LoadBalancerClientFactory.PROPERTY_NAME);
        ObjectProvider<ServiceInstanceListSupplier> provider = loadBalancerClientFactory.getLazyProvider(name, ServiceInstanceListSupplier.class);
        return new LocalRoundRobbinLoadBalancer(provider, name, nacosDiscoveryProperties, profile, Arrays.stream(testServerIps.split(",")).collect(Collectors.toSet()));
    }
}