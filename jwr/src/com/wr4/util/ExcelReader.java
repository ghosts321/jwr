package com.wr4.util;

import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;

 
import clojure.string__init;

import com.wr4.domain.EnInfo;
import com.wr4.domain.EnPFInfo;
import com.wr4.domain.EnRegInfo;
import com.wr4.domain.ExchangeInfo;
import com.wr4.domain.IndexInfo;
import com.wr4.domain.OrgApply;
import com.wr4.domain.OrgYearReport;
import com.wr4.domain.PnApply;
import com.wr4.domain.PnInfo;
import com.wr4.domain.PnTrain;
import com.wr4.domain.RecNotice;
import com.wr4.domain.UserLog;
import com.wr4.domain.YearReport;

/**
 * 操作Excel表格的功能类
 */
public class ExcelReader {
    private POIFSFileSystem fs;
    private HSSFWorkbook wb;
    private HSSFSheet sheet;
    private HSSFRow row;
    /** Oracle数据库连接URL*/ 
    private final static String DB_URL = "jdbc:oracle:thin:@192.168.0.160:1521:orcl";
     
    /** Oracle数据库连接驱动*/ 
    private final static String DB_DRIVER = "oracle.jdbc.driver.OracleDriver"; 
     
    /** 数据库用户名*/ 
    private final static String DB_USERNAME = "yxj1"; 
     
    /** 数据库密码*/ 
    private final static String DB_PASSWORD = "yxj"; 
    /**
     * 读取Excel表格表头的内容
     * @param InputStream
     * @return String 表头内容的数组
     */
    public String[] readExcelTitle(InputStream is) {
        try {
            fs = new POIFSFileSystem(is);
            wb = new HSSFWorkbook(fs);
        } catch (IOException e) {
            e.printStackTrace();
        }
        sheet = wb.getSheetAt(0);
        row = sheet.getRow(0);
        // 标题总列数
        int colNum = row.getPhysicalNumberOfCells();
        System.out.println("colNum:" + colNum);
        String[] title = new String[colNum];
        for (int i = 0; i < colNum; i++) {
            //title[i] = getStringCellValue(row.getCell((short) i));
            title[i] = getCellFormatValue(row.getCell((short) i));
        }
        return title;
    }

    /**
     * 读取Excel数据内容
     * @param InputStream
     * @return Map 包含单元格数据内容的Map对象
     */
    @SuppressWarnings("unused")
	public Map<Integer, String> readExcelContent(InputStream is) {
        Map<Integer, String> content = new HashMap<Integer, String>();
        String str = "";
        try {
            fs = new POIFSFileSystem(is);
            wb = new HSSFWorkbook(fs);
        } catch (IOException e) {
            e.printStackTrace();
        }
        sheet = wb.getSheetAt(0);
        // 得到总行数
        int rowNum = sheet.getLastRowNum();
        row = sheet.getRow(0);
        int colNum = row.getPhysicalNumberOfCells();
        // 正文内容应该从第二行开始,第一行为表头的标题
        String strr="";
        int zbj=0;
        int zbk=0;
        int zbi=0;
        String strii="";
        for (int i = 2; i <= rowNum; i++) {
            row = sheet.getRow(i);
            
            int j = 1;
            int k=3;
            int zi=0;
            String strj="";
            String stri=getCellFormatValue(row.getCell((short) zi)).trim();
            strj= getCellFormatValue(row.getCell((short) j)).trim();

            //如果第二次的 考评要点列为空  获取 上一行的值
            if("".equals(stri)){
            	stri=strii; 
            }else{
            	//如果不为空 记录
            	zbi++;
            	zbj=0;
            	strii=getCellFormatValue(row.getCell((short) zi)).trim();
            }
            //如果第二次的 考评要点列为空  获取 上一行的值
            if("".equals(strj)){
            	zbk++;
            	strj=strr; 
            }else{
            	//如果不为空 记录
            	zbk=1;
            	zbj++;
            	strr=getCellFormatValue(row.getCell((short) j)).trim();
            }
//            System.out.println(zbi);
            String strk=getCellFormatValue(row.getCell((short) k)).trim() + "    ";
//            String strks="";
//            String []sss=strk.split("；\n");
//            
//            for(int y=0;y<sss.length;y++){
//            	if(y==sss.length-2){
//            		strks= sss[y]+sss[sss.length-1];
//            		System.out.println(strks);
//            	}else{
//            		if( y!=sss.length-1){
//            		strks= sss[y];
//            		System.out.println(strks);}
//            	}
//            }
            //城市客运
            String sql="insert into indic4 (i,j,k,name,detailtype) values('"+zbi+"','"+zbj+"','"+zbk+"','"+strk+"','11');";
            System.out.println(sql.replaceAll("查资料：", ""));
            content.put(i, str);
            str = "";
        }
        return content;
    }

    /**
     * 读取Excel数据内容
     * @param InputStream
     * @return Map 包含单元格数据内容的Map对象
     */
	public List readExcelContents(InputStream is,String filePath) {
        Map<Integer, String> content = new HashMap<Integer, String>();
        List list=new ArrayList();
        BufferedWriter bufferedWriter = null;
        FileWriter fileWriter = null;
        try {
            fs = new POIFSFileSystem(is);
            wb = new HSSFWorkbook(fs);
       
        sheet = wb.getSheetAt(0);
        // 得到总行数
        int rowNum = sheet.getLastRowNum();
         fileWriter = new FileWriter(filePath);
         bufferedWriter = new BufferedWriter(fileWriter);
        // 正文内容应该从第二行开始,第一行为表头的标题
        for (int i = 1; i <= rowNum; i++) {
            String str="";
            row = sheet.getRow(i);
            int colNum = row.getLastCellNum();
            EnRegInfo enreg=new EnRegInfo();
            for (int j = 0; j <= row.getLastCellNum(); j++) {
            	if(j==0){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enreg.setContact(value);
            	}else if(j==1){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enreg.setMobile(value);
            		
            	}else if(j==2){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enreg.setPid(value);
            		
            	}else if(j==3){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enreg.setUsername(value);
            		
            	}else if(j==4){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enreg.setTax(value);
            		
            	}else if(j==5){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enreg.setRenew(value);
            		
            	}else if(j==6){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enreg.setAdminmot(value);
            		
            	}else if(j==7){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enreg.setAddress(value);
            		
            	}else if(j==8){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enreg.setUserid(value);
            		
            	}else if(j==9){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enreg.setLegalp(value);
            		
            	}else if(j==10){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enreg.setGrade(value);
            		
            	}else if(j==11){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enreg.setCelltype(value);
            		
            	}else if(j==12){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enreg.setBustype(value);
            		
            	}else if(j==13){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enreg.setTel(value);
            		
            	}else if(j==14){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enreg.setEmail(value);
            	}else if(j==15){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enreg.setLicense(value);
            	}else if(j==16){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enreg.setSafe(value);
            	}else if(j==17){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enreg.setQual(value);
            	}else if(j==18){//省
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enreg.setProvince(value);
            	}else if(j==19){//自评报告
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enreg.setMyreport(value);
            	}else if(j==20){//市
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
//            		enreg.set(value);
            	}else if(j==21){//不清楚什么字段
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
//            		enreg.set(value);
            	}else if(j==22){//联系人身份证号
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enreg.setCpid(value);
            	}else if(j==23){//不清楚什么字段
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
//            		enreg.set(value);
            	}else if(j==24){//不清楚什么字段
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
//            		enreg.set(value);
            	}else if(j==25){//不清楚什么字段
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
//            		enreg.set(value);
            	}
            }
//            list.add(enreg);
             StringBuffer sql=new StringBuffer();
             sql.append("insert into EN_REG (USERID, USERPASS, LICENSE, TAX, PID, USERNAME," +
             		" SAFE, RENEW, MYREPORT, PROVINCE, LEGALP, GRADE, EMAIL, CELLTYPE, BUSTYPE, " +
             		"CONTACT, ADDRESS, MOBILE, QUAL, ADMINMOT, TEL, BUSLICENSE, ORGCODECERT, " +
             		"OTHERCERT, CPID, REGRESP, REGRESPREMARK, " +
             		"REGRESPUSER, CREATEDATE," +
             		" DEL)values (");
             sql.append("'"+enreg.getUserid()+"',");
             sql.append("'"+enreg.getUserpass()+"',");
             sql.append("'"+enreg.getLicense()+"',");
             sql.append("'"+enreg.getTax()+"',");
             sql.append("'"+enreg.getPid()+"',");
             sql.append("'"+enreg.getUsername()+"',");
             sql.append("'"+enreg.getSafe()+"',");
             sql.append("'"+enreg.getRenew()+"',");
             sql.append("'"+enreg.getMyreport()+"',");
             sql.append("'"+enreg.getProvince()+"',");
             sql.append("'"+enreg.getLegalp()+"',");
             sql.append("'"+enreg.getGrade()+"',");
             sql.append("'"+enreg.getEmail()+"',");
             sql.append("'"+enreg.getCelltype()+"',");
             sql.append("'"+enreg.getBustype()+"',");
             sql.append("'"+enreg.getContact()+"',");
             sql.append("'"+enreg.getAddress()+"',");
             sql.append("'"+enreg.getMobile()+"',");
             sql.append("'"+enreg.getQual()+"',");
             sql.append("'"+enreg.getAdminmot()+"',");
             sql.append("'"+enreg.getTel()+"',");
             sql.append("'"+enreg.getBuslicense()+"',");
             sql.append("'"+enreg.getOrgcodecert()+"',");
             sql.append("'"+enreg.getOthercert()+"',");
             sql.append("'"+enreg.getCpid()+"',");
             sql.append("'"+enreg.getRegresp()+"',");
             sql.append("'"+enreg.getRegrespremark()+"',");
             sql.append("'"+enreg.getRegrespuser()+"',");
             sql.append("'"+enreg.getCreatedate()+"',");
             sql.append("'"+enreg.getDel()+"'");
             sql.append(");");
             bufferedWriter.write(sql.toString()+"\n");
             
//            boolean bol=submitData(sql.toString());
            list.add(sql.toString());
        }
        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }finally{
	    	fs=null;
	    	wb=null;
	    	try
	    	   {
	    		bufferedWriter.flush();
	    	    fileWriter.close();
	    	    bufferedWriter.close();
	    	   } catch (IOException e)
	    	   {
	    	    e.printStackTrace();
	    	   }
	    }
	    return list;
    }
	
