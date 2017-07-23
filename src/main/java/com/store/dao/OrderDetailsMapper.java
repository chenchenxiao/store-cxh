package com.store.dao;

import com.store.model.OrderDetails;
import tk.mybatis.mapper.common.BaseMapper;

/**
 * Created by 陈晓海 on 2017/7/22.
 */
public interface OrderDetailsMapper extends BaseMapper<OrderDetails> {
    void updateNumber(OrderDetails orderDetails);
}
