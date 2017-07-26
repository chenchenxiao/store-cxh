package com.store.controller.admin;

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

/**
 * Created by 陈晓海 on 2017/7/21.
 */
@Controller
@RequestMapping("/admin/orders")
public class OrdersController extends BaseAdminController<Orders,Long>{
    @Autowired
    private OrderService orderService;

    @RequestMapping("creatOrders")
    public String creatOrders(Integer userId,Integer[] itemIds,Integer cartId,Model model){
        orderService.creatOrders(itemIds,userId,cartId);
        return null;
    }



}
