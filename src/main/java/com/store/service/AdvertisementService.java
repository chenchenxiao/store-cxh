package com.store.service;
import com.store.been.PageBean;
import com.store.model.Advertisement;
import com.store.model.Items;

import java.util.List;
/**
 * Created by 陈晓海 on 2017/7/28.
 */
public interface AdvertisementService {
    //查询广告信息
    PageBean showAdvertisements(Integer id,PageBean pageBean);
    //根据id查询用户的所有商品
    List<Items> showAllItems(Integer id);
    //查找单条广告信息
    Advertisement selectOneAd(Integer id);
    //添加广告
    void add(Advertisement advertisement);
    //修改广告信息
    void update(Advertisement advertisement);
    //删除单条广告
    void deleteOne(Integer id);
    //删除多条广告
    void deleteByIds(Integer[] ids);
    //根据查询广告信息
    Advertisement selectById(Integer id);
    //根据广告状态查询广告信息
    List<Advertisement> selectByStatus();
    //定时修改广告状态
    void quartzUpdate(Integer page,Integer size);
    //对比要分页的广告总页数与当前要分页的页数的大小
    Long comparePage(Integer page,Integer size);
    //查询热销商品
    List<Items> selectHotSell(String type);
    //将数据存入索引库
    void addToLucene() throws Exception;
}
