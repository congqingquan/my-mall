package priv.cqq.openfeign;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

@EnableFeignClients // ("priv.cqq.**.feign")
@SpringBootApplication
public class OpenfeignServiceCoreApplication {

    public static void main(String[] args) {
        SpringApplication.run(OpenfeignServiceCoreApplication.class, args);
    }
}