package com.store.test;

import org.junit.Test;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by 陈晓海 on 2017/7/13.
 */
public class PathTest {
    @Test
    public void test(){
        String phone = "13414057676";
        String sub = phone.substring(3,7);
        String real = phone.replace(sub,"****");
        System.out.println(real);
    }
}
