package priv.cqq.openfeign.feign;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RestController;
import priv.cqq.openfeign.common.R;
import priv.cqq.openfeign.model.vo.OrderFeignVO;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

// 模拟订单服务
@Slf4j
@RestController
public class OrderFeignController implements OrderFeignService {

    @Resource
    private HttpServletRequest httpServletRequest;

    @Override
    public R<OrderFeignVO> selectById(Long orderId) {
        // 超时测试
//        try {
//            Thread.sleep(3000);
//        } catch (InterruptedException e) {
//            throw new RuntimeException(e);
//        }
        log.info("Auth header {}", httpServletRequest.getHeader("Authorization"));
        // fallback 测试
        int i = 1 / 0;
        return R.success(new OrderFeignVO().setOrderId(orderId).setOrderCode("S" + orderId));
    }

    // 测试契约配置: 如果要测试契约，需要去除接口中配置的 GetMapping，所以需要重写该方法并声明请求路径
//    @Override
//    @GetMapping("/order/feign/selectById/{orderId}")
//    public R<OrderFeignVO> selectById(Long orderId) {
//        return R.success(new OrderFeignVO().setOrderId(orderId).setOrderCode("S" + orderId));
//    }
}