	/**
     * 读取Excel数据内容
     * @param InputStream
     * @return Map 包含单元格数据内容的Map对象
     */
	public List readExcelEn_Apply(InputStream is,String filePath) {
        Map<Integer, String> content = new HashMap<Integer, String>();
        List list=new ArrayList();
        BufferedWriter bufferedWriter = null;
        FileWriter fileWriter = null;
        try {
            fs = new POIFSFileSystem(is);
            wb = new HSSFWorkbook(fs);
       
        sheet = wb.getSheetAt(0);
        // 得到总行数
        int rowNum = sheet.getLastRowNum();
         fileWriter = new FileWriter(filePath);
         bufferedWriter = new BufferedWriter(fileWriter);
        // 正文内容应该从第二行开始,第一行为表头的标题
        for (int i = 1; i <= rowNum; i++) {
            String str="";
            row = sheet.getRow(i);
            int colNum = row.getLastCellNum();
            EnInfo enapply=new EnInfo();
            for (int j = 0; j <= row.getLastCellNum(); j++) {
            	if(j==0){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setLicense(value);
            	}else if(j==1){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setTax(value);
            		
            	}else if(j==2){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setCreatedate(value);
            		
            	}else if(j==3){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setcDate(value);
            		
            	}else if(j==4){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setComment(value);
            		
            	}else if(j==5){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setOrgId1(value);
            		
            	}else if(j==6){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setScore1(value);
            		
            	}else if(j==7){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setAdvice(value);
            		
            	}else if(j==8){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setPid(value);
            		
            	}else if(j==9){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setDel(value);
            		
            	}else if(j==10){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setEnname(value);
            		
            	}else if(j==11){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setSafe(value);
            		
            	}else if(j==12){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setReNew(value);
            		
            	}else if(j==13){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setReport(value);
            		
            	}else if(j==14){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setProvince(value);
            	}else if(j==15){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setCid(value);
            	}else if(j==16){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setLegalp(value);
            	}else if(j==17){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setGrade(value);
            	}else if(j==18){//省
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setEmail(value);
            	}else if(j==19){//自评报告
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setBustype(value);
            	}else if(j==20){//市
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setResp(value);
            	}else if(j==21){//不清楚什么字段
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setRespDateReview(value);
            	}else if(j==22){//联系人身份证号
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setType2(value);
            	}else if(j==23){//不清楚什么字段
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setContact(value);
            	}else if(j==24){//不清楚什么字段
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setAdviceReview(value);
            	}else if(j==25){//不清楚什么字段
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setAddress(value);
            	}else if(j==26){//不清楚什么字段
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setMobile(value);
            	}else if(j==27){//不清楚什么字段
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setQual(value);
            	}else if(j==28){//不清楚什么字段
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setAdminmot(value);
            	}else if(j==29){//不清楚什么字段
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setRespReview(value);
            	}else if(j==30){//不清楚什么字段
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setTel(value);
            	}else if(j==31){//不清楚什么字段
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setRespdate(value);
            	}else if(j==32){//不清楚什么字段
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setResp_reg(value);
            	}else if(j==33){//不清楚什么字段
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setAdvice_reg(value);
            	}else if(j==34){//不清楚什么字段
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setUserId(value);
            	}else if(j==35){//不清楚什么字段
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setForgid(value);
            	}else if(j==36){//不清楚什么字段
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setCity(value);
            	}else if(j==37){//不清楚什么字段
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setFother(value);
            	}else if(j==38){//不清楚什么字段
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setCpid(value);
            	}else if(j==39){//不清楚什么字段
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setBusiness(value);
            	}else if(j==40){//不清楚什么字段
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		if(!value.equals("")){
            			value=value.replaceAll("\\[", "");
            			value=value.replaceAll("\"", "");
            			value=value.replaceAll("\\]", "");
            		}
            		enapply.setOrgId(value);
            	}else if(j==41){//不清楚什么字段
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setScore0(value);
            	}else if(j==42){//不清楚什么字段
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setResp_eval(value);
            	}else if(j==43){//不清楚什么字段
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setRespdate_eval(value);
            	}else if(j==44){//不清楚什么字段
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setAdvice_eval(value);
            	}else if(j==45){//不清楚什么字段
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setOrgid_comment(value);
            	}else if(j==46){//不清楚什么字段
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setStand0(value);
            	}else if(j==47){//不清楚什么字段
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		if(!value.equals("")){
            			value=value.replaceAll("\\[", "");
            			value=value.replaceAll("\"", "");
            			value=value.replaceAll("\\]", "");
            		}
            		enapply.setPnids(value);
            	}else if(j==48){//不清楚什么字段
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		if(!value.equals("")){
            			value=value.replaceAll("\\[", "");
            			value=value.replaceAll("\"", "");
            			value=value.replaceAll("\\]", "");
            		}
            		enapply.setPnids1(value);
            	}else if(j==49){//不清楚什么字段
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setStand1(value);
            	}else if(j==50){//不清楚什么字段
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setResp0(value);
            	}else if(j==51){//不清楚什么字段
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setUno(value);
            	}else if(j==52){//不清楚什么字段
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setType(value);
            	}else if(j==53){//不清楚什么字段
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enapply.setResp_review0(value);
            	}
            }
//            list.add(enreg);
             StringBuffer sql=new StringBuffer();
             sql.append("insert into EN_APPLY (LICENSE, TAX, CREATEDATE, CDATE, REMARKS, ORGID1," +
             		" SCORE1, ADVICE, PID, DEL, ENNAME, SAFE, RENEW, ZPREPORT, PROVINCE, " +
             		"CID, LEGALP, GRADE, EMAIL, BUSTYPE, RESP, RESPDATE_REVIEW, TYPE2, " +
             		"CONTACT, ADVICE_REVIEW, ADDRESS, MOBILE,QUAL,ADMINMOT,RESP_REVIEW, " +
             		"TEL,RESPDATE,RESP_REG,ADVICE_REG,USERID,FORGID,CITY,FOTHER,CPID,BUSINESS,  "+
             		"APPORG, ZPSCORE,RESP_EVAL,RESPDATE_EVAL,ADVICE_EVAL,ORGID_COMMENT," +
             		" STAND0,PNCIDLIST,PNIDS1,STAND1,RESP0,UNO,TYPE,RESP_REVIEW0 )values (");
             sql.append("'"+enapply.getLicense()+"',");
             sql.append("'"+enapply.getTax()+"',");
             sql.append("'"+enapply.getCreatedate()+"',");
             sql.append("'"+enapply.getcDate()+"',");
             sql.append("'"+enapply.getComment()+"',");
             sql.append("'"+enapply.getOrgId1()+"',");
             sql.append("'"+enapply.getScore1()+"',");
             sql.append("'"+enapply.getAdvice()+"',");
             sql.append("'"+enapply.getPid()+"',");
             sql.append("'"+enapply.getDel()+"',");
             sql.append("'"+enapply.getEnname()+"',");
             sql.append("'"+enapply.getSafe()+"',");
             sql.append("'"+enapply.getReNew()+"',");
             sql.append("'"+enapply.getReport()+"',");
             sql.append("'"+enapply.getProvince()+"',");
             sql.append("'"+enapply.getCid()+"',");
             sql.append("'"+enapply.getLegalp()+"',");
             sql.append("'"+enapply.getGrade()+"',");
             sql.append("'"+enapply.getEmail()+"',");
             sql.append("'"+enapply.getBustype()+"',");
             sql.append("'"+enapply.getResp()+"',");
             sql.append("'"+enapply.getRespDateReview()+"',");
             sql.append("'"+enapply.getType2()+"',");
             sql.append("'"+enapply.getContact()+"',");
             sql.append("'"+enapply.getAdviceReview()+"',");
             sql.append("'"+enapply.getAddress()+"',");
             sql.append("'"+enapply.getMobile()+"',");
             sql.append("'"+enapply.getQual()+"',");
             sql.append("'"+enapply.getAdminmot()+"',");
             sql.append("'"+enapply.getRespReview()+"',");
             sql.append("'"+enapply.getTel()+"',");
             sql.append("'"+enapply.getRespdate()+"',");
             sql.append("'"+enapply.getResp_reg()+"',");
             sql.append("'"+enapply.getAdvice_reg()+"',");
             sql.append("'"+enapply.getUserId()+"',");
             sql.append("'"+enapply.getForgid()+"',");
             sql.append("'"+enapply.getCity()+"',");
             sql.append("'"+enapply.getFother()+"',");
             sql.append("'"+enapply.getCpid()+"',");
             sql.append("'"+enapply.getBusiness()+"',");
             sql.append("'"+enapply.getOrgId()+"',");
             sql.append("'"+enapply.getZpscore()+"',");
             sql.append("'"+enapply.getResp_eval()+"',");
             sql.append("'"+enapply.getRespdate_eval()+"',");
             sql.append("'"+enapply.getAdvice_eval()+"',");
             sql.append("'"+enapply.getOrgid_comment()+"',");
             sql.append("'"+enapply.getStand0()+"',");
             sql.append("'"+enapply.getPnids()+"',");
             sql.append("'"+enapply.getPnids1()+"',");
             sql.append("'"+enapply.getStand1()+"',");
             sql.append("'"+enapply.getResp0()+"',");
             sql.append("'"+enapply.getUno()+"',");
             sql.append("'"+enapply.getType()+"',");
             sql.append("'"+enapply.getResp_review0()+"'");
             sql.append(");");
             bufferedWriter.write(sql.toString()+"\n");
             
//            boolean bol=submitData(sql.toString());
            list.add(sql.toString());
        }
        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }finally{
	    	fs=null;
	    	wb=null;
	    	try
	    	   {
	    		bufferedWriter.flush();
	    	    fileWriter.close();
	    	    bufferedWriter.close();
	    	   } catch (IOException e)
	    	   {
	    	    e.printStackTrace();
	    	   }
	    }
	    return list;
    }
	/**
     * 读取Excel数据内容
     * @param InputStream
     * @return Map 包含单元格数据内容的Map对象
     */
	public List readExcelEn_backup(InputStream is,String filePath) {
        Map<Integer, String> content = new HashMap<Integer, String>();
        List list=new ArrayList();
        BufferedWriter bufferedWriter = null;
        FileWriter fileWriter = null;
        try {
            fs = new POIFSFileSystem(is);
            wb = new HSSFWorkbook(fs);
       
        sheet = wb.getSheetAt(0);
        // 得到总行数
        int rowNum = sheet.getLastRowNum();
         fileWriter = new FileWriter(filePath);
         bufferedWriter = new BufferedWriter(fileWriter);
        // 正文内容应该从第二行开始,第一行为表头的标题
        for (int i = 1; i <= rowNum; i++) {
            String str="";
            row = sheet.getRow(i);
            int colNum = row.getLastCellNum();
            ExchangeInfo enback=new ExchangeInfo();
            for (int j = 0; j <= row.getLastCellNum(); j++) {
            	if(j==0){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enback.setAdminmot(value);
            	}else if(j==1){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enback.setAdvice(value);
            		
            	}else if(j==2){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enback.setContent(value);
            		
            	}else if(j==3){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enback.setCdate(value);
            		
            	}else if(j==4){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enback.setReason(value);
            		
            	}else if(j==5){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enback.setUpdateDate(value);
            		
            	}else if(j==6){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		enback.setUserid(value);
            		
            	}
            }
//            list.add(orgapply);
             StringBuffer sql=new StringBuffer();
             sql.append("insert into exchange (REASON, CONTENT, USERID, ADMINMOT, CDATE,ADVICE,UPDATEDATE" + ")values (");
             sql.append("'"+enback.getReason()+"',");
             sql.append("'"+enback.getContent()+"',");
             sql.append("'"+enback.getUserid()+"',");
             sql.append("'"+enback.getAdminmot()+"',");
             sql.append("'"+enback.getCdate()+"',");
             sql.append("'"+enback.getAdvice()+"',");
             sql.append("'"+enback.getUpdateDate()+"'");
             sql.append(");");
             bufferedWriter.write(sql.toString()+"\n");
             
//            boolean bol=submitData(sql.toString());
            list.add(sql.toString());
        }
        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }finally{
	    	fs=null;
	    	wb=null;
	    	try
	    	   {
	    		bufferedWriter.flush();
	    	    fileWriter.close();
	    	    bufferedWriter.close();
	    	   } catch (IOException e)
	    	   {
	    	    e.printStackTrace();
	    	   }
	    }
	    return list;
    }
	
