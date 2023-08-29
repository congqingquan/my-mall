package priv.cqq.exception;

import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import priv.cqq.entity.R;
import priv.cqq.enums.RItem;

import javax.servlet.http.HttpServletRequest;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * Created by QQ.Cong on 2022-12-30 / 14:41:03
 *
 * @author: CongQingquan
 * @Description: 全局异常处理器
 *
 * 注册方式：
 * 1. @ComponentScan(basePackages = "priv.cqq.exception")
 * 2. 组件注册器：
 * @Component
 * public class ComponentRegistry implements BeanDefinitionRegistryPostProcessor {
 *
 *     @Override
 *     public void postProcessBeanDefinitionRegistry(BeanDefinitionRegistry registry) throws BeansException {
 *         // 1. 注册全局异常处理器
 *          GenericBeanDefinition beanDefinition = new GenericBeanDefinition();
 *          beanDefinition.setBeanClass(GlobalExceptionHandler.class);
 *          registry.registerBeanDefinition(Objects.requireNonNull(beanDefinition.getBeanClassName()), beanDefinition);
 *     }
 *
 *     @Override
 *     public void postProcessBeanFactory(ConfigurableListableBeanFactory beanFactory) throws BeansException {
 *         // Do nothing
 *     }
 * }
 */
@Slf4j
@RestControllerAdvice
@ResponseBody
public class GlobalExceptionHandler {

    private static final String LOG_EXCEPTION_FORMAT =
            "GlobalExceptionHandler: URI [%s], Response code [%s], Message [%s]";

    private String getBaseMessage(HttpServletRequest request, RItem responseItem) {
        return String.format(LOG_EXCEPTION_FORMAT,
                request.getRequestURI(),
                responseItem.getCode(),
                responseItem.getMessage()
        );
    }

    private String concatFieldError(List<FieldError> fieldErrorList) {
        StringBuilder builder = new StringBuilder();
        fieldErrorList.forEach(fieldError ->
                builder.append("[")
                        .append(fieldError.getField())
                        .append(" > ")
                        .append(fieldError.getDefaultMessage())
                        .append("]")
                        .append(", ")
        );
        return builder.substring(0, builder.length() - 2);
    }

    @ExceptionHandler(UnauthenticatedException.class)
    @ResponseStatus(HttpStatus.UNAUTHORIZED)
    public R<?> handleUnauthenticatedException(HttpServletRequest request, UnauthenticatedException exception) {
        log.error(getBaseMessage(request, RItem.UNAUTHENTICATED), exception);
        return new R<>(RItem.UNAUTHENTICATED.getCode(), null, exception.getMessage());
    }

    @ExceptionHandler(UnauthorizedException.class)
    @ResponseStatus(HttpStatus.FORBIDDEN)
    public R<?> handleUnauthorizedException(HttpServletRequest request, UnauthenticatedException exception) {
        log.error(getBaseMessage(request, RItem.UNAUTHORIZED), exception);
        return new R<>(RItem.UNAUTHORIZED);
    }

    @ExceptionHandler(BusinessException.class)
    @ResponseStatus(HttpStatus.OK)
    public R<?> handleBusinessException(HttpServletRequest request, BusinessException exception) {
        log.error(getBaseMessage(request, RItem.BUSINESS_EXCEPTION), exception);
        return new R<>(RItem.BUSINESS_EXCEPTION.getCode(), null, exception.getMessage());
    }

    @ExceptionHandler(value = {BindException.class, MethodArgumentNotValidException.class, ConstraintViolationException.class,})
    @ResponseStatus(HttpStatus.OK)
    public R<?> handleValidatedException(HttpServletRequest request, Throwable exception) {
        log.error(getBaseMessage(request, RItem.VALIDATED_EXCEPTION), exception);
        // ValidationException 的子类异常 ConstraintViolationException
        if (exception instanceof ConstraintViolationException) {
            /*
             * ConstraintViolationException的e.getMessage()形如: {方法名}.{参数名}: {message} 这里只需要取后面的message即可
             */
            ConstraintViolationException constraintViolationException = (ConstraintViolationException) exception;
            Set<ConstraintViolation<?>> constraintViolations = constraintViolationException.getConstraintViolations();
            String message = constraintViolations.stream().map(ConstraintViolation::getMessage).collect(Collectors.joining(";"));
            return new R<>(RItem.VALIDATED_EXCEPTION.getCode(), null, message);
        }
        // MethodArgumentNotValidException: BindException 的子类，当接口的请求类型为 application/json 时产生的参数校验异常
        if (exception instanceof MethodArgumentNotValidException) {
            MethodArgumentNotValidException methodArgumentNotValidException = (MethodArgumentNotValidException) exception;
            BindingResult bindingResult = methodArgumentNotValidException.getBindingResult();
            return new R<>(RItem.VALIDATED_EXCEPTION.getCode(), null, concatFieldError(bindingResult.getFieldErrors()));
        }
        // BindException: 顶级的参数校验异常
        else if (exception instanceof BindException) {
            BindException bindException = (BindException) exception;
            BindingResult bindingResult = bindException.getBindingResult();
            return new R<>(RItem.VALIDATED_EXCEPTION.getCode(), null, concatFieldError(bindingResult.getFieldErrors()));
        }
        return new R<>(RItem.VALIDATED_EXCEPTION);
    }

    @ExceptionHandler(Exception.class)
    @ResponseStatus(HttpStatus.OK)
    public R<?> handleException(HttpServletRequest request, Exception exception) {
        log.error(getBaseMessage(request, RItem.SERVER_INNER_EXCEPTION), exception);
        return new R<>(RItem.SERVER_INNER_EXCEPTION);
    }
}