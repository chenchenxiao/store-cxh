package com.store.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.store.been.PageBean;
import com.store.dao.AdminMapper;
import com.store.dao.AdvertisementMapper;
import com.store.model.Admin;
import com.store.model.Advertisement;
import com.store.model.Orders;
import com.store.model.User;
import com.store.service.AdminService;
import com.store.util.Md5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by 陈晓海 on 2017/7/27.
 */
@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;
    @Autowired
    private AdvertisementMapper advertisementMapper;
    //管理员登录
    public Admin login(Admin admin){
        admin.setPassword(Md5Util.convertMD5(admin.getPassword()));
        return adminMapper.selectOne(admin);
    }

    //查询所有的用户
    public PageBean userList(PageBean pageBean) {
        //防止为空串
        if("".equals(pageBean.getSearchText())){
            pageBean.setSearchText(null);
        }
        if(pageBean.getSearchText() != null && pageBean.getSearchText() != ""){
            pageBean.setSearchText("%" + pageBean.getSearchText() + "%");
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

    //根据id查询用户订单所有订单
    public List<Orders> showOrder(Integer userId) {
        User user = adminMapper.selectOrders(userId);
        //如果该用户没有创建过定单就返回null
        if(user == null){
            return null;
        }
        //返回用户的订单集合
        return user.getOrdersList();
    }

    //查询所有的广告
    public PageBean showAllAd(PageBean pageBean) {
        if("".equals(pageBean.getSearchText())){
            pageBean.setSearchText(null);
        }
        if(pageBean.getSearchText() != null && pageBean.getSearchText() != ""){
            String searchText = "%" + pageBean.getSearchText() + "%";
            pageBean.setSearchText(searchText);
        }
        PageHelper.startPage(pageBean.getPage(),pageBean.getSize());
        List list = adminMapper.adList(pageBean.getSearchText());
        //把分页出来的数据放入pageBean
        pageBean.setRecordList(list);
        //取分页信息
        PageInfo<User> pageInfo = new PageInfo<User>(list);
        pageBean.init((int) pageInfo.getTotal(),list);
        return pageBean;
    }

    //修改广告状态
    public void adPass(Integer[] ids) {
        //把需要修改的商品的id遍历放入list集合
        List<Integer> list = new ArrayList<Integer>();
        for(Integer id:ids){
            list.add(id);
        }
        advertisementMapper.updateStatus(list,1);
    }
    //修改广告状态
    public void notPass(Integer[] ids) {
        //取得要修改的广告的id
        List<Integer> list = new ArrayList<Integer>();
        for(Integer id:ids){
            list.add(id);
        }
        advertisementMapper.updateStatus(list,0);
    }
}
