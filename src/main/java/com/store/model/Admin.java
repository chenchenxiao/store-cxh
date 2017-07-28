package com.store.model;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by 陈晓海 on 2017/7/27.
 */
@Table(name = "store_admin")
public class Admin {
    @Id
    private Integer id;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    private String name;
    private String password;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Admin() {

    }

    public Admin(String name, String password) {

        this.name = name;
        this.password = password;
    }
}
