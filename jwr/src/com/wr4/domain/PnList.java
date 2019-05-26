package com.wr4.domain;

import java.io.Serializable;

public class PnList implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	/**
	 *  beginfile String 字段相关专业从业年份证明文件
	 */
	private String beginfile;
	/**
	 *  passDirect String 字段直接颁发                
	 */
	private String passDirect;
	/**
	 *  respReg String 字段初审结果                
	 */
	private String respReg;
	/**
	 *  workdoc String 字段主要工作简历            
	 */
	private String workdoc;
	/**
	 *  fromaddress String 字段常住地                  
	 */
	private String fromaddress;
	/**
	 *  createdate String 字段日期                    
	 */
	private String createdate;
	/**
	 *  adminmot2 String 字段主管机关（地市）        
	 */
	private String adminmot2;
	/**
	 *  pcode String 字段邮编                    
	 */
	private String pcode;
	/**
	 *  proof String 字段身份证明文件            
	 */
	private String proof;
	/**
	 *  advice String 字段处理意见                
	 */
	private String advice;
	/**
	 *  edu String 字段文化程度                
	 */
	private String edu;
	/**
	 *  pid String 字段证件号                  
	 */
	private String pid;
	/**
	 *  pnname String 字段名称                    
	 */
	private String pnname;
	/**
	 *  train String 字段主要学习（培训）经历    
	 */
	private String train;
	/**
	 *  proofmobile String 字段证明人联系电话          
	 */
	private String proofmobile;
	/**
	 *  prof String 字段现从事专业              
	 */
	private String prof;
	/**
	 *  org String 字段单位组织                
	 */
	private String org;
	/**
	 *  photo String 字段照片                    
	 */
	private String photo;
	/**
	 *  title String 字段职称                    
	 */
	private String title;
	/**
	 *  importDate String 字段导入时间                
	 */
	private String importDate;
	/**
	 *  begindate String 字段相关专业从业年份        
	 */
	private String begindate;
	/**
	 *  perf String 字段专业工作业绩            
	 */
	private String perf;
	/**
	 *  titlefile String 字段职称证明文件            
	 */
	private String titlefile;
	/**
	 *  proof2 String 字段学历证明文件            
	 */
	private String proof2;
	/**
	 *  perf2 String 字段专业工作业绩附件        
	 */
	private String perf2;
	/**
	 *  proof3 String 字段培训合格证明文件        
	 */
	private String proof3;
	/**
	 *  email String 字段联系人邮箱              
	 */
	private String email;
	/**
	 *  bussinestype String 字段业务类型                
	 */
	private String bussinestype;
	/**
	 *  fax String 字段传真号码                
	 */
	private String fax;
	/**
	 *  major String 字段所学专业                
	 */
	private String major;
	/**
	 *  prooforg String 字段证明单位                
	 */
	private String prooforg;
	/**
	 *  address String 字段通讯地址                
	 */
	private String address;
	/**
	 *  mobile String 字段手机                    
	 */
	private String mobile;
	/**
	 *  from2 String 字段常住地（地市）          
	 */
	private String from2;
	/**
	 *  proofname String 字段证明人                  
	 */
	private String proofname;
	/**
	 *  cid String 字段证书号                  
	 */
	private String cid;
	/**
	 *  adminmot String 字段主管机关                
	 */
	private String adminmot;
	/**
	 *  tel String 字段联系电话                
	 */
	private String tel;
	/**
	 *  del String 字段是否删除：1，删除  0：未删除
	 */
	private String del;
	/**
	 *  userid String 字段用户ID
	 */
	private String userid;
	/**
	 *  attrorg String 字段所属考评机构
	 */
	private String attrorg;
	/**
	 *  employdate String 字段聘用日期
	 */
	private String employdate;
	/**
	 *  unemploydate String 字段解聘日期
	 */
	private String unemploydate;
	/**
	 *  parttime String 字段专兼职
	 */
	private String parttime;
	/**
	 *  applytype String 字段申请标示（0表示初次申请，1标示证书申请）
	 */
	private String applytype;
	/**
	 *  respdate String 字段初审时间
	 */
	private String respdate;
	/**
	 *  byzd1 String 字段备用字段
	 */
	private String byzd1;
	/**
	 *  byzd2 String 字段备用字段
	 */
	private String byzd2;
	/**
	 *  byzd3 String 字段备用字段
	 */
	private String byzd3;
	/**
	 *  id Double 字段ID
	 */
	private Double id;
	
	private String auditdate;
	private String exam_date;
	private int exam_score;
	private int train_hour;
	private String train_end;
	private String train_start;
	private String train_id;
	private String fzdate;
	private String pass_direct;
	private String city;
	
	
	
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getBeginfile() {
		return beginfile;
	}
	public void setBeginfile(String beginfile) {
		this.beginfile = beginfile;
	}
	public String getPassDirect() {
		return passDirect;
	}
	public void setPassDirect(String passDirect) {
		this.passDirect = passDirect;
	}
	public String getRespReg() {
		return respReg;
	}
	public void setRespReg(String respReg) {
		this.respReg = respReg;
	}
	public String getWorkdoc() {
		return workdoc;
	}
	public void setWorkdoc(String workdoc) {
		this.workdoc = workdoc;
	}
	public String getFromaddress() {
		return fromaddress;
	}
	public void setFromaddress(String fromaddress) {
		this.fromaddress = fromaddress;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	public String getAdminmot2() {
		return adminmot2;
	}
	public void setAdminmot2(String adminmot2) {
		this.adminmot2 = adminmot2;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public String getProof() {
		return proof;
	}
	public void setProof(String proof) {
		this.proof = proof;
	}
	public String getAdvice() {
		return advice;
	}
	public void setAdvice(String advice) {
		this.advice = advice;
	}
	public String getEdu() {
		return edu;
	}
	public void setEdu(String edu) {
		this.edu = edu;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getPnname() {
		return pnname;
	}
	public void setPnname(String pnname) {
		this.pnname = pnname;
	}
	public String getTrain() {
		return train;
	}
	public void setTrain(String train) {
		this.train = train;
	}
	public String getProofmobile() {
		return proofmobile;
	}
	public void setProofmobile(String proofmobile) {
		this.proofmobile = proofmobile;
	}
	public String getProf() {
		return prof;
	}
	public void setProf(String prof) {
		this.prof = prof;
	}
	public String getOrg() {
		return org;
	}
	public void setOrg(String org) {
		this.org = org;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImportDate() {
		return importDate;
	}
	public void setImportDate(String importDate) {
		this.importDate = importDate;
	}
	public String getBegindate() {
		return begindate;
	}
	public void setBegindate(String begindate) {
		this.begindate = begindate;
	}
	public String getPerf() {
		return perf;
	}
	public void setPerf(String perf) {
		this.perf = perf;
	}
	public String getTitlefile() {
		return titlefile;
	}
	public void setTitlefile(String titlefile) {
		this.titlefile = titlefile;
	}
	public String getProof2() {
		return proof2;
	}
	public void setProof2(String proof2) {
		this.proof2 = proof2;
	}
	public String getPerf2() {
		return perf2;
	}
	public void setPerf2(String perf2) {
		this.perf2 = perf2;
	}
	public String getProof3() {
		return proof3;
	}
	public void setProof3(String proof3) {
		this.proof3 = proof3;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBussinestype() {
		return bussinestype;
	}
	public void setBussinestype(String bussinestype) {
		this.bussinestype = bussinestype;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getProoforg() {
		return prooforg;
	}
	public void setProoforg(String prooforg) {
		this.prooforg = prooforg;
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
	public String getFrom2() {
		return from2;
	}
	public void setFrom2(String from2) {
		this.from2 = from2;
	}
	public String getProofname() {
		return proofname;
	}
	public void setProofname(String proofname) {
		this.proofname = proofname;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
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
	public String getDel() {
		return del;
	}
	public void setDel(String del) {
		this.del = del;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getAttrorg() {
		return attrorg;
	}
	public void setAttrorg(String attrorg) {
		this.attrorg = attrorg;
	}
	public String getEmploydate() {
		return employdate;
	}
	public void setEmploydate(String employdate) {
		this.employdate = employdate;
	}
	public String getUnemploydate() {
		return unemploydate;
	}
	public void setUnemploydate(String unemploydate) {
		this.unemploydate = unemploydate;
	}
	public String getParttime() {
		return parttime;
	}
	public void setParttime(String parttime) {
		this.parttime = parttime;
	}
	public String getApplytype() {
		return applytype;
	}
	public void setApplytype(String applytype) {
		this.applytype = applytype;
	}
	public String getRespdate() {
		return respdate;
	}
	public void setRespdate(String respdate) {
		this.respdate = respdate;
	}
	public String getByzd1() {
		return byzd1;
	}
	public void setByzd1(String byzd1) {
		this.byzd1 = byzd1;
	}
	public String getByzd2() {
		return byzd2;
	}
	public void setByzd2(String byzd2) {
		this.byzd2 = byzd2;
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
	public String getAuditdate() {
		return auditdate;
	}
	public void setAuditdate(String auditdate) {
		this.auditdate = auditdate;
	}
	public String getExam_date() {
		return exam_date;
	}
	public void setExam_date(String exam_date) {
		this.exam_date = exam_date;
	}
	public int getExam_score() {
		return exam_score;
	}
	public void setExam_score(int exam_score) {
		this.exam_score = exam_score;
	}
	public int getTrain_hour() {
		return train_hour;
	}
	public void setTrain_hour(int train_hour) {
		this.train_hour = train_hour;
	}
	public String getTrain_end() {
		return train_end;
	}
	public void setTrain_end(String train_end) {
		this.train_end = train_end;
	}
	public String getTrain_start() {
		return train_start;
	}
	public void setTrain_start(String train_start) {
		this.train_start = train_start;
	}
	public String getTrain_id() {
		return train_id;
	}
	public void setTrain_id(String train_id) {
		this.train_id = train_id;
	}
	public String getFzdate() {
		return fzdate;
	}
	public void setFzdate(String fzdate) {
		this.fzdate = fzdate;
	}
	public String getPass_direct() {
		return pass_direct;
	}
	public void setPass_direct(String pass_direct) {
		this.pass_direct = pass_direct;
	}


}
