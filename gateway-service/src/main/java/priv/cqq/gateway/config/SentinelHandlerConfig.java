package priv.cqq.gateway.config;

import com.alibaba.csp.sentinel.adapter.gateway.sc.callback.GatewayCallbackManager;
import lombok.Builder;
import lombok.Data;
import lombok.experimental.Accessors;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.reactive.function.BodyInserters;
import org.springframework.web.reactive.function.server.ServerResponse;

/**
 * Created by Kim QQ.Cong on 2023/8/6 / 01:45
 *
 * @Description: Sentinel 异常处理器配置
 */
@Configuration
public class SentinelHandlerConfig implements InitializingBean {
    
    
    @Data
    @Builder(toBuilder = true)
    @Accessors(chain = true)
    public static class R<T> {
        
        private long code;
        
        private T data;
        
        private String message;
        
        public R() {
        }
        
        public R(long code, T data, String message) {
            super();
            this.code = code;
            this.data = data;
            this.message = message;
        }
    }
    
    @Override
    public void afterPropertiesSet() throws Exception {
        GatewayCallbackManager.setBlockHandler(
                (exchange, throwable) ->
                        ServerResponse.status(HttpStatus.OK)
                                .contentType(MediaType.APPLICATION_JSON)
                                .body(
                                        BodyInserters.fromValue(
                                                R.builder().code(HttpStatus.TOO_MANY_REQUESTS.value()).message("已限流").build()
                                        )
                                ));
    }
}