package com.store.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * Created by 陈晓海 on 2017/7/25.
 */
@Table(name = "store_cart")
public class Cart implements Serializable{
    @Override
    public String toString() {
        return "Cart{" +
                "id=" + id +
                ", userId=" + userId +
                ", payment=" + payment +
                ", cartItemsList=" + cartItemsList +
                '}';
    }

    public Cart(Integer userId) {
        this.userId = userId;
    }

    public Cart() {
    }

    @Column(name = "c_id")
    private Integer id;         //购物车的id

    private Integer userId;     //购物车对应的用户id
    private Float payment;

    public Float getPayment() {
        return payment;
    }

    public void setPayment(Float payment) {
        this.payment = payment;
    }

    @Transient
    private List<CartItems> cartItemsList;      //购物车所包含的商品

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public List<CartItems> getCartItemsList() {
        return cartItemsList;
    }

    public void setCartItemsList(List<CartItems> cartItemsList) {
        this.cartItemsList = cartItemsList;
    }
}
