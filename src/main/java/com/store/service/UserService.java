package com.store.service;

import com.store.model.User;

/**
 * Created by 陈晓海 on 2017/7/8.
 */
public interface UserService {
        Integer checkRepeat(User user);

        void addUser(User user);

        User login(User user);
}