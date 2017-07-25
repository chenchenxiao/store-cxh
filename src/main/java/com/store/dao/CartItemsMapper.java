package com.store.dao;

import com.store.model.Cart;
import com.store.model.CartItems;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.BaseMapper;

import java.util.List;

/**
 * Created by 陈晓海 on 2017/7/25.
 */
public interface CartItemsMapper extends BaseMapper<CartItems> {
    void deleteByIds(@Param("ids") List<Integer> list);

    Cart getList(@Param("id") Integer id);

    void updateCost(CartItems cartItems);
}
