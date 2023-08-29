package priv.cqq.util;

import org.springframework.beans.BeanUtils;

/**
 * Created by QQ.Cong on 2023-01-10 / 11:56
 *
 * @Description 可返回的 BeanUtils
 */
public class ReturnableBeanUtils {

    private ReturnableBeanUtils() {}

    public static <T> T copyProperties(Object source, T target) {
        BeanUtils.copyProperties(source, target);
        return target;
    }
}