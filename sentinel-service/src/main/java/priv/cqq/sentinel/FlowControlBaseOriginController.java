package priv.cqq.sentinel;

import com.alibaba.csp.sentinel.Entry;
import com.alibaba.csp.sentinel.SphU;
import com.alibaba.csp.sentinel.annotation.SentinelResource;
import com.alibaba.csp.sentinel.annotation.aspectj.SentinelResourceAspect;
import com.alibaba.csp.sentinel.slots.block.BlockException;
import com.alibaba.csp.sentinel.slots.block.RuleConstant;
import com.alibaba.csp.sentinel.slots.block.flow.FlowRule;
import com.alibaba.csp.sentinel.slots.block.flow.FlowRuleManager;
import org.springframework.context.annotation.Bean;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.annotation.PostConstruct;
import java.util.Arrays;
import java.util.List;

// 流量控制：服务提供方 (基于原生的 API)
//@RestController
public class FlowControlBaseOriginController {

    public static final String RESOURCE1_NAME = "flow-control-resource1";
    public static final String RESOURCE2_NAME = "flow-control-resource2";

    // 基于原生的 API 注入流控规则
    @PostConstruct
    private void init() {
        List<FlowRule> flowRuleList = Arrays.asList(
                new FlowRule(RESOURCE1_NAME).setGrade(RuleConstant.FLOW_GRADE_QPS).setCount(1),
                new FlowRule(RESOURCE2_NAME).setGrade(RuleConstant.FLOW_GRADE_QPS).setCount(1)
        );
        flowRuleList.addAll(FlowRuleManager.getRules());
        FlowRuleManager.loadRules(flowRuleList);
    }

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

    // 注入处理 @SentinelResource 注解的处理器
    @Bean
    public SentinelResourceAspect sentinelResourceAspect() {
        return new SentinelResourceAspect();
    }

    /**
     * 1. 处理 Blocked 异常的方法的编写规范(强制)：
     * public static SourceMethodReturnType method(SourceMethodParam1 p1, SourceMethodParam... p..., BlockException exception)
     * 2. 执行失败时的回调方法的编写规范(强制)：
     * public static SourceMethodReturnType method(SourceMethodParam1 p1, SourceMethodParam... p..., Throwable throwable)
     * 3. 二者同时存在时，优先执行处理 Blocked 异常的方法
     */
    @SentinelResource(value = RESOURCE2_NAME,
            blockHandler = "handleSentinelException", blockHandlerClass = FlowControlBaseOriginController.class,
            fallback = "handleBusinessException", fallbackClass = FlowControlBaseOriginController.class
    )
    @GetMapping(value = "/sentinel/" + RESOURCE2_NAME + "/{string}")
    public String resource2(@PathVariable String string) {
        int i = 1 / 0;
        return "success ->" + string;
    }

    public static String handleSentinelException(String string, BlockException blockException) {
        return "sentinel exception -> " + string;
    }

    public static String handleBusinessException(String string, Throwable throwable) {
        return "business exception -> " + string;
    }

    // ==================================== 异常全局处理 ====================================

    @GetMapping(value = "/sentinel/globalHandle")
    public String globalHandle() {
        return "global handle";
    }
}