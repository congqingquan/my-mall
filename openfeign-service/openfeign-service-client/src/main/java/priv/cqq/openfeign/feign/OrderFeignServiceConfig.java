package priv.cqq.openfeign.feign;

import com.netflix.loadbalancer.IRule;
import com.netflix.loadbalancer.RandomRule;
import feign.Contract;
import feign.Logger;
import feign.Request;
import feign.RequestInterceptor;
import org.springframework.context.annotation.Bean;

import java.util.concurrent.TimeUnit;

// 订单 Feign 接口配置
public class OrderFeignServiceConfig {

    // 日志配置
    @Bean
    public Logger.Level orderFeignLoggerLevel() {
        return Logger.Level.HEADERS;
    }

    // 契约配置：兼容 Feign 原生注解
    // @Bean
    public Contract orderFeignContract() {
        return new Contract.Default();
    }

    // 超时配置
    @Bean
    public Request.Options orderFeignRequestOptions() {
        // 1. connectTimeout: 建立连接超时时长
        // 2. readTimeout: 建立连接超时后最多等待被调用方响应时长
        // 3. followRedirects: 若响应 3xx 是否进行重定向
        return new Request.Options(
                5, TimeUnit.SECONDS,
                4, TimeUnit.SECONDS, false
        );
    }

    // 拦截器配置 (执行顺序根为 Bean 的配置顺序)
    @Bean
    public RequestInterceptor orderFeignAuthRequestInterceptor() {
        return new OrderFeignAuthRequestInterceptor();
    }

    @Bean
    public RequestInterceptor orderFeignLogRequestInterceptor() {
        return new OrderFeignLogRequestInterceptor();
    }

    // 负载均衡配置
    @Bean
    public IRule feignLoadbalancer() {
        return new RandomRule();
    }
}