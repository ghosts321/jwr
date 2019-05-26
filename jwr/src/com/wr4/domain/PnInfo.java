package com.wr4.domain;

import java.io.Serializable;
import java.util.List;

public class PnInfo implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	//pn_reg 字段
	private int rn;
	private int id;
	private String   userid;
	private String 	userpass;
	private String 	usertype;
	private String 	beginfile;
	private String 	pass_direct;
	private String 	resp_reg;
	private String 	resume;
	private String 	comefrom;
	private String 	cdate;
	private String 	admin2;
	private String 	pcode;
	private String 	proof;
//	private String 	advice;
	private String 	edu;
	private String 	pid;
	private String 	username;
	private String 	train;
	private String 	proofmobile;
	private String 	prof;
	private String 	org;
	private String 	photo;
	private String 	title;
	private String 	import_date;
	private String 	begindate;
	private String 	perf;
	private String 	titlefile;
	private String 	proof2;
	private String 	perf2;
	private String 	proof3;
	private String 	email;
	private String 	type;
	private String 	fax;
	private String 	major;
	private String 	prooforg;
	private String 	address;
	private String 	mobile;
	private String 	from2;
	private String 	proofname;
	private String 	cid;
	private String 	admin;
	private String 	tel;
	private String 	workinfo;
	private String 	proofback;
	private String 	changereason;
	private String 	continuecert;
	private String 	proofperformance;
	private String attrorg;
	private String employdate;
	private String unemploydate;
	private String parttime;
	private String auditresp;//审核结果
	//cert 字段
	private String fzdate;
	private String certnumber;
	private String certtype;
	private String certstatus;
	//pn_train 字段
	private String  pn_id      ;
	private String	pnname     ;
	private String	train_start;
	private String	train_end  ;
	private String	train_hour ;
	private String	exam_score ;
	private String	exam_date  ;
	private String	train_id   ;
	private String	bustype    ;
	private String	adminmot   ;
	private String	del        ;
	//examine 字段
