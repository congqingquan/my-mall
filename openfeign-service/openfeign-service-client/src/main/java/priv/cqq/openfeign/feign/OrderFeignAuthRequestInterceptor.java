package priv.cqq.openfeign.feign;

import feign.RequestInterceptor;
import feign.RequestTemplate;

import java.util.UUID;

public class OrderFeignAuthRequestInterceptor implements RequestInterceptor {

    @Override
    public void apply(RequestTemplate template) {
        String auth = UUID.randomUUID().toString();
        template.header("Authorization", auth);
    }
}