package priv.cqq.gateway.routepridicate;

import lombok.Data;
import org.springframework.cloud.gateway.handler.predicate.AbstractRoutePredicateFactory;
import org.springframework.cloud.gateway.handler.predicate.GatewayPredicate;
import org.springframework.stereotype.Component;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.server.ServerWebExchange;

import java.util.Arrays;
import java.util.List;
import java.util.function.Predicate;

// 1. 必须是一个 Spring Bean
// 2. 必须以 RoutePredicateFactory 作为类名后缀
// 3. 继承 AbstractRoutePredicateFactory
// 4. 设置配置类，声明配置属性接收配置文件中对应的断言信息
// 5. 重写断言方法逻辑
@Component
public class MyPredicateRoutePredicateFactory extends AbstractRoutePredicateFactory<MyPredicateRoutePredicateFactory.Config> {
    
    public MyPredicateRoutePredicateFactory() {
        super(MyPredicateRoutePredicateFactory.Config.class);
    }
    
    @Override
    public Predicate<ServerWebExchange> apply(Config config) {
        return (GatewayPredicate) serverWebExchange -> config.getKey1().equals("key2");
    }
    
    /**
     * 快捷配置
     */
    
    // 配置注入 Config 配置类的配置字段值时，字段的获取循序
    @Override
    public List<String> shortcutFieldOrder() {
        return Arrays.asList("key2", "key1");
    }
    
    @Validated
    @Data
    public static class Config {
        
        private String key1;
        
        private String key2;
    }
}