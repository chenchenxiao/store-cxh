package com.store.service;
import com.store.been.PageBean;
import com.store.model.Advertisement;
import com.store.model.Items;

import java.util.List;
/**
 * Created by 陈晓海 on 2017/7/28.
 */
public interface AdvertisementService {
    PageBean showAdvertisements(Integer id,PageBean pageBean);

    List<Items> showAllItems(Integer id);

    Advertisement selectOneAd(Integer id);

    void add(Advertisement advertisement);

    void update(Advertisement advertisement);

    void deleteOne(Integer id);

    void deleteByIds(Integer[] ids);

    Advertisement selectById(Integer id);

    List<Advertisement> selectByStatus();

    void quartzUpdate(Integer page);

    Long comparePage(Integer page);

}
