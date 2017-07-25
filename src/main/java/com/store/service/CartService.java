package com.store.service;

import com.store.model.Cart;

/**
 * Created by 陈晓海 on 2017/7/25.
 */
public interface CartService {
    void addToCart(Integer itemsId,Integer userId);

    Cart showCart(Integer id);
}
