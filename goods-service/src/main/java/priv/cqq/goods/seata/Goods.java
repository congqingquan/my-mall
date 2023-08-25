package priv.cqq.goods.seata;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.experimental.Accessors;

import java.math.BigDecimal;

@Data
@Accessors(chain = true)
@TableName("goods")
public class Goods {
    @TableId
    private Long id;
    private String name;
    private BigDecimal price;
    private Integer stock;
}
