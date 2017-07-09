package com.store.dao;

import com.store.model.User;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.BaseMapper;

/**
 * Created by 陈晓海 on 2017/7/6.
 */
public interface UserMapper extends BaseMapper<User>{
    User selectById(Integer id);
}
