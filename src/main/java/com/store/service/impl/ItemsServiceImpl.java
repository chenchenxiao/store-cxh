package com.store.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.store.been.PageBean;
import com.store.dao.ItemsMapper;
import com.store.model.Items;
import com.store.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

    //用户增添商品
    public void save(Items items){
        items.setAddDate(new Date());
        items.setUpdateDate(new Date());
        itemsMappers.insert(items);
    }

    //用户查看自己添加的商品
    public PageBean showItems(PageBean pageBean,Integer id,String preDate,String lastDate) throws ParseException {
        //通过判断日期的长度来判断取得的时间值是否为空，因为用了日期控件，所以前台传来的值不为null，无法用null判断
        //此处是防止preDate的值大于lastDate的情况，即开始的日期大于结束的日期
        if(preDate.length() > 0 && lastDate.length() > 0){
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            //先把取得的日期赋给两个日期类型的值,相当于三个数比较时中间值的作用
            Date preTime = formatter.parse(preDate);
            Date lastTime = formatter.parse(lastDate);
            //通过getTime()方法比较两个日期的大小
            if(preTime.getTime() > lastTime.getTime()){
                preDate = formatter.format(lastTime);
                lastDate = formatter.format(preTime);
            }
        }
        //日期的格式化格式
        if(preDate.length() == 0){
            preDate = null;
        }
        if(lastDate.length() == 0){
            lastDate = null;
        }
        PageHelper.startPage(pageBean.getPage(),pageBean.getSize());
        List list = itemsMappers.selectItemsList(id,preDate,lastDate);
        //把分页出来的数据放入pageBean
        pageBean.setRecordList(list);
        //取分页信息
        PageInfo<User> pageInfo = new PageInfo<User>(list);
        pageBean.init((int) pageInfo.getTotal(),list);
        return pageBean;
    }

    //用户修改商品信息
    public void update(Items items) {
        items.setUpdateDate(new Date());
        itemsMappers.updateByPrimaryKeySelective(items);
    }

    //用户查看商品时取得商品信息
    public Items showOneItems(Integer id) {
        return itemsMappers.selectByPrimaryKey(id);
    }

    //用户批量删除商品信息
    public void delete(Integer[] ids) {
        List<Integer> list = new ArrayList<Integer>();
        //把数组的值通过循环赋给list，mapper传参list
        for(int id:ids){
            list.add(id);
        }
        itemsMappers.deleteByIds(list);
    }

    //用户删除单个商品的信息
    public void deleteOne(Integer id){
        itemsMappers.deleteByPrimaryKey(id);
    }
}
