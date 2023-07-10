package priv.cqq.sentinel;

import com.alibaba.csp.sentinel.Entry;
import com.alibaba.csp.sentinel.SphU;
import com.alibaba.csp.sentinel.annotation.SentinelResource;
import com.alibaba.csp.sentinel.annotation.aspectj.SentinelResourceAspect;
import com.alibaba.csp.sentinel.slots.block.BlockException;
import com.alibaba.csp.sentinel.slots.block.RuleConstant;
import com.alibaba.csp.sentinel.slots.block.degrade.DegradeRule;
import com.alibaba.csp.sentinel.slots.block.degrade.DegradeRuleManager;
import org.springframework.context.annotation.Bean;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;
import java.util.List;

// 熔断降级：服务消费方
@RestController
public class DegradeControlController {

    public static final String RESOURCE1_NAME = "degrade-control-resource1";
    public static final String RESOURCE2_NAME = "degrade-control-resource2";

    // 注入熔断降级规则
//    @PostConstruct
    private void init() {

        DegradeRule degradeRule = new DegradeRule(RESOURCE1_NAME);
        // 1. 熔断策略
//        degradeRule.setGrade();
        // 1) 慢调用比例: RuleConstant.DEGRADE_GRADE_RT
        // 2) 异常比例: RuleConstant.DEGRADE_GRADE_EXCEPTION_RATIO
        // 3) 异常数: RuleConstant.DEGRADE_GRADE_EXCEPTION_COUNT

//        // 2. 数量
//        degradeRule.setCount();
//        // 3. 熔断时间窗口
//        degradeRule.setTimeWindow();
//        // 4. 最小请求数
//        degradeRule.setMinRequestAmount();
//        // 5. 统计时间区间
//        degradeRule.setStatIntervalMs();

        // 统计时间区间内达到了最小请求数，且触发异常数达到了阈值，则执行熔断降级方法。
        // 熔断降级后的首次调用若依旧失败，则再次直接触发熔断降级方法，而不参考配置参数。

        List<DegradeRule> degradeRuleList = Arrays.asList(
                new DegradeRule(RESOURCE1_NAME).setGrade(RuleConstant.DEGRADE_GRADE_RT).setCount(1),
                new DegradeRule(RESOURCE2_NAME).setGrade(RuleConstant.FLOW_GRADE_QPS).setCount(1)
        );
        degradeRuleList.addAll(DegradeRuleManager.getRules());
        DegradeRuleManager.loadRules(degradeRuleList);
    }

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
            blockHandler = "handleResource2SentinelBlock", blockHandlerClass = DegradeControlController.class,
            fallback = "handleResource2BusinessException", fallbackClass = DegradeControlController.class
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