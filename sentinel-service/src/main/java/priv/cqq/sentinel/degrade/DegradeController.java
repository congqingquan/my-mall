package priv.cqq.sentinel.degrade;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by QQ.Cong on 2023-07-18 / 10:05
 *
 * @Description
 */
@Slf4j
@RestController
public class DegradeController {

    // ============================================= 熔断规则：慢调用数 =============================================

    @GetMapping(value = "/sentinel/degrade/slowRequestAmount")
    public String slowRequestAmount() {
        return "slow request amount";
    }

    // ============================================= 熔断规则：异常比例 =============================================

    @GetMapping(value = "/sentinel/degrade/exceptionRatio")
    public String exceptionRatio() {
        return "exception ratio";
    }

    // ============================================= 熔断规则：异常数 =============================================

    @GetMapping(value = "/sentinel/degrade/exceptionCount")
    public String exceptionCount() {
        return "exception count";
    }
}