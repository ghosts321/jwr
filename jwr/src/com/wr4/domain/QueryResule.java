package com.wr4.domain;

public class QueryResule {
	private String text;
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	private int rn;//序号
	private String  adminmot;//主管机关
	private String  adminmot2;//主管机关 地市级
	private String  pnname;//姓名
	private String  pid;//身份证号
	private String  fromaddress;//常住地
	private String  from2;//常住地 地市级
	private String  photo;//照片
	private String  org;//工作单位
	private String  title;//职称
	private String  address;//通讯地址
	private String  pcode;//邮编
	private String  tel;//电话
	private String  fax;//传真号码
	private String  mobile;//手机
	private String  email;//联系人邮箱
	private String  edu;//文化程度
	private String  major;//所学专业
	private String  prof;//现从事专业
	private String  begindate;//相关专业从业年份
	private String  bussinestype;//申请专业类型（不得多于两种）
	private String  train;//主要学习（培训）经历
	private String  workdoc;//主要工作简历
	private String  perf;//专业工作业绩
	private String  perf1;//专业技术职称及相关材料 数据库中缺失字段
	private String  perf2;//专业工作业绩附件
	private String  proof;//身份证明文件
	private String  proof2;//学历证明文件
	private String  proof3;//培训合格证明文件
	private String  renew;//换证原因 数据库缺失
	private String  edu2;//继续教育证明<b>（仅换证申请）   数据库缺失
	private String  prooforg;//证明单位
	private String  comdate;//申请提交时间
	private String  train_status;//受理结果
	private String  train_date;//受理日期
	private String cid;//证书号
	private String createdate;
	private String results; //流程表中受理结果
	private String auditdate;//流程表中受理日期
	private String userid;//用户登录名
	private String respdate;//初审时间
	private String parttime;//专兼职
	private String employdate;//聘用日期
	private String unemploydate;//解聘日期
	private int id;//用户ID
	private String proofb;//身份证（背面）
	private String auditresp;//身份证（背面）
	//cert 字段
	private String fzdate;
	private String certnumber;
	private String certtype;
	private String certstatus;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getResults() {
		return results;
	}
	public void setResults(String results) {
		this.results = results;
	}
	public String getAuditdate() {
		return auditdate;
	}
	public void setAuditdate(String auditdate) {
		this.auditdate = auditdate;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
	public String getPnname() {
		return pnname;
	}
	public void setPnname(String pnname) {
		this.pnname = pnname;
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
	public String getAdminmot() {
		return adminmot;
	}
	public void setAdminmot(String adminmot) {
		this.adminmot = adminmot;
	}
	public String getAdminmot2() {
		return adminmot2;
	}
	public void setAdminmot2(String adminmot2) {
		this.adminmot2 = adminmot2;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getFromaddress() {
		return fromaddress;
	}
	public void setFromaddress(String fromaddress) {
		this.fromaddress = fromaddress;
	}
	public String getFrom2() {
		return from2;
	}
	public void setFrom2(String from2) {
		this.from2 = from2;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getOrg() {
		return org;
	}
	public void setOrg(String org) {
		this.org = org;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEdu() {
		return edu;
	}
	public void setEdu(String edu) {
		this.edu = edu;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getProf() {
		return prof;
	}
	public void setProf(String prof) {
		this.prof = prof;
	}
	public String getBegindate() {
		return begindate;
	}
	public void setBegindate(String begindate) {
		this.begindate = begindate;
	}
	public String getBussinestype() {
		return bussinestype;
	}
	public void setBussinestype(String bussinestype) {
		this.bussinestype = bussinestype;
	}
	public String getTrain() {
		return train;
	}
	public void setTrain(String train) {
		this.train = train;
	}
	public String getWorkdoc() {
		return workdoc;
	}
	public void setWorkdoc(String workdoc) {
		this.workdoc = workdoc;
	}
	public String getPerf() {
		return perf;
	}
	public void setPerf(String perf) {
		this.perf = perf;
	}
	public String getPerf1() {
		return perf1;
	}
	public void setPerf1(String perf1) {
		this.perf1 = perf1;
	}
	public String getPerf2() {
		return perf2;
	}
	public void setPerf2(String perf2) {
		this.perf2 = perf2;
	}
	public String getProof() {
		return proof;
	}
	public void setProof(String proof) {
		this.proof = proof;
	}
	public String getProof2() {
		return proof2;
	}
	public void setProof2(String proof2) {
		this.proof2 = proof2;
	}
	public String getProof3() {
		return proof3;
	}
	public void setProof3(String proof3) {
		this.proof3 = proof3;
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
	public String getProoforg() {
		return prooforg;
	}
	public void setProoforg(String prooforg) {
		this.prooforg = prooforg;
	}
	
	public String getRespdate() {
		return respdate;
	}
	public void setRespdate(String respdate) {
		this.respdate = respdate;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getParttime() {
		return parttime;
	}
	public void setParttime(String parttime) {
		this.parttime = parttime;
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
	public String getProofb() {
		return proofb;
	}
	public void setProofb(String proofb) {
		this.proofb = proofb;
	}
	public String getAuditresp() {
		return auditresp;
	}
	public void setAuditresp(String auditresp) {
		this.auditresp = auditresp;
	}
	public String getFzdate() {
		return fzdate;
	}
	public void setFzdate(String fzdate) {
		this.fzdate = fzdate;
	}
	public String getCertnumber() {
		return certnumber;
	}
	public void setCertnumber(String certnumber) {
		this.certnumber = certnumber;
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
	
}
