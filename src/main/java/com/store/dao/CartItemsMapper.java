package com.store.dao;

import com.store.model.Cart;
import com.store.model.CartItems;
import com.store.model.OrderDetails;
import com.store.util.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by 陈晓海 on 2017/7/25.
 */
public interface CartItemsMapper extends BaseMapper<CartItems> {
    //根据id集合删除购物车商品
    void deleteByIds(@Param("ids") List<Integer> list);
//    //修改商品的总金额
    void updateCost(CartItems cartItems);

    //根据商品的id和购物车id取得对应的购物车商品集合
    List<CartItems> selectCartitemsList(@Param("ids") List<Integer> ids, @Param("cartId") Integer cartId);

    //根据商品的id和购物车id删除对应购物车商品
    void deleteByCartId(@Param("ids") List<Integer> ids,@Param("cartId") Integer cartId);
}
