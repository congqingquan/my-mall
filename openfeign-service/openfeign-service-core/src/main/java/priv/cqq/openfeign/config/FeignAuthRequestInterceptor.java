package priv.cqq.openfeign.config;

import feign.RequestInterceptor;
import feign.RequestTemplate;
import lombok.extern.slf4j.Slf4j;

import java.util.UUID;

@Slf4j
public class FeignAuthRequestInterceptor implements RequestInterceptor {

    @Override
    public void apply(RequestTemplate template) {
        String auth = UUID.randomUUID().toString();
        template.header("Authorization", auth);
    }
}