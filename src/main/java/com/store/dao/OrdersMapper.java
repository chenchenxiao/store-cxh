package com.store.dao;

import com.store.been.PageBean;
import com.store.model.Orders;
import java.util.List;

import com.store.util.BaseMapper;
import org.apache.ibatis.annotations.Param;


/**
 * Created by 陈晓海 on 2017/7/22.
 */
public interface OrdersMapper extends BaseMapper<Orders> {
    Orders showCart(@Param("id") Integer id);

    Orders getDetailsList(@Param("id") String id);

    void updatePayment(@Param("ordersId") String ordersId);
}
