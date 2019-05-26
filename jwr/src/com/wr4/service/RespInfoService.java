package com.wr4.service;

import java.util.List;
import java.util.Map;

import com.wr4.domain.CertInfo;
import com.wr4.domain.EnApplyDetail;
import com.wr4.domain.EnInfo;
import com.wr4.domain.EnPFInfo;
import com.wr4.domain.OrgInfo;
import com.wr4.domain.OrgList;
import com.wr4.domain.OrgReg;
import com.wr4.domain.OrgYearReport;
import com.wr4.domain.RecNotice;
import com.wr4.domain.ValueTextBustype;

public interface RespInfoService<T> {
	/**
	 * 获取主管机关
	 * @throws Exception
	 */
	public List getMot(String sqlId,Map map) throws Exception;
	/**
	 * 获取企业列表通过主管机关
	 */
	public List getListByMot(String sqlId,Map map) throws Exception;
	
	/**
	 * 查看企业详细信息
	 */
	public EnApplyDetail getEnDetail(String sqlId,Map map) throws Exception;
	
	/**
	 * 查看考评机构下考评员
	 */
	public List getPnListByPid(String sqlId,Map map) throws Exception;
	
	/**
	 * 保存
	 */
	public void saveAdvice(String sqlId,Map map,EnService enService,EnPFInfo enPFInfo) throws Exception;
	
	/**
	 * 加载申请页面信息根据userid
	 */
	public OrgReg getOrgRegInfo(String sqlId,Map map) throws Exception; 
	
	/**
	 * 下拉框业务类型
	 */
	public List getBusType(String sqlId,Map map) throws Exception;
}
