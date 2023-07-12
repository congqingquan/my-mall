package priv.cqq.sentinel;

import com.alibaba.csp.sentinel.adapter.spring.webmvc.callback.BlockExceptionHandler;
import com.alibaba.csp.sentinel.slots.block.BlockException;
import com.alibaba.csp.sentinel.slots.block.authority.AuthorityException;
import com.alibaba.csp.sentinel.slots.block.degrade.DegradeException;
import com.alibaba.csp.sentinel.slots.block.flow.FlowException;
import com.alibaba.csp.sentinel.slots.block.flow.param.ParamFlowException;
import com.alibaba.csp.sentinel.slots.system.SystemBlockException;
import com.alibaba.fastjson.JSONObject;
import org.apache.http.entity.ContentType;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.nio.charset.StandardCharsets;

/**
 * Created by QQ.Cong on 2023-07-12 / 15:20
 *
 * @Description
 */
@Component
public class GlobalBlockExceptionHandler implements BlockExceptionHandler {

    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response, BlockException blockException) throws Exception {

        JSONObject result = new JSONObject();

        if (blockException instanceof FlowException) {
            result.put("code", 100);
            result.put("message", "已限流");
        } else if (blockException instanceof ParamFlowException) {
            result.put("code", 101);
            result.put("message", "热点参数已限流");
        } else if (blockException instanceof DegradeException) {
            result.put("code", 100);
            result.put("message", "已降级");
        } else if (blockException instanceof SystemBlockException) {
            result.put("code", 100);
            result.put("message", "已触发系统保护规则");
        } else if (blockException instanceof AuthorityException) {
            result.put("code", 100);
            result.put("message", "授权未通过");
        }

        response.setStatus(500);
        response.setCharacterEncoding(StandardCharsets.UTF_8.name());
        response.setContentType(ContentType.APPLICATION_JSON.getMimeType());
        result.writeJSONString(response.getWriter());
    }
}