package com.store.service;

import com.store.been.PageBean;
import com.store.model.Orders;
import java.util.List;
/**
 * Created by 陈晓海 on 2017/7/22.
 */
public interface OrderService {

    void addToCart(Integer itemsId,Integer userId);

    Orders showCart(Integer id);


}
