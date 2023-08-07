package priv.cqq.gateway.loadbalancer;

import com.alibaba.cloud.nacos.NacosDiscoveryProperties;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.ObjectProvider;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.cloud.client.loadbalancer.reactive.DefaultResponse;
import org.springframework.cloud.client.loadbalancer.reactive.EmptyResponse;
import org.springframework.cloud.client.loadbalancer.reactive.Request;
import org.springframework.cloud.client.loadbalancer.reactive.Response;
import org.springframework.cloud.loadbalancer.core.NoopServiceInstanceListSupplier;
import org.springframework.cloud.loadbalancer.core.ReactorServiceInstanceLoadBalancer;
import org.springframework.cloud.loadbalancer.core.SelectedInstanceCallback;
import org.springframework.cloud.loadbalancer.core.ServiceInstanceListSupplier;
import org.springframework.util.CollectionUtils;
import reactor.core.publisher.Mono;

import java.lang.invoke.MethodHandles;
import java.util.List;
import java.util.Objects;
import java.util.Set;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;

/**
 * Created by QQ.Cong on 2023-08-07 / 10:06:54
 *
 * @Description 可本地调用的 SpringCloud 原生负载均衡策略 (改自 load-balancer-service 中的 MyLoadBalancer)
 */
public class LocalRoundRobbinLoadBalancer implements ReactorServiceInstanceLoadBalancer {

    private static final Logger log = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());

    private final AtomicInteger position;

    private final ObjectProvider<ServiceInstanceListSupplier> serviceInstanceListSupplierProvider;

    private final String serviceId;


    // ==================================================================

    private final NacosDiscoveryProperties nacosDiscoveryProperties;

    private final String profile;

    private final Set<String> testServerIpSet;

    public LocalRoundRobbinLoadBalancer(ObjectProvider<ServiceInstanceListSupplier> serviceInstanceListSupplierProvider,
                                        String serviceId,
                                        NacosDiscoveryProperties nacosDiscoveryProperties,
                                        String profile,
                                        Set<String> testServerIpSet) {
        this.serviceId = serviceId;
        this.serviceInstanceListSupplierProvider = serviceInstanceListSupplierProvider;
        this.position = new AtomicInteger(0);
        this.nacosDiscoveryProperties = nacosDiscoveryProperties;
        this.profile = profile;
        this.testServerIpSet = testServerIpSet;
    }

    @Override
    public Mono<Response<ServiceInstance>> choose(Request request) {
        // TODO: move supplier to Request?
        // Temporary conditional logic till deprecated members are removed.
        ServiceInstanceListSupplier supplier = serviceInstanceListSupplierProvider.getIfAvailable(NoopServiceInstanceListSupplier::new);
        return supplier
                .get()
                .next()
                .map(serviceInstances -> processInstanceResponse(supplier, serviceInstances));
    }

    private Response<ServiceInstance> processInstanceResponse(ServiceInstanceListSupplier supplier, List<ServiceInstance> serviceInstances) {
        Response<ServiceInstance> serviceInstanceResponse = getInstanceResponse(serviceInstances);
        if (supplier instanceof SelectedInstanceCallback && serviceInstanceResponse.hasServer()) {
            ((SelectedInstanceCallback) supplier).selectedServiceInstance(serviceInstanceResponse.getServer());
        }
        return serviceInstanceResponse;
    }

    private Response<ServiceInstance> getInstanceResponse(List<ServiceInstance> allServerInstances) {
        if (allServerInstances.isEmpty()) {
            log.warn("No servers available for service: " + this.serviceId);
            return new EmptyResponse();
        }
        // 0. 默认非测试、本地开发环境，使用 serviceId 所有的可用服务实例
        List<ServiceInstance> serviceInstances = allServerInstances;
        // 1. 测试环境: 搜索测试环境中的所有服务节点
        if ("test".equals(profile)) {
            serviceInstances = findTestInstances(allServerInstances);
        }
        // 2. 本地开发环境: 搜索本地开发环境中的所有服务节点, 若为空则使用测试环境的所有服务节点
        else if ("dev".equals(profile)) {
            String ip = nacosDiscoveryProperties.getIp();
            serviceInstances = findDevInstances(allServerInstances, ip);
            if (CollectionUtils.isEmpty(serviceInstances)) {
                serviceInstances = findTestInstances(allServerInstances);
            }
        }
        if (CollectionUtils.isEmpty(serviceInstances)) {
            log.warn("No servers available for service: " + this.serviceId);
            return new EmptyResponse();
        }
        // 3. 轮询访问服务节点
        Response<ServiceInstance> response = roundRobbin(serviceInstances);
        ServiceInstance choose = response.getServer();
        log.info("Request {}, servers={}, choose {}",
                this.serviceId,
                serviceInstances.stream().map(item -> item.getHost() + ":" + item.getPort()).collect(Collectors.toList()),
                choose.getHost() + ":" + choose.getPort());
        return response;
    }

    /**
     * 搜索本地开发环境中的所有服务节点
     */
    private static List<ServiceInstance> findDevInstances(List<ServiceInstance> instances, String ip) {
        return instances
                .stream()
                .filter(instance -> Objects.equals(instance.getHost(), ip))
                .collect(Collectors.toList());
    }

    /**
     * 搜索测试环境中的所有服务节点
     */
    private List<ServiceInstance> findTestInstances(List<ServiceInstance> instances) {
        return instances
                .stream()
                .filter(instance -> testServerIpSet.contains(instance.getHost()))
                .collect(Collectors.toList());
    }


    /**
     * 轮询访问服务实例
     */
    private Response<ServiceInstance> roundRobbin(List<ServiceInstance> instances) {
        // 1. position 溢出后继续自增会进行递减, 只要保证数值变化是有序的, 就可以保证取模结果是有序的.
        int pos = Math.abs(this.position.incrementAndGet());
        ServiceInstance instance = instances.get(pos % instances.size());
        return new DefaultResponse(instance);

        // 2. CAS 自旋修改下次调用服务的索引, 因为取模所以 position 的值不会溢出
        // int allServerCount = instances.size();
        // while (true) {
        //     int current = position.get();
        //     int next = (current + 1) % allServerCount;
        // if (position.compareAndSet(current, next)) {
        //         return new DefaultResponse(instances.get(next));
        //     }
        // }
    }
}