package com.store.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.store.been.PageBean;
import com.store.dao.*;
import com.store.model.*;
import com.store.service.ItemsService;
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
import java.io.InputStream;
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
    @Autowired
    private CartItemsMapper cartItemsMapper;
    @Autowired
    private CartMapper cartMapper;
    //用户增添商品
    public void save(Items items) throws Exception {
        items.setAddDate(new Date());
        items.setUpdateDate(new Date());
        //取得插入数据库后商品的主键
        Integer id = itemsMappers.saveOne(items);
        //给ItemsCustom赋值
        ItemsCustom itemsCustom = new ItemsCustom();
        itemsCustom.setId(id);
        itemsCustom.setUid(items.getUid());
        itemsCustom.setTitle(items.getTitle());
        itemsCustom.setType(items.getType());
        itemsCustom.setPrice(items.getPrice());
        itemsCustom.setName(items.getName());
        itemsCustom.setPhoto(items.getPhoto());
        new LuceneDao().add(itemsCustom);
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
        if("".equals(pageBean.getSearchText())){
            pageBean.setSearchText(null);
        }
        PageHelper.startPage(pageBean.getPage(),pageBean.getSize());
        if(pageBean.getSearchText() != null && pageBean.getSearchText() != ""){
            pageBean.setSearchText("%" + pageBean.getSearchText() + "%");
        }
        List list = itemsMappers.selectItemsList(id,pageBean.getSearchText(),preDate,lastDate);
        //把分页出来的数据放入pageBean
        pageBean.setRecordList(list);
        //取分页信息
        PageInfo<User> pageInfo = new PageInfo<User>(list);
        pageBean.init((int) pageInfo.getTotal(),list);
        return pageBean;
    }

    //用户修改商品信息
    public void update(Items items) throws Exception {
        //修改商品的修改日期
        items.setUpdateDate(new Date());
        //修改购物车对应商品的价格,购物车的总金额在展示购物车的时候修改，如果在这里修改会比较麻烦
        List<CartItems> list = cartItemsMapper.select(new CartItems(items.getId()));
        Float cost = Float.valueOf(0);
        for(int i = 0;i < list.size();i++){
            //商品的全额
            cost = items.getPrice() * list.get(i).getItemsNumber();
            //重新设置商品的单价
            list.get(i).setMoney(items.getPrice());
            //重新设置商品的全额
            list.get(i).setCost(cost);
            //重新设置商品标题
            list.get(i).setTitle(items.getTitle());
            //如果商品照片不为空说明重新上传了图片，所以购物车商品也要修改图片
            if(items.getPhoto() != null){
                list.get(i).setPhoto(items.getPhoto());
            }
            cartItemsMapper.updateByPrimaryKey(list.get(i));
        }
        itemsMappers.updateByPrimaryKeySelective(items);
    }

    //用户查看商品时取得商品信息
    public Items showOneItems(Integer id) {
        return itemsMappers.selectByPrimaryKey(id);
    }

    //用户批量删除商品信息
    public void delete(Integer[] ids) throws Exception {
        List<Integer> list = new ArrayList<Integer>();
        //把数组的值通过循环赋给list，mapper传参list
        for(int id:ids){
            list.add(id);
        }
        itemsMappers.deleteByIds(list);
    }

    //用户删除单个商品的信息
    public void deleteOne(Integer id){
        LuceneDao luceneDao = new LuceneDao();
        try {
            luceneDao.deleteOne(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        itemsMappers.deleteByPrimaryKey(id);
    }

    //用户导出商品列表
    public void exportExcel(List<Items> itemsList, ServletOutputStream outputStream) {
        ExcelUtil.exportUserExcel(itemsList,outputStream);
    }

    //取得该用户的商品信息
    public List<Items> itemList(Integer id) {
        return itemsMappers.selectItemsList(id,null,null,null);
    }
    //导入商品信息
    public void importExcel(MultipartFile file,Integer id) {
        try {
            InputStream inputStream = file.getInputStream();
            boolean is03Excel = file.getOriginalFilename().matches("^.+\\.(?i)(xls)$");
            //1、读取工作簿
            Workbook workbook = is03Excel ? new HSSFWorkbook(inputStream):new XSSFWorkbook(inputStream);
            //2、读取工作表
            Sheet sheet = workbook.getSheetAt(0);
            //日期的格式
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            //3、读取行
            if(sheet.getPhysicalNumberOfRows() > 2){
                System.out.println("number-->" + sheet.getPhysicalNumberOfRows());
                Items items = null;
                for(int k = 2; k < sheet.getPhysicalNumberOfRows(); k++){
                    //4、读取单元格
                    Row row = sheet.getRow(k);
                    items = new Items();
                    //用户名
                    Cell cell0 = row.getCell(0);
                    items.setName((cell0.getStringCellValue()));
                    Cell cell1 = row.getCell(1);
                    items.setType(cell1.getStringCellValue());
                    Cell cell2 = row.getCell(2);
                    items.setTitle(cell2.getStringCellValue());
                    Cell cell3 = row.getCell(3);
                    items.setDetails(cell3.getStringCellValue());
                    Cell cell4 = row.getCell(4);
                    items.setPrice((float) cell4.getNumericCellValue());
                    Cell cell5 = row.getCell(5);
                    items.setNumber((int) cell5.getNumericCellValue());
                    Cell cell6 = row.getCell(6);
                    items.setPhoto(cell6.getStringCellValue());
                    Cell cell7 = row.getCell(7);
                    items.setAddDate(formatter.parse(cell7.getStringCellValue()));      //从excel取得的日期类型是字符串型的，所以需要转为日期类型
                    Cell cell8 = row.getCell(8);
                    items.setUpdateDate(formatter.parse(cell8.getStringCellValue()));
                    items.setUid(id);
                    System.out.println("items-->" + k);
                    itemsMappers.insert(items);
                }
            }
            workbook.close();
            inputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    //取得指定类型的商品信息
    public PageBean showTypeItems(String type,PageBean pageBean) throws Exception {
//        PageHelper.startPage(pageBean.getPage(),pageBean.getSize());
//        List list = itemsMappers.selectTypeItems(type);
//        //把分页出来的数据放入pageBean
//        System.out.println("list-->" + list.size());
//        pageBean.setRecordList(list);
//        //取分页信息
//        PageInfo<Items> pageInfo = new PageInfo<Items>(list);
//        pageBean.init((int) pageInfo.getTotal(),list);
        LuceneDao luceneDao = new LuceneDao();
        if(type != null){
            pageBean.setSearchText(type);
        }
        return  luceneDao.findAllByKeywords(pageBean);
    }
    //取得指定导出的商品集合
    public List<Items> expList(Integer[] ids) {
        List<Integer> list = new ArrayList<Integer>();
        //把数组的值通过循环赋给list，mapper传参list
        for(int id:ids){
            list.add(id);
        }
        return itemsMappers.selectListByIds(list);
    }
    //根据商品id查找对应用户的商品
    public List<Items> selectUserItems(Integer id) {
        PageHelper.startPage(1,3);
        List<Items> itemsList = itemsMappers.selectUserItems(id);
        return null;
    }
}
