package com.store.model;

import org.hibernate.validator.constraints.Length;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;
import java.util.Date;

/**
 * Created by 陈晓海 on 2017/8/1.
 *
 */
public class ItemsCustom {
   private Integer id;
   private String name;
   private String title;
   private String type;
   private Float price;
   private String photo;
   private Integer uid;

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public ItemsCustom() {
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public ItemsCustom(Integer id, String name, String title, String type, Float price, String photo) {

        this.id = id;
        this.name = name;
        this.title = title;
        this.type = type;
        this.price = price;
        this.photo = photo;
    }

    public Integer getId() {

        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }


    public String getPhoto() {
        return photo;
    }

    @Override
    public String toString() {
        return "ItemsCustom{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", title='" + title + '\'' +
                ", type='" + type + '\'' +
                ", price='" + price + '\'' +
                ", photo='" + photo + '\'' +
                '}';
    }

    public void setPhoto(String photo) {
        this.photo = photo;


    }
}
