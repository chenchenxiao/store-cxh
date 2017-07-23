package com.store.controller.admin;

import com.store.been.AjaxResult;
import com.store.model.Orders;
import com.store.model.User;
import com.store.service.OrderService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

/**
 * Created by 陈晓海 on 2017/7/21.
 */
@Controller
@RequestMapping("admin/orders")
public class OrdersController extends BaseAdminController<Orders,Long>{
    @Autowired
    private OrderService orderService;
    //用户加入物品到购物车
    @RequestMapping("addToCart")
    public String addSuccess(Integer itemsId, HttpSession session, RedirectAttributes redirectAttributes) throws Exception {
        //先取得用户信息
        User user = (User) session.getAttribute("loginUser");
        //把用户的ID传过去
        orderService.addToCart(itemsId,user.getId());
        return TEMPLATE_PATH + "cartSuccess";

    }
    //购物车的商品
    @RequestMapping("showCart/{id}")
    public String showCart(@PathVariable("id") Integer id, Model model){
        Orders orders = orderService.showCart(id);
        System.out.println("orders-->" + orders.toString());
        model.addAttribute("orders",orders);
        return "cart";
    }
}
