package com.store.dao;

import com.store.model.Advertisement;
import com.store.util.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by 陈晓海 on 2017/7/28.
 */
public interface AdvertisementMapper extends BaseMapper<Advertisement>{
    //根据用户的id查找广告信息
    List<Advertisement> selectAdvertisements(@Param("id") Integer userId,@Param("searchText") String searchText);

    void deleteByIds(@Param("ids") List<Integer> list);

    void deleteById(@Param("id") Integer id);

    Advertisement selectById(@Param("id") Integer id);

    void updateAd(Advertisement advertisement);

    List<Advertisement> selectByStatus(@Param("status") Integer id);

    void adPass(@Param("ids") List<Integer> ids);

    void notPass(@Param("ids") List<Integer> ids);


}
