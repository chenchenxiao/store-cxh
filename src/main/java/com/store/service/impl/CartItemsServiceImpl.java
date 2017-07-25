package com.store.service.impl;

import com.store.dao.CartItemsMapper;
import com.store.dao.CartMapper;
import com.store.dao.OrderDetailsMapper;
import com.store.model.Cart;
import com.store.model.CartItems;
import com.store.model.OrderDetails;
import com.store.model.Orders;
import com.store.service.CartItemsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by 陈晓海 on 2017/7/25.
 */
@Service
public class CartItemsServiceImpl implements CartItemsService {
        @Autowired
        private CartItemsMapper cartItemsMapper;
        @Autowired
        private CartMapper cartMapper;
        //批量删除购物车商品
        public void deleteByIds(Integer[] ids,Integer cartId) {
            List<Integer> list = new ArrayList<Integer>();
            //把数组的值通过循环赋给list，mapper传参list
            for(int id:ids){
                list.add(id);
            }
            cartItemsMapper.deleteByIds(list);
            //根基明细单的订单id取得对应的订单
            Cart cart = cartMapper.getCartById(cartId);
            System.out.println("-->" + cart);
            //判断购物车是否为空，即是否删除了购物车的所有商品，如果不为空就重新计算购物车商品的总金额，如果为空就把购物车商品的总金额改为0
            if(cart != null){
                //购物车中的商品详情
                List<CartItems> cartItemsList = cart.getCartItemsList();
                //取得购物车中各个商品的总金额，相加就是所有商品的总金额
                System.out.println(list.toString());
                Float payment = Float.valueOf(0);
                for(int i = 0;i < cartItemsList.size();i++){
                    System.out.println(cartItemsList.get(i).getCost());
                    payment += cartItemsList.get(i).getCost();
                }
                //设置购物车商品的总金额
                cart.setPayment(payment);
                //修改同步到数据库
                cartMapper.updatePayment(cart);
            }else{
                cart = cartMapper.selectByPrimaryKey(cartId);
                cart.setPayment((float) 0);
                cartMapper.updatePayment(cart);
            }
        }

    public Cart updateItemsNumber(CartItems cartItems) {
        //给商品设置全额
        cartItems.setCost(cartItems.getMoney() * cartItems.getItemsNumber());
        //先同步到数据库，后面的集合中取得的数据才准确
        cartItemsMapper.updateByPrimaryKeySelective(cartItems);

        //根据商品对应购物车的取得对应的购物车信息
        Cart cart = cartMapper.getCartById(cartItems.getCartId());
        //购物车对应的商品集合
        List<CartItems> list = cart.getCartItemsList();
        //取得购物车中商品的金额，相加就是购物车的总金额
        System.out.println(cart);
        System.out.println(list.toString());
        Float payment = Float.valueOf(0);
        for(int i = 0;i < list.size();i++){
            System.out.println(list.get(i).getCost());
            payment += list.get(i).getCost();
        }
        //设置购物车的总金额
        cart.setPayment(payment);
        //修改同步到数据库
        cartMapper.updatePayment(cart);
        return cart;
    }
}
