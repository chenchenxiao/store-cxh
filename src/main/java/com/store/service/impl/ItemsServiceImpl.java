package com.store.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.store.been.PageBean;
import com.store.dao.ItemsMapper;
import com.store.model.Items;
import com.store.model.User;
import com.store.util.ExcelUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import java.io.FileInputStream;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by 陈晓海 on 2017/7/19.
 */
@Service
public class ItemsServiceImpl implements ItemsService {

    @Autowired
    private ItemsMapper itemsMappers;

    //用户增添商品
    public void save(Items items){
        items.setAddDate(new Date());
        items.setUpdateDate(new Date());
        itemsMappers.insert(items);
    }

    //用户查看自己添加的商品
    public PageBean showItems(PageBean pageBean,Integer id,String preDate,String lastDate) throws ParseException {
        //用户刚点进我的商城后查看我的商品时，preDate和lastDate都是Null的，而后面由于用了控件，传到后台的日期值都是空的，即使没有填写值
        // 所以要在此加非空判断，否则会报空指针
        if(preDate != null && lastDate != null){
            //通过判断日期的长度来判断取得的时间值是否为空，因为用了日期控件，所以前台传来的值不为null，无法用null判断
            if(preDate.length() > 0 && lastDate.length() > 0){
                //日期的格式化格式
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                //先把取得的日期赋给两个日期类型的值,相当于三个数比较时中间值的作用
                Date preTime = formatter.parse(preDate);
                Date lastTime = formatter.parse(lastDate);
                //此处是防止preDate的值大于lastDate的情况，即开始的日期大于结束的日期
                //通过getTime()方法比较两个日期的大小
                if(preTime.getTime() > lastTime.getTime()){
                    preDate = formatter.format(lastTime);
                    lastDate = formatter.format(preTime);
                }
            }
            if(preDate.length() == 0){
                preDate = null;
            }
            if(lastDate.length() == 0){
                lastDate = null;
            }
        }
        PageHelper.startPage(pageBean.getPage(),pageBean.getSize());
        List list = itemsMappers.selectItemsList(id,preDate,lastDate);
        //把分页出来的数据放入pageBean
        pageBean.setRecordList(list);
        //取分页信息
        PageInfo<User> pageInfo = new PageInfo<User>(list);
        pageBean.init((int) pageInfo.getTotal(),list);
        return pageBean;
    }

    //用户修改商品信息
    public void update(Items items) {
        items.setUpdateDate(new Date());
        itemsMappers.updateByPrimaryKeySelective(items);
    }

    //用户查看商品时取得商品信息
    public Items showOneItems(Integer id) {
        return itemsMappers.selectByPrimaryKey(id);
    }

    //用户批量删除商品信息
    public void delete(Integer[] ids) {
        List<Integer> list = new ArrayList<Integer>();
        //把数组的值通过循环赋给list，mapper传参list
        for(int id:ids){
            list.add(id);
        }
        itemsMappers.deleteByIds(list);
    }

    //用户删除单个商品的信息
    public void deleteOne(Integer id){
        itemsMappers.deleteByPrimaryKey(id);
    }

    //用户导出商品列表
    public void exportExcel(List<Items> itemsList, ServletOutputStream outputStream) {
        ExcelUtil.exportUserExcel(itemsList,outputStream);
    }
    //取得该用户的所有商品
    public List<Items> itemList(Integer id) {
        return itemsMappers.selectItemsList(id,null,null);
    }

//    public List<Items> importExcel(MultipartFile file) {
//        try {
//            FileInputStream fileInputStream = new FileInputStream(file);
//            boolean is03Excel = userExcelFileName.matches("^.+\\.(?i)(xls)$");
//            //1、读取工作簿
//            Workbook workbook = is03Excel ? new HSSFWorkbook(fileInputStream):new XSSFWorkbook(fileInputStream);
//            //2、读取工作表
//            Sheet sheet = workbook.getSheetAt(0);
//            //3、读取行
//            if(sheet.getPhysicalNumberOfRows() > 2){
//                User user = null;
//                for(int k = 2; k < sheet.getPhysicalNumberOfRows(); k++){
//                    //4、读取单元格
//                    Row row = sheet.getRow(k);
//                    user = new User();
//                    //用户名
//                    Cell cell0 = row.getCell(0);
//                    user.setName(cell0.getStringCellValue());
//                    //帐号
//                    Cell cell1 = row.getCell(1);
//                    user.setAccount(cell1.getStringCellValue());
//                    //所属部门
//                    Cell cell2 = row.getCell(2);
//                    user.setDept(cell2.getStringCellValue());
//                    //性别
//                    Cell cell3 = row.getCell(3);
//                    user.setGender(cell3.getStringCellValue().equals("男"));
//                    //手机号
//                    String mobile = "";
//                    Cell cell4 = row.getCell(4);
//                    try {
//                        mobile = cell4.getStringCellValue();
//                    } catch (Exception e) {
//                        double dMobile = cell4.getNumericCellValue();
//                        mobile = BigDecimal.valueOf(dMobile).toString();
//                    }
//                    user.setMobile(mobile);
//
//                    //电子邮箱
//                    Cell cell5 = row.getCell(5);
//                    user.setEmail(cell5.getStringCellValue());
//                    //生日
//                    Cell cell6 = row.getCell(6);
//                    if(cell6.getDateCellValue() != null){
//                        user.setBirthday(cell6.getDateCellValue());
//                    }
//                    //默认用户密码为 123456
//                    user.setPassword("123456");
//                    //默认用户状态为 有效
//                    user.setState(User.USER_STATE_VALID);
//
//                    //5、保存用户
//                    save(user);
//                }
//            }
//            workbook.close();
//            fileInputStream.close();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return null;
//    }
}