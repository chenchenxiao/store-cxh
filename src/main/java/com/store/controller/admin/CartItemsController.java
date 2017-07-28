package com.store.controller.admin;

import com.store.model.*;
import com.store.service.CartItemsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * Created by 陈晓海 on 2017/7/25.
 * 购物车商品controller
 */
@Controller
@RequestMapping("/admin/cartItems")
public class CartItemsController {
    @Autowired
    private CartItemsService cartItemsService;

    //批量删除购物车商品
    @RequestMapping("/deleteByIds")
    public String deleteByIds(Integer[] itemIds,Integer cartId, HttpSession session){
        User user = (User) session.getAttribute("loginUser");
        System.out.println("ids-->" + itemIds);
        System.out.println("cartId-->" +cartId);
        cartItemsService.deleteByIds(itemIds,cartId);
        return "redirect:/admin/cart/showCart/"+user.getId();
    }

    //修改商品的数量
    @RequestMapping("/updateItemsNumber")
    @ResponseBody
    public Cart updateItemsNumber(CartItems cartItems){
        System.out.println("cartItems-->" + cartItems);
        return cartItemsService.updateItemsNumber(cartItems);
    }
}
