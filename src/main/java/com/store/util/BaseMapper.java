package com.store.util;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.special.InsertListMapper;

/**
 * Created by 陈晓海 on 2017/7/26.
 * 通用mapepr接口
 */
public interface BaseMapper<T> extends Mapper<T>,InsertListMapper<T> {
}
