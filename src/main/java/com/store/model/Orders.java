package com.store.model;

import java.util.List;

import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * Created by 陈晓海 on 2017/7/21.
 */
@Table(name = "store_orders")
public class Orders {
   private String id;          //订单的ID
   private Integer userId;      //订单的用户id
    @Transient
   private List<OrderDetails> orderDetailsList;
    @Transient
    public List<OrderDetails> getOrderDetailsList() {
        return orderDetailsList;
    }

    public void setOrderDetailsList(List<OrderDetails> orderDetailsList) {
        this.orderDetailsList = orderDetailsList;
    }

    public Orders(Integer userId){
       this.userId = userId;
   }

    public Orders(String id, Integer userId) {
        this.id = id;
        this.userId = userId;
    }

    public Orders() {
    }



    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        userId = userId;
    }
}
