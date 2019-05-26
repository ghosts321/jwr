package com.wr4.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.wr4.action.BaseAction;

public class UploadAction extends BaseAction{
    
    private File image; //上传的文件
    private String imageFileName; //文件名称
    private String imageContentType; //文件类型
    private static final long serialVersionUID = 1L;  
    protected String mime = null;

    
    
    public String getMime() {
		return mime;
	}



	public void setMime(String mime) {
		this.mime = "application/x-msdownload";
	}



	public String upload() throws Exception {
		String flg=request.getParameter("flg");
		String imgnames=request.getParameter("imgnames");
		String realpath="" ;
		File files=  new File(realpath);    
	   	 if (!files.exists()) {
	   		 files.mkdir();
	   	 }
       System.out.println("realpath: "+realpath);
		String returnjsp="upload" ;
		if(flg==null || "".equals(flg)){
			realpath = ServletActionContext.getServletContext().getRealPath("/images");
			returnjsp="input";
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmssSSSS");
        	String date = sdf.format(new Date());
        	int i=imageFileName.lastIndexOf(".");
        	imageFileName= date+imageFileName.substring(i,imageFileName.length());
		}else{
			imageFileName=imgnames;
	        realpath = ServletActionContext.getServletContext().getRealPath("/uploadimg");
		}
        if (image != null) {
            File savefile = new File(new File(realpath), imageFileName);
            if (!savefile.getParentFile().exists())
                savefile.getParentFile().mkdirs();
            FileUtils.copyFile(image, savefile);
            request.setAttribute("ms", "yes");
            request.setAttribute("fileName", imageFileName);
        }
        return returnjsp;
    }
    
    
    
  //文件下载
    public void downloadFile() throws IOException, ServletException,Exception {
    	request.setCharacterEncoding("UTF-8");
    	String srcFileName=request.getParameter("file");
    	File srcFile=null;
    	String desFile=null;
        String realpath = ServletActionContext.getServletContext().getRealPath("/images");
        srcFile=new File(realpath+"/"+srcFileName);
        if (!srcFile.exists()) {
        	logger.error("下载文件不存在:");
        	  writer("文件" + srcFileName + "没有发现");
        	   
            throw new Exception("文件" + srcFileName + "没有发现");
       
        }
        if (desFile == null)
            desFile =srcFileName;
        downloadInputStream(new FileInputStream(srcFile), desFile, (int)srcFile.length());
    }

    public void downloadInputStream(InputStream ins, String desfileName, int contentLength) throws ServletException, IOException,Exception{
        if (response == null)
            throw new Exception("ServletResponse 不能为空.");
        if (ins == null)
            throw new ServletException("输入输出流不能为空.");
        if (desfileName == null || desfileName.equals("")) {
            throw new Exception("目标文件不能为空.");
        }
        else {
            try {
            	logger.info("开始下载文件");
                response.setContentType(mime);
                response.setContentLength(contentLength);
                response.setHeader("Content-Disposition", String.valueOf((new StringBuffer("attachment;")).append(" filename=").append(new String(desfileName.getBytes(), "8859_1"))));
                ServletOutputStream out = response.getOutputStream();
                int readBytes = 0;
                int totalRead = 0;
                byte buffer[] = new byte[M_BLOCKSIZE];
                while (totalRead < contentLength) {
                    readBytes = ins.read(buffer, 0, M_BLOCKSIZE);
                    totalRead += readBytes;
                    out.write(buffer, 0, readBytes);
                }
                out.flush();
                out.close();
            }
            finally {
                ins.close();
            }
        }
    }
    /**
     * 删除单个文件
     * @param filePath
     * @return
     */
    public boolean deleteFile(String filePath){
    	boolean flag = false;
    	File file = new File(filePath);
    	if (file.isFile()&&file.exists()) {
			file.delete();
			flag = true;
		}
		return flag;
    }
    
    
    public File getImage() {
        return image;
    }

    public void setImage(File image) {
        this.image = image;
    }

    public String getImageFileName() {
        return imageFileName;
    }

    public void setImageFileName(String imageFileName) {
        this.imageFileName = imageFileName;
    }

    public String getImageContentType() {
        return imageContentType;
    }

    public void setImageContentType(String imageContentType) {
        this.imageContentType = imageContentType;
    }

    
}