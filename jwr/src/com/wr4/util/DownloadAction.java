package com.wr4.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.struts2.ServletActionContext;

import com.wr4.action.BaseAction;


public class DownloadAction extends BaseAction  
{  
  
    private static final long serialVersionUID = 1L;  
    protected String mime = null;
    private List<com.wr4.domain.FileItem>list;  
    private Dao dao=new Dao();  
    private String fileId;      
    private FileItem fileItem;  
   

    public void DownloadUtility(HttpServletResponse response) {
        this.mime = "application/x-msdownload";
    }

    public void DownloadUtility(HttpServletResponse response, String mime) {
        this.mime = mime;
    }

      
    //获得list  
    public String list()  
    {  
        list=dao.getFileList();  
        return "list-success";  
    }  
    //获得文件  
    public String get()  
    {  
        fileItem=(FileItem) dao.getFileItem(fileId);  
        return "get-success";  
    }  
      
    //获得输入流  
    public InputStream getInputStream()  
    {  
        try  
        {  
            String path=ServletActionContext.getServletContext().getRealPath("/");  
            String fileName=path+((com.wr4.domain.FileItem) fileItem).getLocationPath();  
            FileInputStream fis=new FileInputStream(fileName);  
            return fis;  
        }  
        catch (FileNotFoundException e)  
        {  
            // TODO Auto-generated catch block  
            e.printStackTrace();  
        }  
        return null;  
    }  
      
    //获得文件类型  
    public String getContentType()  
    {  
        return fileItem.getContentType();  
    }  
      
    //获得文件下载位置  
    public String getContentDisposition()  
    {  
        try  
        {  
            return "attachment;filename="+URLEncoder.encode(((com.wr4.domain.FileItem) fileItem).getFileName(),"utf-8");  
        }  
        catch (UnsupportedEncodingException e)  
        {  
            // TODO Auto-generated catch block  
            e.printStackTrace();  
        }  
        return null;  
    }  
      
    //获得文件字节大小  
    public int getContentLength()  
    {  
		return ((DownloadAction) fileItem).getContentLength();  
    }  
      
      
    public List<com.wr4.domain.FileItem> getList()  
    {  
        return list;  
    }  
  
//    public void setList(List<FileItem> list)  
//    {  
//        this.list = list;  
//    }  
    public String getFileId()  
    {  
        return fileId;  
    }  
    public void setFileId(String fileId)  
    {  
        this.fileId = fileId;  
    }  
    
    
    
  
}  