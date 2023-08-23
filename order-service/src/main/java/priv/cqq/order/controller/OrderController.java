package priv.cqq.order.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class OrderController {

    @Autowired
    private OrderMapper orderMapper;

    @PostMapping("/order")
    public ResponseEntity<Long> create(Order order){
        orderMapper.insert(order);
        return ResponseEntity.status(HttpStatus.CREATED).body(order.getId());
    }
}