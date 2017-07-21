package com.store.controller.admin;

import com.store.model.Cart;
import com.store.model.Items;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by 陈晓海 on 2017/7/21.
 */
@Controller
@RequestMapping("admin/cart")
public class CartController extends BaseAdminController<Cart,Long>{
    @RequestMapping("cartSuccess")
    public String addSuccess(){
        return TEMPLATE_PATH + "cartSuccess";
    }
}
