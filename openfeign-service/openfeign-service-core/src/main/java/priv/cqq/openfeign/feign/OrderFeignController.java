package priv.cqq.openfeign.feign;

import org.springframework.web.bind.annotation.RestController;
import priv.cqq.openfeign.common.R;
import priv.cqq.openfeign.model.vo.OrderFeignVO;

// 模拟订单服务
@RestController
public class OrderFeignController implements OrderFeignService {

    @Override
    public R<OrderFeignVO> selectById(Long orderId) {
        return R.success(new OrderFeignVO().setOrderId(orderId).setOrderCode("S" + orderId));
    }

    // 测试契约配置: 如果要测试契约，需要去除接口中配置的 GetMapping，所以需要重写该方法并声明请求路径
//    @Override
//    @GetMapping("/order/feign/selectById/{orderId}")
//    public R<OrderFeignVO> selectById(Long orderId) {
//        return R.success(new OrderFeignVO().setOrderId(orderId).setOrderCode("S" + orderId));
//    }
}