package com.store.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * Created by 陈晓海 on 2017/7/21.
 */
@Table(name = "store_orders")
public class Orders {
    @Id
    @Column(name = "o_id")
    private String id;          //订单的ID

    public Float getPayment() {
        return payment;
    }

    public void setPayment(Float payment) {
        this.payment = payment;
    }

    @Column(name = "user_id")
    private Integer userId;     //订单的用户id
    private Float payment;      //订单的总金额
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

    @Override
    public String toString() {
        return "Orders{" +
                "id='" + id + '\'' +
                ", userId=" + userId +
                ", orderDetailsList=" + orderDetailsList.toString() +
                '}';
    }

    public Orders(String id, Integer userId,Float payment) {
        this.id = id;
        this.userId = userId;
        this.payment = payment;
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
