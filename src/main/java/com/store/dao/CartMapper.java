package com.store.dao;

import com.store.model.Cart;
import com.store.model.CartItems;
import com.store.util.BaseMapper;
import org.apache.ibatis.annotations.Param;

/**
 * Created by 陈晓海 on 2017/7/25.
 */
public interface CartMapper extends BaseMapper<Cart> {
    Integer addCart(Cart cart);

    Cart showCart(@Param("id") Integer id);

    Cart getCartById(@Param("id") Integer id);

    Cart getCartByUserId(@Param("id") Integer id);

    void updatePayment(Cart cart);

    Cart selectById(@Param("id") Integer id);
}
