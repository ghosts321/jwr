package com.wr4.service;

import java.util.List;
import java.util.Map;

import com.wr4.domain.EnInfo;
import com.wr4.domain.PnInfo;

/**
 * 类说明：业务逻辑层接口
 * 
 * @author 作者: wangtiecai
 * @version 创建时间：2013年12月13日 14:55:27
 */
public interface EnManageService {
	
	/**
	 * 企业达标等级证书制发
	 */
	public List getEnProduceList(String sqlId,Map map) throws Exception;
	
	/**
	 * 发证更新申请表
	 */
	public void updateApplyCertNo(String sqlId,Map map) throws Exception;
	
	/**
	 * 本考评机构考评过的企业档案
	 */
	public List getEnFileManageList(String sqlId,Map map) throws Exception;
	
	/**
	 * 考评情况汇总
	 */
	public List getEnScoreSumList(String sqlId,Map map) throws Exception;
	
	/**
	 * 查看详情
	 */
	public EnInfo getEnDetail(String sqlId,Map map) throws Exception;
}