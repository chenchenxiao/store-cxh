package com.store.controller.admin;

import com.store.been.PageBean;
import com.store.model.Admin;
import com.store.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * Created by 陈晓海 on 2017/7/27.
 * 管理员controller
 */
@Controller
@RequestMapping("/admin/admin")
public class AdminController extends BaseAdminController<Admin,Long>{
    @Autowired
    private AdminService adminService;
    //跳转到后台管理员登录页面
    @RequestMapping("/loginUI")
    public String loginUI(){
        return TEMPLATE_PATH + "loginUI";
    }

    //管理员登录
    @RequestMapping("/login")
    public String login(Admin admin, HttpSession session){
        System.out.println(adminService);
        session.setAttribute("loginAdmin",admin);
        adminService.login(admin);
        return null;
    }

    //跳转到用户管理页
    @RequestMapping("/userList")
    public String userList(Model model, PageBean pageBean){
        model.addAttribute("PageBean",adminService.userList(pageBean));
        return TEMPLATE_PATH + "userList";
    }

    //查看用户的订单及订单详情
    @RequestMapping("showOrders/{id}")
    public String showOrders(Model model,@PathVariable("id") Integer userId){
        model.addAttribute("ordersList",adminService.showOrder(userId));
        return TEMPLATE_PATH + "ordersList";
    }
}
