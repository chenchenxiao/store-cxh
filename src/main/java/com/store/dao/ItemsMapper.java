package com.store.dao;

import com.store.model.Items;
import com.store.util.BaseMapper;
import org.apache.ibatis.annotations.Param;
import java.util.List;
/**
 * Created by 陈晓海 on 2017/7/19.
 */
public interface ItemsMapper extends BaseMapper<Items> {
    //根据id集合批量删除
    void deleteByIds(@Param("ids" ) List<Integer> ids);
    //根据用户id，查询条件进行搜索
    List<Items> selectItemsList(@Param("uid") Integer uid,@Param("searchText") String searchText,@Param("preDate") String preDate,@Param("lastDate") String lastDate);
    //根据id集合进行查询
    List<Items> selectListByIds(@Param("ids" ) List<Integer> list);
    Integer saveOne(Items items);
    //根据商品id查找对应用户的商品
    List<Items> selectUserItems(@Param("id") Integer id);
}
