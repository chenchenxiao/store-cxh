package com.store.model;

import org.hibernate.validator.constraints.Length;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by 陈晓海 on 2017/7/16.
 * 商品实体类
 */
@Table(name = "store_items")
public class Items implements Serializable {
    @Id
    private Integer id;     //商品的id
    @Column(name = "uid")
    private Integer uid;        //商品用户的id
    @NotNull
    private String  name;       //商品的名称
    @NotNull
    private String type;        //商品的类型
    @Length(min=2,max=11)
    private String title;       //商品的标题
    @NotNull
    private String details;     //商品的详情介绍
    @NotNull
    private Float price;        //商品的价格
    @NotNull
    private Integer number;     //商品的库存量

    private String photo;
    @Column(name = "add_date")
    private Date addDate;      //商品的添加时间

    public Items(Integer id) {
        this.id = id;
    }

    public Items() {

    }

    public Date getAddDate() {
        return addDate;
    }

    public void setAddDate(Date addDate) {
        this.addDate = addDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }
    @Column(name = "update_date")
    private Date updateDate;     //商品的修改时间
    @Transient
    private User user;

    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "Items{" +
                "id=" + id +
                ", uid=" + uid +
                ", name='" + name + '\'' +
                ", title='" + title + '\'' +
                ", details='" + details + '\'' +
                ", price=" + price +
                ", number=" + number +
                ", photo='" + photo + '\'' +
                ", addDate=" + addDate +
                ", updateDate=" + updateDate +
                ", type='" + type + '\'' +
                '}';
    }


}
