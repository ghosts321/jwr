package com.wr4.domain;
/**
 * 主管机关注册表
 * @author Administrator
 *
 */
public class MotRegInfo {
	private String tax;              //传真      
	private String createdate;       //日期      
	private String pid;              //证件号    
	private String del;              //删除标志  
	private String motname;          //名称      
	private String legalp;           //法人代表  
	private String email;            //联系人邮箱
	private String contact;          //联系人姓名
	private String cpid; 			//联系人身份争号
	private String address;          //通讯地址  
	private String mobile;           //手机      
	private String adminmot;         //主管机关  
	private String tel;              //联系电话  
	private String userid;           //用户登录账号
	private String userpass;  		//用户密码  --使用MD5加密
	private String regrespremark;   //初审意见
	private String regresp;        //初审结果
	private String regrespuser;     //初审审核人
	private int    id;				//主键
	private String  loginMotCode;   //当前登录用户主管机关代码
	
	private String city;			//城市
	
	private int start;
	private int pagesize;
	
	
	public String getLoginMotCode() {
		return loginMotCode;
	}
	public void setLoginMotCode(String loginMotCode) {
		this.loginMotCode = loginMotCode;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRegrespremark() {
		return regrespremark;
	}
	public void setRegrespremark(String regrespremark) {
		this.regrespremark = regrespremark;
	}
	public String getRegresp() {
		return regresp;
	}
	public void setRegresp(String regresp) {
		this.regresp = regresp;
	}
	public String getRegrespuser() {
		return regrespuser;
	}
	public void setRegrespuser(String regrespuser) {
		this.regrespuser = regrespuser;
	}
	public String getCpid() {
		return cpid;
	}
	public void setCpid(String cpid) {
		this.cpid = cpid;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpass() {
		return userpass;
	}
	public void setUserpass(String userpass) {
		this.userpass = userpass;
	}
	public String getTax() {
		return tax;
	}
	public void setTax(String tax) {
		this.tax = tax;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getDel() {
		return del;
	}
	public void setDel(String del) {
		this.del = del;
	}
	public String getMotname() {
		return motname;
	}
	public void setMotname(String motname) {
		this.motname = motname;
	}
	public String getLegalp() {
		return legalp;
	}
	public void setLegalp(String legalp) {
		this.legalp = legalp;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getAdminmot() {
		return adminmot;
	}
	public void setAdminmot(String adminmot) {
		this.adminmot = adminmot;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getPagesize() {
		return pagesize;
	}
	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}

}
