package priv.cqq.sentinel;

import com.alibaba.csp.sentinel.Entry;
import com.alibaba.csp.sentinel.SphU;
import com.alibaba.csp.sentinel.annotation.SentinelResource;
import com.alibaba.csp.sentinel.annotation.aspectj.SentinelResourceAspect;
import com.alibaba.csp.sentinel.slots.block.BlockException;
import org.springframework.context.annotation.Bean;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

// 流量控制：服务提供方
@RestController
    public class FlowControlController {

    public static final String RESOURCE1_NAME = "flow-control-resource1";
    public static final String RESOURCE2_NAME = "flow-control-resource2";

    // 注入流控规则: 如果想要应用 sentinel-dashboard，就不能在通过原生的方法配置流控规则，会导致无法注册在 sentinel-dashboard 中
//    @PostConstruct
//    private void init() {
//        List<FlowRule> flowRuleList = Arrays.asList(
//                new FlowRule(RESOURCE1_NAME).setGrade(RuleConstant.FLOW_GRADE_QPS).setCount(1),
//                new FlowRule(RESOURCE2_NAME).setGrade(RuleConstant.FLOW_GRADE_QPS).setCount(1)
//        );
//        flowRuleList.addAll(FlowRuleManager.getRules());
//        FlowRuleManager.loadRules(flowRuleList);
//    }

    // ==================================== 原生方式 ====================================
    @GetMapping(value = "/sentinel/" + RESOURCE1_NAME)
    public String resource1() {
        Entry entry = null;
        try {
            entry = SphU.entry(RESOURCE1_NAME);
            return "success";
        } catch (BlockException e) {
            return "已限流";
        } finally {
            if (entry != null) {
                entry.exit();
            }
        }
    }


    // ==================================== 切面方式 ====================================


    @Bean
    public SentinelResourceAspect sentinelResourceAspect() {
        return new SentinelResourceAspect();
    }

    @SentinelResource(value = RESOURCE2_NAME,
            blockHandler = "handleResource2SentinelBlock", blockHandlerClass = FlowControlController.class,
            fallback = "handleResource2BusinessException", fallbackClass = FlowControlController.class
    )
    @GetMapping(value = "/sentinel/" + RESOURCE2_NAME + "/{string}")
    public String resource2(@PathVariable String string) {
        int i = 1 / 0;
        return "success ->" + string;
    }

    public static String handleResource2SentinelBlock(String string, BlockException blockException) {
        return "blocked -> " + string;
    }

    public static String handleResource2BusinessException(String string, Throwable throwable) {
        return "business exception -> " + string;
    }
}