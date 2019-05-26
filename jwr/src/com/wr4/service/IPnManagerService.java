package com.wr4.service;

import java.util.List;
import java.util.Map;

import com.wr4.domain.PnInfo;

/**
 * 类说明：业务逻辑层接口
 * 
 * @author 作者: wangtiecai
 * @version 创建时间：2013年12月13日 14:55:27
 */
public interface IPnManagerService {
	public List<PnInfo> selectePnList(String sqlId, PnInfo pnInfo, int start, int limit) throws Exception;
	public PnInfo selecteOne(PnInfo pnInfo) throws Exception;
	public List selecteSignOrg(String userid) throws Exception;
	public List selectAllInOrg(String string, Map map, int offset,
			int limit) throws Exception;
	public List selectePnListAll(String sqlId, PnInfo pnInfo) throws Exception;
	public List selectAllInOrgAll(String sqlId, Map map) throws Exception;
	public int resetPwd(String sqlId,Map map) throws Exception;
	
	public List isPwd(String sqlId,Map map) throws Exception;
}