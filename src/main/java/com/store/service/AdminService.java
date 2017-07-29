package com.store.service;

import com.store.been.PageBean;
import com.store.model.Admin;
import com.store.model.Advertisement;
import com.store.model.Orders;
import java.util.List;

/**
 * Created by 陈晓海 on 2017/7/27.
 */
public interface AdminService {
    //管理员登录
    Admin login(Admin admin);

    //查找所有用户
    PageBean userList(PageBean pageBean);

    //查看用户订单详情
    List<Orders> showOrder(Integer userId);

    //显示所有的广告
    PageBean showAllAd(PageBean pageBean);

    //修改让广告显示
    void adPass(Integer[] ids);

    //修改让广告不显示
    void notPass(Integer[] ids);


}
