package com.store.util;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.multipart.MultipartFile;

import java.beans.PropertyDescriptor;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by 陈晓海 on 2017/6/11.
 */
public class ExcelUtils {
    public static List<Object> ExcelForList(MultipartFile file, Class<?>  beanclazz, Boolean titleExist) {
        List<Object> list = new ArrayList<Object>();
        try {
            // IO流读取文件
            InputStream input = file.getInputStream();
            // 创建文档
            Workbook wb = new HSSFWorkbook(input);
            // 得到第一张工作表
            Sheet sheet = wb.getSheetAt(0);
            int i;
            if (titleExist) {
                i = 1;
            } else {
                i = 0;
            }
            // 行的遍历
            for (; i <= sheet.getLastRowNum(); i++) {
                // 得到行
                Row row = sheet.getRow(i);
                // 单元格的遍历
                // 实例化对象
                Object object = beanclazz.newInstance();

                Field[] fields = beanclazz.getDeclaredFields();
                int j = 0;
                for (Field field : fields) {
                    String fieldName = field.getName();
                    PropertyDescriptor pd = new PropertyDescriptor(fieldName, beanclazz);
                    Method getMethod = pd.getWriteMethod();
                    Cell cell = row.getCell(j++);
                    try{
                        int type = cell.getCellType();

                        if (type == cell.CELL_TYPE_BOOLEAN) {
                            // 返回布尔类型的值
                            boolean value = cell.getBooleanCellValue();
                            getMethod.invoke(object, value);
                            System.out.println(object);
                            System.out.println(value);
                        } else if (type == cell.CELL_TYPE_NUMERIC) {
                            // 返回数值类型的值
                            Double d = cell.getNumericCellValue();
                            int value = d.intValue();
                            getMethod.invoke(object, new Integer(value));
                        } else if (type == cell.CELL_TYPE_STRING) {
                            // 返回字符串类型的值
                            String value = cell.getStringCellValue();
                            getMethod.invoke(object, new String(value));
                        }

                    }catch (Exception e) {
                        System.out.println("");
                    }
                }
                list.add(object);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

//    public static void Exp() throws Exception {
//        // 声明一个工作薄
//        HSSFWorkbook wb = new HSSFWorkbook();
//        //声明一个单子并命名
//        HSSFSheet sheet = wb.createSheet("学生表");
//        //给单子名称一个长度
//        sheet.setDefaultColumnWidth((short)15);
//        // 生成一个样式
//        HSSFCellStyle style = wb.createCellStyle();
//        //创建第一行（也可以称为表头）
//        HSSFRow row = sheet.createRow(0);
//        //样式字体居中
//        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
//        //给表头第一行一次创建单元格
//        HSSFCell cell = row.createCell((short) 0);
//        cell.setCellValue("学生编号");
//        cell.setCellStyle(style);
//        cell = row.createCell( (short) 1);
//        cell.setCellValue("学生姓名");
//        cell.setCellStyle(style);
//        cell = row.createCell((short) 2);
//        cell.setCellValue("学生");
//        cell.setCellStyle(style);
//
//        //添加一些数据，这里先写死，大家可以换成自己的集合数据
//        List<Student> list = new ArrayList<Student>();
//        list.add(new Student(111,"张三","男"));
//        list.add(new Student(111,"李四","男"));
//        list.add(new Student(111,"王五","女"));
//
//        //向单元格里填充数据
//        for (short i = 0; i < list.size(); i++) {
//            row = sheet.createRow(i + 1);
//            row.createCell(0).setCellValue(list.get(i).getId());
//            row.createCell(1).setCellValue(list.get(i).getName());
//            row.createCell(2).setCellValue(list.get(i).getSex());
//        }
//
//        try {
//            //默认导出到E盘下
//            FileOutputStream out = new FileOutputStream("E://学生表.xls");
//            wb.write(out);
//            out.close();
//            JOptionPane.showMessageDialog(null, "导出成功");
//        } catch (FileNotFoundException e) {
//            JOptionPane.showMessageDialog(null, "导出失败");
//            e.printStackTrace();
//        } catch (IOException e) {
//            JOptionPane.showMessageDialog(null, "导出失败");
//            e.printStackTrace();
//        }
//    }
}
