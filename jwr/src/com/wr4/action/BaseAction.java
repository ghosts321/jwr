package com.wr4.action;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import clojure.main;

import com.opensymphony.xwork2.ActionSupport;
import com.wr4.service.IPnPageService;
import com.wr4.service.impl.BaseServiceImpl;

/**
 * 类说明：用户基类Action
 * 
 * @author 作者: zhangli
 * @version 创建时间：2013年10月29日 15:08:47
 */
public   class BaseAction extends ActionSupport implements
		ServletRequestAware, ServletResponseAware {

	private static final long serialVersionUID = 1L;
	 public Log logger = LogFactory.getLog(this.getClass());
	 public final static int M_BLOCKSIZE = 65535;
	public HttpServletRequest request;
	public HttpServletResponse response;
	private IPnPageService pnPageService;
	public String page;
	public int pagesize;
	public int offset;
	public int limit;
	public int start;

	private BaseServiceImpl baseService;
	
	
	public BaseServiceImpl getBaseService() {
		return baseService;
	}

	public void setBaseService(BaseServiceImpl baseService) {
		this.baseService = baseService;
	}

	public IPnPageService getPnPageService() {
		return pnPageService;
	}

	public void setPnPageService(IPnPageService pnPageService) {
		this.pnPageService = pnPageService;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;

	}

	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}

	/**
	 * 获得request
	 * 
	 * @return
	 */
	public HttpServletRequest getRequest() {
		return ServletActionContext.getRequest();
	}

	/**
	 * 获得response
	 * 
	 * @return
	 */
	public HttpServletResponse getResponse() {
		return ServletActionContext.getResponse();
	}

	/**
	 * 获得session
	 * 
	 * @return
	 */
	public HttpSession getSession() {
		return getRequest().getSession();
	}

	/**
	 * 获得servlet上下文
	 * 
	 * @return
	 */
	public ServletContext getServletContext() {
		return ServletActionContext.getServletContext();
	}

	public String getRealyPath(String path) {
		return getServletContext().getRealPath(path);
	}

	/**
	 * 页面输出信息
	 * 
	 * @param message
	 * @throws Exception
	 */
	public void writer(String message) throws Exception {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		try {
			out.print(message);
			out.close();
		} catch (Exception e) {
			out.close();
			e.printStackTrace();
		}finally{
			out=null;
		}
	}

	// md5
	public static String md5(String str) {

		if (str == null)
			return "";

		String rt = "";
		try {
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			md5.update(str.getBytes("gb2312"));
			byte[] bt = md5.digest();
			String s = null;
			int l = 0;
			for (int i = 0; i < bt.length; i++) {
				s = Integer.toHexString(bt[i]);
				l = s.length();
				if (l > 2)
					s = s.substring(l - 2, l);
				else if (l == 1)
					s = "0" + s;
				rt += s;
			}
			// rt;
		} catch (NoSuchAlgorithmException e1) {
			e1.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		return rt;

	}
	
    /**
     * 分页
     * 
     */
	public void getPageParameters() {
		page = 1+"";
		pagesize = 10;
		if (request.getParameter("page") != null
				&& request.getParameter("pagesize") != null) {
			page =  request.getParameter("page") ;
			pagesize = Integer.parseInt(request.getParameter("pagesize"));
		}
		// 计算开始的记录和结束的记录
		offset = (Integer.parseInt(page) - 1) * pagesize;
		limit = ((Integer.parseInt(page) - 1) * pagesize) + pagesize;
	}
	
	public void getPageParameter(){
		 page = request.getParameter("page");
		 pagesize = Integer.parseInt(request.getParameter("pagesize"));
		 start =Integer.parseInt(page)*pagesize-pagesize;
	}
	
	/**
	 * 返回ligerjson
	 */
	public void writeLigerJson(List list,int totalList){
		if (list != null && list.size() > 0) {
			JSONArray jsonObject = JSONArray.fromObject(list);
			String js = jsonObject.toString();
			js = "{Rows: " + jsonObject.toString() + ",Total:"
					+ totalList + "}";
			try {
				writer(js);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else{
			list=new ArrayList();
			JSONArray jsonObject = JSONArray.fromObject(list);
			String js = jsonObject.toString();
			js = "{Rows: " + jsonObject.toString() + ",Total:"
					+ 0 + "}";
			try {
				writer(js);
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}
		
	}
 
	/**
	 * 返回ligerjson
	 */
	public void writeLigerJson(List list,int totalList,JsonConfig jsonConfig ){
		if (list != null && list.size() > 0) {
			JSONArray jsonObject = JSONArray.fromObject(list,jsonConfig);
			String js = jsonObject.toString();
			js = "{Rows: " + jsonObject.toString() + ",Total:"
					+ totalList + "}";
			try {
				writer(js);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else{
			list=new ArrayList();
			JSONArray jsonObject = JSONArray.fromObject(list);
			String js = jsonObject.toString();
			js = "{Rows: " + jsonObject.toString() + ",Total:"
					+ list.size() + "}";
			try {
				writer(js);
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}
	}
	
	public int getCount(String sqlId,Object object){
		int i=0;
		try {
		     i=(Integer) baseService.selectCount(sqlId, object);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	
	public static void main(String[] args) {
		System.out.println(md5("123456"));
	}
}