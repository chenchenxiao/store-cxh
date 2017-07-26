package com.store.dao;

import com.store.model.User;
import com.store.util.BaseMapper;
import org.apache.ibatis.annotations.Param;


/**
 * Created by 陈晓海 on 2017/7/6.
 */
public interface UserMapper extends BaseMapper<User> {
    Integer checkAccount(String account);

    User checkUser(String condition);

}
