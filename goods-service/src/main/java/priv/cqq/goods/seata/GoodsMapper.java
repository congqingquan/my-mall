package priv.cqq.goods.seata;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface GoodsMapper extends BaseMapper<Goods> {

    @Update("update goods set stock = stock - ${num} where id = #{goodsId} and stock >= ${num}")
    int reduce(@Param("goodsId") Long goodsId, @Param("num") int num);

    @Update("update goods set stock = stock + ${num} where id = #{goodsId}")
    int plus(@Param("goodsId") Long goodsId, @Param("num") int num);
}
