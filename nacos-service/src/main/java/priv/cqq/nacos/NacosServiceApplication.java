package priv.cqq.nacos;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
public class NacosServiceApplication {

    public static void main(String[] args) throws InterruptedException {
        SpringApplication.run(NacosServiceApplication.class, args);
    }

    @RestController
    @RefreshScope
    public class RefreshScopeController {

        @Value("${test-key}")
        private String testKey;

        @GetMapping(value = "/refreshScope")
        public String refreshScope() {
            return String.format("Latest value : %s ", testKey);
        }
    }
}