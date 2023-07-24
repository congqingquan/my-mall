package priv.cqq.sentinel.cluster;

import com.alibaba.csp.sentinel.annotation.SentinelResource;
import com.alibaba.csp.sentinel.slots.block.BlockException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by QQ.Cong on 2023-07-18 / 10:05
 *
 * @Description
 */
@Slf4j
@RestController
public class ClusterController {

    private static String port;

    @Autowired
    public void init(@Value("${server.port}") String port) {
        ClusterController.port = port;
    }

    // ============================================= 集群流控 =============================================

    @GetMapping(value = "/sentinel/cluster/{string}")
    @SentinelResource(value = "cr", blockHandler = "handleException")
    public String cluster(@PathVariable String string) {
        return string + " -> " + port;
    }

    public static String handleException(String string, BlockException blockException) {
        return "exception: " + string + " -> " + port;
    }
}