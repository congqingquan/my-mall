package priv.cqq.entity;

import lombok.Builder;
import lombok.Data;
import lombok.experimental.Accessors;
import priv.cqq.enums.RItem;

/**
 * Created by Kim QQ.Cong on 2020-09-23 / 12:11:03
 *
 * @author: CongQingquan
 * @Description: 响应实体
 */
@Data
@Builder(toBuilder = true)
@Accessors(chain = true)
public class R<T> {

	private long code;

	private T data;

	private String message;

	public R() {}

	public R(long code, T data, String message) {
		super();
		this.code = code;
		this.data = data;
		this.message = message;
	}
	
	public R(RItem responseItem) {
		this.code = responseItem.getCode();
		this.message = responseItem.getMessage();
	}

	public static R<?> success() {
		return success(null);
	}

	public static <T> R<T> success(T data) {
		return new R<>(RItem.SUCCESS.getCode(), data, RItem.SUCCESS.getMessage());
	}

	public static <T> R<T> response(RItem item) {
		return new R<>(item.getCode(), null, item.getMessage());
	}

	public static <T> R<T> response(long code, T data, String message) {
		return new R<>(code, data, message);
	}
}