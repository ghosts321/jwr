package com.wr4.util.email;


public class SendMail {

	public static void send(String toAddress, String subject, String content) {
		 MailSenderInfo mailInfo = new MailSenderInfo();   
	     mailInfo.setMailServerHost("smtp.163.com");   
	     mailInfo.setMailServerPort("25");   
	     mailInfo.setValidate(true);   
	     mailInfo.setUserName("yooyfei@163.com");   
	     mailInfo.setPassword("546098735");//您的邮箱密码   
	     mailInfo.setFromAddress("yooyfei@163.com");   
	     mailInfo.setToAddress(toAddress);   
	     mailInfo.setSubject(subject);   
	     mailInfo.setContent(content);   
	        //这个类主要来发送邮件  
	     SimpleMailSender sms = new SimpleMailSender();  
	     sms.sendTextMail(mailInfo);//发送文体格式   
	}
	public static void main(String[] args) {
		
		send("1323801376@qq.com", "测试", "你的密码为123456");
		/*String s="I love java";
		
	    //System.out.println(new StringBuffer(s).reverse());
		
	    String str=new StringBuffer(s).reverse().toString();
	    
	    String ss[]=str.split(" ");
	    StringBuffer sb=new StringBuffer();
	    for (int i = 0; i < ss.length; i++) {
			sb.append(new StringBuffer(ss[i]).reverse()+" ");
		}
	   // System.out.println(sb.toString());
		
		//System.out.println(reverse("student"));
		//reverse2("student");
		System.out.println(reverseString("student"));*/
		
	}
	public static String reverse(String s) {
	  int length = s.length();
	  if (length <= 1){
		  return s;
	  }
	  String left = s.substring(0, length / 2);
	  String right = s.substring(length / 2, length);
	  return reverse(right) + reverse(left);
	}
	
	public static void  reverse2(String s) {
		char[] c=s.toCharArray();
		String ss="";
		for (int i = c.length-1; i>=0; i--) {
			ss+=c[i];
		}
		System.out.println(ss);
	 }
	   public static String reverseString(String s){
	        if(s.isEmpty()) return s;
	        return reverseString(s.substring(1))+s.charAt(0);
	   }
}
