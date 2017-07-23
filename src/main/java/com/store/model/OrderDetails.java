package com.store.model;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * Created by 陈晓海 on 2017/7/22.
 * 订单明细POJO
 */
@Table(name = "store_orderdetails")
public class OrderDetails {
    @Id
    @Column(name = "od_id")
    private Integer id;             //订单明细的id
    private String ordersId;       //订单的id
    private Integer itemsId;        //商品的id
    private Integer itemsNumber;    //加入的商品的数量
    @Transient
    private Orders orders;          //商品明细对应的订单
    @Transient
    private Items items;            //商品明细对应的商品

    public Orders getOrders() {
        return orders;
    }

    public void setOrders(Orders orders) {
        this.orders = orders;
    }

    public Items getItems() {
        return items;
    }

    public void setItems(Items items) {
        this.items = items;
    }
    public OrderDetails() {
    }

    public OrderDetails(String ordersId,Integer itemsId) {
        this.itemsId = itemsId;
        this.ordersId = ordersId;
    }
    public OrderDetails(Integer itemsId) {
        this.itemsId = itemsId;
    }

    public OrderDetails(String ordersId, Integer itemsId, Integer itemsNumber) {
        this.ordersId = ordersId;
        this.itemsId = itemsId;
        this.itemsNumber = itemsNumber;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrdersId() {
        return ordersId;
    }

    public void setOrdersId(String ordersId) {
        this.ordersId = ordersId;
    }

    public Integer getItemsId() {
        return itemsId;
    }

    public void setItemsId(Integer itemsId) {
        this.itemsId = itemsId;
    }

    public Integer getItemsNumber() {
        return itemsNumber;
    }

    public void setItemsNumber(Integer itemsNumber) {
        this.itemsNumber = itemsNumber;
    }
}
