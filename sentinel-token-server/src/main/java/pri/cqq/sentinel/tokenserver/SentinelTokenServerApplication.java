package pri.cqq.sentinel.tokenserver;

import com.alibaba.csp.sentinel.cluster.server.ClusterTokenServer;
import com.alibaba.csp.sentinel.cluster.server.SentinelDefaultTokenServer;
import com.alibaba.csp.sentinel.cluster.server.config.ClusterServerConfigManager;
import com.alibaba.csp.sentinel.cluster.server.config.ServerTransportConfig;

/**
 * Created by QQ.Cong on 2023-07-24 / 16:53:59
 *
 * @Description 纯管控台的配置无法建立 token-client 与 token-server 的连接，需要集成配置规则的 datasource，并在代码中配置。这个目前没有实现。
 */
public class SentinelTokenServerApplication {

    public static final String DASHBOARD_ULR = "localhost:8400";

    // 使用系统属性代替启动参数: 连接管控台
    static {
        System.setProperty("csp.sentinel.dashboard.server", DASHBOARD_ULR);
        // 与控制台通讯的端口，默认是8719，不可用会一直+1: 客户端暴露 sentinel 原生 api 的访问端口，用于管控台获取客户端簇点链路、监控数据、更新规则等
        System.setProperty("csp.sentinel.api.port", "8501");
        // 服务名称
        System.setProperty("project.name", "token-server");
        // 设置pid(可选)
        System.setProperty("csp.sentinel.log.use.pid", "true");
    }

    public static void main(String[] args) throws Exception {

        // Not embedded mode by default (alone mode).
        ClusterTokenServer tokenServer = new SentinelDefaultTokenServer();

        // A sample for manually load config for cluster server.
        // It's recommended to use dynamic data source to cluster manage config and rules.
        // See the sample in DemoClusterServerInitFunc for detail.
        ClusterServerConfigManager.loadGlobalTransportConfig(
                new ServerTransportConfig()
                        .setIdleSeconds(600)
                        .setPort(8500)
        );
        // ClusterServerConfigManager.loadServerNamespaceSet(Collections.singleton("token-server"));

        // Start the server.
        tokenServer.start();
    }
}
