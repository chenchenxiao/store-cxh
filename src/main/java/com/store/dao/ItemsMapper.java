package com.store.dao;

import com.store.model.Items;
import com.store.util.BaseMapper;
import org.apache.ibatis.annotations.Param;
import java.util.List;
/**
 * Created by 陈晓海 on 2017/7/19.
 */
public interface ItemsMapper extends BaseMapper<Items> {
    void deleteByIds(@Param("ids" ) List<Integer> ids);

    List<Items> selectItemsList(@Param("uid") Integer uid,@Param("searchText") String searchText,@Param("preDate") String preDate,@Param("lastDate") String lastDate);

    List<Items> selectTypeItems(@Param("type") String type);


    List<Items> selectListByIds(@Param("ids" ) List<Integer> list);
}
