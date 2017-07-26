package com.store.service;

import com.store.model.CartItems;

import java.util.List;

/**
 * Created by 陈晓海 on 2017/7/22.
 */
public interface OrderService {
    String creatOrders(Integer[] itemIds, Integer userId, Integer cartId);

    List<CartItems > showCartItems(Integer[] itemIds,Integer cartId);
}
