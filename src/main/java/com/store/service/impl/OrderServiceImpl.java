package com.store.service.impl;

import com.store.been.PageBean;
import com.store.dao.ItemsMapper;
import com.store.dao.OrderDetailsMapper;
import com.store.dao.OrdersMapper;
import com.store.model.Orders;
import com.store.model.OrderDetails;
import com.store.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

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

    //用户加入商品到购物车，创建订单
    @Transactional(rollbackFor = Exception.class)
    public Boolean addToCart(Integer itemsId,Integer userId)  {
        //先从数据库查找是否存在符合条件的对象
        boolean flag = true;
        try {
            Orders orders = ordersMapper.selectOne(new Orders(userId));
            //判断该用户的购物车是否已经存在商品，即是否已经创建过订单
            //如果已经创建过订单就不用创建订单
            OrderDetails orderDetails;
            if (orders != null) {
                //判断是否已经有该商品的订单明细单
                 orderDetails = orderDetailsMapper.selectOne(new OrderDetails(orders.getId(),itemsId));
                //如果订单明细单不为空则该商品则该商品数量加一，否则就创建新的订单明细单
                if (orderDetails != null) {
                    orderDetails.setItemsNumber(orderDetails.getItemsNumber() + 1);
                    //修改该明细单的信息
                    orderDetailsMapper.updateNumber(orderDetails);
                } else {
                    //创建新的明细单
                    orderDetails = new OrderDetails(orders.getId(),itemsId,1);
                    //保存该明细单
                    orderDetailsMapper.insertSelective(orderDetails);
                }
            } else {
                //创建新的订单
                //给订单号赋值，使用UUID生成
                String ordersId = UUID.randomUUID().toString();
                orders = new Orders(ordersId,userId);
                //给明细单赋值
                orderDetails = new OrderDetails(ordersId,itemsId,1);
                //保存订单和明细单到数据库
                ordersMapper.insertSelective(orders);
                orderDetailsMapper.insertSelective(null);
            }
        } catch (Exception e) {
            e.printStackTrace();
            //由于加了trycatch，所以必须加上下面的代码事务才会回滚，如果不加trycatch则会自动回滚
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly() ;
        }
        return flag;
    }
    @Transactional
    //展示购物车的商品
    public Orders showCart(Integer id){
        return ordersMapper.showCart(id);
    }
}
