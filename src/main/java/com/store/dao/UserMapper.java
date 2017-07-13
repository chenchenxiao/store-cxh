package com.store.dao;

import com.store.model.User;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.BaseMapper;
import tk.mybatis.mapper.common.Mapper;

/**
 * Created by 陈晓海 on 2017/7/6.
 */
public interface UserMapper extends BaseMapper<User>{
    Integer checkAccount(String account);
}
