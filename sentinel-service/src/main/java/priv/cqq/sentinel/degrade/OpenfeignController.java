package priv.cqq.sentinel.degrade;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
public class OpenfeignController {

    @FeignClient(name = "nacos-sentinel-service")
    public interface FeignService {

        @GetMapping(value = "/echo/{string}")
        String echo(@PathVariable String string);
    }

    @Resource
    private FeignService feignService;

    @GetMapping(value = "/sentinel/openfeign/{string}")
    public String echo(@PathVariable String string) {
        return feignService.echo(string);
    }
}