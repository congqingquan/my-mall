package priv.cqq.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * Created by QQ.Cong on 2022-12-30 / 14:46:54
 *
 * @author: CongQingquan
 * @Description: 响应项
 */
@Getter
@AllArgsConstructor
public enum RItem {

    SUCCESS(200, "成功"),
    UNAUTHENTICATED(401, "未认证"),
    UNAUTHORIZED(403, "未授权"),
    SERVER_INNER_EXCEPTION(500, "服务内部异常"),
    BUSINESS_EXCEPTION(600, "业务异常"),
    VALIDATED_EXCEPTION(700, "参数验证异常");

    private final long code;

    private final String message;
}