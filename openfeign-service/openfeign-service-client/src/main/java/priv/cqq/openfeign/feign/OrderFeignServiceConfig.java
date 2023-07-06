package priv.cqq.openfeign.feign;

import feign.Contract;
import feign.Logger;
import org.springframework.context.annotation.Bean;

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
}