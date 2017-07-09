package com.store.controller;

import com.store.model.User;
import com.store.service.UserService;
import com.store.util.CheckNumberUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by 陈晓海 on 2017/7/8.
 */
@Controller
@RequestMapping("admin/user")
public class UserController {
    @Autowired
    UserService userService;

    @RequestMapping("checkName")
    public void checkName(User user, PrintWriter outs){
        System.out.println(user.getName());
        if(userService.checkName(user) > 0){
            System.out.println("boolean-->" + false);
            outs.print("{\"result\":"+false+"}");
        }else{
            System.out.println("boolean-->" + true);
            outs.print("{\"result\":"+true+"}");
        }
    }

    @RequestMapping("checkPhone")
    public void phoneCheck(String phoneNumber,PrintWriter outs) throws IOException {
        System.out.println("phoneNumber-->" + phoneNumber);
        String checkNumber = CheckNumberUtil.getCheckNumber();
//        SendPhoneMsgUtil.sendMsg(phoneNumber,checkNumber);
        outs.print("{\"result\":"+checkNumber+"}");
    }

    @RequestMapping("test")
    public void test(){
        System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    }
}
