package com.wr4.task;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;
import org.apache.struts2.ServletActionContext;
import org.omg.CORBA.Request;
import org.springframework.http.HttpRequest;

import com.wr4.action.BaseAction;

/**
 * 类说明：定时器调用存储过程类
 * @author zhouds
 * @version 2014-5-8
 */
public class DataConversionTask extends BaseAction {

	    public void showQuartzMessageEachseconds() 
	    {  
	    	System.out.print("数据转换任务线程开始执行:everytime");
	    }  
	    //showQuartzMessageAtFixedTime
	    public void showQuartzMessageAtFixedTime() 
	    {  
	    	logger.info("数据转换任务线程开始执行!");
			Properties pro =new Properties(); 
			String driver="oracle.jdbc.driver.OracleDriver";
//			String strUrl="jdbc:oracle:thin:@192.168.0.22:1521:pldb";
			Statement stmt=null;
			ResultSet rs=null;
			Connection conn=null;
			try {
//				String realpath = ServletActionContext.getServletContext().getRealPath("classes");
//				String realpath=DataConversionTask.class.getResource("/").getPath();
//				pro.load(new FileInputStream(realpath+"/jdbc.properties"));
				InputStream is=DataConversionTask.class.getResourceAsStream("/jdbc.properties");
				pro.load(is);
				String strUrl=pro.getProperty("jdbc.url").trim();
				String userString=pro.getProperty("jdbc.username");
				String passString=pro.getProperty("jdbc.password");
				
				Class.forName(driver);
				conn=DriverManager.getConnection(strUrl,userString, passString);
				
				//开始查询任务
				CallableStatement proc=null;
				proc=conn.prepareCall("{call jwr.app_bak(?,?,?)}");
				String sql_task="select p.id,p.Tablename,p.adminmot from plan_task p where p.execflag='Y'";
				stmt=conn.createStatement();
				rs=stmt.executeQuery(sql_task);
				while (rs.next()) {
					
					String taskid=rs.getString(1);
					String tablename=rs.getString(2);
					String adminmot=rs.getString(3);
					
					proc.setString(1, tablename);
					proc.setString(2, adminmot);
					proc.registerOutParameter(3,Types.VARCHAR);
//				proc=conn.prepareCall("{call jwr.TESTB(?,?)}");
//				proc.setString(1, userString);
//				proc.registerOutParameter(2,Types.VARCHAR);
					
					proc.execute();
					String result=proc.getString(3);
					System.out.println(result);
					logger.debug("数据转换任务"+taskid+"执行结果："+result);
				}
				
				
			} catch (SQLException ex1) {
				// TODO: handle exception
				ex1.printStackTrace();
			}
			catch (Exception ex2) {
				// TODO: handle exception
				ex2.printStackTrace();
			}
			finally
			{
				try {
					if (rs!=null) {
						rs.close();
					}
					if (stmt!=null) {
						stmt.close();
						
					}
					if (conn!=null) {
						conn.close();
					}
				} catch (SQLException e) {
					// TODO: handle exception
					e.printStackTrace();
				}
			}
		
		
	    } 
	public static void main(String args[]){
		Properties pro =new Properties(); 
		String driver="oracle.jdbc.driver.OracleDriver";
//		String strUrl="jdbc:oracle:thin:@192.168.0.22:1521:pldb";
		String para1="org_apply";
		String para2="07";
		Statement stmt=null;
		ResultSet rs=null;
		Connection conn=null;
		
		try {
//			String realpath = ServletActionContext.getServletContext().getRealPath("jdbc.properties");
			InputStream is=DataConversionTask.class.getResourceAsStream("/jdbc.properties");
			pro.load(is);
			String strUrl=pro.getProperty("jdbc.url").trim();
			String userString=pro.getProperty("jdbc.username");
			String passString=pro.getProperty("jdbc.password");
			
			Class.forName(driver);
			conn=DriverManager.getConnection(strUrl,userString, passString);
			CallableStatement proc=null;
			//开始查询任务
			String sql_task="select p.id,p.Tablename,p.adminmot from plan_task p where p.execflag='Y'";
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql_task);
			while (rs.next()) {
				
				String taskid=rs.getString(1);
				String tablename=rs.getString(2);
				String adminmot=rs.getString(3);
				
				proc=conn.prepareCall("{call jwr.app_bak(?,?,?)}");
				proc.setString(1, tablename);
				proc.setString(2, adminmot);
				proc.registerOutParameter(3,Types.VARCHAR);
//			proc=conn.prepareCall("{call jwr.TESTB(?,?)}");
//			proc.setString(1, userString);
//			proc.registerOutParameter(2,Types.VARCHAR);
				
				proc.execute();
				String result=proc.getString(3);
				System.out.println(result);
				System.out.println("数据转换任务"+taskid+"执行结果："+result);
			}
			
		} catch (SQLException ex1) {
			// TODO: handle exception
			ex1.printStackTrace();
		}
		catch (Exception ex2) {
			// TODO: handle exception
			ex2.printStackTrace();
		}
		finally
		{
			try {
				if (rs!=null) {
					rs.close();
				}
				if (stmt!=null) {
					stmt.close();
					
				}
				if (conn!=null) {
					conn.close();
				}
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
	}

}
