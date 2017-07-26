package com.store.controller.admin;

import com.store.model.CartItems;
import com.store.model.Orders;
import com.store.model.User;
import com.store.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import javax.swing.*;
import java.util.List;

/**
 * Created by 陈晓海 on 2017/7/21.
 */
@Controller
@RequestMapping("/admin/orders")
public class OrdersController extends BaseAdminController<Orders,Long>{
    @Autowired
    private OrderService orderService;

    //用户在购物车点击去结算后，创建订单，显示订单信息
    @RequestMapping("creatOrders")
    public String creatOrders(Integer[] itemIds,Integer cartId,Model model,HttpSession session){
        User user = (User) session.getAttribute("loginUser");
        //创建订单，返回订单号
        String ordersId = orderService.creatOrders(itemIds,user.getId(),cartId);
        //根据返回的订单号取得订单信息

        return null;
    }

    @RequestMapping("affirmOrder")
    public String affirmOrder(Integer[] itemIds,Integer cartId,Model model){
        List<CartItems> list = orderService.showCartItems(itemIds,cartId);
        model.addAttribute("cartItemsList",list);
        return TEMPLATE_PATH + "order-cart";
    }
}
