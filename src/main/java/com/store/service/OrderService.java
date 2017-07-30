package com.store.service;

import com.store.model.CartItems;

import java.util.List;

/**
 * Created by 陈晓海 on 2017/7/22.
 */
public interface OrderService {
    //创建订单
    String creatOrders(Integer[] itemIds, Integer userId, Integer cartId);
    //展示购物车商品
    List<CartItems > showCartItems(Integer[] itemIds,Integer cartId);
}
