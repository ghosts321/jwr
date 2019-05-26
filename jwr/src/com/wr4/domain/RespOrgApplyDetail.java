package com.wr4.domain;

import java.io.Serializable;

public class RespOrgApplyDetail implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	/**
	 *  createdate String 字段日期                           
	 */
	private String createdate;
	/**
	 *  met String 字段单位基本情况相关材料           
	 */
	private String met;
	/**
	 *  cdate String 字段发证时间                       
	 */
	private String cdate;
	/**
	 *  pcode String 字段邮编                           
	 */
	private String pcode;
	/**
	 *  remark String 字段备注                           
	 */
	private String remark;
	/**
	 *  advice String 字段处理意见                       
	 */
	private String advice;
	/**
	 *  pid String 字段证件号                         
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
	 *  cid String 字段证书号                         
	 */
	private String cid;
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
	/**
	 *  resp String 字段受理结果                       
	 */
	private String resp;
	/**
	 *  fax String 字段传真号码                       
	 */
	private String fax;
	/**
	 *  pnumber Double 字段专职考评员人数                 
	 */
	private Double pnumber;
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
	 *  pnumber2 Double 字段高级技术职称考评员人数         
	 */
	private Double pnumber2;
	/**
	 *  respdate String 字段受理日期                       
	 */
	private String respdate;
	/**
	 *  applytype String 字段申请标示(0表示初次申请,1标示证书申请)
	 */
	private String applytype;
	/**
	 *  id Double 字段ID
	 */
	private Double id;
	/**
	 *  man String 字段考评管理制度
	 */
	private String man;
	/**
	 *  orher String 字段其他材料
	 */
	private String orher;
	/**
	 *  del String 字段删除标志
	 */
	private String del;
	/**
	 *  respreview String 字段审核结果
	 */
	private String respreview;
	
	private String filetext;
	private String motname;
	private String sladvice;
	private String city;
	
	
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	public String getMet() {
		return met;
	}
	public void setMet(String met) {
		this.met = met;
	}
	public String getCdate() {
		return cdate;
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getAdvice() {
		return advice;
	}
	public void setAdvice(String advice) {
		this.advice = advice;
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
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
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
	public String getResp() {
		return resp;
	}
	public void setResp(String resp) {
		this.resp = resp;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public Double getPnumber() {
		return pnumber;
	}
	public void setPnumber(Double pnumber) {
		this.pnumber = pnumber;
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
	public Double getPnumber2() {
		return pnumber2;
	}
	public void setPnumber2(Double pnumber2) {
		this.pnumber2 = pnumber2;
	}
	public String getRespdate() {
		return respdate;
	}
	public void setRespdate(String respdate) {
		this.respdate = respdate;
	}
	public String getApplytype() {
		return applytype;
	}
	public void setApplytype(String applytype) {
		this.applytype = applytype;
	}
	public Double getId() {
		return id;
	}
	public void setId(Double id) {
		this.id = id;
	}
	public String getMan() {
		return man;
	}
	public void setMan(String man) {
		this.man = man;
	}
	public String getOrher() {
		return orher;
	}
	public void setOrher(String orher) {
		this.orher = orher;
	}
	public String getDel() {
		return del;
	}
	public void setDel(String del) {
		this.del = del;
	}
	public String getRespreview() {
		return respreview;
	}
	public void setRespreview(String respreview) {
		this.respreview = respreview;
	}
	public String getFiletext() {
		return filetext;
	}
	public void setFiletext(String filetext) {
		this.filetext = filetext;
	}
	public String getMotname() {
		return motname;
	}
	public void setMotname(String motname) {
		this.motname = motname;
	}
	public String getSladvice() {
		return sladvice;
	}
	public void setSladvice(String sladvice) {
		this.sladvice = sladvice;
	}
	
}
