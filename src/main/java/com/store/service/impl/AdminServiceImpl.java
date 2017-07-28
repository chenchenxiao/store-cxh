package com.store.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.store.been.PageBean;
import com.store.dao.AdminMapper;
import com.store.model.Admin;
import com.store.model.Orders;
import com.store.model.User;
import com.store.service.AdminService;
import com.store.util.Md5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 陈晓海 on 2017/7/27.
 */
@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;
    //管理员登录
    public Admin login(Admin admin){
        admin.setPassword(Md5Util.convertMD5(admin.getPassword()));
        return adminMapper.selectOne(admin);
    }

    public PageBean userList(PageBean pageBean) {
        //防止为空串
        if("".equals(pageBean.getSearchText())){
            pageBean.setSearchText(null);
        }
        PageHelper.startPage(pageBean.getPage(),pageBean.getSize());
        List list = adminMapper.userList(pageBean.getSearchText());
        //把分页出来的数据放入pageBean
        pageBean.setRecordList(list);
        //取分页信息
        PageInfo<User> pageInfo = new PageInfo<User>(list);
        pageBean.init((int) pageInfo.getTotal(),list);
        return pageBean;
    }


    public List<Orders> showOrder(Integer userId) {
        User user = adminMapper.selectOrders(userId);
        //返回用户的订单集合
        return user.getOrdersList();
    }
}
