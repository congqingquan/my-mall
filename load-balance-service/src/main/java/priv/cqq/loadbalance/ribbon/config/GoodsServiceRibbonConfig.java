package priv.cqq.loadbalance.ribbon.config;

import com.netflix.loadbalancer.IRule;
import com.netflix.loadbalancer.RandomRule;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Created by QQ.Cong on 2023-07-04 / 15:03
 *
 * @Description 商品服务 Ribbon 配置
 */
@Configuration
public class GoodsServiceRibbonConfig {

    // 随机
    @Bean
    public IRule iRule() {
        return new RandomRule();
    }
}