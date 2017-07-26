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



}
