package com.wr4.domain;

import java.io.Serializable;

public class ExchangeCertInfo implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//pn_reg表中字段
	private String   userid         ; 
	private String 	userpass        ;
	private String 	beginfile       ;
	private String 	pass_direct     ;
	private String 	resp_reg        ;
	private String 	resume          ;
	private String 	comefrom        ; 
	private String 	cdate           ; 
	private String 	admin2          ; 
	private String 	pcode           ; 
	private String 	proof           ; 
	private String 	edu             ; 
	private String 	pid             ; 
	private String 	username        ; 
	private String 	train           ; 
	private String 	proofmobile     ; 
	private String 	prof            ; 
	private String 	org             ; 
	private String 	photo           ; 
	private String 	title           ; 
	private String 	import_date     ; 
	private String 	begindate       ; 
	private String 	perf            ; 
	private String 	titlefile       ; 
	private String 	proof2          ; 
	private String 	perf2           ; 
	private String 	proof3          ; 
	private String 	email           ; 
	private String 	type            ; 
	private String 	fax             ; 
	private String 	major           ; 
	private String 	prooforg        ; 
	private String 	address         ; 
	private String 	mobile          ; 
	private String 	from2           ; 
	private String 	proofname       ; 
	private String 	cid             ; 
	private String 	admin           ; 
	private String 	tel             ; 
	private String 	workinfo        ; 
	private String 	proofback       ; 
	private String 	changereason    ; 
	private String 	continuecert    ; 
	private String 	proofperformance; 
	private String 	advice          ; 
	private String 	attrorg         ; 
	private String 	employdate      ; 
	private String 	unemploydate    ; 
	private String 	parttime        ;
	//cert表中字段
	private String 	certnumber   ;
	private String 	fzdate       ;
	private String 	certtype     ;
	private String 	certstatus   ;
	private String 	reason       ;
	private String 	stopdate     ;
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
	public String getAdvice() {
		return advice;
	}
	public void setAdvice(String advice) {
		this.advice = advice;
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
	public String getCertnumber() {
		return certnumber;
	}
	public void setCertnumber(String certnumber) {
		this.certnumber = certnumber;
	}
	public String getFzdate() {
		return fzdate;
	}
	public void setFzdate(String fzdate) {
		this.fzdate = fzdate;
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
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getStopdate() {
		return stopdate;
	}
	public void setStopdate(String stopdate) {
		this.stopdate = stopdate;
	}
	
}
