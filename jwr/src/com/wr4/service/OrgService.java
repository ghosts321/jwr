package com.wr4.service;

import java.util.List;
import java.util.Map;

import com.wr4.domain.CertInfo;
import com.wr4.domain.EnInfo;
import com.wr4.domain.OrgInfo;
import com.wr4.domain.OrgList;
import com.wr4.domain.OrgYearReport;
import com.wr4.domain.RecNotice;

public interface OrgService<T> {
	/**
	 *资质证书制发列表 
	 */
	public List<T> selecteOrgBookList(String sqlId, OrgInfo orgInfo, int start, int limit) throws Exception;
	
	/**
	 *考评机构列表 
	 */
	public List<T> selecteOrgList(String sqlId,OrgList orgList,  int start, int limit) throws Exception;
	
	/**
	 *考评机构列表 查询总条数
	 */
	public List<T> selecteOrgList(String sqlId,OrgList orgList) throws Exception;
	
	
	/**
	 *考评机构查看详细信息 
	 */
	public OrgInfo scanDetail(Map map) throws Exception;
	
	/**
	 *证书制发查看详细信息 
	 */
	public OrgInfo applyDetail(Map map) throws Exception;
	
	/**
	 * 查询当日证书号个数
	 */
	public String queryNoNum(String sqlId,Map map) throws Exception;
	
	/**
	 * 添加证书号到证书表
	 */
	public void insertCertNo(String sqlId,Map map) throws Exception;
	
	/**
	 * 插入流程表记录，状态为已发证
	 */
	public void insertExamin(String sqlId,Map map) throws Exception;
	
	/**
	 * 申请表加证书号
	 */
	public Map updateApplyCertNo(String sqlId,OrgService orgService,Map map) throws Exception;
	
	/**
	 * 问题整改查询
	 */
	public OrgInfo getOrgInfo(String sqlId,Map map) throws Exception;
	
	/**
	 * 插入整改意见
	 */
	public Integer saveRecNotice(String sqlId,RecNotice recNotice) throws Exception;
	
	/**证书撤销
	 * 
	 */
	public Integer updateAdvice(String sqlId,CertInfo certInfo,Map map) throws Exception;
	/**
	 * 企业证书撤销
	 * zhangli
	 * 2014年2月19日 12:35:46
	 * @param sqlId
	 * @param certInfo
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public Integer updateEnAdvice(String sqlId, CertInfo certInfo,Map map) throws Exception;
	/**
	 * 考评员证书撤销
	 * zhangli
	 * 2014年2月19日 12:35:46
	 * @param sqlId
	 * @param certInfo
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public Integer updatePnAdvice(String sqlId, CertInfo certInfo,Map map) throws Exception;
	/**
	 * 
	 * @param sqlId
	 * @param orgInfo
	 * @return
	 */
	public List<T> selectOrgList(String sqlId, OrgInfo orgInfo) throws Exception;
	
	/**
	 * 考评机构年度报告
	 */
	public List<T> getYearReport(String sqlId,OrgYearReport orgYearReport,  int start, int limit) throws Exception;
	/**
	 * 主管机关年度报告 
	 * @throws Exception
	 */
	public List getMotYearReportList(String sqlId,Map map,  int start, int limit) throws Exception;
	public List getMotYearReportAllList(String sqlId,Map map) throws Exception;
	public List getOrgByCon(String sql,Map map,int start, int limit) throws Exception;

	public List getOrgByConAll(String sqlId, Map map) throws Exception;
	public Map updateEnApplyCertNo(String sqlId,OrgService orgService,Map map) throws Exception;
	
	public List getWorkProList(String sqlId,Map map,  int start, int limit) throws Exception;	
	public List getWorkProAllList(String sqlId,Map map) throws Exception;
	
	public Object updateEmployPn(String sqlId,Map map) throws Exception;
	
	public String selecteBusName(String sqlId,Map map)throws Exception;
}
