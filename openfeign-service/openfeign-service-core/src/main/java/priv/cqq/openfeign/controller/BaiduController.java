package priv.cqq.openfeign.controller;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
public class BaiduController {


    @FeignClient(name = "Baidu", url = "http://www.baidu.com")
    public interface BaiduFeignService {
        @GetMapping
        String get();
    }

    @Resource
    private BaiduFeignService baiduFeignService;

    @GetMapping(value = "/baidu")
    public String baidu() {
        return baiduFeignService.get();
    }
}