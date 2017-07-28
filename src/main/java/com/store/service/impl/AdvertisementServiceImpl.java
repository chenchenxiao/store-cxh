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
    public PageBean showAdvertisements(Integer id,PageBean pageBean) {
        System.out.println(advertisementMapper);
        if(pageBean.getSearchText() != null && !"".equals(pageBean.getSearchText())){
            pageBean.setSearchText("%" + pageBean.getSearchText() + "%");
        }
        PageHelper.startPage(pageBean.getPage(),pageBean.getSize());
        List list = advertisementMapper.selectAdvertisements(id,pageBean.getSearchText());
        //把分页出来的数据放入pageBean
        pageBean.setRecordList(list);
        //取分页信息
        PageInfo<User> pageInfo = new PageInfo<User>(list);
        pageBean.init((int) pageInfo.getTotal(),list);
        return pageBean;
    }

    public List<Items> showAllItems(Integer userId) {
        Items items = new Items();
        items.setUid(userId);
        return itemsMapper.select(items);
    }

    public Advertisement selectOneAd(Integer id) {
        return advertisementMapper.selectOne(new Advertisement(id));
    }

    public void add(Advertisement advertisement) {
        Items items = itemsMapper.selectByPrimaryKey(advertisement.getItemsId());
        advertisement.setItemsName(items.getName());
        advertisement.setUserId(items.getUid());
        advertisement.setStatus(0);
        advertisementMapper.insert(advertisement);
    }

    public void update(Advertisement advertisement) {
        advertisementMapper.updateByPrimaryKeySelective(advertisement);
    }

    public void deleteOne(Integer id) {
        advertisementMapper.deleteById(id);
    }

    public void deleteByIds(Integer[] ids) {
        List<Integer> list = new ArrayList<Integer>();
        for(int i :ids){
            list.add(i);
        }
        advertisementMapper.deleteByIds(list);
    }
}
