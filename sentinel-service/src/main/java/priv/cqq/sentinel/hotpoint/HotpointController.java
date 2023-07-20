package priv.cqq.sentinel.hotpoint;

import com.alibaba.csp.sentinel.annotation.SentinelResource;
import com.alibaba.csp.sentinel.slots.block.BlockException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by QQ.Cong on 2023-07-18 / 10:05
 *
 * @Description
 */
@Slf4j
@RestController
public class HotpointController {

    // ============================================= 热点规则：热点参数 =============================================

    @GetMapping(value = "/sentinel/hotpoint")
    @SentinelResource(value = "hp", blockHandler = "handleHotpointParamException")
    public Integer hotpointParam(@RequestParam(required = false) Integer param) {
        return param;
    }

    public static Integer handleHotpointParamException(Integer integer, BlockException blockException) {
        log.error(blockException.getMessage());
        return 999;
    }
}