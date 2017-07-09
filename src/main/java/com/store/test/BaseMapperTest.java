package com.store.test;

import com.github.pagehelper.PageHelper;
import com.store.dao.UserMapper;
import com.store.model.User;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Created by 陈晓海 on 2017/7/8.
 */
public class BaseMapperTest {
    @Test
    public void baseMapperTest(){
        ApplicationContext application = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        UserMapper userMapper = application.getBean(UserMapper.class);
//        userMapper.selectOne(new User(1,"1",null,null));
//        userMapper.selectById(1);
//        userMapper.selectByPrimaryKey(1);
        PageHelper.startPage(1,5);
        userMapper.selectAll();

    }

}
