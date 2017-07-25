package com.store.dao;

import com.store.model.Cart;
import com.store.model.CartItems;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.BaseMapper;

/**
 * Created by 陈晓海 on 2017/7/25.
 */
public interface CartMapper extends BaseMapper<Cart>{
    Integer addCart(Cart cart);

    Cart showCart(@Param("id") Integer id);

    Cart getCartById(@Param("id") Integer id);

    void updatePayment(Cart cart);
}
