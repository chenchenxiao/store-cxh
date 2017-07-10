package com.store.controller;

import com.store.been.AjaxResult;
import com.store.model.User;
import com.store.service.UserService;
import com.store.util.CheckNumberUtil;
import com.store.util.SendPhoneMsgUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
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

    //校验用户名或手机号是否已被注册
    @RequestMapping("checkRepeat")
    public void checkName(User user,PrintWriter outs){
        System.out.println(user.getName());
        if(userService.checkName(user) > 0){
            System.out.println("boolean-->" + false);
            outs.print("{\"result\":"+false+"}");
        }else{
            System.out.println("boolean-->" + true);
            outs.print("{\"result\":"+true+"}");
        }
    }

    //获取手机验证码
    @RequestMapping("checkPhone")
    public void phoneCheck(String phoneNumber,PrintWriter outs) throws IOException {
        System.out.println("phoneNumber-->" + phoneNumber);
        String checkNumber = CheckNumberUtil.getCheckNumber();
//        SendPhoneMsgUtil.sendMsg(phoneNumber,checkNumber);
        System.out.println("发送完短信了");
        outs.print("{\"result\":"+checkNumber+"}");
    }

    //注册用户
    @RequestMapping("regist")
    public String regist(@Valid User user,BindingResult bindingResult, Model model){
        if(bindingResult.hasErrors()){
            model.addAttribute("result",new AjaxResult(true,"格式填写错误"));
            System.out.println("格式填写错误");
            return "userRegist";
        }else{
            userService.addUser(user);
            model.addAttribute("result",new AjaxResult(true,"注册成功,请登录"));
            return "loginUI";
        }
    }

    //用户登录
    @RequestMapping("login")
    public String login(User user, Model model, HttpSession session){
        User loginUser = userService.login(user);
        try {
            if (loginUser != null) {
                session.setAttribute("loginUser",loginUser);
                return "show";
            } else {
                model.addAttribute("result", new AjaxResult(false, "用户名和密码匹配失败"));
                System.out.println("登录失败");
                return "loginUI";
            }
        }catch (Exception e){
            e.printStackTrace();
            model.addAttribute("result",new AjaxResult(false,"发生错误了"));
            return "loginUI";
        }
    }

    @RequestMapping("test")
    public void test(){
        System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    }
}
