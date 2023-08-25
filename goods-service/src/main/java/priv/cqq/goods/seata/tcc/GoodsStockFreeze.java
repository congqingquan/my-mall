package priv.cqq.goods.seata.tcc;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("goods_stock_freeze")
public class GoodsStockFreeze {

    @TableId(type = IdType.INPUT)
    private String xid;
    private Integer freezeStock;
    private Integer state;

    public static abstract class State {
        public final static int TRY = 0;
        public final static int CONFIRM = 1;
        public final static int CANCEL = 2;
    }
}
