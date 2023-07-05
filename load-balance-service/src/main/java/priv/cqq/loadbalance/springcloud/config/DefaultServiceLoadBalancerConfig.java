package priv.cqq.loadbalance.springcloud.config;

import org.springframework.beans.factory.ObjectProvider;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.cloud.loadbalancer.core.ReactorLoadBalancer;
import org.springframework.cloud.loadbalancer.core.ServiceInstanceListSupplier;
import org.springframework.cloud.loadbalancer.support.LoadBalancerClientFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.core.env.Environment;
import priv.cqq.loadbalance.springcloud.loadbalancer.MyLoadBalancer;

/**
 * Created by QQ.Cong on 2023-07-05 / 14:16
 *
 * @Description 默认 Load balancer 配置
 */
// @Configuration // 注意，此处不能增加 @Configuration 注解，这样反而会使得下方的 @Bean 方法形参中注入不了 LoadBalancerClientFactory，说明该参数是负载均衡配置类的处理类传入的。
public class DefaultServiceLoadBalancerConfig {

    @Bean
    public ReactorLoadBalancer<ServiceInstance> myLoadBalancer(Environment environment, LoadBalancerClientFactory loadBalancerClientFactory) {
        String name = environment.getProperty(LoadBalancerClientFactory.PROPERTY_NAME);
        ObjectProvider<ServiceInstanceListSupplier> provider = loadBalancerClientFactory.getLazyProvider(name, ServiceInstanceListSupplier.class);
        return new MyLoadBalancer(provider, name);
    }
}