package priv.cqq.exception;

/**
 * Created by QQ.Cong on 2022-12-30 / 14:50:25
 *
 * @author: CongQingquan
 * @Description: 业务异常
 */
public class BusinessException extends RuntimeException {
    
    public BusinessException() {
    }
    
    public BusinessException(String message) {
        super(message);
    }
    
    public BusinessException(String message, Throwable cause) {
        super(message, cause);
    }
    
    public BusinessException(Throwable cause) {
        super(cause);
    }
    
    public BusinessException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}