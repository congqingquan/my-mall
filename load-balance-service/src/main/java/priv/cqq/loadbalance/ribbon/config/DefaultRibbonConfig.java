package priv.cqq.loadbalance.ribbon.config;

import com.netflix.loadbalancer.IRule;
import com.netflix.loadbalancer.RoundRobinRule;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

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
        return new RoundRobinRule();
    }
}