package com.wr4.domain;

import java.io.Serializable;

public class EnInfo{
	
	
	/**
	 * 
	 */
	
	private int id;
	private String license;
	private String tax;
	private String date;
	private String cDate;
	private String comment;
	private String orgId1;
	private String advice;
	private String pid;
	private String del;
	private String enname;
	private String safe;
	private String reNew;
	private String report;
	private String province;
	private String provinceName;
	private String cid;
	private String legalp;
	private String grade;
	private String email;
	private String bustype;
	private String resp;
	private String respDateReview;
	private String type2;
	private String contact;
	private String adviceReview;
	private String address;
	private String mobile;
	private String qual;
	private String adminmot;
	private String adminMotName;
	private String respReview;
	private String tel;
	private String respDate;
	private String fzDate;
	private String auditDate;
	private String auditAdvice;
	private String results;
	private String userId;
	private String orgId;
	private String applyType;
	private String busType;
	private String filetext;
	private String uppername;
	private String auditdate;
	private int rn;
	private String changedate;//换证审批时间
	private String changeresault;//换证审批结果 
	private String changereason;//换证审批意见
	private String createdate;//创建时间
	private String zpreport;//企业自评报告
	private String remarks;//备注
	private String pncidlist;//考评员cid
	private String resp0;//考评员cid
	private String resp_review0;//考评员cid
	
	//分页专用
	private int start;
	private int pagesize;
	
	
	/**
	 *  zpscore String 字段企业自评分
	 */
	private String zpscore;
	private String kpscore;
 
	private String kpadvice;
	private String kpdate;
	private String kpresult;
	private String apporg;//选择的考评机构  orgid1 做为指定的考评机构
	private String apporgname;//选择的考评机构  orgid1 做为指定的考评机构
	private String slAdvice;
	private String slResult;
	private String slDate;
	private String regrespremark;
	private String regresp;
	private String city;
	private String cityname;
	private String score1;
	private String resp_reg;        
	private String advice_reg;      
	private String uid;             
	private String forgid;          
	private String fother;          
	private String cpid;            
	private String business;        
	private String score0;          
	private String resp_eval ;      
	private String respdate_eval ;  
	private String advice_eval;     
	private String orgid_comment;   
	private String stand0;          
	private String pnids;           
	private String pnids1;          
	private String stand1;          
	private String uno;             
	private String type;            
	private String auditername;            
	
