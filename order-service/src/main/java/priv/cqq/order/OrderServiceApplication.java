package priv.cqq.order;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@SpringBootApplication
@EnableDiscoveryClient
public class OrderServiceApplication {
    
    public static void main(String[] args) {
        SpringApplication.run(OrderServiceApplication.class, args);
    }
    
    @RestController
    public class OrderController {
        
        @Value("${server.port}")
        private String port;
        
        @GetMapping(value = "/echo/{string}")
        public String echo(
                @RequestHeader(value = "my-header", required = false) String mh,
                @PathVariable String string) {
            return String.format("Order service %s %s, header %s", port, string, mh);
        }
        
        @GetMapping(value = "/get")
        public String get() {
            return String.format("Order service %s Get %s ", port, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss").format(LocalDateTime.now()));
        }
    }
}
