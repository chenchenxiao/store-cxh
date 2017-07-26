package com.store.service;

import com.store.model.Cart;
import com.store.model.CartItems;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by 陈晓海 on 2017/7/25.
 */
public interface CartItemsService {
    //删除购物车商品
    void deleteByIds(Integer[] id,Integer cartId);
    //修改购物车商品的数量
    Cart updateItemsNumber(CartItems cartItems);


}
