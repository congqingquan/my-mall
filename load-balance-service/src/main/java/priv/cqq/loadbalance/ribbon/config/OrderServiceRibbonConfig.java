package priv.cqq.loadbalance.ribbon.config;

import com.netflix.loadbalancer.IRule;
import com.netflix.loadbalancer.RoundRobinRule;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Created by QQ.Cong on 2023-07-04 / 15:04:18
 *
 * @Description 订单服务 Ribbon 配置
 */
@Configuration
public class OrderServiceRibbonConfig {

    // 轮询
    @Bean
    public IRule iRule() {
        return new RoundRobinRule();
    }
}