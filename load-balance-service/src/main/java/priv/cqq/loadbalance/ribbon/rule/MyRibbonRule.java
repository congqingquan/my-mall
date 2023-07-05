package priv.cqq.loadbalance.ribbon.rule;

import com.netflix.client.config.IClientConfig;
import com.netflix.loadbalancer.AbstractLoadBalancerRule;
import com.netflix.loadbalancer.ILoadBalancer;
import com.netflix.loadbalancer.Server;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.lang.invoke.MethodHandles;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Created by QQ.Cong on 2023-07-04 / 17:20
 *
 * @Description 自定义 Ribbon 负载均衡策略 (轮询)
 */
public class MyRibbonRule extends AbstractLoadBalancerRule {

    private static final Logger log = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());

    private final AtomicInteger nextServerIndex = new AtomicInteger(0);

    private int maxRetry;

    public MyRibbonRule() {}

    public MyRibbonRule(int maxRetry) {
        this.maxRetry = maxRetry;
    }

    @Override
    public Server choose(Object key) {
        ILoadBalancer loadBalancer = getLoadBalancer();
        List<Server> allServer = loadBalancer.getAllServers();
        if (allServer == null || allServer.isEmpty()) {
            return null;
        }
        Server server;
        int retry = 0;
        int maxRetry = this.maxRetry;
        int allServerCount = allServer.size();
        do {
            int nextServerIndex = getNextServerIndex(allServerCount);
            server = allServer.get(nextServerIndex);
            if (server.isAlive() && server.isReadyToServe()) {
                return server;
            }
        }
        while (++retry < maxRetry);
        log.warn("No available alive servers after {} tries from load balancer: {}", retry, loadBalancer);
        return null;
    }

    private int getNextServerIndex(int allServerCount) {
        while (true) {
            int current = nextServerIndex.get();
            int next = (current + 1) % allServerCount;
            if (nextServerIndex.compareAndSet(current, next)) {
                return next;
            }
        }
    }

    @Override
    public void initWithNiwsConfig(IClientConfig clientConfig) {

    }
}