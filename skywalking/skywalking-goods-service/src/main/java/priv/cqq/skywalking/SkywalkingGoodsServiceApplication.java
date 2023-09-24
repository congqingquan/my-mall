package priv.cqq.skywalking;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class SkywalkingGoodsServiceApplication {
    
    /**
     VM Options:
     
     -javaagent:/Users/congqingquan/development/skywalking/skywalking-agent/skywalking-agent.jar
     -DSW_AGENT_NAME=skywalking-goods-service
     -DSW_AGENT_COLLECTOR_BACKEND_SERVICES=127.0.0.1:8800
     */
    
    public static void main(String[] args) {
        SpringApplication.run(SkywalkingGoodsServiceApplication.class, args);
    }
    
}
