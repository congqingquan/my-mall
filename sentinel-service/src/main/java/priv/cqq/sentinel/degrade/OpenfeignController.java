package priv.cqq.sentinel.degrade;

import com.alibaba.csp.sentinel.annotation.SentinelResource;
import com.alibaba.csp.sentinel.slots.block.BlockException;
import feign.hystrix.FallbackFactory;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.concurrent.TimeUnit;

@RestController
public class OpenfeignController {
    
    @FeignClient(name = "nacos-sentinel-service", fallbackFactory = FeignService.FeignFallbackFactory.class)
    public interface FeignService {
        
        @GetMapping(value = "/sentinel/feign/echo/{string}")
        String echo(@PathVariable String string);
        
        @Slf4j
        @RestController
        class FeignController implements FeignService {
            
            @SentinelResource(value = "echo", blockHandler = "handleEchoException")
            @Override
            public String echo(String string) {
                try {
                    TimeUnit.SECONDS.sleep(3);
                } catch (InterruptedException e) {
                    throw new RuntimeException(e);
                }
                return string;
            }
            
            public static String handleEchoException(String string, BlockException blockException) {
                log.error(blockException.getMessage());
                return "handleEchoException";
            }
        }
        
        @Slf4j
        @Component
        class FeignFallbackHandler implements FeignService {
            
            @Override
            public String echo(String string) {
                log.error("sentinel 熔断降级");
                return "fake value";
            }
        }
        
        @Slf4j
        @Component
        class FeignFallbackFactory implements FallbackFactory<FeignFallbackHandler> {
            
            @Resource
            private FeignFallbackHandler feignFallbackHandler;
            
            @Override
            public FeignFallbackHandler create(Throwable cause) {
                log.error(cause.getMessage());
                return feignFallbackHandler;
            }
        }
    }
    
    @Resource
    private FeignService feignService;
    
    @GetMapping(value = "/sentinel/openfeign/echo/{string}")
    public String echo(@PathVariable String string) {
        return feignService.echo(string);
    }
}