	/**
     * 读取Excel数据内容
     * @param InputStream
     * @return Map 包含单元格数据内容的Map对象
     */
	public List readExcelEn_Report(InputStream is,String filePath) {
        Map<Integer, String> content = new HashMap<Integer, String>();
        List list=new ArrayList();
        BufferedWriter bufferedWriter = null;
        FileWriter fileWriter = null;
        try {
            fs = new POIFSFileSystem(is);
            wb = new HSSFWorkbook(fs);
       
        sheet = wb.getSheetAt(0);
        // 得到总行数
        int rowNum = sheet.getLastRowNum();
         fileWriter = new FileWriter(filePath);
         bufferedWriter = new BufferedWriter(fileWriter);
        // 正文内容应该从第二行开始,第一行为表头的标题
        for (int i = 1; i <= rowNum; i++) {
            String str="";
            row = sheet.getRow(i);
            int colNum = row.getLastCellNum();
            YearReport report=new YearReport();
            for (int j = 0; j <= row.getLastCellNum(); j++) {
            	if(j==0){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		report.setfReport(value);
            	}else if(j==1){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		report.setUserId(value);
            		
            	}else if(j==2){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		report.setYear(value);
            		
            	}else if(j==3){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		report.setCreateDate(value);
            		
            	}
            }
//            list.add(orgapply);
             StringBuffer sql=new StringBuffer();
             sql.append("insert into EN_REPORT (FREPORT, USERID, YEAR, CREATEDATE" + ")values (");
             sql.append("'"+report.getfReport()+"',");
             sql.append("'"+report.getUserId()+"',");
             sql.append("'"+report.getYear()+"',");
             sql.append("'"+report.getCreateDate()+"'");
             sql.append(");");
             bufferedWriter.write(sql.toString()+"\n");
             
//            boolean bol=submitData(sql.toString());
            list.add(sql.toString());
        }
        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }finally{
	    	fs=null;
	    	wb=null;
	    	try
	    	   {
	    		bufferedWriter.flush();
	    	    fileWriter.close();
	    	    bufferedWriter.close();
	    	   } catch (IOException e)
	    	   {
	    	    e.printStackTrace();
	    	   }
	    }
	    return list;
    }
	/**
     * 读取Excel数据内容
     * @param InputStream
     * @return Map 包含单元格数据内容的Map对象
     */
	public List readQYPFExcelContents(InputStream is,String filePath) {
        Map<Integer, String> content = new HashMap<Integer, String>();
        List list=new ArrayList();
        BufferedWriter bufferedWriter = null;
        FileWriter fileWriter = null;
        try {
            fs = new POIFSFileSystem(is);
            wb = new HSSFWorkbook(fs);
       
        sheet = wb.getSheetAt(0);
        // 得到总行数
        int rowNum = sheet.getLastRowNum();
         fileWriter = new FileWriter(filePath);
         bufferedWriter = new BufferedWriter(fileWriter);
        // 正文内容应该从第二行开始,第一行为表头的标题
        for (int i = 1; i <= rowNum; i++) {
            String str="";
            row = sheet.getRow(i);
            int colNum = row.getLastCellNum();
            EnPFInfo qypf=new EnPFInfo();
            for (int j = 0; j <= row.getLastCellNum(); j++) {
            	if(j==0){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		qypf.setCreateuser(value);
            	}else if(j==1){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		qypf.setCreatedate(value);
            		
            	}else if(j==2){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		qypf.setBusclass(value);
            		
            	}else if(j==3){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		JSONObject jsonObject = JSONObject.fromObject(value);
            		String sum =  jsonObject.get("sum")==null?"":jsonObject.get("sum").toString();
            		String report = jsonObject.get("report")==null?"":jsonObject.get("report").toString();
            		String grade = jsonObject.get("grade")==null?"":jsonObject.get("grade").toString();
            		String stand_comment = jsonObject.get("stand-comment")==null?"":jsonObject.get("stand-comment").toString();
            		jsonObject.remove("sum");
            		jsonObject.remove("report");
            		jsonObject.remove("grade");
            		jsonObject.remove("stand-comment");
            		value=jsonObject.toString();
            		value=value.substring(1,value.length()-1);
            		String arrays[]=value.split(",");
            		String newValue="";
            		//记录的分数 
            		for(int y=0;y<arrays.length;y++){
//            			System.out.println("================:"+arrays[y].toString());
            		
            			String keyValues[]=arrays[y].toString().split(":");
            			if(keyValues.length==2){
            				newValue+="{"+y+":"+keyValues[1].replaceAll("\"", "")+"},";
            			}
            			
            		}
            		
            		qypf.setReportname(report);
            		qypf.setScoresum(sum);
            		qypf.setLeval(grade);
            		qypf.setStand_comment(stand_comment);
            		
            		qypf.setScore(newValue);
            		
            	}else if(j==4){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		qypf.setDel(value);
            		
            	}else if(j==5){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		qypf.setEnid(value);
            		
            	}else if(j==6){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		qypf.setUno(value);
            		
            	}
            	
            }
//            list.add(enreg);
             StringBuffer sql=new StringBuffer();
             sql.append("insert into qypf_table (CREATEDATE, CREATEUSER, CREATEPID, BUSCLASS, SCORESUM, LEVAL," +
             		" REPORTNAME, SCORE, APPLYID, KPRESULT, KPADVICE, DEL, ENID ," +
             		" UNO,STAND_COMMENT)values (");
             sql.append("'"+qypf.getCreatedate()+"',");
             sql.append("'"+qypf.getCreateuser()+"',");
             sql.append("'"+qypf.getCreatepid()+"',");
             sql.append("'"+qypf.getBusclass()+"',");
             sql.append("'"+qypf.getScoresum()+"',");
             sql.append("'"+qypf.getLeval()+"',");
             sql.append("'"+qypf.getReportname()+"',");
             sql.append("'"+qypf.getScore()+"',");
             sql.append("'"+qypf.getApplyId()+"',");
             sql.append("'"+qypf.getKpresult()+"',");
             sql.append("'"+qypf.getKpadvice()+"',");
             sql.append("'"+qypf.getDel()+"',");
             sql.append("'"+qypf.getEnid()+"',");
             sql.append("'"+qypf.getUno()+"',");
             sql.append("'"+qypf.getStand_comment()+"'");
             sql.append(");");
             bufferedWriter.write(sql.toString()+"\n");
             
//            boolean bol=submitData(sql.toString());
            list.add(sql.toString());
        }
        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }finally{
	    	fs=null;
	    	wb=null;
	    	try
	    	   {
	    		bufferedWriter.flush();
	    	    fileWriter.close();
	    	    bufferedWriter.close();
	    	   } catch (IOException e)
	    	   {
	    	    e.printStackTrace();
	    	   }
	    }
	    return list;
    }
	/**
     * 读取Excel数据内容
     * @param InputStream
     * @return Map 包含单元格数据内容的Map对象
     */
	public List readOrgApplyExcelContents(InputStream is,String filePath) {
        Map<Integer, String> content = new HashMap<Integer, String>();
        List list=new ArrayList();
        BufferedWriter bufferedWriter = null;
        FileWriter fileWriter = null;
        try {
            fs = new POIFSFileSystem(is);
            wb = new HSSFWorkbook(fs);
       
        sheet = wb.getSheetAt(0);
        // 得到总行数
        int rowNum = sheet.getLastRowNum();
         fileWriter = new FileWriter(filePath);
         bufferedWriter = new BufferedWriter(fileWriter);
        // 正文内容应该从第二行开始,第一行为表头的标题
        for (int i = 1; i <= rowNum; i++) {
            String str="";
            row = sheet.getRow(i);
            int colNum = row.getLastCellNum();
            OrgApply orgapply=new OrgApply();
            for (int j = 0; j <= row.getLastCellNum(); j++) {
            	if(j==0){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		orgapply.setResp_reg(value);
            	}else if(j==1){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		orgapply.setCreatedate(value);
            		
            	}else if(j==2){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		orgapply.setMet(value);
            		
            	}else if(j==3){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		orgapply.setPcode(value);
            		
            	}else if(j==4){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		orgapply.setPid(value);
            		
            	}else if(j==5){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		orgapply.setOrgname(value);
            		
            	}else if(j==6){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		orgapply.setRenew(value);
            		
            	}else if(j==7){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		orgapply.setStartdate(value);
            		
            	}else if(j==8){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		orgapply.setPns(value);
            		
            	}else if(j==9){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		orgapply.setProvince(value);
            		
            	}else if(j==10){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		orgapply.setAdvice_reg(value);
            		
            	}else if(j==11){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		orgapply.setLegalp(value);
            		
            	}else if(j==12){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		orgapply.setGrade(value);
            		
            	}else if(j==13){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		orgapply.setEmail(value);
            		
            	}else if(j==14){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		orgapply.setBustype(value);
            	}else if(j==15){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		orgapply.setFax(value);
            	}else if(j==16){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		orgapply.setPunm(value);
            	}else if(j==17){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		orgapply.setContact(value);
            	}else if(j==18){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		orgapply.setAddress(value);
            	}else if(j==19){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		orgapply.setMobile(value);
            	}else if(j==20){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		orgapply.setAdminmot(value);
            	}else if(j==21){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		orgapply.setTel(value);
            	}else if(j==22){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		orgapply.setPunm2(value);
            	}else if(j==23){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		orgapply.setCpid(value);
            	}else if(j==24){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		orgapply.setDel(value);
            	}else if(j==25){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		orgapply.setUserid(value);
            	}else if(j==26){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		orgapply.setCdate(value);
            	}else if(j==27){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		orgapply.setRemark(value);
            	}else if(j==28){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		orgapply.setAdvice(value);
            	}else if(j==29){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		orgapply.setCid(value);
            	}else if(j==30){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		orgapply.setResp(value);
            	}else if(j==31){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		orgapply.setRespdate(value);
            	}else if(j==32){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		orgapply.setRule(value);
            	}else if(j==33){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		orgapply.setOrher(value);
            	}else if(j==34){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		orgapply.setUno(value);
            	}
            }
//            list.add(orgapply);
             StringBuffer sql=new StringBuffer();
             sql.append("insert into ORG_APPLY (RESP_REG, CREATEDATE, MET, PCODE, PID, ORGNAME," +
             		" RENEW, STARTDATE, PNS, PROVINCE, ADVICE_REG, LEGALP,GRADE, EMAIL, BUSTYPE, " +
             		"FAX, PNUMBER, CONTACT, ADDRESS, MOBILE, ADMINMOT, TEL, PNUMBER2,CPID, " +
             		"DEL, USERID, CDATE, REMARK, " +
             		"ADVICE, CID,RESP,RESPDATE,RULE,ORHER," +
             		" UNO)values (");
             sql.append("'"+orgapply.getResp_reg()+"',");
             sql.append("'"+orgapply.getCreatedate()+"',");
             sql.append("'"+orgapply.getMet()+"',");
             sql.append("'"+orgapply.getPcode()+"',");
             sql.append("'"+orgapply.getPid()+"',");
             sql.append("'"+orgapply.getOrgname()+"',");
             sql.append("'"+orgapply.getRenew()+"',");
             sql.append("'"+orgapply.getStartdate()+"',");
             sql.append("'"+orgapply.getPns()+"',");
             sql.append("'"+orgapply.getProvince()+"',");
             sql.append("'"+orgapply.getAdvice_reg()+"',");
             sql.append("'"+orgapply.getLegalp()+"',");
             sql.append("'"+orgapply.getGrade()+"',");
             sql.append("'"+orgapply.getEmail()+"',");
             sql.append("'"+orgapply.getBustype()+"',");
             sql.append("'"+orgapply.getFax()+"',");
             sql.append("'"+orgapply.getPunm()+"',");
             sql.append("'"+orgapply.getContact()+"',");
             sql.append("'"+orgapply.getAddress()+"',");
             sql.append("'"+orgapply.getMobile()+"',");
             sql.append("'"+orgapply.getAdminmot()+"',");
             sql.append("'"+orgapply.getTel()+"',");
             sql.append("'"+orgapply.getPunm2()+"',");
             sql.append("'"+orgapply.getCpid()+"',");
             sql.append("'"+orgapply.getDel()+"',");
             sql.append("'"+orgapply.getUserid()+"',");
             sql.append("'"+orgapply.getCdate()+"',");
             sql.append("'"+orgapply.getRemark()+"',");
             sql.append("'"+orgapply.getAdvice()+"',");
             sql.append("'"+orgapply.getCid()+"',");
             sql.append("'"+orgapply.getResp()+"',");
             sql.append("'"+orgapply.getRespdate()+"',");
             sql.append("'"+orgapply.getRule()+"',");
             sql.append("'"+orgapply.getOrher()+"',");
             sql.append("'"+orgapply.getUno()+"'");
             sql.append(");");
             bufferedWriter.write(sql.toString()+"\n");
             
//            boolean bol=submitData(sql.toString());
            list.add(sql.toString());
        }
        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }finally{
	    	fs=null;
	    	wb=null;
	    	try
	    	   {
	    		bufferedWriter.flush();
	    	    fileWriter.close();
	    	    bufferedWriter.close();
	    	   } catch (IOException e)
	    	   {
	    	    e.printStackTrace();
	    	   }
	    }
	    return list;
    }
	 /**
     * 读取Excel数据内容
     * @param InputStream
     * @return Map 包含单元格数据内容的Map对象
     */
	public List readExcelUsers(InputStream is,String filePath) {
        Map<Integer, String> content = new HashMap<Integer, String>();
        List list=new ArrayList();
        BufferedWriter bufferedWriter = null;
        FileWriter fileWriter = null;
        try {
            fs = new POIFSFileSystem(is);
            wb = new HSSFWorkbook(fs);
       
        sheet = wb.getSheetAt(0);
        // 得到总行数
        int rowNum = sheet.getLastRowNum();
         fileWriter = new FileWriter(filePath);
         bufferedWriter = new BufferedWriter(fileWriter);
        // 正文内容应该从第二行开始,第一行为表头的标题
        for (int i = 1; i <= rowNum; i++) {
            String str="";
            row = sheet.getRow(i);
            int colNum = row.getLastCellNum();
            EnRegInfo enreg=new EnRegInfo();
            StringBuffer sql=new StringBuffer();
            sql.append("insert into userregister (ISREAD,usable,PAPERID,COMMONNAME,fngrade,fntype,USER_ID," +
            		"USERTYPE,CONTACT,MOBILETELEPHONE,MOT,fnmenu,del,USER_PASS," +
            		"REGISTERDATE,sms,agent,LEGALP,menu3,PROVINCE," +
            		"ADDRESS,TEL,GRADE,sex,org,import_date)values (");
            for (int j = 0; j <= row.getLastCellNum(); j++) {
            	if(j==0){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		  sql.append("'"+value+"',");
            	}else if(j==1){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		sql.append("'"+value+"',");
            	}else if(j==2){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		sql.append("'"+value+"',");            		
            	}else if(j==3){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		sql.append("'"+value+"',");
            	}else if(j==4){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		sql.append("'"+value+"',");            		
            	}else if(j==5){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		sql.append("'"+value+"',");
            	}else if(j==6){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		sql.append("'"+value+"',");            		
            	}else if(j==7){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		sql.append("'"+value+"',");            		
            	}else if(j==8){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		sql.append("'"+value+"',");            		
            	}else if(j==9){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		sql.append("'"+value+"',");            		
            	}else if(j==10){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		sql.append("'"+value+"',");            		
            	}else if(j==11){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		sql.append("'"+value+"',");            		
            	}else if(j==12){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		sql.append("'"+value+"',");            		
            	}else if(j==13){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		sql.append("'"+value+"',");            		
            	}else if(j==14){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		sql.append("'"+value+"',");
            	}else if(j==15){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		sql.append("'"+value+"',");
            	}else if(j==16){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		sql.append("'"+value+"',");
            	}else if(j==17){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		sql.append("'"+value+"',");
            	}else if(j==18){//省
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		sql.append("'"+value+"',");
            	}else if(j==19){//自评报告
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		sql.append("'"+value+"',");
            	}else if(j==20){//市
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		sql.append("'"+value+"',");
            	}else if(j==21){//不清楚什么字段
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		sql.append("'"+value+"',");
            	}else if(j==22){//联系人身份证号
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		sql.append("'"+value+"',");            		
            	}else if(j==23){//不清楚什么字段
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
//            		enreg.set(value);
            		sql.append("'"+value+"',");
            	}else if(j==24){//不清楚什么字段
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
//            		enreg.set(value);
            		sql.append("'"+value+"',");
            	}else if(j==25){//不清楚什么字段
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
//            		enreg.set(value);
            		sql.append("'"+value+"',");
            	}
            }
            sql.append(");");
      	  bufferedWriter.write(sql.toString()+"\n");
//            list.add(enreg);
             
//          boolean bol=submitData(sql.toString());
        }
        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }finally{
	    	fs=null;
	    	wb=null;
	    	try
	    	   {
	    		bufferedWriter.flush();
	    	    fileWriter.close();
	    	    bufferedWriter.close();
	    	   } catch (IOException e)
	    	   {
	    	    e.printStackTrace();
	    	   }
	    }
	    return list;
    }
	/**
     * 读取Excel数据内容
     * @param InputStream
     * @return Map 包含单元格数据内容的Map对象
     */
	public List readOrgbackupExcelContents(InputStream is,String filePath) {
        Map<Integer, String> content = new HashMap<Integer, String>();
        List list=new ArrayList();
        BufferedWriter bufferedWriter = null;
        FileWriter fileWriter = null;
        try {
            fs = new POIFSFileSystem(is);
            wb = new HSSFWorkbook(fs);
       
        sheet = wb.getSheetAt(0);
        // 得到总行数
        int rowNum = sheet.getLastRowNum();
         fileWriter = new FileWriter(filePath);
         bufferedWriter = new BufferedWriter(fileWriter);
        // 正文内容应该从第二行开始,第一行为表头的标题
        for (int i = 1; i <= rowNum; i++) {
            String str="";
            row = sheet.getRow(i);
            int colNum = row.getLastCellNum();
            ExchangeInfo orgback=new ExchangeInfo();
            for (int j = 0; j <= row.getLastCellNum(); j++) {
            	if(j==0){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		orgback.setReason(value);
            	}else if(j==1){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		orgback.setContent(value);
            		
            	}else if(j==2){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		orgback.setUserid(value);
            		
            	}else if(j==3){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		orgback.setAdminmot(value);
            		
            	}else if(j==4){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		orgback.setCdate(value);
            		
            	}
            }
//            list.add(orgapply);
             StringBuffer sql=new StringBuffer();
             sql.append("insert into exchange (REASON, CONTENT, USERID, ADMINMOT, CDATE" + ")values (");
             sql.append("'"+orgback.getReason()+"',");
             sql.append("'"+orgback.getContent()+"',");
             sql.append("'"+orgback.getUserid()+"',");
             sql.append("'"+orgback.getAdminmot()+"',");
             sql.append("'"+orgback.getCdate()+"'");
             sql.append(");");
             bufferedWriter.write(sql.toString()+"\n");
             
//            boolean bol=submitData(sql.toString());
            list.add(sql.toString());
        }
        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }finally{
	    	fs=null;
	    	wb=null;
	    	try
	    	   {
	    		bufferedWriter.flush();
	    	    fileWriter.close();
	    	    bufferedWriter.close();
	    	   } catch (IOException e)
	    	   {
	    	    e.printStackTrace();
	    	   }
	    }
	    return list;
    }
	/**
     * 读取Excel数据内容
     * @param InputStream
     * @return Map 包含单元格数据内容的Map对象
     */
	public List readOrgReportExcelContents(InputStream is,String filePath) {
        Map<Integer, String> content = new HashMap<Integer, String>();
        List list=new ArrayList();
        BufferedWriter bufferedWriter = null;
        FileWriter fileWriter = null;
        try {
            fs = new POIFSFileSystem(is);
            wb = new HSSFWorkbook(fs);
       
        sheet = wb.getSheetAt(0);
        // 得到总行数
        int rowNum = sheet.getLastRowNum();
         fileWriter = new FileWriter(filePath);
         bufferedWriter = new BufferedWriter(fileWriter);
        // 正文内容应该从第二行开始,第一行为表头的标题
        for (int i = 1; i <= rowNum; i++) {
            String str="";
            row = sheet.getRow(i);
            int colNum = row.getLastCellNum();
            OrgYearReport orgreport=new OrgYearReport();
            for (int j = 0; j <= row.getLastCellNum(); j++) {
            	if(j==0){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		orgreport.setFreport(value);
            	}else if(j==1){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		orgreport.setUserid(value);
            		
            	}else if(j==2){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		orgreport.setYear(value);
            		
            	}else if(j==3){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		orgreport.setCreatedate(value);
            		
            	}
            }
//            list.add(orgapply);
             StringBuffer sql=new StringBuffer();
             sql.append("insert into org_report (FREPORT, USERID, YEAR, CREATEDATE" + ")values (");
             sql.append("'"+orgreport.getFreport()+"',");
             sql.append("'"+orgreport.getUserid()+"',");
             sql.append("'"+orgreport.getYear()+"',");
             sql.append("'"+orgreport.getCreatedate()+"'");
             sql.append(");");
             bufferedWriter.write(sql.toString()+"\n");
             
//            boolean bol=submitData(sql.toString());
            list.add(sql.toString());
        }
        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }finally{
	    	fs=null;
	    	wb=null;
	    	try
	    	   {
	    		bufferedWriter.flush();
	    	    fileWriter.close();
	    	    bufferedWriter.close();
	    	   } catch (IOException e)
	    	   {
	    	    e.printStackTrace();
	    	   }
	    }
	    return list;
    }
	/**
     * 读取Excel数据内容
     * @param InputStream
     * @return Map 包含单元格数据内容的Map对象
     */
	public List readPnregExcelContents(InputStream is,String filePath) {
        Map<Integer, String> content = new HashMap<Integer, String>();
        List list=new ArrayList();
        BufferedWriter bufferedWriter = null;
        FileWriter fileWriter = null;
        try {
            fs = new POIFSFileSystem(is);
            wb = new HSSFWorkbook(fs);
       
        sheet = wb.getSheetAt(0);
        // 得到总行数
        int rowNum = sheet.getLastRowNum();
         fileWriter = new FileWriter(filePath);
         bufferedWriter = new BufferedWriter(fileWriter);
        // 正文内容应该从第二行开始,第一行为表头的标题
        for (int i = 1; i <= rowNum; i++) {
            String str="";
            row = sheet.getRow(i);
            int colNum = row.getLastCellNum();
            PnInfo pnreg=new PnInfo();
            for (int j = 0; j <= row.getLastCellNum(); j++) {
            	if(j==0){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnreg.setCity(value);
            	}else if(j==1){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnreg.setOrg(value);
            		
            	}else if(j==2){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnreg.setTrain(value);
            		
            	}else if(j==3){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnreg.setPerf(value);
            		
            	}else if(j==4){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnreg.setComefrom(value);
            		
            	}else if(j==5){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnreg.setPid(value);
            		
            	}else if(j==6){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnreg.setUsername(value);
            		
            	}else if(j==7){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnreg.setResume(value);
            		
            	}else if(j==8){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnreg.setRenew(value);
            		
            	}else if(j==9){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnreg.setAdmin(value);
            		
            	}else if(j==10){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnreg.setPhoto(value);
            		
            	}else if(j==11){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnreg.setAddress(value);
            		
            	}else if(j==12){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnreg.setUserid(value);
            		
            	}else if(j==13){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnreg.setEdu(value);
            		
            	}else if(j==14){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnreg.setBegindate(value);
            		
            	}else if(j==15){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnreg.setMajor(value);
            		
            	}else if(j==16){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnreg.setProf(value);
            		
            	}else if(j==17){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnreg.setType(value);
            		
            	}else if(j==18){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnreg.setEmail(value);
            		
            	}else if(j==19){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnreg.setPcode(value);
            		
            	}else if(j==20){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnreg.setProof(value);
            		
            	}else if(j==21){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnreg.setProof2(value);
            		
            	}else if(j==22){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnreg.setTitle(value);
            		
            	}else if(j==23){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnreg.setTel(value);
            		
            	}else if(j==24){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnreg.setFax(value);
            		
            	}else if(j==25){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnreg.setPerf2(value);
            		
            	}else if(j==26){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnreg.setProof3(value);
            		
            	}else if(j==27){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnreg.setProofback(value);
            		
            	}else if(j==28){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnreg.setUno(value);
            		
            	}else if(j==29){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnreg.setEdu2(value);
            		
            	}else if(j==30){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnreg.setPerf1(value);
            		
            	}else if(j==31){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnreg.setOrgproof(value);
            		
            	}
            }
//            list.add(orgapply);
             StringBuffer sql=new StringBuffer();
             sql.append("insert into pn_reg (MOBILE, ORG, TRAIN, PERF,COMEFROM,PID,USERNAME,RESUME," +
            		 "CHANGEREASON,ADMIN,PHOTO,ADDRESS,USERID,EDU,BEGINDATE,MAJOR,PROF,TYPE,EMAIL,PCODE,"+
            		 "PROOF,PROOF2,TITLE,TEL,FAX,PERF2,PROOF3,PROOFB,UNO,EDU2,PERF1,ORGPROOF"
            		 + ")values (");
             sql.append("'"+pnreg.getMobile()+"',");
             sql.append("'"+pnreg.getOrg()+"',");
             sql.append("'"+pnreg.getTrain()+"',");
             sql.append("'"+pnreg.getPerf()+"',");
             sql.append("'"+pnreg.getComefrom()+"',");
             sql.append("'"+pnreg.getPid()+"',");
             sql.append("'"+pnreg.getUsername()+"',");
             sql.append("'"+pnreg.getResume()+"',");
             sql.append("'"+pnreg.getChangereason()+"',");
             sql.append("'"+pnreg.getAdmin()+"',");
             sql.append("'"+pnreg.getPhoto()+"',");
             sql.append("'"+pnreg.getAddress()+"',");
             sql.append("'"+pnreg.getUserid()+"',");
             sql.append("'"+pnreg.getEdu()+"',");
             sql.append("'"+pnreg.getBegindate()+"',");
             sql.append("'"+pnreg.getMajor()+"',");
             sql.append("'"+pnreg.getProf()+"',");
             sql.append("'"+pnreg.getType()+"',");
             sql.append("'"+pnreg.getEmail()+"',");
             sql.append("'"+pnreg.getPcode()+"',");
             sql.append("'"+pnreg.getProof()+"',");
             sql.append("'"+pnreg.getProof2()+"',");
             sql.append("'"+pnreg.getTitle()+"',");
             sql.append("'"+pnreg.getTel()+"',");
             sql.append("'"+pnreg.getFax()+"',");
             sql.append("'"+pnreg.getPerf2()+"',");
             sql.append("'"+pnreg.getProof3()+"',");
             sql.append("'"+pnreg.getProofback()+"',");
             sql.append("'"+pnreg.getUno()+"',");
             sql.append("'"+pnreg.getEdu2()+"',");
             sql.append("'"+pnreg.getPerf1()+"',");
             sql.append("'"+pnreg.getOrgproof()+"'");
             sql.append(");");
             bufferedWriter.write(sql.toString()+"\n");
             
//            boolean bol=submitData(sql.toString());
            list.add(sql.toString());
        }
        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }finally{
	    	fs=null;
	    	wb=null;
	    	try
	    	   {
	    		bufferedWriter.flush();
	    	    fileWriter.close();
	    	    bufferedWriter.close();
	    	   } catch (IOException e)
	    	   {
	    	    e.printStackTrace();
	    	   }
	    }
	    return list;
    }
	/**
     * 读取Excel数据内容
     * @param InputStream
     * @return Map 包含单元格数据内容的Map对象
     */
	public List readPnApplyExcelContents(InputStream is,String filePath) {
        Map<Integer, String> content = new HashMap<Integer, String>();
        List list=new ArrayList();
        BufferedWriter bufferedWriter = null;
        FileWriter fileWriter = null;
        try {
            fs = new POIFSFileSystem(is);
            wb = new HSSFWorkbook(fs);
       
        sheet = wb.getSheetAt(0);
        // 得到总行数
        int rowNum = sheet.getLastRowNum();
         fileWriter = new FileWriter(filePath);
         bufferedWriter = new BufferedWriter(fileWriter);
        // 正文内容应该从第二行开始,第一行为表头的标题
        for (int i = 1; i <= rowNum; i++) {
            String str="";
            row = sheet.getRow(i);
            int colNum = row.getLastCellNum();
            PnApply pnapply=new PnApply();
            for (int j = 0; j <= row.getLastCellNum(); j++) {
            	if(j==0){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		if("沈阳".equals(value)){
            			pnapply.setCity("0700002");
            		}else if("鞍山".equals(value)){
            			pnapply.setCity("0700003");
            		}else if("本溪".equals(value)){
            			pnapply.setCity("0700004");
            		}else if("朝阳".equals(value)){
            			pnapply.setCity("0700005");
            		}else if("大连".equals(value)){
            			pnapply.setCity("0700006");
            		}else if("丹东".equals(value)){
            			pnapply.setCity("0700007");
            		}else if("抚顺".equals(value)){
            			pnapply.setCity("0700008");
            		}else if("阜新".equals(value)){
            			pnapply.setCity("0700009");
            		}else if("葫芦岛".equals(value)){
            			pnapply.setCity("0700010");
            		}else if("锦州".equals(value)){
            			pnapply.setCity("0700011");
            		}else if("辽阳".equals(value)){
            			pnapply.setCity("0700012");
            		}else if("盘锦".equals(value)){
            			pnapply.setCity("0700013");
            		}else if("铁岭".equals(value)){
            			pnapply.setCity("0700014");
            		}else if("营口".equals(value)){
            			pnapply.setCity("0700015");
            		}
            		
            	}else if(j==1){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setCreatedate(value);
            		
            	}else if(j==2){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setCdate(value);
            		
            	}else if(j==3){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setPid(value);
            		
            	}else if(j==4){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setPnname(value);
            		
            	}else if(j==5){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setSex(value);
            		
            	}else if(j==6){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setOrg(value);
            		
            	}else if(j==7){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setCid(value);
            		
            	}else if(j==8){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setImport_date(value);
            		
            	}else if(j==9){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setUserid(value);
            		
            	}else if(j==10){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setBussinestype(value);
            		
            	}else if(j==11){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setAuditresp("1");
            		
            	}else if(j==12){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setAddress(value);
            		
            	}else if(j==13){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setMobile(value);
            		
            	}else if(j==14){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setAdminmot(value);
            		
            	}else if(j==15){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setAuditdate(value);
            		
            	}else if(j==16){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setBegindate(value);
            		
            	}/*else if(j==17){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setBussinestype(value);
            		
            	}else if(j==18){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setMajor(value);
            		
            	}else if(j==19){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setAddress(value);
            		
            	}else if(j==20){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setMobile(value);
            		
            	}else if(j==21){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setFrom2(value);
            		
            	}else if(j==22){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setAdminmot(value);
            		
            	}else if(j==23){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setTel(value);
            		
            	}else if(j==24){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setProof(value);
            		
            	}else if(j==25){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setProof2(value);
            		
            	}else if(j==26){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setProofmobile(value);
            		
            	}else if(j==27){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setTitle(value);
            		
            	}else if(j==28){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setEmail(value);
            		
            	}else if(j==29){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setFax(value);
            		
            	}else if(j==30){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setProoforg(value);
            		
            	}else if(j==31){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setProofname(value);
            		
            	}else if(j==32){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setPerf(value);
            		
            	}else if(j==33){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setBeginfile(value);
            		
            	}else if(j==34){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setTitlefile(value);
            		
            	}else if(j==35){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setProof3(value);
            		
            	}else if(j==36){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setPerf2(value);
            		
            	}else if(j==37){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setDel(value);
            		
            	}else if(j==38){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setAdvice_reg(value);
            		
            	}else if(j==39){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setCdate(value);
            		
            	}else if(j==40){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setRemark(value);
            		
            	}else if(j==41){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setRenew(value);
            		
            	}else if(j==42){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setCid(value);
            		
            	}else if(j==43){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setDirect_name(value);
            		
            	}else if(j==44){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setUserid(value);
            		
            	}else if(j==45){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setResp(value);
            		
            	}else if(j==46){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setDirect_title(value);
            		
            	}else if(j==47){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setRespdate(value);
            		
            	}else if(j==48){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setProofb(value);
            		
            	}else if(j==49){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setPerf1(value);
            		
            	}else if(j==50){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setEdu2(value);
            		
            	}else if(j==51){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setOrgproof(value);
            		
            	}else if(j==52){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setTrain_end(value);
            		
            	}else if(j==53){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setParttime(value);
            		
            	}else if(j==54){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setTrain_start(value);
            		
            	}else if(j==55){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setEmploydate(value);
            		
            	}else if(j==56){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setUnemploydate(value);
            		
            	}else if(j==57){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setTrain_hour(value);
            		
            	}else if(j==58){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setExam_score(value);
            		
            	}else if(j==59){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setAttrorg(value);
            		
            	}else if(j==60){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setTrain_id(value);
            		
            	}else if(j==61){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setExam_date(value);
            		
            	}else if(j==62){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setUno(value);
            		
            	}else if(j==63){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setSex(value);
            		
            	}else if(j==64){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pnapply.setCity(value);
            		
            	}*/
            }
//            list.add(orgapply);
             StringBuffer sql=new StringBuffer();
             sql.append("insert into pn_apply (PASS_DIRECT, RESP_REG, WORKDOC, FROMADDRESS,CREATEDATE,ADMINMOT2,PCODE,ADVICE," +
            		 "EDU,PID,PNNAME,TRAIN,PROF,ORG,PHOTO,IMPORT_DATE,BEGINDATE,BUSSINESTYPE,MAJOR,ADDRESS,MOBILE,FROM2,ADMINMOT,"+
            		 "TEL,PROOF,PROOF2,PROOFMOBILE,TITLE,EMAIL,FAX,PROOFORG,PROOFNAME,PERF,BEGINFILE,TITLEFILE,PROOF3,PERF2,"+
            		 "DEL,ADVICE_REG,CDATE,REMARK,RENEW,CID,DIRECT_NAME,USERID,RESP,DIRECT_TITLE,RESPDATE,PROOFB,PERF1,EDU2,"+
            		 "ORGPROOF,TRAIN_END,PARTTIME,TRAIN_START,EMPLOYDATE,UNEMPLOYDATE,TRAIN_HOUR,EXAM_SCORE,ATTRORG,TRAIN_ID,"+
            		 "EXAM_DATE,UNO,SEX,CITY"
            		 + ")values (");
             sql.append("'"+pnapply.getPass_direct()+"',");
             sql.append("'"+pnapply.getResp_reg()+"',");
             sql.append("'"+pnapply.getWorkdoc()+"',");
             sql.append("'"+pnapply.getFromaddress()+"',");
             sql.append("'"+pnapply.getCreatedate()+"',");
             sql.append("'"+pnapply.getAdminmot2()+"',");
             sql.append("'"+pnapply.getPcode()+"',");
             sql.append("'"+pnapply.getAdvice()+"',");
             sql.append("'"+pnapply.getEdu()+"',");
             sql.append("'"+pnapply.getPid()+"',");
             sql.append("'"+pnapply.getPnname()+"',");
             sql.append("'"+pnapply.getTrain()+"',");
             sql.append("'"+pnapply.getProf()+"',");
             sql.append("'"+pnapply.getOrg()+"',");
             sql.append("'"+pnapply.getPhoto()+"',");
             sql.append("'"+pnapply.getImport_date()+"',");
             sql.append("'"+pnapply.getBegindate()+"',");
             sql.append("'"+pnapply.getBussinestype()+"',");
             sql.append("'"+pnapply.getMajor()+"',");
             sql.append("'"+pnapply.getAddress()+"',");
             sql.append("'"+pnapply.getMobile()+"',");
             sql.append("'"+pnapply.getFrom2()+"',");
             sql.append("'"+pnapply.getAdminmot()+"',");
             sql.append("'"+pnapply.getTel()+"',");
             sql.append("'"+pnapply.getProof()+"',");
             sql.append("'"+pnapply.getProof2()+"',");
             sql.append("'"+pnapply.getProofmobile()+"',");
             sql.append("'"+pnapply.getTitle()+"',");
             sql.append("'"+pnapply.getEmail()+"',");
             sql.append("'"+pnapply.getFax()+"',");
             sql.append("'"+pnapply.getProoforg()+"',");
             sql.append("'"+pnapply.getProofname()+"',");
             sql.append("'"+pnapply.getPerf()+"',");
             sql.append("'"+pnapply.getBeginfile()+"',");
             sql.append("'"+pnapply.getTitlefile()+"',");
             sql.append("'"+pnapply.getProof3()+"',");
             sql.append("'"+pnapply.getPerf2()+"',");
             sql.append("'"+pnapply.getDel()+"',");
             sql.append("'"+pnapply.getAdvice_reg()+"',");
             sql.append("'"+pnapply.getCdate()+"',");
             sql.append("'"+pnapply.getRemark()+"',");
             sql.append("'"+pnapply.getRenew()+"',");
             sql.append("'"+pnapply.getCid()+"',");
             sql.append("'"+pnapply.getDirect_name()+"',");
             sql.append("'"+pnapply.getUserid()+"',");
             sql.append("'"+pnapply.getResp()+"',");
             sql.append("'"+pnapply.getDirect_title()+"',");
             sql.append("'"+pnapply.getRespdate()+"',");
             sql.append("'"+pnapply.getProofb()+"',");
             sql.append("'"+pnapply.getPerf1()+"',");
             sql.append("'"+pnapply.getEdu2()+"',");
             sql.append("'"+pnapply.getOrgproof()+"',");
             sql.append("'"+pnapply.getTrain_end()+"',");
             sql.append("'"+pnapply.getParttime()+"',");
             sql.append("'"+pnapply.getTrain_start()+"',");
             sql.append("'"+pnapply.getEmploydate()+"',");
             sql.append("'"+pnapply.getUnemploydate()+"',");
             sql.append("'"+pnapply.getTrain_hour()+"',");
             sql.append("'"+pnapply.getExam_score()+"',");
             sql.append("'"+pnapply.getAttrorg()+"',");
             sql.append("'"+pnapply.getTrain_id()+"',");
             sql.append("'"+pnapply.getExam_date()+"',");
             sql.append("'"+pnapply.getUno()+"',");
             sql.append("'"+pnapply.getSex()+"',");
             sql.append("'"+pnapply.getCity()+"'");
             sql.append(");");
             bufferedWriter.write(sql.toString()+"\n");
             
//            boolean bol=submitData(sql.toString());
            list.add(sql.toString());
        }
        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }finally{
	    	fs=null;
	    	wb=null;
	    	try
	    	   {
	    		bufferedWriter.flush();
	    	    fileWriter.close();
	    	    bufferedWriter.close();
	    	   } catch (IOException e)
	    	   {
	    	    e.printStackTrace();
	    	   }
	    }
	    return list;
    }
	/**
     * 读取Excel数据内容
     * @param InputStream
     * @return Map 包含单元格数据内容的Map对象
     */
	public List readPnTrainExcelContents(InputStream is,String filePath) {
        Map<Integer, String> content = new HashMap<Integer, String>();
        List list=new ArrayList();
        BufferedWriter bufferedWriter = null;
        FileWriter fileWriter = null;
        try {
            fs = new POIFSFileSystem(is);
            wb = new HSSFWorkbook(fs);
       
        sheet = wb.getSheetAt(0);
        // 得到总行数
        int rowNum = sheet.getLastRowNum();
         fileWriter = new FileWriter(filePath);
         bufferedWriter = new BufferedWriter(fileWriter);
        // 正文内容应该从第二行开始,第一行为表头的标题
        for (int i = 1; i <= rowNum; i++) {
            String str="";
            row = sheet.getRow(i);
            int colNum = row.getLastCellNum();
            PnTrain pntrain=new PnTrain();
            for (int j = 0; j <= row.getLastCellNum(); j++) {
            	if(j==0){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pntrain.setTrain_end(value);
            	}else if(j==1){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pntrain.setTrain_start(value);
            		
            	}else if(j==2){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pntrain.setName(value);
            		
            	}else if(j==3){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pntrain.setTrainhour(value);
            		
            	}else if(j==4){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pntrain.setExamscore(value);
            		
            	}else if(j==5){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pntrain.setTrain_id(value);
            		
            	}else if(j==6){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pntrain.setTrain_id(value);
            		
            	}else if(j==7){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pntrain.setExam_date(value);
            		
            	}else if(j==8){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pntrain.setUserid(value);
            		
            	}else if(j==9){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pntrain.setUserid(value);
            		
            	}else if(j==10){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pntrain.setBustype(value);
            		
            	}else if(j==11){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pntrain.setAdminmot(value);
            		
            	}else if(j==12){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		pntrain.setPid(value);
            		
            	}
            }
//            list.add(orgapply);
             StringBuffer sql=new StringBuffer();
             sql.append("insert into pn_train (TRAIN_END, TRAIN_START, PNNAME, TRAIN_HOUR,EXAM_SCORE,TRAIN_ID,EXAM_DATE,USERID,BUSTYPE,ADMINMOT,pid" + ")values (");
             sql.append("'"+pntrain.getTrain_end()+"',");
             sql.append("'"+pntrain.getTrain_start()+"',");
             sql.append("'"+pntrain.getName()+"',");
             sql.append("'"+pntrain.getTrainhour()+"',");
             sql.append("'"+pntrain.getExamscore()+"',");
             sql.append("'"+pntrain.getTrain_id()+"',");
             sql.append("'"+pntrain.getExam_date()+"',");
             sql.append("'"+pntrain.getUserid()+"',");
             sql.append("'"+pntrain.getBustype()+"',");
             sql.append("'"+pntrain.getAdminmot()+"',");
             sql.append("'"+pntrain.getPid()+"'");
             sql.append(");");
             bufferedWriter.write(sql.toString()+"\n");
             
//            boolean bol=submitData(sql.toString());
            list.add(sql.toString());
        }
        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }finally{
	    	fs=null;
	    	wb=null;
	    	try
	    	   {
	    		bufferedWriter.flush();
	    	    fileWriter.close();
	    	    bufferedWriter.close();
	    	   } catch (IOException e)
	    	   {
	    	    e.printStackTrace();
	    	   }
	    }
	    return list;
    }
	/**
     * 读取Excel数据内容
     * @param InputStream
     * @return Map 包含单元格数据内容的Map对象
     */
	public List readSYNRExcelContents(InputStream is,String filePath) {
        Map<Integer, String> content = new HashMap<Integer, String>();
        List list=new ArrayList();
        BufferedWriter bufferedWriter = null;
        FileWriter fileWriter = null;
        try {
            fs = new POIFSFileSystem(is);
            wb = new HSSFWorkbook(fs);
       
        sheet = wb.getSheetAt(0);
        // 得到总行数
        int rowNum = sheet.getLastRowNum();
         fileWriter = new FileWriter(filePath);
         bufferedWriter = new BufferedWriter(fileWriter);
        // 正文内容应该从第二行开始,第一行为表头的标题
        for (int i = 1; i <= rowNum; i++) {
            String str="";   
            row = sheet.getRow(i);
            int colNum = row.getLastCellNum();
            IndexInfo synr=new IndexInfo();
            for (int j = 0; j <= row.getLastCellNum(); j++) {
            	if(j==0){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		synr.setPtype(value);
            	}else if(j==1){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		synr.setCreatedate(value);
            		
            	}else if(j==2){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		synr.setLinkhref(value);
            		
            	}else if(j==3){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		synr.setPno(value);
            		
            	}else if(j==4){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		synr.setPtitle(value);
            		
            	}else if(j==5){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		synr.setUserid(value);
            		
            	}else if(j==6){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		synr.setFilename(value);
            		
            	}else if(j==7){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		synr.setPdel(value);
            		
            	}else if(j==8){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		synr.setContenttext(value);
            		
            	}
            }
//            list.add(orgapply);
             StringBuffer sql=new StringBuffer();
             sql.append("insert into synr_tbl (PTYPE, CREATEDATE, LINKHREF, PNO,PTITLE,USERID,FILENAME,PDEL,CONTENTTEXT" + ")values (");
             sql.append("'"+synr.getPtype()+"',");
             sql.append("'"+synr.getCreatedate()+"',");
             sql.append("'"+synr.getLinkhref()+"',");
             sql.append("'"+synr.getPno()+"',");
             sql.append("'"+synr.getPtitle()+"',");
             sql.append("'"+synr.getUserid()+"',");
             sql.append("'"+synr.getFilename()+"',");
             sql.append("'"+synr.getPdel()+"',");
             sql.append("'"+synr.getContenttext()+"'");
             sql.append(");");
             bufferedWriter.write(sql.toString()+"\n");
             
//            boolean bol=submitData(sql.toString());
            list.add(sql.toString());
        }
        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }finally{
	    	fs=null;
	    	wb=null;
	    	try
	    	   {
	    		bufferedWriter.flush();
	    	    fileWriter.close();
	    	    bufferedWriter.close();
	    	   } catch (IOException e)
	    	   {
	    	    e.printStackTrace();
	    	   }
	    }
	    return list;
    }
	/**
     * 读取Excel数据内容
     * @param InputStream
     * @return Map 包含单元格数据内容的Map对象
     */
	public List readlogExcelContents(InputStream is,String filePath) {
        Map<Integer, String> content = new HashMap<Integer, String>();
        List list=new ArrayList();
        BufferedWriter bufferedWriter = null;
        FileWriter fileWriter = null;
        try {
            fs = new POIFSFileSystem(is);
            wb = new HSSFWorkbook(fs);
       
        sheet = wb.getSheetAt(0);
        // 得到总行数
        int rowNum = sheet.getLastRowNum();
         fileWriter = new FileWriter(filePath);
         bufferedWriter = new BufferedWriter(fileWriter);
        // 正文内容应该从第二行开始,第一行为表头的标题
        for (int i = 1; i <= rowNum; i++) {
            String str="";   
            row = sheet.getRow(i);
            int colNum = row.getLastCellNum();
            UserLog log=new UserLog();
            for (int j = 0; j <= row.getLastCellNum(); j++) {
            	if(j==0){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		log.setNo(value);
            	}else if(j==1){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		log.setDate1(value);
            		
            	}else if(j==2){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		log.setCreatedate(value);
            		
            	}else if(j==3){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		log.setPid(value);
            		
            	}else if(j==4){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		log.setUrl(value);
            		
            	}else if(j==5){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		log.setUserid(value);
            		
            	}else if(j==6){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		log.setType(value);
            		
            	}else if(j==7){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		log.setRole(value);
            		
            	}else if(j==8){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		log.setUno(value);
            		
            	}else if(j==9){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		log.setMsg(value);
            		
            	}else if(j==10){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		log.setOid(value);
            		
            	}
            }
//            list.add(orgapply);
             StringBuffer sql=new StringBuffer();
             sql.append("insert into syslog (DATE1, CREATEDATE, PID, URL,USERID,TYPE,ROLE,NO,UNO,MSG,OID" + ")values (");
             sql.append("'"+log.getDate1()+"',");
             sql.append("'"+log.getCreatedate()+"',");
             sql.append("'"+log.getPid()+"',");
             sql.append("'"+log.getUrl()+"',");
             sql.append("'"+log.getUserid()+"',");
             sql.append("'"+log.getType()+"',");
             sql.append("'"+log.getRole()+"',");
             sql.append("'"+log.getNo()+"',");
             sql.append("'"+log.getUno()+"',");
             sql.append("'"+log.getMsg()+"',");
             sql.append("'"+log.getOid()+"'");
             sql.append(");");
             bufferedWriter.write(sql.toString()+"\n");
             
//            boolean bol=submitData(sql.toString());
            list.add(sql.toString());
        }
        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }finally{
	    	fs=null;
	    	wb=null;
	    	try
	    	   {
	    		bufferedWriter.flush();
	    	    fileWriter.close();
	    	    bufferedWriter.close();
	    	   } catch (IOException e)
	    	   {
	    	    e.printStackTrace();
	    	   }
	    }
	    return list;
    }
	/**
     * 读取Excel数据内容
     * @param InputStream
     * @return Map 包含单元格数据内容的Map对象
     */
	public List readZGTZExcelContents(InputStream is,String filePath) {
        Map<Integer, String> content = new HashMap<Integer, String>();
        List list=new ArrayList();
        BufferedWriter bufferedWriter = null;
        FileWriter fileWriter = null;
        try {
            fs = new POIFSFileSystem(is);
            wb = new HSSFWorkbook(fs);
       
        sheet = wb.getSheetAt(0);
        // 得到总行数
        int rowNum = sheet.getLastRowNum();
         fileWriter = new FileWriter(filePath);
         bufferedWriter = new BufferedWriter(fileWriter);
        // 正文内容应该从第二行开始,第一行为表头的标题
        for (int i = 1; i <= rowNum; i++) {
            String str="";   
            row = sheet.getRow(i);
            int colNum = row.getLastCellNum();
            RecNotice zgtz=new RecNotice();
            for (int j = 0; j <= row.getLastCellNum(); j++) {
            	if(j==0){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		zgtz.setCreateDate(value);
            	}else if(j==1){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		zgtz.setAdvice_Refine(value);
            		
            	}else if(j==2){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		zgtz.setUserId(value);
            		
            	}else if(j==3){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		zgtz.setAdmin_userId(value);
            		
            	}else if(j==4){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		zgtz.setRespdate_Refine(value);
            		
            	}else if(j==5){
            		String value=getCellFormatValue(row.getCell((short) j)).trim();
            		zgtz.setRefine_doc(value);
            		
            	}
            }
             StringBuffer sql=new StringBuffer();
             sql.append("insert into zgtz_tbl (CREATEDATE, ADVICE_REFINE, USERID, ADMIN_USERID,RESPDATE_REFINE,REFINE_DOC" + ")values (");
             sql.append("'"+zgtz.getCreateDate()+"',");
             sql.append("'"+zgtz.getAdvice_Refine()+"',");
             sql.append("'"+zgtz.getUserId()+"',");
             sql.append("'"+zgtz.getAdmin_userId()+"',");
             sql.append("'"+zgtz.getRespdate_Refine()+"',");
             sql.append("'"+zgtz.getRefine_doc()+"'");
             sql.append(");");
             bufferedWriter.write(sql.toString()+"\n");
             
            list.add(sql.toString());
        }
        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }finally{
	    	fs=null;
	    	wb=null;
	    	try
	    	   {
	    		bufferedWriter.flush();
	    	    fileWriter.close();
	    	    bufferedWriter.close();
	    	   } catch (IOException e)
	    	   {
	    	    e.printStackTrace();
	    	   }
	    }
	    return list;
    }
    /**
     * 获取单元格数据内容为字符串类型的数据
     * 
     * @param cell Excel单元格
     * @return String 单元格数据内容
     */
    private String getStringCellValue(HSSFCell cell) {
        String strCell = "";
        switch (cell.getCellType()) {
        case HSSFCell.CELL_TYPE_STRING:
            strCell = cell.getStringCellValue();
            break;
        case HSSFCell.CELL_TYPE_NUMERIC:
            strCell = String.valueOf(cell.getNumericCellValue());
            break;
        case HSSFCell.CELL_TYPE_BOOLEAN:
            strCell = String.valueOf(cell.getBooleanCellValue());
            break;
        case HSSFCell.CELL_TYPE_BLANK:
            strCell = "";
            break;
        default:
            strCell = "";
            break;
        }
        if (strCell.equals("") || strCell == null) {
            return "";
        }
        if (cell == null) {
            return "";
        }
        return strCell;
    }

