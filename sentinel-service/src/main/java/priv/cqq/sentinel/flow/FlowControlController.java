package priv.cqq.sentinel.flow;

import com.alibaba.csp.sentinel.annotation.SentinelResource;
import com.alibaba.csp.sentinel.slots.block.BlockException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CountDownLatch;

// 流量控制：服务提供方
@Slf4j
@RestController
public class FlowControlController {

    // ============================================= 流控模式：直接 =============================================

    // 对于超出限流阈值的请求，直接拒绝，直接执行配置的异常回调。

    // ============================================= 流控模式：关联 =============================================

    // 当关联的资源触发限流时，并非限流关联资源，而是当前的配置资源

    @GetMapping(value = "/sentinel/relate/createOrder")
    public String relateCreateOrder() {
        return "Relate create order";
    }

    @GetMapping(value = "/sentinel/relate/getOrder")
    public String relateGetOrder() {
        return "Relate get order";
    }

    // ============================================= 流控模式：链路 =============================================

    @Resource
    private UserService userService;
    
    @GetMapping(value = "/sentinel/chain/createOrder")
    public String chainCreateOrder() {
        return "Chain create order -> " + userService.getUser();
    }

    @GetMapping(value = "/sentinel/chain/getOrder")
    public String chainGetOrder() {
        return "Chain get order -> " + userService.getUser();
    }
    
    @Service
    public class UserService {
        
        @SentinelResource(value = "getUser", blockHandler = "handleGetUserBlock")
        public String getUser() {
            return "张三";
        }
        
        public String handleGetUserBlock(BlockException blockException) {
            return "查询用户限流";
        }
    }
    
    // ============================================= 流控效果：快速失败 =============================================
    
    // 当请求达到限流阈值时，直接抛出限流异常 FlowException：Blocked by Sentinel(flow limiting)
    
    @GetMapping(value = "/sentinel/behavior/fastFailure")
    public String fastFailure() {
        return "fast failure";
    }
    
    // ============================================= 流控效果：warm up =============================================
    
    @GetMapping(value = "/sentinel/behavior/warmup")
    public String warmup() {
        return "warm up";
    }
    
    public static void main(String[] args) throws InterruptedException {
        CountDownLatch countDownLatch = new CountDownLatch(2);
        List<Thread> threads = new ArrayList<>();
        RestTemplate restTemplate = new RestTemplate();
        for (int i = 0; i < 10; i++) {
            Thread thread = new Thread(() -> {
                for (int j = 0; j < 20; j++) {
                    try {
                        restTemplate.getForObject("http://localhost:6600/sentinel/behavior/warmup", String.class);
                    } catch (Exception e) {
                        log.error(e.getMessage());
                    }
                    try {
                        Thread.sleep(500 + j * 20);
                    } catch (InterruptedException e) {
                        throw new RuntimeException(e);
                    }
                }
                countDownLatch.countDown();
            });
            threads.add(thread);
        }
        threads.forEach(Thread::start);
        
        countDownLatch.await();
        log.info("finish");
    }
    
    // ============================================= 流控效果：排队等待 =============================================
}