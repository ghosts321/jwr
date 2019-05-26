/**
 * 描述 Examine
 * 版权所有(C) 2012 深圳市银之杰科技股份有限公司
 * 创建:CodeX 2012-11-11
 */

package com.wr4.domain;

import java.io.Serializable;
import java.util.Date;


public class Examine implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
   	/**
     * 缺省构造函数
     */
 	public Examine() {
 	
  	}
 	
 	private int id;
  	
	/**
	 *  userid String 字段用户ID
	 */
	private String userid;
	/**
	 *  usertype String 字段用户类型
	 */
	private String usertype;
	/**
	 *  status String 字段当前处理状态
	 */
	private String status;
	/**
	 *  auditerMot String 字段该交由哪个处理机关
	 */
	private String auditerMot;
	/**
	 *  auditer String 字段具体哪个用户处理的此条记录
	 */
	private String auditer;
	/**
	 *  auditdate String 字段处理时间
	 */
	private String auditdate;
	/**
	 *  advice String 字段处理意见
	 */
	private String advice;
	/**
	 *  audittype String 字段该哪一级处理
	 */
	private String audittype;
	/**
	 *  results String 字段处理结果   同意 1 不同意0     已发证2
	 */
	private String results;
	/**
	 *  auditname String 字段签发人姓名
	 */
	private String auditname;
	/**
	 *  beiyong1 String 字段备用字段
	 */
	private String beiyong1;
	/**
	 *  applyId String 申请表ID
	 */
	private String applyId;
	/**
	 *  beiyong3 String 字段备用字段
	 */
	private String beiyong3;
	/**
	 *  beiyong4 String 字段备用字段
	 */
	private String beiyong4;
	/**
	 *  pid String 字段证件号
	 */
	private String pid;
	/**
	 *  pid String 字段业务类型
	 */
	private String bustype;

	private String oldStatus;
	private String nextStatus;
	private String handletype;
	private String orgId;
	
	//考评员直接颁发相关字段
	private String pass_direct;// 直接颁发   PASS_DIRECT
	private String directjon;//DIRECTJOB 直接颁发人职务
	private String directname;//直接颁发人姓名
	//上海报表需增加字段
	private String examType;
	private String addedReason;
	private String addedRemark;
	private String auditername;//处理人
	private String auditerdate;//处理时间
	
	
	
	public String getAuditerdate() {
		return auditerdate;
	}
	public void setAuditerdate(String auditerdate) {
		this.auditerdate = auditerdate;
	}
	public String getAuditername() {
		return auditername;
	}
	public void setAuditername(String auditername) {
		this.auditername = auditername;
	}
	public String getExamType() {
		return examType;
	}
	public void setExamType(String examType) {
		this.examType = examType;
	}
	public String getAddedReason() {
		return addedReason;
	}
	public void setAddedReason(String addedReason) {
		this.addedReason = addedReason;
	}
	public String getAddedRemark() {
		return addedRemark;
	}
	public void setAddedRemark(String addedRemark) {
		this.addedRemark = addedRemark;
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
	public String getOrgId() {
		return orgId;
	}
	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}
	/**
	* 返回用户ID属性的值
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
	* 返回用户类型属性的值
	* @return String
	*/ 
	public String getUsertype() {
		return this.usertype;
	}
	/**
	 * 设置usertype的值
	 * @param usertype String
	 */
	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}
	/**
	* 返回当前处理状态属性的值
	* @return String
	*/ 
	public String getStatus() {
		return this.status;
	}
	/**
	 * 设置status的值
	 * @param status String
	 */
	public void setStatus(String status) {
		this.status = status;
	}
	/**
	* 返回该交由哪个处理机关属性的值
	* @return String
	*/ 
	public String getAuditerMot() {
		return this.auditerMot;
	}
	/**
	 * 设置auditerMot的值
	 * @param auditerMot String
	 */
	public void setAuditerMot(String auditerMot) {
		this.auditerMot = auditerMot;
	}
	/**
	* 返回具体哪个用户处理的此条记录属性的值
	* @return String
	*/ 
	public String getAuditer() {
		return this.auditer;
	}
	/**
	 * 设置auditer的值
	 * @param auditer String
	 */
	public void setAuditer(String auditer) {
		this.auditer = auditer;
	}
	/**
	* 返回处理时间属性的值
	* @return String
	*/ 
	public String getAuditdate() {
		return this.auditdate;
	}
	/**
	 * 设置auditdate的值
	 * @param auditdate String
	 */
	public void setAuditdate(String auditdate) {
		this.auditdate = auditdate;
	}
	/**
	* 返回处理意见属性的值
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
	* 返回该哪一级处理属性的值
	* @return String
	*/ 
	public String getAudittype() {
		return this.audittype;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * 设置audittype的值
	 * @param audittype String
	 */
	public void setAudittype(String audittype) {
		this.audittype = audittype;
	}
	/**
	* 返回处理结果   同意 1 不同意0     已发证2属性的值
	* @return String
	*/ 
	public String getResults() {
		return this.results;
	}
	/**
	 * 设置results的值
	 * @param results String
	 */
	public void setResults(String results) {
		this.results = results;
	}
	/**
	* 返回签发人姓名属性的值
	* @return String
	*/ 
	public String getAuditname() {
		return this.auditname;
	}
	/**
	 * 设置auditname的值
	 * @param auditname String
	 */
	public void setAuditname(String auditname) {
		this.auditname = auditname;
	}
	/**
	* 返回备用字段属性的值
	* @return String
	*/ 
	public String getBeiyong1() {
		return this.beiyong1;
	}
	/**
	 * 设置beiyong1的值
	 * @param beiyong1 String
	 */
	public void setBeiyong1(String beiyong1) {
		this.beiyong1 = beiyong1;
	}
	/**
	* 返回备用字段属性的值
	* @return String
	*/ 


	/**
	* 返回备用字段属性的值
	* @return String
	*/ 
	public String getBeiyong3() {
		return this.beiyong3;
	}
	public String getApplyId() {
		return applyId;
	}
	public void setApplyId(String applyId) {
		this.applyId = applyId;
	}
	/**
	 * 设置beiyong3的值
	 * @param beiyong3 String
	 */
	public void setBeiyong3(String beiyong3) {
		this.beiyong3 = beiyong3;
	}
	/**
	* 返回备用字段属性的值
	* @return String
	*/ 
	public String getBeiyong4() {
		return this.beiyong4;
	}
	/**
	 * 设置beiyong4的值
	 * @param beiyong4 String
	 */
	public void setBeiyong4(String beiyong4) {
		this.beiyong4 = beiyong4;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getBustype() {
		return bustype;
	}
	public void setBustype(String bustype) {
		this.bustype = bustype;
	}
	public String getOldStatus() {
		return oldStatus;
	}
	public void setOldStatus(String oldStatus) {
		this.oldStatus = oldStatus;
	}
	public String getNextStatus() {
		return nextStatus;
	}
	public void setNextStatus(String nextStatus) {
		this.nextStatus = nextStatus;
	}
	public String getHandletype() {
		return handletype;
	}
	public void setHandletype(String handletype) {
		this.handletype = handletype;
	}


	
}
