package com.store.service.impl;

import com.store.been.PageBean;
import com.store.model.Items;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.util.*;

/**
 * Created by 陈晓海 on 2017/7/19.
 */
public interface ItemsService {
    void save(Items items);

    PageBean showItems(PageBean pageBean,Integer id,String preDate,String lastDate) throws ParseException;

    void update(Items items);

    Items showOneItems(Integer id);

    void delete(Integer[] ids);

    void deleteOne(Integer id);
}
