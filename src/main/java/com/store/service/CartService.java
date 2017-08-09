package com.store.service;

import com.store.model.Cart;

/**
 * Created by 陈晓海 on 2017/7/25.
 */
public interface CartService {
    //添加商品到购物车
    void addToCart(Integer itemsId,Integer userId);
    //根据用户的id取得购物车信息
    Cart showCart(Integer id);
}
