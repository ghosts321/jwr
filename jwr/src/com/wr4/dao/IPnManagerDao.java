package com.wr4.dao;

import java.util.List;
import java.util.Map;

import com.wr4.domain.PnInfo;

/**
 * 类说明：业务逻辑层接口
 * 
 * @author 作者: wangtiecai
 * @version 创建时间：2013年12月13日 14:55:27
 */
public interface IPnManagerDao {
	public List<PnInfo> selectPnList(String sqlId, PnInfo pnInfo, int start, int limit) throws Exception;
	public PnInfo selectOne(PnInfo pnInfo) throws Exception;
	public List selecteSignOrg(String userid);
	public List selectAllInOrg(String sqlid, Map map, int offset, int limit) throws Exception;
	public List selectePnListAll(String sqlId, PnInfo pnInfo) throws Exception;
	public List selectAllInOrgAll(String sqlId, Map map) throws Exception;
	public List isPwd(String sqlId,Map map) throws Exception;
	public int resetPwd(String sqlId,Map map)throws Exception;
}