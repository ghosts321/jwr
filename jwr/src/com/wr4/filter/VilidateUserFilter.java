package com.wr4.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

public class VilidateUserFilter extends HttpServlet implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest userRequest = (HttpServletRequest)request;
        HttpServletResponse userResponse = (HttpServletResponse)response;    
        String path = userRequest.getContextPath();
        String indexPath = userRequest.getScheme()+"://"+userRequest.getServerName()+":"+userRequest.getServerPort()+path;
		Object user = userRequest.getSession().getAttribute("userid");
		String requestURI = userRequest.getRequestURI();
		if(requestURI.endsWith(".jsp") && !requestURI.endsWith("login.jsp") && !requestURI.endsWith("Updata.jsp") && !requestURI.endsWith("reg.jsp")
				&& !requestURI.endsWith("enFirstPublicity.jsp") && !requestURI.endsWith("nameReportAdd.jsp") && !requestURI.endsWith("indexMore.jsp")
				&& !requestURI.endsWith("chayan.jsp") && !requestURI.endsWith("content.jsp")){
			if(user == null){
				userResponse.sendRedirect(indexPath);
			}
			chain.doFilter(request, response);
		}else{
			chain.doFilter(request, response);
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
	}

}
