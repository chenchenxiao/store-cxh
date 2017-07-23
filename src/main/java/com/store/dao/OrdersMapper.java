package com.store.dao;

import com.store.been.PageBean;
import com.store.model.Orders;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.BaseMapper;
import tk.mybatis.mapper.common.Mapper;

/**
 * Created by 陈晓海 on 2017/7/22.
 */
public interface OrdersMapper extends Mapper<Orders> {
    Orders showCart(@Param("id") Integer id);
}
