package com.wr4.domain;
public class FileItem  
{  
    private String fileId;  
    private String fileName;  
    private String contentType;  
    private String locationPath;  
    private int contentLength;
	public String getFileId() {
		return fileId;
	}
	public void setFileId(String fileId) {
		this.fileId = fileId;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	public String getLocationPath() {
		return locationPath;
	}
	public void setLocationPath(String locationPath) {
		this.locationPath = locationPath;
	}
	public int getContentLength() {
		return contentLength;
	}
	public void setContentLength(int contentLength) {
		this.contentLength = contentLength;
	}  
     
      
    //getter和setter略  
      
}  