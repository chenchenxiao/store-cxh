package com.store.dao;

import com.store.model.OrderDetails;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.BaseMapper;
import tk.mybatis.mapper.common.condition.UpdateByConditionSelectiveMapper;

import java.util.List;

/**
 * Created by 陈晓海 on 2017/7/22.
 */
public interface OrderDetailsMapper extends BaseMapper<OrderDetails>{
//   void upd(OrderDetails orderDetails);

    void deleteByIds(@Param("ids") List<Integer> list);


}
