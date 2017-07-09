package com.store.service.impl;

import com.store.dao.UserMapper;
import com.store.model.User;
import com.store.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 陈晓海 on 2017/7/8.
 */
@Service
public class UserServiceImpl implements UserService{
    @Autowired
    UserMapper userMapper;
    public Integer checkName(User user) {
        return userMapper.selectCount(user);
    }
}
