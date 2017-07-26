package com.store.service.impl;

import com.store.been.PageBean;
import com.store.dao.CartItemsMapper;
import com.store.dao.ItemsMapper;
import com.store.dao.OrderDetailsMapper;
import com.store.dao.OrdersMapper;
import com.store.model.CartItems;
import com.store.model.Items;
import com.store.model.Orders;
import com.store.model.OrderDetails;
import com.store.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

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

    public void creatOrders(Integer[] itemIds, Integer userId,Integer cartId) {
        //保存商品id的集合
        List<Integer> list = new ArrayList<Integer>();
        //把数组的值通过循环赋给list
        for(int id:itemIds){
             list.add(id);
        }
        //取得购物车所选择的商品
        List<CartItems> cartItemsList = cartItemsMapper.getCartItemsList(list,cartId);
         //保存订单明细的集合
        List<OrderDetails> orderDetailsList = new ArrayList<OrderDetails>();
        //订单明细表对象
        OrderDetails orderDetails = new OrderDetails();
        //订单总金额
        Float payment = Float.valueOf(0);
        //生成订单号
        String ordersId = UUID.randomUUID().toString() ;
        System.out.println("-->" + cartItemsList);
        //给订单明细表各个值赋值
        for(int i = 0;i < cartItemsList.size();i++){
            orderDetails.setItemsNumber(cartItemsList.get(i).getItemsNumber());
            orderDetails.setMoney(cartItemsList.get(i).getMoney());
            orderDetails.setOrdersId(ordersId);
            orderDetails.setItemsId(cartItemsList.get(i).getItemsId());
            orderDetailsList.add(orderDetails);
            payment += cartItemsList.get(i).getCost();
        }
        //创建订单
        ordersMapper.insertSelective(new Orders(ordersId,userId,payment));
        //把订单明细表保存到数据库
        orderDetailsMapper.insertList(orderDetailsList);
        //删除购物车中加入订单的商品
        cartItemsMapper.deleteByCartId(list,cartId);
    }
}
