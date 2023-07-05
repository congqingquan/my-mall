package priv.cqq.loadbalance.ribbon.config;

import com.netflix.loadbalancer.IRule;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import priv.cqq.loadbalance.ribbon.rule.MyRibbonRule;

/**
 * Created by QQ.Cong on 2023-07-04 / 16:31
 *
 * @Description 默认 Ribbon 配置
 */
@Configuration
public class DefaultRibbonConfig {

    // Nacos
    @Bean
    public IRule iRule() {
//        return new NacosRule();
        return new MyRibbonRule(1);
    }
}