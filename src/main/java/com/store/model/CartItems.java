package com.store.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * Created by 陈晓海 on 2017/7/22.
 * 订单明细POJO
 */
@Table(name = "store_cartitems")
public class CartItems {
    @Id
    @Column(name = "cit_id")
    private Integer id;             //购物车商品明细id
    private Integer itemsId;        //购物车商品对应的id
    private Integer cartId;         //购物车明细对应的购物车id

    public CartItems(Integer itemsId, Integer cartId) {
        this.itemsId = itemsId;
        this.cartId = cartId;
    }

    public CartItems(Integer itemsId) {
        this.itemsId = itemsId;
    }

    private Integer itemsNumber;    //加入的商品的数量
    private Float money;          //商品的单价
    private Float cost;           //商品的总价

    @Transient
    private Items items;          //对应的商品信息

    @Override
    public String toString() {
        return "CartItems{" +
                "id=" + id +
                ", itemsId=" + itemsId +
                ", cartId=" + cartId +
                ", itemsNumber=" + itemsNumber +
                ", money=" + money +
                ", cost=" + cost +
                ", items=" + items +
                '}';
    }
    public CartItems(){

    }
    public CartItems(Integer itemsId, Integer cartId, Integer itemsNumber, Float money, Float cost) {
        this.itemsId = itemsId;
        this.cartId = cartId;
        this.itemsNumber = itemsNumber;
        this.money = money;
        this.cost = cost;
    }

    public Items getItems() {
        return items;
    }

    public void setItems(Items items) {
        this.items = items;
    }



    public Integer getItemsId() {

        return itemsId;
    }

    public void setItemsId(Integer itemsId) {
        this.itemsId = itemsId;
    }

    public Float getMoney() {

        return money;
    }

    public void setMoney(Float money) {
        this.money = money;
    }

    public Float getCost() {
        return cost;
    }

    public void setCost(Float cost) {
        this.cost = cost;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getItemsNumber() {
        return itemsNumber;
    }

    public void setItemsNumber(Integer itemsNumber) {
        this.itemsNumber = itemsNumber;
    }


    public Integer getCartId() {
        return cartId;
    }

    public void setCartId(Integer cartId) {
        this.cartId = cartId;
    }
}