	private String area;
	
	
	public String getAuditername() {
		return auditername;
	}
	public void setAuditername(String auditername) {
		this.auditername = auditername;
	}
	public String getApporgname() {
		return apporgname;
	}
	public void setApporgname(String apporgname) {
		this.apporgname = apporgname;
	}
	public String getScore1() {
		return score1;
	}
	public void setScore1(String score1) {
		this.score1 = score1;
	}
	public String getResp_reg() {
		return resp_reg;
	}
	public void setResp_reg(String resp_reg) {
		this.resp_reg = resp_reg;
	}
	public String getAdvice_reg() {
		return advice_reg;
	}
	public void setAdvice_reg(String advice_reg) {
		this.advice_reg = advice_reg;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getForgid() {
		return forgid;
	}
	public void setForgid(String forgid) {
		this.forgid = forgid;
	}
	public String getFother() {
		return fother;
	}
	public void setFother(String fother) {
		this.fother = fother;
	}
	public String getCpid() {
		return cpid;
	}
	public void setCpid(String cpid) {
		this.cpid = cpid;
	}
	public String getBusiness() {
		return business;
	}
	public void setBusiness(String business) {
		this.business = business;
	}
	public String getScore0() {
		return score0;
	}
	public void setScore0(String score0) {
		this.score0 = score0;
	}
	public String getResp_eval() {
		return resp_eval;
	}
	public void setResp_eval(String resp_eval) {
		this.resp_eval = resp_eval;
	}
	public String getRespdate_eval() {
		return respdate_eval;
	}
	public void setRespdate_eval(String respdate_eval) {
		this.respdate_eval = respdate_eval;
	}
	public String getAdvice_eval() {
		return advice_eval;
	}
	public void setAdvice_eval(String advice_eval) {
		this.advice_eval = advice_eval;
	}
	public String getOrgid_comment() {
		return orgid_comment;
	}
	public void setOrgid_comment(String orgid_comment) {
		this.orgid_comment = orgid_comment;
	}
	public String getStand0() {
		return stand0;
	}
	public void setStand0(String stand0) {
		this.stand0 = stand0;
	}
	public String getPnids() {
		return pnids;
	}
	public void setPnids(String pnids) {
		this.pnids = pnids;
	}
	public String getPnids1() {
		return pnids1;
	}
	public void setPnids1(String pnids1) {
		this.pnids1 = pnids1;
	}
	public String getStand1() {
		return stand1;
	}
	public void setStand1(String stand1) {
		this.stand1 = stand1;
	}
	public String getUno() {
		return uno;
	}
	public void setUno(String uno) {
		this.uno = uno;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getResp0() {
		return resp0;
	}
	public void setResp0(String resp0) {
		this.resp0 = resp0;
	}
	public String getResp_review0() {
		return resp_review0;
	}
	public void setResp_review0(String resp_review0) {
		this.resp_review0 = resp_review0;
	}
	public String getPncidlist() {
		return pncidlist;
	}
	public void setPncidlist(String pncidlist) {
		this.pncidlist = pncidlist;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getCityname() {
		return cityname;
	}
	public void setCityname(String cityname) {
		this.cityname = cityname;
	}
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
	public String getApporg() {
		return apporg;
	}
	public void setApporg(String apporg) {
		this.apporg = apporg;
	}
	public String getZpscore() {
		return zpscore;
	}
	public void setZpscore(String zpscore) {
		this.zpscore = zpscore;
	}
	public String getKpscore() {
		return kpscore;
	}
	public void setKpscore(String kpscore) {
		this.kpscore = kpscore;
	}
	public String getKpadvice() {
		return kpadvice;
	}
	public void setKpadvice(String kpadvice) {
		this.kpadvice = kpadvice;
	}
	public String getKpdate() {
		return kpdate;
	}
	public void setKpdate(String kpdate) {
		this.kpdate = kpdate;
	}
	public String getKpresult() {
		return kpresult;
	}
	public void setKpresult(String kpresult) {
		this.kpresult = kpresult;
	}
	public String getZpreport() {
		return zpreport;
	}
	public void setZpreport(String zpreport) {
		this.zpreport = zpreport;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	public String getChangereason() {
		return changereason;
	}
	public void setChangereason(String changereason) {
		this.changereason = changereason;
	}
	public String getChangedate() {
		return changedate;
	}
	public void setChangedate(String changedate) {
		this.changedate = changedate;
	}
	public String getChangeresault() {
		return changeresault;
	}
	public void setChangeresault(String changeresault) {
		this.changeresault = changeresault;
	}
	private String motname;
	/*
	 * 受理结果
	 */
	private String respResult;
	/*
	 * 受理意见
	 */
	private String respAdvice;
	/*
	 * 受理日期
	 */
	private String respdate;
	/*
	 * 考评结果
	 */
	private String orgresult;
	/*
	 * 考评意见
	 */
	private String orgadvice;
	/*
	 * 考评日期
	 */
	private String orgdate;
	private String auditResult;
	/*
	 * 自评分数
	 */
	private String selfScore;
	/*
	 * 考评分数
	 */
	private String kaoScore;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLicense() {
		return license;
	}
	public void setLicense(String license) {
		this.license = license;
	}
	public String getTax() {
		return tax;
	}
	public void setTax(String tax) {
		this.tax = tax;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getcDate() {
		return cDate;
	}
	public void setcDate(String cDate) {
		this.cDate = cDate;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getOrgId1() {
		return orgId1;
	}
	public void setOrgId1(String orgId1) {
		this.orgId1 = orgId1;
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
	public String getDel() {
		return del;
	}
	public void setDel(String del) {
		this.del = del;
	}
	public String getSafe() {
		return safe;
	}
	public void setSafe(String safe) {
		this.safe = safe;
	}
	public String getReNew() {
		return reNew;
	}
	public void setReNew(String reNew) {
		this.reNew = reNew;
	}
	public String getReport() {
		return report;
	}
	public void setReport(String report) {
		this.report = report;
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

	public String getResp() {
		return resp;
	}
	public void setResp(String resp) {
		this.resp = resp;
	}
	public String getRespDateReview() {
		return respDateReview;
	}
	public void setRespDateReview(String respDateReview) {
		this.respDateReview = respDateReview;
	}
	public String getType2() {
		return type2;
	}
	public void setType2(String type2) {
		this.type2 = type2;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getAdviceReview() {
		return adviceReview;
	}
	public void setAdviceReview(String adviceReview) {
		this.adviceReview = adviceReview;
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
	public String getQual() {
		return qual;
	}
	public void setQual(String qual) {
		this.qual = qual;
	}
	public String getRespReview() {
		return respReview;
	}
	public void setRespReview(String respReview) {
		this.respReview = respReview;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getRespDate() {
		return respDate;
	}
	public void setRespDate(String respDate) {
		this.respDate = respDate;
	}
	public String getFzDate() {
		return fzDate;
	}
	public void setFzDate(String fzDate) {
		this.fzDate = fzDate;
	}
	public String getAuditDate() {
		return auditDate;
	}
	public void setAuditDate(String auditDate) {
		this.auditDate = auditDate;
	}
	public String getAuditAdvice() {
		return auditAdvice;
	}
	public void setAuditAdvice(String auditAdvice) {
		this.auditAdvice = auditAdvice;
	}
	public String getResults() {
		return results;
	}
	public void setResults(String results) {
		this.results = results;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getOrgId() {
		return orgId;
	}
	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}
	public String getApplyType() {
		return applyType;
	}
	public void setApplyType(String applyType) {
		this.applyType = applyType;
	}
	public String getBusType() {
		return busType;
	}
	public void setBusType(String busType) {
		this.busType = busType;
	}
	public String getEnname() {
		return enname;
	}
	public void setEnname(String enname) {
		this.enname = enname;
	}
	public String getBustype() {
		return bustype;
	}
	public void setBustype(String bustype) {
		this.bustype = bustype;
	}
	public String getAdminmot() {
		return adminmot;
	}
	public void setAdminmot(String adminmot) {
		this.adminmot = adminmot;
	}
	public String getProvinceName() {
		return provinceName;
	}
	public void setProvinceName(String provinceName) {
		this.provinceName = provinceName;
	}
	public String getAdminMotName() {
		return adminMotName;
	}
	public void setAdminMotName(String adminMotName) {
		this.adminMotName = adminMotName;
	}
	public String getFiletext() {
		return filetext;
	}
	public void setFiletext(String filetext) {
		this.filetext = filetext;
	}
	public String getUppername() {
		return uppername;
	}
	public void setUppername(String uppername) {
		this.uppername = uppername;
	}
	public String getAuditdate() {
		return auditdate;
	}
	public void setAuditdate(String auditdate) {
		this.auditdate = auditdate;
	}
	public String getRespResult() {
		return respResult;
	}
	public void setRespResult(String respResult) {
		this.respResult = respResult;
	}
	public String getRespAdvice() {
		return respAdvice;
	}
	public void setRespAdvice(String respAdvice) {
		this.respAdvice = respAdvice;
	}
	public String getRespdate() {
		return respdate;
	}
	public void setRespdate(String respdate) {
		this.respdate = respdate;
	}
	public String getOrgresult() {
		return orgresult;
	}
	public void setOrgresult(String orgresult) {
		this.orgresult = orgresult;
	}
	public String getOrgadvice() {
		return orgadvice;
	}
	public void setOrgadvice(String orgadvice) {
		this.orgadvice = orgadvice;
	}
	public String getOrgdate() {
		return orgdate;
	}
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
	public String getMotname() {
		return motname;
	}
	public void setMotname(String motname) {
		this.motname = motname;
	}
	public void setOrgdate(String orgdate) {
		this.orgdate = orgdate;
	}
	public String getAuditResult() {
		return auditResult;
	}
	public void setAuditResult(String auditResult) {
		this.auditResult = auditResult;
	}
	public String getSelfScore() {
		return selfScore;
	}
	public void setSelfScore(String selfScore) {
		this.selfScore = selfScore;
	}
	public String getKaoScore() {
		return kaoScore;
	}
	public void setKaoScore(String kaoScore) {
		this.kaoScore = kaoScore;
	}
	public String getSlAdvice() {
		return slAdvice;
	}
	public void setSlAdvice(String slAdvice) {
		this.slAdvice = slAdvice;
	}
	public String getSlResult() {
		return slResult;
	}
	public void setSlResult(String slResult) {
		this.slResult = slResult;
	}
	public String getSlDate() {
		return slDate;
	}
	public void setSlDate(String slDate) {
		this.slDate = slDate;
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
