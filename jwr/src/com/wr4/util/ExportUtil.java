package com.wr4.util;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;

import com.wr4.action.BaseAction;

public class ExportUtil extends BaseAction{
	/**
	 * 输出文件
	 * fileName : 模板文件名       docName： 导出后的默认文件名
	 * list:数据集合
	 */
	public void exportFile(String fileName,String docName,List list,String prpoFileName,String str){
		OutputStream out=null;

		try {
		    long start8 = System.currentTimeMillis();
		    DateFormat df = new SimpleDateFormat("yyyyMMdd");
		    docName = docName + "_" + df.format(new Date()) + ".xls";
		    response=ServletActionContext.getResponse();
		    response.reset();
		    response.setCharacterEncoding("UTF-8");
		    docName = URLEncoder.encode(docName, "UTF-8");
		    response.setContentType("application/x-msdownload;charset=UTF-8");
		    response.setHeader("Content-disposition", "attachment; filename=" + docName);
		    out = response.getOutputStream();   
		    getIdcWorkExcel(fileName,list,  prpoFileName,str).write(out);
		   
		} catch (Exception e) {
		    // TODO Auto-generated catch block
		    e.printStackTrace();
		}finally{
		    if(out!=null){
		        try {
		            out.close();
		        } catch (IOException e1) {
		            e1.printStackTrace();
		        }
		    }
		}
	}
	/**
	 * exportFileName:模板文件名
	 * @param list
	 * @return
	 * @throws FileNotFoundException 
	 */
	public HSSFWorkbook getIdcWorkExcel(String exportFileName,List list,String prpoFileName,String str ) throws FileNotFoundException {
	    HSSFWorkbook wb = null;//要导出的流
	    InputStream in = new FileInputStream(exportFileName);//无错误完全匹配
	    try {
	        wb = new HSSFWorkbook(in);   
	        HSSFSheet sheet = wb.getSheetAt(0);//获取sheet
	        HSSFRow headRow= sheet.getRow(0);//获取行
//	        int cellSum=headRow.getLastCellNum(); //获取当前行最大列数
	            if(list!=null&&list.size()>0){
	            	
	            	//封装表头
	            	HSSFRow row= sheet.getRow(0);
	            	if(row==null){
	            		row=sheet.createRow(0);
	            	}
	            	Map map1=getFieldMap(list.get(0),str);
	            	//从properties 文件中 获取 表头字段对应中文名
	            	 InputStream ins = new BufferedInputStream(new FileInputStream(prpoFileName));
			            Properties p = new Properties();
			            p.load(ins);
	            	Iterator<String> iter1 = map1.keySet().iterator();
	            	int cell1=0;
	            	while (iter1.hasNext()) {
	            		
	            		String   key = iter1.next();
	            		String ss=p.getProperty(key);
	            		if(p.getProperty(key)!=null){
	            			String   value=ss;//从property文件中读取
		            		addCell(row, value, cell1);
		            		cell1++;
	            		}
	            	
	            	}
		            int k=1;//数据起始行数
		           
		            for(int i=0;i<list.size();i++){
		            	//循环数据      调用 getFieldMap方法  得到 map对象  key:bean.属性  value:bean.get属性
		            	Map map=getFieldMap(list.get(i),str);
		            	HSSFRow row1= sheet.getRow(k);
		            	if(row1==null){
		            		row1=sheet.createRow(k);
		            	}
		            	Iterator<String> iter = map.keySet().iterator();
		            	int cell=0;
		            	while (iter.hasNext()) {
		            		String   key = iter.next();
		            		String ss=p.getProperty(key);
		            		if(p.getProperty(key)!=null){
//		            			String   value=ss;//从property文件中读取
		            			String  value = map.get(key).toString();
			            		addCell(row1, value, cell);
			            		cell++;
		            		}
		            	}
		                k++;
		            }
		        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        throw new RuntimeException(e);
	    } 
	    return wb;
	} 
	/**
	 * obj:数据集合对象
	 * @param obj
	 * @return
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 */
	public Map getFieldMap(Object obj,String str) throws IllegalArgumentException, IllegalAccessException{
		Field[] fields = obj.getClass().getDeclaredFields();  
	    Field.setAccessible(fields, true);
	    Map map=new HashMap();
	    for (int i = 0; i < fields.length; i++) {  
	        Field field = fields[i];  
	      if(field.get(obj)==null){
	    	  
	      }
	        map.put(str+field.getName(),  field.get(obj)==null?"":field.get(obj).toString());
	    }  
	    return map;
	}
	/**
	 * 增加列
	 * @param row
	 * @param value
	 * @param col
	 */
	public void addCell(HSSFRow row, Object value, int col) {
	    HSSFCell cell = row.createCell(col);

	    switch (col) {
	    // case 24:
	    //	            case 25:
	    //	            case 26:
	    case 33:
	        double num;
	        try {
	            num = Double.parseDouble((String) value);
	        } catch (Exception e) {
	            num = 0;
	        }
	        cell.setCellValue(num);
	        break;
	    default:
	        if (value instanceof Date) {
	            cell.setCellValue((Date) value);
	        } else {
	            cell.setCellValue(new HSSFRichTextString((String) value));
	        }
	    }
	}
}
