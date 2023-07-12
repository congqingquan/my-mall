package priv.cqq.sentinel;

import com.alibaba.csp.sentinel.Entry;
import com.alibaba.csp.sentinel.SphU;
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

    // 注入流控规则: 如果想要应用 sentinel-dashboard 中的配置，就不能在通过编码式在项目中配置规则，否则会导致资源无法展示在 sentinel-dashboard 中
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
            return "sentinel exception";
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

//    @SentinelResource(value = RESOURCE2_NAME
//            ,
//            blockHandler = "handleSentinelException", blockHandlerClass = FlowControlBaseOriginController.class,
//            fallback = "handleBusinessException", fallbackClass = FlowControlBaseOriginController.class
//    )
    @GetMapping(value = "/sentinel/" + RESOURCE2_NAME + "/{string}")
    public String resource2(@PathVariable String string) {
//        int i = 1 / 0;
        return "success ->" + string;
    }

    public static String handleSentinelException(String string, BlockException blockException) {
        return "sentinel exception -> " + string;
    }

    public static String handleBusinessException(String string, Throwable throwable) {
        return "business exception -> " + string;
    }
}