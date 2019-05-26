package com.wr4.domain;

import java.io.Serializable;

/**
 * 类说明：用户表
 * 
 * @author 作者: zhangli
 * @version 创建时间：2013年10月29日 15:10:19
 */
public class User implements Serializable {
	private static final long serialVersionUID = -4415990281535582814L;
	public static long getSerialVersionUID() {
		return serialVersionUID;
	}
	private Integer id;
	private String user_id;
	private String user_pass;
	private String password;
	private String commonname; //用户名称
	private String usertype;   //用户角色，根据usertype来判断进入系统后的菜单显示
	private String paperid;//用户所属组织id
	private String del;//用户删除标识,1:已删除的用户信息  0：未删除的用户
	private String mot;//用户所属的主管机关代码
    private String orgid;
    private String remark;//用于登录日志 记录信息
    private String createdate;//
    private String mobiletelephone;//联系人手机
    private String telephonenumber;//联系人电话
    private String contact;//联系人
    private String isread;//是否只读
    private String email;//联系人邮箱
    private String fax;//联系人传真
    private String address;//通讯地址
    private String tel;//联系电话
    private String motname;//主管机关名称
    private String regresp="同意";//查询出的用户 初审结果都为同意
    private String iswrite;//是否查看权限
    private String province;//所在省市
    private String provincename;//所在省市名称
    private String grade;//等级
    private String bustype;//业务类型
    private String busclass;//业务类别
    private String respuserid;//审批的那个用户 用于 记录审批日志
    private String regresps;//审批结果
    private String usable;//是否可用
    private String registerdate;//用户创建时间
    private String legalp;//法人代表
    private String city; //所在市
    
    
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getRegisterdate() {
		return registerdate;
	}

	public void setRegisterdate(String registerdate) {
		this.registerdate = registerdate;
	}

	public String getUsable() {
		return usable;
	}

	public void setUsable(String usable) {
		this.usable = usable;
	}

	public String getRegresps() {
		return regresps;
	}

	public void setRegresps(String regresps) {
		this.regresps = regresps;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getProvincename() {
		return provincename;
	}

	public void setProvincename(String provincename) {
		this.provincename = provincename;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getBustype() {
		return bustype;
	}

	public void setBustype(String bustype) {
		this.bustype = bustype;
	}
	
	public String getBusclass() {
		return busclass;
	}

	public void setBusclass(String busclass) {
		this.busclass = busclass;
	}

	public String getRespuserid() {
		return respuserid;
	}

	public void setRespuserid(String respuserid) {
		this.respuserid = respuserid;
	}

	public String getRegresp() {
		return regresp;
	}

	public void setRegresp(String regresp) {
		this.regresp = regresp;
	}

	public String getIswrite() {
		return iswrite;
	}

	public void setIswrite(String iswrite) {
		this.iswrite = iswrite;
	}

	public String getTelephonenumber() {
		return telephonenumber;
	}

	public void setTelephonenumber(String telephonenumber) {
		this.telephonenumber = telephonenumber;
	}

	public String getMotname() {
		return motname;
	}

	public void setMotname(String motname) {
		this.motname = motname;
	}

	public String getMobiletelephone() {
		return mobiletelephone;
	}

	public void setMobiletelephone(String mobiletelephone) {
		this.mobiletelephone = mobiletelephone;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getIsread() {
		return isread;
	}

	public void setIsread(String isread) {
		this.isread = isread;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getCreatedate() {
		return createdate;
	}

	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getOrgid() {
		return orgid;
	}

	public void setOrgid(String orgid) {
		this.orgid = orgid;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getCommonname() {
		return commonname;
	}

	public String getDel() {
		return del;
	}
	
	public Integer getId() {
		return id;
	}

	public String getMot() {
		return mot;
	}

	public String getPaperid() {
		return paperid;
	}

	public String getPassword() {
		return password;
	}

	public String getUser_id() {
		return user_id;
	}

	public String getUser_pass() {
		return user_pass;
	}

	public String getUsertype() {
		return usertype;
	}

	public void setCommonname(String commonname) {
		this.commonname = commonname;
	}

	public void setDel(String del) {
		this.del = del;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public void setMot(String mot) {
		this.mot = mot;
	}

	public void setPaperid(String paperid) {
		this.paperid = paperid;
	}

	 
	public void setPassword(String password) {
		this.password = password;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

 
	public void setUser_pass(String user_pass) {
		this.user_pass = user_pass;
	}

	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}

	public String getLegalp() {
		return legalp;
	}

	public void setLegalp(String legalp) {
		this.legalp = legalp;
	}
}
