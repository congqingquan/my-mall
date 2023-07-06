package priv.cqq.openfeign.common;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * Created by Kim QQ.Cong on 2020-09-23 / 12:56:02
 *
 * @author: CongQingquan
 * @Description: 响应项
 */
@Getter
@AllArgsConstructor
public enum RItem {

    /**
     * Success
     */
    SUCCESS(200, "成功"),

    /**
     * 服务内部异常
     */
    SERVER_INNER_EXCEPTION(500, "服务内部异常"),

    /**
     * 业务异常
     */
    BUSINESS_EXCEPTION(600, "业务异常"),

    /**
     * 参数验证异常
     */
    VALIDATED_EXCEPTION(700, "参数验证异常");

    private final long code;

    private final String message;
}