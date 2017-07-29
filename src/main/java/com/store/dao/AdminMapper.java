package com.store.dao;

import com.store.been.PageBean;
import com.store.model.Admin;
import com.store.model.Advertisement;
import com.store.model.Orders;
import com.store.model.User;
import com.store.util.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by 陈晓海 on 2017/7/27.
 */
public interface AdminMapper extends BaseMapper<Admin> {
    //用户列表
    List<User> userList(@Param("searchText") String searchText);

    //多对多查询用户的订单和订单的商品信息
    User selectOrders(@Param("userId") Integer userId);

    List<Advertisement> adList(String searchText);

}
