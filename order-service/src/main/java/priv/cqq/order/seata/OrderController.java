package priv.cqq.order.seata;

import io.seata.spring.annotation.GlobalTransactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import priv.cqq.entity.R;
import priv.cqq.order.seata.client.GoodsFeignClient;

import java.time.LocalDateTime;

@RestController
public class OrderController {

    @Autowired
    private GoodsFeignClient goodsFeignClient;

    @Autowired
    private OrderMapper orderMapper;

    @PostMapping("/seata/order")
    @GlobalTransactional
    public R<Boolean> create(Order order) {
        order.setCreateTime(LocalDateTime.now());
        orderMapper.insert(order);
        return goodsFeignClient.reduceStock(order.getGoodsId(), order.getTotal());
    }

    @PostMapping("/seata/TCCOrder")
//    @GlobalTransactional
    public ResponseEntity<Long> TCCCreate(Order order) {
        order.setCreateTime(LocalDateTime.now());
        orderMapper.insert(order);
        goodsFeignClient.TCCReduceStock(order.getGoodsId(), order.getTotal());
        return ResponseEntity.status(HttpStatus.CREATED).body(order.getId());
    }
}