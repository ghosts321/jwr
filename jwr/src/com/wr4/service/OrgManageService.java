package com.wr4.service;

import java.util.List;
import java.util.Map;

import com.wr4.domain.CertInfo;
import com.wr4.domain.EnInfo;
import com.wr4.domain.Examine;
import com.wr4.domain.MotInfo;
import com.wr4.domain.OrgInfo;
import com.wr4.domain.OrgList;
import com.wr4.domain.OrgYearReport;
import com.wr4.domain.RecNotice;

public interface OrgManageService<T> {
	/**
	 * 考评机构工作下查询资质申请列表
	 */
	public List getBookApplyList(String sqlId, Map map, int start, int limit) throws Exception;
	public List getBookApplyAllList(String sqlId,Map map) throws Exception;
	/**
	 * 插入到申请表
	 */
	public int orgReg(String sqlId,OrgInfo orgInfo) throws Exception;
	
	/**
	 * 插入到流程表
	 */
	public void orgRegExm(String sqlId,Examine examine) throws Exception;
	
	/**
	 * 查询变更记录
	 */
	public List getUpdateList(String sqlId,Map map) throws Exception;
	
	/**
	 * 插入数据到变更表
	 */
	public void insertUpdateContent(String sqlId,Map map) throws Exception;
	
	/**
	 * 查询本机构下证书列表
	 */
	public List getBookChange(String sqlId, Map map, int start, int limit) throws Exception;
	public List getAllBookChange(String sqlId,Map map) throws Exception;
	
	/**
	 * 查询年度工作报告列表
	 */
	public List getBookYearReportList(String sqlId, Map map, int start, int limit) throws Exception;
	
	/**
	 * 保存年度报表信息到org_report表
	 */
	public void saveYearReport(String sqlId,OrgYearReport orgYearReport) throws Exception;
	
	/**
	 * 获取id申请表
	 */
	public OrgInfo getOrgApplyId(String sqlId,OrgInfo orgInfo) throws Exception;
	
	/**
	 * 根据motcode获取motname
	 */
	public MotInfo getMotByCode(String sqlId,Map map) throws Exception;
	
	/**
	 * 更新换证原因
	 */
	public int updateReason(String sqlId,Map map) throws Exception;
	
	public List getBookChange(String sqlId,Map map)throws Exception;
}
