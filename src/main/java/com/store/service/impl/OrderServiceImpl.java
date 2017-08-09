package com.store.service.impl;

import com.store.dao.*;
import com.store.model.*;
import com.store.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * Created by 陈晓海 on 2017/7/22.
 */
@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    OrdersMapper ordersMapper;
    @Autowired
    ItemsMapper itemsMapper;
    @Autowired
    OrderDetailsMapper orderDetailsMapper;
    @Autowired
    CartItemsMapper cartItemsMapper;
    @Autowired
    CartMapper cartMapper;
    //创建订单，返回订单号
    public String creatOrders(Integer[] itemIds, Integer userId, Integer cartId) {
        //保存商品id的集合
        List<Integer> idList = new ArrayList<Integer>();
        //把数组的值通过循环赋给list
        for(int id:itemIds){
            idList.add(id);
        }
        //根据购物车商品的ID数组取得商品
        List<Items> itemsList = itemsMapper.selectListByIds(idList);
        //取得购物车所选择的商品
        List<CartItems> cartItemsList = cartItemsMapper.selectCartitemsList(idList,cartId);
         //保存订单明细的集合
        List<OrderDetails> orderDetailsList = new ArrayList<OrderDetails>();
        //订单总金额
        Float payment = Float.valueOf(0);
        //生成订单号
        String ordersId = UUID.randomUUID().toString() ;
        System.out.println("-->" + cartItemsList);
        //给订单明细表各个值赋值
        for(int i = 0;i < cartItemsList.size();i++){
            //订单明细表对象
            OrderDetails orderDetails = new OrderDetails();
            orderDetails.setItemsNumber(cartItemsList.get(i).getItemsNumber());
            orderDetails.setMoney(cartItemsList.get(i).getMoney());
            orderDetails.setOrdersId(ordersId);
            orderDetails.setItemsId(cartItemsList.get(i).getItemsId());
            orderDetails.setCost(cartItemsList.get(i).getCost());
            orderDetailsList.add(orderDetails);
            payment += cartItemsList.get(i).getCost();
            //修改商品的库存量
            itemsList.get(i).setNumber(itemsList.get(i).getNumber() - orderDetails.getItemsNumber());
            //修改商品库存量
            itemsMapper.updateByPrimaryKey(itemsList.get(i));
        }
        //创建订单
        ordersMapper.insertSelective(new Orders(ordersId,userId,payment));
        //把订单明细表保存到数据库
        orderDetailsMapper.insertList(orderDetailsList);
        //删除购物车中对应的商品
        cartItemsMapper.deleteByIds(idList);
        //清空购物车商品的总价
        Cart cart = cartMapper.selectById(cartId);
        cart.setPayment(0f);
        cart.setId(cartId);
        //把购物车商品总价改为0
        cartMapper.updatePayment(cart);
        return ordersId;
    }

    //用户确认订单
    public List<CartItems > showCartItems(Integer[] itemIds,Integer cartId){
        //保存商品id的集合
        List<Integer> list = new ArrayList<Integer>();
        //把数组的值通过循环赋给list
        for(int id:itemIds){
            list.add(id);
        }
        //取得购物车所选择的商品
        List<CartItems> cartItemsList = cartItemsMapper.selectCartitemsList(list,cartId);
        return cartItemsList;
    }

}
