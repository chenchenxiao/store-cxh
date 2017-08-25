package com.store.controller;

import com.store.model.Items;
import com.store.model.User;
import com.store.util.ExcelUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * Created by 陈晓海 on 2017/7/9.
 */
@Component
@Controller
@RequestMapping("test")
public class TestController {
    private int i;
//    @Scheduled(cron = "0/5 * * * * ?")
    @RequestMapping("test")
    public void test(){
       i++;
        System.out.println(i);
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

   @RequestMapping("excelImort")
    public void testExcel(MultipartFile itemsFile){
       System.out.println("!!!!");
       List<Object> list = ExcelUtil.ExcelForList(itemsFile, Items.class, true);
       System.out.println(list.get(2).toString());
   }

   @RequestMapping("login")
    public String  shiroLogin(String username,String password){
       System.out.println(username);
       System.out.println(password);
       Subject currentUser = SecurityUtils.getSubject();
       if(!currentUser.isAuthenticated()){
           //把用户名和密码封装为UsernamePasswordToken 对象
           UsernamePasswordToken token = new UsernamePasswordToken(username,password);
           //remembermae   实际时要根据复选框按钮来判断是否为true
           token.setRememberMe(true);
           try{
               //执行登录
               currentUser.login(token);
           }
           //所有认证时异常的父类
           catch(AuthenticationException e){
               System.out.println("登录失败-->" + e.getMessage());
           }
       }
        return "success";
    }
//    @RequestMapping("logouting")
//    public String logout(){
//        System.out.println("???");
//        return "login";
//    }
}
