package com.store.service;

import com.store.model.Cart;
import com.store.model.CartItems;

/**
 * Created by 陈晓海 on 2017/7/25.
 */
public interface CartItemsService {
    void deleteByIds(Integer[] id,Integer cartId);

    Cart updateItemsNumber(CartItems cartItems);
}
