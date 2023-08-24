package priv.cqq.order.config;

import feign.Logger;
import feign.Request;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.concurrent.TimeUnit;

@Configuration // @Configuration 表示为全局 Feign 配置
public class FeignConfig {

    // 日志配置
    @Bean
    public Logger.Level feignLoggerLevel() {
        return Logger.Level.HEADERS;
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
}