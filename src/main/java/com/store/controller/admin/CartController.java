package com.store.controller.admin;

import com.store.model.Cart;
import com.store.model.User;
import com.store.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

/**
 * Created by 陈晓海 on 2017/7/25.
 * 购物车控制器
 */
@Controller
@RequestMapping("/admin/cart")
public class CartController extends BaseAdminController<Cart,Long>{
    @Autowired
    private CartService cartService;

    //用户加入物品到购物车
    @RequestMapping("addToCart")
    public String addSuccess(Integer itemsId, HttpSession session, RedirectAttributes redirectAttributes) throws Exception {
        //先取得用户信息
        User user = (User) session.getAttribute("loginUser");
        //把用户的ID传过去
        cartService.addToCart(itemsId,user.getId());
        return TEMPLATE_PATH + "cartSuccess";
    }

    //根据用户id展示用户的购物车
    @RequestMapping("/showCart/{id}")
    public String showCart(@PathVariable("id") Integer id, Model model){
        Cart cart = cartService.showCart(id);
        model.addAttribute("cart",cart);
        return TEMPLATE_PATH + "cart";
    }
}
