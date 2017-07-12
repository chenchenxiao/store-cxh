package com.store.service.impl;

import com.store.dao.UserMapper;
import com.store.model.User;
import com.store.service.UserService;
import com.store.util.Md5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 陈晓海 on 2017/7/8.
 */
@Service
public class UserServiceImpl implements UserService{
    @Autowired
    UserMapper userMapper;

    public Integer checkRepeat(User user) {
        return userMapper.selectCount(user);
    }

    public void addUser(User user) {
        user.setPassword(Md5Util.convertMD5(user.getPassword()));
        userMapper.insert(user);
    }

    public User login(User user){
        user.setPassword(Md5Util.convertMD5(user.getPassword()));
        return userMapper.selectOne(user);
    }
}
