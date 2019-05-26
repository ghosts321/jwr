package com.wr4.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.wr4.domain.EnPandect;
import com.wr4.service.EnPandectService;

public class ExcelServlet extends HttpServlet {  
	   
	    private EnPandectService enPandectService;
	    
	   
		public void doGet(HttpServletRequest request, HttpServletResponse response)  
                throws ServletException, IOException {  
			List<EnPandect> list = null;
			
			//获取enPandectServiceBean
			WebApplicationContext context =   
                WebApplicationContextUtils.getWebApplicationContext(this.getServletContext()); 
			enPandectService=(EnPandectService) context.getBean("enPandectService");
			
			System.out.println("----------------------"+enPandectService);
			
			String xlsName=this.getServletContext().getRealPath("/");
			
			try {
				String[] headers = { "主管机关编号", "主管机关名称", "	已注册", "已受理","已审核", "	已考评" };  
				list=enPandectService.getEnPandectList("statistics.enPandectCountList");
				
				String fileName=xlsName+"reports\\enPandectList.xls";
				
				FileOutputStream fos=new FileOutputStream(fileName);
				
				ExportExcel<EnPandect> e=new ExportExcel<EnPandect>();
				//先把记录导出到指定excel
				e.exportExcel(headers, list, fos);
				
				
				//弹出下载框，下载文件
				download(fileName, response);  
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }  
        private void download(String path, HttpServletResponse response) {  
            try {  
                // path是指欲下载的文件的路径。  
                File file = new File(path);  
                // 取得文件名。  
                String filename = file.getName();  
                // 以流的形式下载文件。  
                InputStream fis = new BufferedInputStream(new FileInputStream(path));  
                byte[] buffer = new byte[fis.available()];  
                fis.read(buffer);  
                fis.close();  
                // 清空response  
                response.reset();  
                // 设置response的Header  
                response.addHeader("Content-Disposition", "attachment;filename="  
                        + new String(filename.getBytes()));  
                response.addHeader("Content-Length", "" + file.length());  
                OutputStream toClient = new BufferedOutputStream(  
                        response.getOutputStream());  
                response.setContentType("application/vnd.ms-excel;charset=gb2312");  
                toClient.write(buffer);  
                toClient.flush();  
                toClient.close();  
            } catch (IOException ex) {  
                ex.printStackTrace();  
            }  
        }  
    }  