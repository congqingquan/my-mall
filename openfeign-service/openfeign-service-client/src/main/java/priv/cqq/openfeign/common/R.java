package priv.cqq.openfeign.common;

import lombok.Builder;
import lombok.Data;
import lombok.experimental.Accessors;

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

	/**
	 * Response code
	 */
	private long code;
	/**
	 * Response data
	 */
	private T data;
	/**
	 * Response message
	 */
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
	
	/**
	 * 成功
	 * @return
	 */
	public static R<?> success() {
		return success(null);
	}

	/**
	 * 成功
	 * @param data
	 * @param <T>
	 * @return
	 */
	public static <T> R<T> success(T data) {
		return new R<>(RItem.SUCCESS.getCode(), data, RItem.SUCCESS.getMessage());
	}

	/**
	 * 响应
	 * @param item
	 * @param <T>
	 * @return
	 */
	public static <T> R<T> response(RItem item) {
		return new R<>(item.getCode(), null, item.getMessage());
	}
}