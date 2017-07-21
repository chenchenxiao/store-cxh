package com.store.model;

import javax.persistence.Table;
import java.util.Date;
/**
 * Created by 陈晓海 on 2017/7/21.
 */
@Table(name = "store_cart")
public class Cart {
    private Integer id;
    private Date creatDate;
    private Date updateDate;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getCreatDate() {
        return creatDate;
    }

    public void setCreatDate(Date creatDate) {
        this.creatDate = creatDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }
}
