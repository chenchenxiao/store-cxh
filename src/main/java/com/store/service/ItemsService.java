package com.store.service;

import com.store.been.PageBean;
import com.store.model.Items;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import java.text.ParseException;
import java.util.*;

/**
 * Created by 陈晓海 on 2017/7/19.
 */
public interface ItemsService {
    //添加商品
    void save(Items items);
    //展示商品列表
    PageBean showItems(PageBean pageBean,Integer id,String preDate,String lastDate) throws ParseException;
    //修改商品
    void update(Items items);
    //取得单个商品
    Items showOneItems(Integer id);
    //删除商品
    void delete(Integer[] ids);
    //删除单个商品
    void deleteOne(Integer id);
    //以excel表的格式导出商品信息
    void exportExcel(List<Items> itemsList, ServletOutputStream outputStream);

    List<Items> itemList(Integer id);

    //以excel表的格式导入商品信息
    void importExcel(MultipartFile file,Integer id);
    //取得指定类型的商品信息
    PageBean showTypeItems(String type,PageBean pageBean);
    //取得要导出的商品信息的集合
    List<Items> expList(Integer[] ids);
}
