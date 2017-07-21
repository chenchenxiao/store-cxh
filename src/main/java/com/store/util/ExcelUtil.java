package com.store.util;

import java.beans.PropertyDescriptor;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;

import javax.servlet.ServletInputStream;
import javax.servlet.ServletOutputStream;

import com.store.model.Items;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.web.multipart.MultipartFile;


public class ExcelUtil {

	/**
	 * 导出用户的所有列表到excel
	 * @param itemsList 商品列别
	 * @param outputStream 输出流
	 */
	public static void exportUserExcel(List<Items> itemsList, ServletOutputStream outputStream) {
		try {
			//1、创建工作簿
			HSSFWorkbook workbook = new HSSFWorkbook();
			//1.1、创建合并单元格对象
			CellRangeAddress cellRangeAddress = new CellRangeAddress(0, 0, 0, 4);//起始行号，结束行号，起始列号，结束列号
			
			//1.2、头标题样式
			HSSFCellStyle style1 = createCellStyle(workbook, (short)16);
			
			//1.3、列标题样式
			HSSFCellStyle style2 = createCellStyle(workbook, (short)13);
			
			//2、创建工作表
			HSSFSheet sheet = workbook.createSheet("商品列表");
			//2.1、加载合并单元格对象
			sheet.addMergedRegion(cellRangeAddress);
			//设置默认列宽
			sheet.setDefaultColumnWidth(25);
			
			//3、创建行
			//3.1、创建头标题行；并且设置头标题
			HSSFRow row1 = sheet.createRow(0);
			HSSFCell cell1 = row1.createCell(0);
			//加载单元格样式
			cell1.setCellStyle(style1);
			cell1.setCellValue("商品列表");
			
			//3.2、创建列标题行；并且设置列标题
			HSSFRow row2 = sheet.createRow(1);
			String[] titles = {"名称","类型","标题","细节","价格", "库存量", "图片名称", "增添时间","修改时间"};
			for(int i = 0; i < titles.length; i++){
				HSSFCell cell2 = row2.createCell(i);
				//加载单元格样式
				cell2.setCellStyle(style2);
				cell2.setCellValue(titles[i]);
			}
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			//4、操作单元格；将用户列表写入excel
			if(itemsList != null){
				for(int j = 0; j < itemsList.size(); j++){
					HSSFRow row = sheet.createRow(j+2);
					HSSFCell cell11 = row.createCell(0);
					cell11.setCellValue(itemsList.get(j).getName());
					HSSFCell cell12 = row.createCell(1);
					cell12.setCellValue(itemsList.get(j).getType());
					HSSFCell cell13 = row.createCell(2);
					cell13.setCellValue(itemsList.get(j).getTitle());
					HSSFCell cell14 = row.createCell(3);
					cell14.setCellValue(itemsList.get(j).getDetails());
					HSSFCell cell15 = row.createCell(4);
					cell15.setCellValue(itemsList.get(j).getPrice());
					HSSFCell cell16 = row.createCell(5);
					cell16.setCellValue(itemsList.get(j).getNumber());
					HSSFCell cell17 = row.createCell(6);
					cell17.setCellValue(itemsList.get(j).getPhoto());
					HSSFCell cell18 = row.createCell(7);
					String preTime = formatter.format(itemsList.get(j).getAddDate());
					cell18.setCellValue(preTime);
					HSSFCell cell19 = row.createCell(8);
					String lastTime = formatter.format(itemsList.get(j).getUpdateDate());
					cell19.setCellValue(lastTime);
				}
			}
			//5、输出
			workbook.write(outputStream);
			workbook.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 创建单元格样式
	 * @param workbook 工作簿
	 * @param fontSize 字体大小
	 * @return 单元格样式
	 */
	private static HSSFCellStyle createCellStyle(HSSFWorkbook workbook, short fontSize) {
		HSSFCellStyle style = workbook.createCellStyle();
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);//水平居中
		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);//垂直居中
		//创建字体
		HSSFFont font = workbook.createFont();
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);//加粗字体
		font.setFontHeightInPoints(fontSize);
		//加载字体
		style.setFont(font);
		return style;
	}

	public static List<Object> ExcelForList(MultipartFile file, Class<?>  beanclazz, Boolean titleExist) {
		List<Object> list = new ArrayList<Object>();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
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
				int j = 0;		////////
				for (Field field : fields) {
					String fieldName = field.getName();
					PropertyDescriptor pd = new PropertyDescriptor(fieldName, beanclazz);
					Method getMethod = pd.getWriteMethod();
					Cell cell = row.getCell(j++);
					try{
						int type = cell.getCellType();
						if(fieldName.equals("addDate") || fieldName.equals("updateDate")){
							System.out.println("number-->" + cell.getNumericCellValue());
							System.out.println("boolean-->" + DateUtil.isCellDateFormatted(cell));
							getMethod.invoke(object,cell.getStringCellValue());
						}
						if (type == cell.CELL_TYPE_BOOLEAN) {
							// 返回布尔类型的值
							boolean value = cell.getBooleanCellValue();
							getMethod.invoke(object, value);
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
					System.out.println("end");
				}
				System.out.println("一个对象");
				list.add(object);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

}
