package priv.cqq.openfeign.model.vo;

import lombok.Data;
import lombok.experimental.Accessors;

/**
 * Created by QQ.Cong on 2023-07-06 / 11:30
 *
 * @Description
 */
@Data
@Accessors(chain = true)
public class OrderFeignVO {

    private Long orderId;

    private String orderCode;
}