package priv.cqq.sentinel.flow;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

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

    @GetMapping(value = "/sentinel/chain/createOrder")
    public String chainCreateOrder() {
        return "Chain create order";
    }

    @GetMapping(value = "/sentinel/chain/getOrder")
    public String chainGetOrder() {
        return "Chain get order";
    }
}