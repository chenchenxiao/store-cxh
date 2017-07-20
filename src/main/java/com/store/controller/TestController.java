package com.store.controller;

import com.store.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by 陈晓海 on 2017/7/9.
 */
@Controller
public class TestController {
    @RequestMapping("test")
    public void test(){
        System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!");
    }

    @ResponseBody
    @RequestMapping("testRep")
    public User testRep(){
        User user = new User();
        user.setId(2);
        return user;
    }

    @RequestMapping("testUed")
    public String textUed(String testUeditor){
        System.out.println("testUeditor-->" + testUeditor);
        return "/ueditorTest";
    }

    @RequestMapping("getDate")
    public String getDate(String date){
        System.out.println("date-->" + date );
        return "test";
    }
}
