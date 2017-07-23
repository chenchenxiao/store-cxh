package com.store.controller.admin;

import com.store.model.Orders;
import com.store.model.User;
import com.store.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
    public String addSuccess(Integer itemsId, HttpSession session){
        User user = (User) session.getAttribute("loginUser");
        orderService.addToCart(itemsId,user.getId());
        return TEMPLATE_PATH + "cartSuccess";
    }
    //购物车的商品
    @RequestMapping("showCart")
    public String showCart(){
        return null;
    }
}
