package priv.cqq.loadbalance.ribbon.rule;

import com.netflix.client.config.IClientConfig;
import com.netflix.loadbalancer.AbstractLoadBalancerRule;
import com.netflix.loadbalancer.Server;

import java.util.List;

/**
 * Created by QQ.Cong on 2023-07-04 / 17:20
 *
 * @Description 自定义 Ribbon 负载均衡策略
 */
public class MyRibbonRule extends AbstractLoadBalancerRule {

    @Override
    public Server choose(Object key) {
        List<Server> servers = getLoadBalancer().getReachableServers();

        return null;
    }

    @Override
    public void initWithNiwsConfig(IClientConfig clientConfig) {

    }
}