package priv.cqq.order.controller;

import io.seata.spring.annotation.GlobalTransactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import priv.cqq.order.controller.client.GoodsFeignClient;

import java.time.LocalDateTime;

@RestController
public class OrderController {

    @Autowired
    private GoodsFeignClient goodsFeignClient;

    @Autowired
    private OrderMapper orderMapper;

    @PostMapping("/order")
    @GlobalTransactional
    public ResponseEntity<Long> create(Order order) {
        order.setCreateTime(LocalDateTime.now());
        orderMapper.insert(order);
        goodsFeignClient.reduceStock(order.getGoodsId(), order.getTotal());
        return ResponseEntity.status(HttpStatus.CREATED).body(order.getId());
    }
}