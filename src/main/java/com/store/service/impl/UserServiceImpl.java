package com.store.service.impl;

import com.store.dao.UserMapper;
import com.store.model.User;
import com.store.service.UserService;
import com.store.util.Md5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sun.security.provider.MD5;

/**
 * Created by 陈晓海 on 2017/7/8.
 */
@Service
public class UserServiceImpl implements UserService{
    @Autowired
    UserMapper userMapper;

    //检验用户名或手机号是否已被注册
    public Integer checkRepeat(User user) {
        return userMapper.selectCount(user);
    }

    //注册用户
    public void addUser(User user) {
        user.setPassword(Md5Util.convertMD5(user.getPassword()));
        userMapper.insert(user);
    }

    //用户登录
    public User login(User user){
        user.setPassword(Md5Util.convertMD5(user.getPassword()));
        return userMapper.selectOne(user);
    }

    //用户修改自己的资料
    public User findUpdateUser(Integer id) {
        return userMapper.selectByPrimaryKey(id);
    }

    //用户修改资料时检验用户名
    public Integer checkAccount(String account) {
        return userMapper.checkAccount(account);
    }

    //用户修改资料
    public void update(User user){
        if(user.getPassword() != null){
            user.setPassword(Md5Util.convertMD5(user.getPassword()));
        }
        userMapper.updateByPrimaryKeySelective(user);
    }
}