//	private String  userid     ;
	private String	status     ;
	private String	auditer_mot;
	private String	auditer    ;
	private String	auditdate  ;
	private String	advice     ;
	private String	audittype  ;
	private String	results    ;
	private String  auditname;
	private String  fromaddress;//常住地
	private String  bussinestype;//申请专业类型（不得多于两种）
	private String  workdoc;//主要工作简历
	private String  perf1;//专业技术职称及相关材料 数据库中缺失字段
	private String  renew;//换证原因 数据库缺失
	private String  edu2;//继续教育证明<b>（仅换证申请）   数据库缺失
	private String  comdate;//申请提交时间
	private String  train_status;//受理结果
	private String  train_date;//受理日期
	private String createdate;
	 
	private String respdate;//初审时间
	
	private String adminMotName;
	private String directname;
	private String typename;
	private String regrespremark;
	private String regresp;
	private String   userId;
	
	private String   du_code;
	private String   du_name;
	private String   jiebie;
	private String   sz_city;
	private String   sz_province;
	private String   city;//所在市
	private String   uno;//U盘号
	private String   orgproof;//工作业绩证明<b>（仅换证申请）
	
	private int start;
	private int pagesize;
	
	
	
	public String getUno() {
		return uno;
	}
	public void setUno(String uno) {
		this.uno = uno;
	}
	public String getOrgproof() {
		return orgproof;
	}
	public void setOrgproof(String orgproof) {
		this.orgproof = orgproof;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getDu_code() {
		return du_code;
	}
	public void setDu_code(String du_code) {
		this.du_code = du_code;
	}
	public String getDu_name() {
		return du_name;
	}
	public void setDu_name(String du_name) {
		this.du_name = du_name;
	}
	public String getSz_city() {
		return sz_city;
	}
	public void setSz_city(String sz_city) {
		this.sz_city = sz_city;
	}
	public String getSz_province() {
		return sz_province;
	}
	public void setSz_province(String sz_province) {
		this.sz_province = sz_province;
	}
	public String getJiebie() {
		return jiebie;
	}
	public void setJiebie(String jiebie) {
		this.jiebie = jiebie;
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
	public String getAuditresp() {
		return auditresp;
	}
	public void setAuditresp(String auditresp) {
		this.auditresp = auditresp;
	}
	public String getFromaddress() {
		return fromaddress;
	}
	public void setFromaddress(String fromaddress) {
		this.fromaddress = fromaddress;
	}
	public String getBussinestype() {
		return bussinestype;
	}
	public void setBussinestype(String bussinestype) {
		this.bussinestype = bussinestype;
	}
	public String getWorkdoc() {
		return workdoc;
	}
	public void setWorkdoc(String workdoc) {
		this.workdoc = workdoc;
	}
	public String getPerf1() {
		return perf1;
	}
	public void setPerf1(String perf1) {
		this.perf1 = perf1;
	}
	public String getRenew() {
		return renew;
	}
	public void setRenew(String renew) {
		this.renew = renew;
	}
	public String getEdu2() {
		return edu2;
	}
	public void setEdu2(String edu2) {
		this.edu2 = edu2;
	}
	public String getComdate() {
		return comdate;
	}
	public void setComdate(String comdate) {
		this.comdate = comdate;
	}
	public String getTrain_status() {
		return train_status;
	}
	public void setTrain_status(String train_status) {
		this.train_status = train_status;
	}
	public String getTrain_date() {
		return train_date;
	}
	public void setTrain_date(String train_date) {
		this.train_date = train_date;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	public String getRespdate() {
		return respdate;
	}
	public void setRespdate(String respdate) {
		this.respdate = respdate;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAuditname() {
		return auditname;
	}
	public void setAuditname(String auditname) {
		this.auditname = auditname;
	}
	public String getCerttype() {
		return certtype;
	}
	public void setCerttype(String certtype) {
		this.certtype = certtype;
	}
	public String getCertstatus() {
		return certstatus;
	}
	public void setCertstatus(String certstatus) {
		this.certstatus = certstatus;
	}
	public String getPn_id() {
		return pn_id;
	}
	public void setPn_id(String pn_id) {
		this.pn_id = pn_id;
	}
	public String getPnname() {
		return pnname;
	}
	public void setPnname(String pnname) {
		this.pnname = pnname;
	}
	public String getTrain_start() {
		return train_start;
	}
	public void setTrain_start(String train_start) {
		this.train_start = train_start;
	}
	public String getTrain_end() {
		return train_end;
	}
	public void setTrain_end(String train_end) {
		this.train_end = train_end;
	}
	public String getTrain_hour() {
		return train_hour;
	}
	public void setTrain_hour(String train_hour) {
		this.train_hour = train_hour;
	}
	public String getExam_score() {
		return exam_score;
	}
	public void setExam_score(String exam_score) {
		this.exam_score = exam_score;
	}
	public String getExam_date() {
		return exam_date;
	}
	public void setExam_date(String exam_date) {
		this.exam_date = exam_date;
	}
	public String getTrain_id() {
		return train_id;
	}
	public void setTrain_id(String train_id) {
		this.train_id = train_id;
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
	public String getDel() {
		return del;
	}
	public void setDel(String del) {
		this.del = del;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getAuditer_mot() {
		return auditer_mot;
	}
	public void setAuditer_mot(String auditer_mot) {
		this.auditer_mot = auditer_mot;
	}
	public String getAuditer() {
		return auditer;
	}
	public void setAuditer(String auditer) {
		this.auditer = auditer;
	}
	public String getAuditdate() {
		return auditdate;
	}
	public void setAuditdate(String auditdate) {
		this.auditdate = auditdate;
	}
	public String getAudittype() {
		return audittype;
	}
	public void setAudittype(String audittype) {
		this.audittype = audittype;
	}
	public String getResults() {
		return results;
	}
	public void setResults(String results) {
		this.results = results;
	}
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
	public String getCertnumber() {
		return certnumber;
	}
	public void setCertnumber(String certnumber) {
		this.certnumber = certnumber;
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
	public String getUsertype() {
		return usertype;
	}
	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}
	public String getBeginfile() {
		return beginfile;
	}
	public void setBeginfile(String beginfile) {
		this.beginfile = beginfile;
	}
	public String getPass_direct() {
		return pass_direct;
	}
	public void setPass_direct(String pass_direct) {
		this.pass_direct = pass_direct;
	}
	public String getResp_reg() {
		return resp_reg;
	}
	public void setResp_reg(String resp_reg) {
		this.resp_reg = resp_reg;
	}
	public String getResume() {
		return resume;
	}
	public void setResume(String resume) {
		this.resume = resume;
	}
	public String getComefrom() {
		return comefrom;
	}
	public void setComefrom(String comefrom) {
		this.comefrom = comefrom;
	}
	public String getCdate() {
		return cdate;
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	public String getAdmin2() {
		return admin2;
	}
	public void setAdmin2(String admin2) {
		this.admin2 = admin2;
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
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
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
	public String getImport_date() {
		return import_date;
	}
	public void setImport_date(String import_date) {
		this.import_date = import_date;
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
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
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getWorkinfo() {
		return workinfo;
	}
	public void setWorkinfo(String workinfo) {
		this.workinfo = workinfo;
	}
	public String getProofback() {
		return proofback;
	}
	public void setProofback(String proofback) {
		this.proofback = proofback;
	}
	public String getChangereason() {
		return changereason;
	}
	public void setChangereason(String changereason) {
		this.changereason = changereason;
	}
	public String getContinuecert() {
		return continuecert;
	}
	public void setContinuecert(String continuecert) {
		this.continuecert = continuecert;
	}
	public String getProofperformance() {
		return proofperformance;
	}
	public void setProofperformance(String proofperformance) {
		this.proofperformance = proofperformance;
	}
	public String getFzdate() {
		return fzdate;
	}
	public void setFzdate(String fzdate) {
		this.fzdate = fzdate;
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
	public void setAdminMotName(String adminMotName) {
		this.adminMotName = adminMotName;
	}
	public String getAdminMotName() {
		return adminMotName;
	}
	public String getDirectname() {
		return directname;
	}
	public void setDirectname(String directname) {
		this.directname = directname;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
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
