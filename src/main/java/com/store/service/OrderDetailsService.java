package com.store.service;

import com.store.model.OrderDetails;

/**
 * Created by 陈晓海 on 2017/7/22.
 */
public interface OrderDetailsService {

    void deleteByIds(Integer[] id);

    void updateItemsNumber(OrderDetails orderDetails);
}
