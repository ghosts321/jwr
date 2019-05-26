package com.wr4.domain;
/**
 * 考评员注册表
 * @author Administrator
 *
 */
public class PnRegInfo {
	  private String userid         ;  	       //   登录名            
	  private String userpass       ;          //   登录密码     
	  private String beginfile      ;          //   相关专业从业年份证明文件          
	  private String pass_direct    ;          //   直接颁发          
	  private String resp_reg       ;          //   初审结果          
	  private String resume         ;          //   主要工作简历          
	  private String comefrom       ;          //   常住地          
	  private String cdate          ;          //   日期          
	  private String admin2         ;          //   主管机关（地市）          
	  private String pcode          ;          //   邮编          
	  private String proof          ;          //   身份证明文件  v        
	  private String edu            ;          //   文化程度          
	  private String pid            ;          //   证件号          
	  private String username       ;          //   名称          
	  private String train          ;          //   主要学习（培训）经历          
	  private String proofmobile    ;          //   证明人联系电话          
	  private String prof           ;          //   现从事专业          
	  private String org            ;          //   单位组织          
	  private String photo          ;          //   照片          
	  private String title          ;          //   职称          
	  private String import_date    ;          //   导入时间          
	  private String begindate      ;          //   相关专业从业年份          
	  private String perf           ;          //   专业工作业绩          
	  private String titlefile      ;          //   职称证明文件          
	  private String proof2         ;          //   学历证明文件          
	  private String perf2          ;          //   专业工作业绩附件          
	  private String proof3         ;          //   培训合格证明文件          
	  private String email          ;          //   联系人邮箱          
	  private String type           ;          //   业务类型          
	  private String fax            ;          //   传真号码          
	  private String major          ;          //   所学专业          
	  private String prooforg       ;          //   证明单位          
	  private String address        ;          //   通讯地址          
	  private String mobile            ;       //   手机          
	  private String from2             ;       //   常住地（地市）          
	  private String proofname         ;       //   证明人          
	  private String cid               ;       //   证书号          
	  private String admin             ;       //   主管机关          
	  private String tel               ;       //   联系电话          
	  private String workinfo          ;       //   专业技术职称及相关资料          
	  private String proofback         ;       //   身份证明文件（背面）          
	  private String perf1;
	  private String regrespremark;   //初审意见
	  private String regresp;        //初审结果
	  private String regrespuser;     //初审审核人
	  private String proofb; 
	  private int    id;							//主键       
	  private String  loginMotCode;   //当前登录用户主管机关代码
	  private String city;        //所在市
	
	  private int start;
	  private int pagesize;
	
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getLoginMotCode() {
		return loginMotCode;
	}
	public void setLoginMotCode(String loginMotCode) {
		this.loginMotCode = loginMotCode;
	}
	public String getProofb() {
		return proofb;
	}
	public void setProofb(String proofb) {
		this.proofb = proofb;
	}
	public String getPerf1() {
		return perf1;
	}
	public void setPerf1(String perf1) {
		this.perf1 = perf1;
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
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
