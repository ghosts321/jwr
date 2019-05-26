package com.wr4.domain;
/**
 * 主管机关注册表
 * @author Administrator
 *
 */
public class EnRegInfo {
	private int id;
	private String tax;              //传真      
	private String resp_reg;         //初审结果  
	private String createdate;       //日期      
	private String pid;              //证件号    
	private String del;              //删除标志  
	private String username;          //名称      
	private String advice_reg;       //初审意见  
	private String legalp;           //法人代表  
	private String email;            //联系人邮箱
	private String contact;          //联系人姓名
	private String cpid; 			//联系人身份争号
	private String address;          //通讯地址  
	private String mobile;           //手机      
	private String adminmot;         //主管机关  
	private String tel;              //联系电话  
	private String license; 		//经营许可证
	private String safe;			//安全生产组织架构
	private String renew;			//换证原因
	private String myreport;		//标准化达标自评报告
	private String province;		//所在省市
	private String grade;			//企业申请等级
	private String celltype;		//业务类别
	private String bustype;			//业务类型
	private String qual;			//企业法人营业执照
	private String othercert;		//其他安全管理体系证书证件             
	private String buslicense;		//营业执照
	private String orgcodecert;		//组织机构代码证
	private String userid;  		//用户登录账号 
	private String userpass;		//用户密码
	private String loginMot;		//登录用户主管机关代码
	private String regrespremark;   //初审意见
	private String regresp;        //初审结果
	private String regrespuser;     //初审审核人
	private String city;     //所在市
	
	private String area;
	
	private int start;
	private int pagesize;
	
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
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
	public String getLoginMot() {
		return loginMot;
	}
	public void setLoginMot(String loginMot) {
		this.loginMot = loginMot;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserpass() {
		return userpass;
	}
	public void setUserpass(String userpass) {
		this.userpass = userpass;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getOthercert() {
		return othercert;
	}
	public void setOthercert(String othercert) {
		this.othercert = othercert;
	}
	public String getBuslicense() {
		return buslicense;
	}
	public void setBuslicense(String buslicense) {
		this.buslicense = buslicense;
	}
	public String getOrgcodecert() {
		return orgcodecert;
	}
	public void setOrgcodecert(String orgcodecert) {
		this.orgcodecert = orgcodecert;
	}
	public String getTax() {
		return tax;
	}
	public void setTax(String tax) {
		this.tax = tax;
	}
	public String getResp_reg() {
		return resp_reg;
	}
	public void setResp_reg(String resp_reg) {
		this.resp_reg = resp_reg;
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
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getAdvice_reg() {
		return advice_reg;
	}
	public void setAdvice_reg(String advice_reg) {
		this.advice_reg = advice_reg;
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
	public String getCpid() {
		return cpid;
	}
	public void setCpid(String cpid) {
		this.cpid = cpid;
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
	public String getLicense() {
		return license;
	}
	public void setLicense(String license) {
		this.license = license;
	}
	public String getSafe() {
		return safe;
	}
	public void setSafe(String safe) {
		this.safe = safe;
	}
	public String getRenew() {
		return renew;
	}
	public void setRenew(String renew) {
		this.renew = renew;
	}
	public String getMyreport() {
		return myreport;
	}
	public void setMyreport(String myreport) {
		this.myreport = myreport;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getCelltype() {
		return celltype;
	}
	public void setCelltype(String celltype) {
		this.celltype = celltype;
	}
	public String getBustype() {
		return bustype;
	}
	public void setBustype(String bustype) {
		this.bustype = bustype;
	}
	public String getQual() {
		return qual;
	}
	public void setQual(String qual) {
		this.qual = qual;
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
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	  
	 
	
}
