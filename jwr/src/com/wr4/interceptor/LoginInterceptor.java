package com.wr4.interceptor;

import java.lang.reflect.Method;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.wr4.action.LoginAction;

public class LoginInterceptor extends AbstractInterceptor {  
  
      
    public String intercept(ActionInvocation invocation) throws Exception {  
    	//对LogonAction不做该项拦截 
    	Object action = invocation.getAction();
		if (action instanceof LoginAction) {
			return invocation.invoke();
		}
		Method [] sss=action.getClass().getDeclaredMethods();
		for(int i=0;i<sss.length;i++){
			String methodName=sss[i].getName();
			if("removeSession".equals(methodName)){
				return invocation.invoke();
			}
			if("getMot".equals(methodName)){
				return invocation.invoke();
			}
			if("regUpdata".equals(methodName)){
				return invocation.invoke();
			}
			if("getEnPublicityList".equals(methodName)){
				return invocation.invoke();
			}
			if("saveTaskAssingation".equals(methodName)){
				return invocation.invoke();
			}
			if("nameReportInsert".equals(methodName)){
				return invocation.invoke();
			}if("downloadFile".equals(methodName)){
				return invocation.invoke();
			}
		}
//        // 取得请求相关的ActionContext实例  
        ActionContext ctx = invocation.getInvocationContext();  
        Map session = ctx.getSession();  
        String user = (String) session.get("userid");  
        // 如果没有值 证明SESSION 超时  返回登录页面
  
        if (user != null ) {  
            return invocation.invoke();  
        }  
        return "sysindex";  
  
    }  
  
}  