package com.wr4.domain;

public class PnApply {
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
	private String resp_reg;//初审结果
	//cert 字段
	private String fzdate;
	private String certnumber;
	private String certtype;
	private String certstatus;
	private String adminMotName;
	private String bustype;
	private String pass_direct;// 直接颁发   PASS_DIRECT
	private String directjon;//DIRECTJOB 直接颁发人职务
	private String directname;//直接颁发人姓名
	private String advice;//处理意见
	private String city;//所在市
	private String import_date;//导入时间
	private String proofmobile;//证明人联系电话
	private String proofname;//证明人
	private String beginfile;//相关专业从业年份证明文件
	private String titlefile;//职称证明文件
	private String del;//删除标识
	private String advice_reg;//初审意见
	private String cdate;//发证时间
	private String remark;//备注
	private String direct_name;//签发人姓名
	private String resp;//受理结果
	private String direct_title;//签发人职务
	private String orgproof;//工作业绩证明<b>（仅换证申请）
	private String train_end;//培训结束日期
	private String train_start;//培训开始日期
	private String train_hour;//培训学时
	private String exam_score;//考试分数
	private String attrorg;//所属考评机构
	private String train_id;//培训合格证号
	private String exam_date;//考试日期
	private String uno;//优盘号
	private String sex;//性别
	private String stopdate;//性别
	
	
	
	
	
	
	
	
	public String getStopdate() {
		return stopdate;
	}
	public void setStopdate(String stopdate) {
		this.stopdate = stopdate;
	}
	public String getExam_date() {
		return exam_date;
	}
	public void setExam_date(String exam_date) {
		this.exam_date = exam_date;
	}
	public String getUno() {
		return uno;
	}
	public void setUno(String uno) {
		this.uno = uno;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getTrain_id() {
		return train_id;
	}
	public void setTrain_id(String train_id) {
		this.train_id = train_id;
	}
	public String getAttrorg() {
		return attrorg;
	}
	public void setAttrorg(String attrorg) {
		this.attrorg = attrorg;
	}
	public String getExam_score() {
		return exam_score;
	}
	public void setExam_score(String exam_score) {
		this.exam_score = exam_score;
	}
	public String getTrain_hour() {
		return train_hour;
	}
	public void setTrain_hour(String train_hour) {
		this.train_hour = train_hour;
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
	public String getOrgproof() {
		return orgproof;
	}
	public void setOrgproof(String orgproof) {
		this.orgproof = orgproof;
	}
	public String getDirect_title() {
		return direct_title;
	}
	public void setDirect_title(String direct_title) {
		this.direct_title = direct_title;
	}
	public String getResp() {
		return resp;
	}
	public void setResp(String resp) {
		this.resp = resp;
	}
	public String getDirect_name() {
		return direct_name;
	}
	public void setDirect_name(String direct_name) {
		this.direct_name = direct_name;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getCdate() {
		return cdate;
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	public String getAdvice_reg() {
		return advice_reg;
	}
	public void setAdvice_reg(String advice_reg) {
		this.advice_reg = advice_reg;
	}
	public String getDel() {
		return del;
	}
	public void setDel(String del) {
		this.del = del;
	}
	public String getTitlefile() {
		return titlefile;
	}
	public void setTitlefile(String titlefile) {
		this.titlefile = titlefile;
	}
	public String getBeginfile() {
		return beginfile;
	}
	public void setBeginfile(String beginfile) {
		this.beginfile = beginfile;
	}
	public String getProofname() {
		return proofname;
	}
	public void setProofname(String proofname) {
		this.proofname = proofname;
	}
	public String getProofmobile() {
		return proofmobile;
	}
	public void setProofmobile(String proofmobile) {
		this.proofmobile = proofmobile;
	}
	public String getImport_date() {
		return import_date;
	}
	public void setImport_date(String import_date) {
		this.import_date = import_date;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getPass_direct() {
		return pass_direct;
	}
	public void setPass_direct(String pass_direct) {
		this.pass_direct = pass_direct;
	}
	public String getDirectjon() {
		return directjon;
	}
	public void setDirectjon(String directjon) {
		this.directjon = directjon;
	}
	public String getDirectname() {
		return directname;
	}
	public void setDirectname(String directname) {
		this.directname = directname;
	}
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
	public String getResp_reg() {
		return resp_reg;
	}
	public void setResp_reg(String resp_reg) {
		this.resp_reg = resp_reg;
	}
	public void setAdminMotName(String adminMotName) {
		this.adminMotName = adminMotName;
	}
	public String getAdminMotName() {
		return adminMotName;
	}
	public void setBustype(String bustype) {
		this.bustype = bustype;
	}
	public String getBustype() {
		return bustype;
	}
	public String getAdvice() {
		return advice;
	}
	public void setAdvice(String advice) {
		this.advice = advice;
	}
	
	
}
