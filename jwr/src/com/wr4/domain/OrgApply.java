
package com.wr4.domain;

import java.util.Date;


/**
 * 功能/模块 ：OrgApply 实体类
 * @author 
 * @version 1.0
 * @Description 数据库表自动维护系统 OrgApply
 * 修订历史：2014-1-7
 * 日期  作者  参考  描述
 * see 相关类连接
 */

public class OrgApply{
	
	private static final long serialVersionUID = 344745915703L;
	
  	
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
	 * 审核结果
	 */
	private String respreview;
	
	private String rn;
	private String motname;
	private String uppername;
	private String filetext;
	private String resp_reg;  //初审结果
	private String advice_reg; //初审意见
	private String cpid;   //联系人身份证号
	private String rule;   //考评管理制度  
	private String uno;    //U盘号
	private String punm;    //U盘号
	private String punm2;    //U盘号


	
	
	
	
	
	public String getPunm() {
		return punm;
	}
	public void setPunm(String punm) {
		this.punm = punm;
	}
	public String getPunm2() {
		return punm2;
	}
	public void setPunm2(String punm2) {
		this.punm2 = punm2;
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
	public String getCpid() {
		return cpid;
	}
	public void setCpid(String cpid) {
		this.cpid = cpid;
	}
	public String getRule() {
		return rule;
	}
	public void setRule(String rule) {
		this.rule = rule;
	}
	public String getUno() {
		return uno;
	}
	public void setUno(String uno) {
		this.uno = uno;
	}
	public String getUppername() {
		return uppername;
	}
	public void setUppername(String uppername) {
		this.uppername = uppername;
	}
	public String getRn() {
		return rn;
	}
	public void setRn(String rn) {
		this.rn = rn;
	}
	public String getMotname() {
		return motname;
	}
	public void setMotname(String motname) {
		this.motname = motname;
	}
	/**
	* 返回日期                           属性的值
	* @return String
	*/ 
	public String getCreatedate() {
		return this.createdate;
	}
	/**
	 * 设置createdate的值
	 * @param createdate String
	 */
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	/**
	* 返回单位基本情况相关材料           属性的值
	* @return String
	*/ 
	public String getMet() {
		return this.met;
	}
	/**
	 * 设置met的值
	 * @param met String
	 */
	public void setMet(String met) {
		this.met = met;
	}
	/**
	* 返回发证时间                       属性的值
	* @return String
	*/ 
	public String getCdate() {
		return this.cdate;
	}
	/**
	 * 设置cdate的值
	 * @param cdate String
	 */
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	/**
	* 返回邮编                           属性的值
	* @return String
	*/ 
	public String getPcode() {
		return this.pcode;
	}
	/**
	 * 设置pcode的值
	 * @param pcode String
	 */
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	/**
	* 返回备注                           属性的值
	* @return String
	*/ 
	public String getRemark() {
		return this.remark;
	}
	/**
	 * 设置remark的值
	 * @param remark String
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}
	/**
	* 返回处理意见                       属性的值
	* @return String
	*/ 
	public String getAdvice() {
		return this.advice;
	}
	/**
	 * 设置advice的值
	 * @param advice String
	 */
	public void setAdvice(String advice) {
		this.advice = advice;
	}
	/**
	* 返回证件号                         属性的值
	* @return String
	*/ 
	public String getPid() {
		return this.pid;
	}
	/**
	 * 设置pid的值
	 * @param pid String
	 */
	public void setPid(String pid) {
		this.pid = pid;
	}
	/**
	* 返回名称                           属性的值
	* @return String
	*/ 
	public String getOrgname() {
		return this.orgname;
	}
	/**
	 * 设置orgname的值
	 * @param orgname String
	 */
	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}
	/**
	* 返回换证原因（仅换证申请）         属性的值
	* @return String
	*/ 
	public String getRenew() {
		return this.renew;
	}
	/**
	 * 设置renew的值
	 * @param renew String
	 */
	public void setRenew(String renew) {
		this.renew = renew;
	}
	/**
	* 返回开始从事相应业务年份           属性的值
	* @return String
	*/ 
	public String getStartdate() {
		return this.startdate;
	}
	/**
	 * 设置startdate的值
	 * @param startdate String
	 */
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	/**
	* 返回专职考评员聘用证明与职称证明   属性的值
	* @return String
	*/ 
	public String getPns() {
		return this.pns;
	}
	/**
	 * 设置pns的值
	 * @param pns String
	 */
	public void setPns(String pns) {
		this.pns = pns;
	}
	/**
	* 返回所在省市                       属性的值
	* @return String
	*/ 
	public String getProvince() {
		return this.province;
	}
	/**
	 * 设置province的值
	 * @param province String
	 */
	public void setProvince(String province) {
		this.province = province;
	}
	/**
	* 返回证书号                         属性的值
	* @return String
	*/ 
	public String getCid() {
		return this.cid;
	}
	/**
	 * 设置cid的值
	 * @param cid String
	 */
	public void setCid(String cid) {
		this.cid = cid;
	}
	/**
	* 返回法人代表                       属性的值
	* @return String
	*/ 
	public String getLegalp() {
		return this.legalp;
	}
	/**
	 * 设置legalp的值
	 * @param legalp String
	 */
	public void setLegalp(String legalp) {
		this.legalp = legalp;
	}
	/**
	* 返回等级                           属性的值
	* @return String
	*/ 
	public String getGrade() {
		return this.grade;
	}
	/**
	 * 设置grade的值
	 * @param grade String
	 */
	public void setGrade(String grade) {
		this.grade = grade;
	}
	/**
	* 返回联系人邮箱                     属性的值
	* @return String
	*/ 
	public String getEmail() {
		return this.email;
	}
	/**
	 * 设置email的值
	 * @param email String
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	* 返回用户ID                         属性的值
	* @return String
	*/ 
	public String getUserid() {
		return this.userid;
	}
	/**
	 * 设置userid的值
	 * @param userid String
	 */
	public void setUserid(String userid) {
		this.userid = userid;
	}
	/**
	* 返回业务类型                       属性的值
	* @return String
	*/ 
	public String getBustype() {
		return this.bustype;
	}
	/**
	 * 设置bustype的值
	 * @param bustype String
	 */
	public void setBustype(String bustype) {
		this.bustype = bustype;
	}
	/**
	* 返回受理结果                       属性的值
	* @return String
	*/ 
	public String getResp() {
		return this.resp;
	}
	/**
	 * 设置resp的值
	 * @param resp String
	 */
	public void setResp(String resp) {
		this.resp = resp;
	}
	/**
	* 返回传真号码                       属性的值
	* @return String
	*/ 
	public String getFax() {
		return this.fax;
	}
	/**
	 * 设置fax的值
	 * @param fax String
	 */
	public void setFax(String fax) {
		this.fax = fax;
	}
	/**
	* 返回专职考评员人数                 属性的值
	* @return Double
	*/ 
	public Double getPnumber() {
		return this.pnumber;
	}
	/**
	 * 设置pnumber的值
	 * @param pnumber Double
	 */
	public void setPnumber(Double pnumber) {
		this.pnumber = pnumber;
	}
	/**
	* 返回联系人姓名                     属性的值
	* @return String
	*/ 
	public String getContact() {
		return this.contact;
	}
	/**
	 * 设置contact的值
	 * @param contact String
	 */
	public void setContact(String contact) {
		this.contact = contact;
	}
	/**
	* 返回通讯地址                       属性的值
	* @return String
	*/ 
	public String getAddress() {
		return this.address;
	}
	/**
	 * 设置address的值
	 * @param address String
	 */
	public void setAddress(String address) {
		this.address = address;
	}
	/**
	* 返回手机                           属性的值
	* @return String
	*/ 
	public String getMobile() {
		return this.mobile;
	}
	/**
	 * 设置mobile的值
	 * @param mobile String
	 */
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	/**
	* 返回主管机关                       属性的值
	* @return String
	*/ 
	public String getAdminmot() {
		return this.adminmot;
	}
	/**
	 * 设置adminmot的值
	 * @param adminmot String
	 */
	public void setAdminmot(String adminmot) {
		this.adminmot = adminmot;
	}
	/**
	* 返回联系电话                       属性的值
	* @return String
	*/ 
	public String getTel() {
		return this.tel;
	}
	/**
	 * 设置tel的值
	 * @param tel String
	 */
	public void setTel(String tel) {
		this.tel = tel;
	}
	/**
	* 返回高级技术职称考评员人数         属性的值
	* @return Double
	*/ 
	public Double getPnumber2() {
		return this.pnumber2;
	}
	/**
	 * 设置pnumber2的值
	 * @param pnumber2 Double
	 */
	public void setPnumber2(Double pnumber2) {
		this.pnumber2 = pnumber2;
	}
	/**
	* 返回受理日期                       属性的值
	* @return String
	*/ 
	public String getRespdate() {
		return this.respdate;
	}
	/**
	 * 设置respdate的值
	 * @param respdate String
	 */
	public void setRespdate(String respdate) {
		this.respdate = respdate;
	}
	/**
	* 返回申请标示(0表示初次申请,1标示证书申请)属性的值
	* @return String
	*/ 
	public String getApplytype() {
		return this.applytype;
	}
	/**
	 * 设置applytype的值
	 * @param applytype String
	 */
	public void setApplytype(String applytype) {
		this.applytype = applytype;
	}
	/**
	* 返回ID属性的值
	* @return Double
	*/ 
	public Double getId() {
		return this.id;
	}
	/**
	 * 设置id的值
	 * @param id Double
	 */
	public void setId(Double id) {
		this.id = id;
	}
	/**
	* 返回考评管理制度属性的值
	* @return String
	*/ 
	public String getMan() {
		return this.man;
	}
	/**
	 * 设置man的值
	 * @param man String
	 */
	public void setMan(String man) {
		this.man = man;
	}
	/**
	* 返回其他材料属性的值
	* @return String
	*/ 
	public String getOrher() {
		return this.orher;
	}
	/**
	 * 设置orher的值
	 * @param orher String
	 */
	public void setOrher(String orher) {
		this.orher = orher;
	}
	/**
	* 返回删除标志属性的值
	* @return String
	*/ 
	public String getDel() {
		return this.del;
	}
	/**
	 * 设置del的值
	 * @param del String
	 */
	public void setDel(String del) {
		this.del = del;
	}
	public String getRespreview() {
		return respreview;
	}
	public String getFiletext() {
		return filetext;
	}
	public void setFiletext(String filetext) {
		this.filetext = filetext;
	}
	public void setRespreview(String respreview) {
		this.respreview = respreview;
	}

	


	
}
