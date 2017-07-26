package com.store.service;

import com.store.been.PageBean;
import com.store.model.Orders;
import org.apache.ibatis.annotations.Param;

import java.util.List;
/**
 * Created by 陈晓海 on 2017/7/22.
 */
public interface OrderService {
    void creatOrders(Integer[] itemIds,Integer userId,Integer cartId);
}
