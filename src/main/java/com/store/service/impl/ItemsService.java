package com.store.service.impl;

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
    void save(Items items);

    PageBean showItems(PageBean pageBean,Integer id,String preDate,String lastDate) throws ParseException;

    void update(Items items);

    Items showOneItems(Integer id);

    void delete(Integer[] ids);

    void deleteOne(Integer id);

    void exportExcel(List<Items> itemsList, ServletOutputStream outputStream);

    List<Items> itemList(Integer id);

//    List<Items> importExcel(MultipartFile file);
}
