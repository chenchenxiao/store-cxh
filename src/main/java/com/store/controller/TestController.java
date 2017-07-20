package com.store.controller;

import com.store.model.Items;
import com.store.model.User;
import com.store.util.ExcelUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * Created by 陈晓海 on 2017/7/9.
 */
@Controller
public class TestController {
    @RequestMapping("test")
    public void test(){
        System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!");
    }

    @ResponseBody
    @RequestMapping("testRep")
    public User testRep(){
        User user = new User();
        user.setId(2);
        return user;
    }

    @RequestMapping("testUed")
    public String textUed(String testUeditor){
        System.out.println("testUeditor-->" + testUeditor);
        return "/ueditorTest";
    }

    @RequestMapping("getDate")
    public String getDate(String date){
        System.out.println("date-->" + date );
        return "test";
    }

   @RequestMapping("excelImort")
    public void testExcel(MultipartFile itemsFile){
       System.out.println("!!!!");
       List<Object> list = ExcelUtil.ExcelForList(itemsFile, Items.class, true);
       System.out.println(list.get(2).toString());
   }
}