    /**
     * 获取单元格数据内容为日期类型的数据
     * 
     * @param cell
     *            Excel单元格
     * @return String 单元格数据内容
     */
    private String getDateCellValue(HSSFCell cell) {
        String result = "";
        try {
            int cellType = cell.getCellType();
            if (cellType == HSSFCell.CELL_TYPE_NUMERIC) {
                Date date = cell.getDateCellValue();
                result = (date.getYear() + 1900) + "-" + (date.getMonth() + 1)
                        + "-" + date.getDate();
            } else if (cellType == HSSFCell.CELL_TYPE_STRING) {
                String date = getStringCellValue(cell);
                result = date.replaceAll("[年月]", "-").replace("日", "").trim();
            } else if (cellType == HSSFCell.CELL_TYPE_BLANK) {
                result = "";
            }
        } catch (Exception e) {
            System.out.println("日期格式不正确!");
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 根据HSSFCell类型设置数据
     * @param cell
     * @return
     */
    private String getCellFormatValue(HSSFCell cell) {
        String cellvalue = "";
        if (cell != null) {
            // 判断当前Cell的Type
            switch (cell.getCellType()) {
            // 如果当前Cell的Type为NUMERIC
            case HSSFCell.CELL_TYPE_NUMERIC:
            case HSSFCell.CELL_TYPE_FORMULA: {
                // 判断当前的cell是否为Date
                if (HSSFDateUtil.isCellDateFormatted(cell)) {
                    // 如果是Date类型则，转化为Data格式
                    
                    //方法1：这样子的data格式是带时分秒的：2011-10-12 0:00:00
                    //cellvalue = cell.getDateCellValue().toLocaleString();
                    
                    //方法2：这样子的data格式是不带带时分秒的：2011-10-12
                    Date date = cell.getDateCellValue();
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    cellvalue = sdf.format(date);
                    
                }
                // 如果是纯数字
                else {
                    // 取得当前Cell的数值
                    cellvalue = String.valueOf(cell.getNumericCellValue());
                }
                break;
            }
            // 如果当前Cell的Type为STRIN
            case HSSFCell.CELL_TYPE_STRING:
                // 取得当前的Cell字符串
                cellvalue = cell.getRichStringCellValue().getString();
                break;
            // 默认的Cell值
            default:
                cellvalue = " ";
            }
        } else {
            cellvalue = "";
        }
        return cellvalue;

    }
    
    /** 
     * 获取数据库连接 
     * @return 
     */ 
    public Connection getConnection(){ 
    	/** 声明Connection连接对象*/ 
        Connection conn = null; 
        try{ 
            /** 使用Class.forName()方法自动创建这个驱动程序的实例且自动调用DriverManager来注册它*/ 
            Class.forName(DB_DRIVER); 
            /** 通过DriverManager的getConnection()方法获取数据库连接*/ 
            conn = (Connection) DriverManager.getConnection(DB_URL,DB_USERNAME,DB_PASSWORD); 
        }catch(Exception ex){ 
            ex.printStackTrace(); 
        } 
        return conn; 
    } 
     
    /** 
     * 关闭数据库连接 
     *  
     * @param connect 
     */ 
    public void closeConnection(Connection conn){ 
        try{ 
            if(conn!=null){ 
                /** 判断当前连接连接对象如果没有被关闭就调用关闭方法*/ 
                if(!conn.isClosed()){ 
                    conn.close(); 
                } 
            } 
        }catch(Exception ex){ 
            ex.printStackTrace(); 
        } 
    } 
    /**
     * 提交SQL
     * @param object
     * @return
     */
    public boolean submitData(String sql){
    	boolean bol=false;
    	  try{ 
    		  Connection   conn=getConnection();
    		  sql=sql.replaceAll("null", "");
	          PreparedStatement ps=conn.prepareStatement(sql);
	          bol = ps.execute();
	          closeConnection(conn);
          }catch(Exception ex){ 
              ex.printStackTrace(); 
          } 
    	return bol;
    }
    
    public static void main(String[] args){
//            System.out.println("获得Excel表格的标题:");
//            for (String s : title) {
//                System.out.print(s + " ");s) {
        try {
//            // 对读取Excel表格标题测试
//            InputStream is = new FileInputStream("d:\\test2.xls");
        	ExcelReader excelReader = new ExcelReader();
//            String[] title = excelReader.readExce
//            }
        	System.out.println("12");
            // 对读取Excel表格内容测试
//            InputStream is2 = new FileInputStream("D:/Program Files/Tencent/QQ/Users/506259606/FileRecv/考评细则/考评细则/水路危品.xls");
        	//读取的Excel所在路径
//        	InputStream is2 = new FileInputStream("C:/Users/Administrator/Desktop/各种表/企业注册表.xls");            
//        	InputStream is2 = new FileInputStream("C:/Users/Administrator/Desktop/各种表/user.xls");
//        	InputStream is2 = new FileInputStream("F:/导出数据/en-stand.xls");
//        	InputStream is2 = new FileInputStream("F:/导出数据/org-apply.xls");
//        	InputStream is2 = new FileInputStream("F:/导出数据/org-backup.xls");
//        	InputStream is2 = new FileInputStream("F:/导出数据/org-report.xls");
//        	InputStream is2 = new FileInputStream("F:/导出数据/pn.xls");
//        	InputStream is2 = new FileInputStream("F:/导出数据/pn-apply.xls");
//        	InputStream is2 = new FileInputStream("F:/导出数据/pn-train.xls");
//        	InputStream is2 = new FileInputStream("F:/导出数据/portal.xls");
//        	InputStream is2 = new FileInputStream("F:/导出数据/refine.xls");
//        	InputStream is2 = new FileInputStream("F:/导出数据/log.xls");
        	InputStream is2 = new FileInputStream("F:/pnreg.xls");
        	//要输出的 sql文件
//        	List list = excelReader.readExcelContents(is2,"d:/insertEnReg.sql");
//        	List list = excelReader.readExcelUsers(is2,"d:/insertUser.sql");
//        	List list = excelReader.readQYPFExcelContents(is2,"d:/insertQYPF.sql");
//        	List list = excelReader.readOrgApplyExcelContents(is2,"d:/insertOrgApply.sql");
//        	List list = excelReader.readOrgbackupExcelContents(is2,"d:/insertOrgBack.sql");
//        	List list = excelReader.readOrgReportExcelContents(is2,"d:/insertOrgReport.sql");
//        	List list = excelReader.readPnregExcelContents(is2,"d:/insertPnReg.sql");
//        	List list = excelReader.readPnApplyExcelContents(is2,"d:/insertPnApply.sql");
//        	List list = excelReader.readPnTrainExcelContents(is2,"d:/insertPnTrain.sql");
//        	List list = excelReader.readSYNRExcelContents(is2,"d:/insertSYNR.sql");
//        	List list = excelReader.readZGTZExcelContents(is2,"d:/insertZGTZ.sql");
//        	List list = excelReader.readlogExcelContents(is2,"d:/insertlog.sql");
        	List list = excelReader.readPnApplyExcelContents(is2,"d:/insertpn_apply11.sql");
        	System.out.println("获得Excel表格的内容:");
//            for (int i = 1; i <= map.size(); i++) {
//                System.out.println(map.get(i));
//            }

        } catch (FileNotFoundException e) {
            System.out.println("未找到指定路径的文件!");
            e.printStackTrace();
        }finally{
        	
        }
    }
}