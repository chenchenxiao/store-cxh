package com.store.test;

import com.store.model.Items;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.junit.Test;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.Field;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by 陈晓海 on 2017/7/20.
 */
public class ExcelTest {
    @Test
    public void testWriteExcel() throws Exception {
        HSSFWorkbook hssfWorkbook = new HSSFWorkbook();
        HSSFSheet hssfSheet = hssfWorkbook.createSheet("test");
        HSSFRow row = hssfSheet.createRow(2);
        HSSFCell cell = row.createCell(2);
        cell.setCellValue("Hello");
        FileOutputStream fileOutputStream = new FileOutputStream("D:\\test\\test.xlsx");
        hssfWorkbook.write(fileOutputStream);
        hssfWorkbook.close();
        fileOutputStream.close();
    }

    public void testReadExcel() throws Exception {
        FileInputStream fileOutputStream = new FileInputStream("D:\\test\\test.xls");
        HSSFWorkbook hssfWorkbook = new HSSFWorkbook(fileOutputStream);
        HSSFSheet hssfSheet = hssfWorkbook.getSheet("test");
        HSSFRow row = hssfSheet.getRow(2);
        HSSFCell cell = row.getCell(2);
        System.out.println("value-->" + cell.getStringCellValue());
        hssfWorkbook.close();
        fileOutputStream.close();

    }

    @Test
    public void testImpl(){
        Field[] fields = Items.class.getDeclaredFields();
        for (Field f:fields){
            System.out.println("-->" + f.getName());
        }
        Date currentTime = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String dateString = formatter.format(currentTime);
        try {
            System.out.println(dateString);
            Date date = formatter.parse(dateString);
            System.out.println(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }
}
