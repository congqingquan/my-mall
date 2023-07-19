package priv.cqq.sentinel;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

@EnableFeignClients
@SpringBootApplication
public class SentinelServiceApplication {

    public static void main(String[] args) {
        SpringApplication.run(SentinelServiceApplication.class, args);
    }
}
