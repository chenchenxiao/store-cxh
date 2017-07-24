package com.store.service.impl;

import com.store.dao.ItemsMapper;
import com.store.dao.OrderDetailsMapper;
import com.store.dao.OrdersMapper;
import com.store.model.Items;
import com.store.model.OrderDetails;
import com.store.model.Orders;
import com.store.service.OrderDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by 陈晓海 on 2017/7/22.
 */
@Service
public class OrderDetailsServiceImpl implements OrderDetailsService {
    @Autowired
    private OrderDetailsMapper orderDetailsMapper;
    @Autowired
    private ItemsMapper itemsMapper;
    @Autowired
    private OrdersMapper ordersMapper;
    //批量删除购物车商品
    public void deleteByIds(Integer[] ids,String ordersId) {
        List<Integer> list = new ArrayList<Integer>();
        //把数组的值通过循环赋给list，mapper传参list
        for(int id:ids){
            list.add(id);
        }
        orderDetailsMapper.deleteByIds(list);
        //根基明细单的订单id取得对应的订单
        Orders orders = ordersMapper.getDetailsList(ordersId);
        //订单对应的明细单集合
        List<OrderDetails> detailsList = orders.getOrderDetailsList();
        //取得订单中所有明细单的总金额，相加就是订单的总金额
        System.out.println(orders);
        System.out.println(list.toString());
        Float payment = Float.valueOf(0);
        for(int i = 0;i < list.size();i++){
            System.out.println(detailsList.get(i).getCost());
            payment += detailsList.get(i).getCost();
        }
        //设置订单的总金额
        orders.setPayment(payment);
        //修改同步到数据库
        ordersMapper.updateByPrimaryKeySelective(orders);
    }
    //修改商品的数量
    public Orders updateItemsNumber(OrderDetails orderDetails) {
        //给明细单设置总金额
        orderDetails.setCost(orderDetails.getMoney() * orderDetails.getItemsNumber());
        //先同步到数据库，后面的集合中取得的数据才准确
        orderDetailsMapper.updateByPrimaryKeySelective(orderDetails);

        //根基明细单的订单id取得对应的订单
        Orders orders = ordersMapper.getDetailsList(orderDetails.getOrdersId());
        //订单对应的明细单集合
        List<OrderDetails> list = orders.getOrderDetailsList();
        //取得订单中所有明细单的总金额，相加就是订单的总金额
        System.out.println(orders);
        System.out.println(list.toString());
        Float payment = Float.valueOf(0);
        for(int i = 0;i < list.size();i++){
            System.out.println(list.get(i).getCost());
           payment += list.get(i).getCost();
        }
        //设置订单的总金额
        orders.setPayment(payment);
        //修改同步到数据库
        ordersMapper.updateByPrimaryKeySelective(orders);
        return orders;
    }


}
