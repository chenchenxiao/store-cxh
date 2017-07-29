package com.store.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.store.been.PageBean;
import com.store.dao.AdvertisementMapper;
import com.store.dao.ItemsMapper;
import com.store.model.Advertisement;
import com.store.model.Items;
import com.store.model.User;
import com.store.service.AdvertisementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by 陈晓海 on 2017/7/28.
 */
@Service
public class AdvertisementServiceImpl implements AdvertisementService {
    @Autowired
    private AdvertisementMapper advertisementMapper;
    @Autowired
    private ItemsMapper itemsMapper;

    public PageBean showAdvertisements(Integer id, PageBean pageBean) {
        System.out.println(advertisementMapper);
        if (" ".equals(pageBean.getSearchText())) {
            pageBean.setSearchText(null);
        }
        if (pageBean.getSearchText() != null) {
            pageBean.setSearchText("%" + pageBean.getSearchText() + "%");
        }
        PageHelper.startPage(pageBean.getPage(), pageBean.getSize());
        List list = advertisementMapper.selectAdvertisements(id, pageBean.getSearchText());
        //把分页出来的数据放入pageBean
        pageBean.setRecordList(list);
        //取分页信息
        PageInfo<User> pageInfo = new PageInfo<User>(list);
        pageBean.init((int) pageInfo.getTotal(), list);
        return pageBean;
    }

    //根据用户id查找用户所有的商品
    public List<Items> showAllItems(Integer userId) {
        Items items = new Items();
        items.setUid(userId);
        return itemsMapper.select(items);
    }

    //根据用户id查找
    public Advertisement selectOneAd(Integer id) {
        return advertisementMapper.selectOne(new Advertisement(id));
    }

    //添加
    public void add(Advertisement advertisement) {
        Items items = itemsMapper.selectByPrimaryKey(advertisement.getItemsId());
        advertisement.setItemsName(items.getName());
        advertisement.setUserId(items.getUid());
        advertisement.setStatus(0);
        advertisementMapper.insert(advertisement);
    }

    //修改
    public void update(Advertisement advertisement) {
        Items items = itemsMapper.selectByPrimaryKey(advertisement.getItemsId());
        advertisement.setItemsName(items.getName());
        advertisementMapper.updateAd(advertisement);
    }

    //删除单条信息
    public void deleteOne(Integer id) {
        advertisementMapper.deleteById(id);
    }

    //批量删除
    public void deleteByIds(Integer[] ids) {
        List<Integer> list = new ArrayList<Integer>();
        for (int i : ids) {
            list.add(i);
        }
        advertisementMapper.deleteByIds(list);
    }

    //根据广告id查找
    public Advertisement selectById(Integer id) {
        return advertisementMapper.selectById(id);
    }

    //查找已经显示的广告
    public List<Advertisement> selectByStatus() {
        PageHelper.startPage(1, 5);
        List list = advertisementMapper.selectByStatus(1);
        return list;
    }

    //比较定时更新时分页的页数是否大于总页数
    public Long comparePage(Integer page) {
        PageHelper.startPage(page, 5);
        List<Advertisement> list = advertisementMapper.selectByStatus(null);
        //取分页信息
        PageInfo<Advertisement> pageInfo = new PageInfo<Advertisement>(list);
        System.out.println("compare-------------------" + (pageInfo.getTotal() + 5 - 1) / 5);
        return (pageInfo.getTotal() + 5 - 1) / 5;
    }

    //定时更新广告信息
    public void quartzUpdate(Integer page) {
        //修改未显示的广告后也要修改已经显示的广告
        ////比较定时更新时分页的页数是否大于总页数
        System.out.println("page-->" + page);
        //先通过分页取得要修改的广告信息集合
        List<Advertisement> passList = new ArrayList<Advertisement>();
        PageHelper.startPage(1, 5);
        passList = advertisementMapper.selectByStatus(0);
        //通过遍历取得广告的id
        List<Integer> passIntegerList = new ArrayList<Integer>();
        for (Advertisement ad : passList) {
            passIntegerList.add(ad.getId());
        }
        //判断广告id的集合是否为空，即是否分页取到了数据，如果有数据，就进行修改
        System.out.println("adPassSIZE-->" + passList.size());
        if (passIntegerList.size() > 0) {
            System.out.println("adPass-------------------------");
            advertisementMapper.adPass(passIntegerList);
        }
        List<Advertisement> notPassList = new ArrayList<Advertisement>();
        //判断是不是第一次修改，若不是则修改已经显示过的广告
        if (page - 1 > 0) {
            //先通过分页取得要修改的广告信息集合,取得上一次已经显示过的广告信息
            PageHelper.startPage(1, 5);
            notPassList = advertisementMapper.selectByStatus(1);
        }
            //通过遍历取得广告的id
            List<Integer> notPassIntegerList = new ArrayList<Integer>();
            for (Advertisement ad : notPassList) {
                notPassIntegerList.add(ad.getId());
            }
        System.out.println("notPassSize-->" + notPassList.size());
        //判断广告id的集合是否为空，即是否分页取到了数据，如果有数据，就进行修改
        if (notPassIntegerList.size() > 0) {
            System.out.println("Notpass---------------------");
            advertisementMapper.notPass(notPassIntegerList);
        }
    }
}




