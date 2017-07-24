package com.store.dao;

import com.store.model.Items;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.BaseMapper;
import java.util.List;
/**
 * Created by 陈晓海 on 2017/7/19.
 */
public interface ItemsMapper extends BaseMapper<Items> {
    void deleteByIds(@Param("ids" ) List<Integer> ids);

    List<Items> selectItemsList(@Param("uid") Integer uid,@Param("preDate") String preDate,@Param("lastDate") String lastDate);

    List<Items> showTypeItems(@Param("type") String type);

    List<Items> test(@Param("id") Integer id);

    List<Items> expList(@Param("ids" ) List<Integer> list);
}
