package com.store.model;

import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * Created by 陈晓海 on 2017/7/27.
 * 权限实体类
 */
@Table(name = "store_privilege")
public class Privilege {
    @Id
    private Integer id;     //权限的id
    private String name;    //权限的名称
    private Privilege childrenId;      //子权限
    private Privilege parentId;       //父权限

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

    public Privilege getChildrenId() {
        return childrenId;
    }

    public void setChildrenId(Privilege childrenId) {
        this.childrenId = childrenId;
    }

    public Privilege getParentId() {
        return parentId;
    }

    public void setParentId(Privilege parentId) {
        this.parentId = parentId;
    }
}
