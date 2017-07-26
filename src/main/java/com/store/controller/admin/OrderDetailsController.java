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


}
