package com.store.dao;

import com.store.model.Advertisement;
import com.store.model.Items;
import com.store.util.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by 陈晓海 on 2017/7/28.
 */
public interface AdvertisementMapper extends BaseMapper<Advertisement>{
    //根据用户的id查找广告信息
    List<Advertisement> selectAdvertisements(@Param("id") Integer userId,@Param("searchText") String searchText);
    //批量删除广告
    void deleteByIds(@Param("ids") List<Integer> list);
    //删除单个广告
    void deleteById(@Param("id") Integer id);
    //根据id进行查询
    Advertisement selectById(@Param("id") Integer id);
    //修改广告信息
    void updateAd(Advertisement advertisement);
    //根据广告状态查询广告
    List<Advertisement> selectByStatus(@Param("status") Integer id);
    //修改广告状态
    void updateStatus(@Param("ids") List<Integer> ids,@Param("status") Integer status);
    //根据订单明细表的商品的购买人数来查询热销商品，有用到左外联
    List<Items> selectHotSell(@Param("type") String type);

}
