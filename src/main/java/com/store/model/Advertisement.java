package com.store.model;

import org.hibernate.validator.constraints.Length;

import javax.persistence.Table;

/**
 * Created by 陈晓海 on 2017/7/28.
 * 广告实体类
 */
@Table(name = "store_advertisement")
public class Advertisement {
    private Integer id;                 //id

    public Advertisement(Integer userId) {
        this.userId = userId;
    }
    public Advertisement(){}
    @Length(min = 3,max = 8)
    private String description;         //商品的介绍

    private String photo;               //广告的图片
    private Integer itemsId;            //广告的商品的ID
    private Integer  status;            //广告的状态，由管理员审批
    private String itemsName;           //广告的商品的名称
    private Integer userId;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getItemsName() {
        return itemsName;
    }

    public void setItemsName(String itemsName) {
        this.itemsName = itemsName;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getId() {
        return id;

    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public Integer getItemsId() {
        return itemsId;
    }

    public void setItemsId(Integer itemsId) {
        this.itemsId = itemsId;
    }
}
