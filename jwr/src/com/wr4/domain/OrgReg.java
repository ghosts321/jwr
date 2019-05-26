package com.wr4.domain;

import java.io.Serializable;

public class OrgReg implements Serializable{
	
	/**
	 *  met String 字段单位基本情况相关材料
	 */
	private String met;
	/**
	 *  pcode String 字段邮编
	 */
	private String pcode;
	/**
	 *  pid String 字段组织机构代码
	 */
	private String pid;
	/**
	 *  orgname String 字段名称
	 */
	private String orgname;
	/**
	 *  renew String 字段换证原因（仅换证申请）                    
	 */
	private String renew;
	/**
	 *  others String 字段其他材料                    
	 */
	private String others;
	/**
	 *  startdate String 字段开始从事相应业务年份        
	 */
	private String startdate;
	/**
	 *  pns String 字段专职考评员聘用证明与职称证明 
	 */
	private String pns;
	/**
	 *  province String 字段所在省市      
	 */
	private String province;
	/**
	 *  legalp String 字段法人代表                
	 */
	private String legalp;
	/**
	 *  grade String 字段等级                
	 */
	private String grade;
	/**
	 *  email String 字段联系人邮箱                    
	 */
	private String email;
	/**
	 *  userid String 字段用户ID              
	 */
	private String userid;
	/**
	 *  bustype String 字段业务类型                
	 */
	private String bustype;
	private String busType;
	/**
	 *  fax String 字段传真号码                
	 */
	private String fax;
	/**
	 *  pnumber Double 字段专职考评员人数              
	 */
	private int pnumber;
	/**
	 *  contact String 字段联系人姓名                
	 */
	private String contact;
	/**
	 *  address String 字段通讯地址                    
	 */
	private String address;
	/**
	 *  mobile String 字段手机        
	 */
	private String mobile;
	/**
	 *  adminmot String 字段主管机关                
	 */
	private String adminmot;
	/**
	 *  tel String 字段联系电话                
	 */
	private String tel;
	/**
	 *  rule String 字段考评管理制度              
	 */
	private String rule;
	/**
	 *  pnumber2 Double 字段高级技术职称考评员人数              
	 */
	private int pnumber2;
	/**
	 *  userpass String 字段用户密码
	 */
	private String userpass;
	/**
	 *  cpid String 字段联系人身份证号
	 */
	private String cpid;
	/**
	 *  createdate String 字段注册日期           
	 */
	private String createdate;
	/**
	 *  byzd3 String 字段备用字段3              
	 */
	private String byzd3;
	/**
	 *  id Double 字段ID
	 */
	private Double id;
	/**
	 *  del String 字段删除标识 1 已删除
	 */
	private String del;
	/**
	 *  regresp String 字段初审结果
	 */
	private String regresp;
	/**
	 *  regrespremark String 字段初审意见
	 */
	private String regrespremark;
	/**
	 *  regrespuser String 字段初审审核人
	 */
	private String regrespuser;
	
	private String motname;
	private String typename;
	private String city;
	
	
	public String getBusType() {
		return busType;
	}
	public void setBusType(String busType) {
		this.busType = busType;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getMotname() {
		return motname;
	}
	public void setMotname(String motname) {
		this.motname = motname;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
	public String getMet() {
		return met;
	}
	public void setMet(String met) {
		this.met = met;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getOrgname() {
		return orgname;
	}
	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}
	public String getRenew() {
		return renew;
	}
	public void setRenew(String renew) {
		this.renew = renew;
	}
	public String getOthers() {
		return others;
	}
	public void setOthers(String others) {
		this.others = others;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getPns() {
		return pns;
	}
	public void setPns(String pns) {
		this.pns = pns;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getLegalp() {
		return legalp;
	}
	public void setLegalp(String legalp) {
		this.legalp = legalp;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getBustype() {
		return bustype;
	}
	public void setBustype(String bustype) {
		this.bustype = bustype;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
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
	public String getRule() {
		return rule;
	}
	public void setRule(String rule) {
		this.rule = rule;
	}
	public String getUserpass() {
		return userpass;
	}
	public void setUserpass(String userpass) {
		this.userpass = userpass;
	}
	public String getCpid() {
		return cpid;
	}
	public void setCpid(String cpid) {
		this.cpid = cpid;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	public String getByzd3() {
		return byzd3;
	}
	public void setByzd3(String byzd3) {
		this.byzd3 = byzd3;
	}
	public Double getId() {
		return id;
	}
	public void setId(Double id) {
		this.id = id;
	}
	public String getDel() {
		return del;
	}
	public void setDel(String del) {
		this.del = del;
	}
	public String getRegresp() {
		return regresp;
	}
	public void setRegresp(String regresp) {
		this.regresp = regresp;
	}
	public String getRegrespremark() {
		return regrespremark;
	}
	public void setRegrespremark(String regrespremark) {
		this.regrespremark = regrespremark;
	}
	public String getRegrespuser() {
		return regrespuser;
	}
	public void setRegrespuser(String regrespuser) {
		this.regrespuser = regrespuser;
	}
	public int getPnumber() {
		return pnumber;
	}
	public void setPnumber(int pnumber) {
		this.pnumber = pnumber;
	}
	public int getPnumber2() {
		return pnumber2;
	}
	public void setPnumber2(int pnumber2) {
		this.pnumber2 = pnumber2;
	}
	
	
}
