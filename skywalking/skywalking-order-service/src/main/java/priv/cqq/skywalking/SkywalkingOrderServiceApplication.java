package priv.cqq.skywalking;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

@EnableFeignClients
@SpringBootApplication
public class SkywalkingOrderServiceApplication {
    
    /**
     VM Options:
     
     -javaagent:/Users/congqingquan/development/skywalking/skywalking-agent/skywalking-agent.jar
     -DSW_AGENT_NAME=skywalking-order-service
     -DSW_AGENT_COLLECTOR_BACKEND_SERVICES=127.0.0.1:8800
     */
    
    public static void main(String[] args) {
        SpringApplication.run(SkywalkingOrderServiceApplication.class, args);
    }
    
}
