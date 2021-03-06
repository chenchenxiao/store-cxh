package com.store.test;

import com.github.pagehelper.PageHelper;
import com.store.dao.*;
import com.store.model.Cart;
import com.store.model.OrderDetails;
import com.store.model.Orders;
import com.store.model.User;
import com.store.service.impl.OrderDetailsServiceImpl;
import org.apache.ibatis.annotations.Param;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * Created by 陈晓海 on 2017/7/8.
 */
@Component
public class BaseMapperTest {
    @Test
    public void baseMapperTest(){
        ApplicationContext application = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");

        UserMapper userMapper = application.getBean(UserMapper.class);
        OrderDetailsMapper orderDetailsMapper = application.getBean(OrderDetailsMapper.class);
        OrdersMapper orderMapper = application.getBean(OrdersMapper.class);
        CartMapper cartMapper = application.getBean(CartMapper.class);
        AdvertisementMapper advertisementMapper = application.getBean(AdvertisementMapper.class);
//        userMapper.selectOne(new User(1,"1",null,null));
//        userMapper.selectById(1);
//        userMapper.selectByPrimaryKey(1);
//        PageHelper.startPage(1,5);
//        userMapper.selectAll();
//          int i = userMapper.selectCountByExample("test");
//        System.out.println(i);
//        userMapper.selectByPrimaryKey(1);
//        ItemsMapper itemsMapper = application.getBean(ItemsMapper.class);
//        System.out.println(itemsMapper.showTypeItems("服装"));
//         OrderDetails orderDetails = orderDetailsMapper.selectByPrimaryKey(1);
//         orderDetailsMapper.updateByConditionSelective(orderDetails, 20);
//          Orders orders = orderMapper.getDetailsList("a712a586-282e-4858-98c0-5fc4f0050401");
//        Cart cart = new Cart();
//        cart.setPayment((float) 0);
//        cart.setUserId(47);
//        String str = "/admin/admin/userList";
//        System.out.println(str.substring(str.indexOf("/"),str.lastIndexOf("/")));
//        User user = userMapper.selectByPrimaryKey(56);
//        System.out.println(user);

        System.out.println(advertisementMapper.selectHotSell("服装").get(0));
        System.out.println("--------");
        System.out.println(advertisementMapper.selectHotSell("美食").get(0));
    }
    public void testQuart(){
        System.out.println("aaa");
    }
}
