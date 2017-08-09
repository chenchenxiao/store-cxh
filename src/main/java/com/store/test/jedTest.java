package com.store.test;/**
 * Created by 陈晓海 on 2017/8/7.
 */

import javafx.application.Application;
import javafx.stage.Stage;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

public class jedTest{
    @Test
    public void testJedisPool() {
        ApplicationContext application = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");

        JedisPool pool = (JedisPool) application.getBean("jedisPool");
        Jedis jedis = null;
        try {
            jedis = pool.getResource();

            jedis.set("name", "lisi");
            jedis.set("name2", "test2");
            String name = jedis.get("name");
            System.out.println(name);
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (jedis != null) {
                // 关闭连接
                jedis.close();
            }
        }
    }


}
