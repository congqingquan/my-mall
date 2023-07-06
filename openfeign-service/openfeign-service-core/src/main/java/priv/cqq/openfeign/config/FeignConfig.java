package priv.cqq.openfeign.config;

import feign.Contract;
import feign.Logger;
import org.springframework.context.annotation.Bean;

// @Configuration // @Configuration 表示为全局 Feign 配置
public class FeignConfig {

    // 日志配置
    @Bean
    public Logger.Level feignLoggerLevel() {
        return Logger.Level.HEADERS;
    }

    // 契约配置：兼容 Feign 原生注解
    @Bean
    public Contract feignContract() {
        return new Contract.Default();
    }
}