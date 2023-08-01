package priv.cqq.gateway.filter;

import lombok.Data;
import org.springframework.cloud.gateway.filter.GatewayFilter;
import org.springframework.cloud.gateway.filter.factory.AbstractGatewayFilterFactory;
import org.springframework.stereotype.Component;
import org.springframework.validation.annotation.Validated;

import java.util.Arrays;
import java.util.List;

/**
 * Created by Kim QQ.Cong on 2023/7/31 / 23:01
 *
 * @author: CongQingquan
 * @Description: 局部拦截器
 */

// 1. 必须是一个 Spring Bean
// 2. 继承 AbstractGatewayFilterFactory
// 3. 设置配置类，声明配置属性接收配置文件中对应的断言信息
// 4. 重写拦截方法逻辑
@Component
public class MyFilter extends AbstractGatewayFilterFactory<MyFilter.Config> {
    
    public MyFilter() {
        super(MyFilter.Config.class);
    }
    
    
    @Override
    public List<String> shortcutFieldOrder() {
        return Arrays.asList("name", "value");
    }
    
    @Override
    public GatewayFilter apply(Config config) {
        return (exchange, chain) -> {
            exchange.getRequest().mutate().header(config.getName(), config.getValue());
            return chain.filter(exchange);
        };
    }
    
    @Validated
    @Data
    public static class Config {
        
        private String name;
        
        private String value;
    }
}
