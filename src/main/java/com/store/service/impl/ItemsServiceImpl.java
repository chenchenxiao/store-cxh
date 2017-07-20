package com.store.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.store.been.PageBean;
import com.store.dao.ItemsMapper;
import com.store.model.Items;
import com.store.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by 陈晓海 on 2017/7/19.
 */
@Service
public class ItemsServiceImpl implements ItemsService {

    @Autowired
    private ItemsMapper itemsMappers;

    public void save(Items items){
        items.setAddDate(new Date());
        items.setUpdateDate(new Date());
        itemsMappers.insert(items);
    }

    public PageBean showItems(PageBean pageBean,Integer id){
        PageHelper.startPage(pageBean.getPage(),pageBean.getSize());
        List list = itemsMappers.selectItemsList(id);
        //把分页出来的数据放入pageBean
        pageBean.setRecordList(list);
        //取分页信息
        PageInfo<User> pageInfo = new PageInfo<User>(list);
        pageBean.init((int) pageInfo.getTotal(),list);
        return pageBean;
    }

    public void update(Items items) {
        items.setUpdateDate(new Date());
        itemsMappers.updateByPrimaryKeySelective(items);
    }

    public Items showOneItems(Integer id) {
        return itemsMappers.selectByPrimaryKey(id);
    }

    public void delete(Integer[] ids) {
        List<Integer> list = new ArrayList<Integer>();
        System.out.println("ids-->" + ids.length);
        for(int id:ids){
            list.add(id);
        }
        itemsMappers.deleteByIds(list);
    }

    public void deleteOne(Integer id){
        itemsMappers.deleteByPrimaryKey(id);
    }
}
