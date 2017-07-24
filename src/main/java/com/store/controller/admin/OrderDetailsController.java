package com.store.controller.admin;

import com.store.model.OrderDetails;
import com.store.model.Orders;
import com.store.model.User;
import com.store.service.OrderDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * Created by 陈晓海 on 2017/7/23.
 */
@Controller
@RequestMapping("/admin/orderDetails")
public class OrderDetailsController {

    @Autowired
    private OrderDetailsService orderDetailsService;

    //批量删除购物车商品
    @RequestMapping("/deleteByIds")
    public String deleteByIds(Integer[] itemIds,String ordersId, HttpSession session){
        User user = (User) session.getAttribute("loginUser");
        System.out.println("ids-->" + itemIds);
        System.out.println("ordersId-->" +ordersId);
        orderDetailsService.deleteByIds(itemIds,ordersId);
        return "redirect:/admin/orders/showCart/"+user.getId();
    }

    //修改商品的数量
    @RequestMapping("/updateItemsNumber")
    @ResponseBody
    public Orders updateItemsNumber(OrderDetails orderDetails){
        System.out.println("orderdetails-->" + orderDetails);
        return orderDetailsService.updateItemsNumber(orderDetails);
    }
}
