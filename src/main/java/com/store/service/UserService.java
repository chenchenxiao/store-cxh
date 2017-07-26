package com.store.service;

import com.store.model.User;

/**
 * Created by 陈晓海 on 2017/7/8.
 */
public interface UserService {
        //校验邮箱，手机，用户名是否已被使用
        Integer checkRepeat(User user);
        //添加用户
        void addUser(User user);
        //登录
        User login(User user);
        //根据id查找对应用户
        User findUpdateUser(Integer id);
        //校验用户名是否被使用
        Integer checkAccount(String account);
        //修改用户信息
        void update(User user);
        //用户找回密码时根据用户名校验是否存在该用户
        User checkUser(String condition);


}
