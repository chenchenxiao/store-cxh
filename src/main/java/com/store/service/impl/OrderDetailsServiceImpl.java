package com.store.service.impl;

import com.store.dao.OrderDetailsMapper;
import com.store.model.OrderDetails;
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
    //批量删除购物车商品
    public void deleteByIds(Integer[] ids) {
        List<Integer> list = new ArrayList<Integer>();
        //把数组的值通过循环赋给list，mapper传参list
        for(int id:ids){
            list.add(id);
        }
        System.out.println("size" + list.size());
        orderDetailsMapper.deleteByIds(list);
    }
    //修改商品的数量
    public void updateItemsNumber(OrderDetails orderDetails) {
        orderDetails.setCost(orderDetails.getMoney() * orderDetails.getItemsNumber());
        orderDetailsMapper.updateByPrimaryKeySelective(orderDetails);
    }
}
