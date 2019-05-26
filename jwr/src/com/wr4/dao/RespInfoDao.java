package com.wr4.dao;

import java.util.List;
import java.util.Map;

import com.wr4.domain.EnApplyDetail;
import com.wr4.domain.EnPFInfo;
import com.wr4.domain.OrgReg;
import com.wr4.domain.User;
import com.wr4.domain.ValueTextBustype;
import com.wr4.service.EnService;

/**
 * 类说明：数据库业务接口层
 * 
 * @author 作者: 李灵通
 * @version 创建时间：2013年12月27日 10:54:47
 */
public interface RespInfoDao {

	public List getMot(String sqlId,Map map) throws Exception;
	
	public List getListByMot(String sqlId,Map map) throws Exception;
	
	public EnApplyDetail getEnDetail(String sqlId,Map map) throws Exception;
	
	public List getPnListByPid(String sqlId,Map map) throws Exception;
	
	public void saveAdvice(String sqlId,Map map) throws Exception;
	
	public OrgReg getOrgRegInfo(String sqlId,Map map) throws Exception;
	
	public List getBusType(String sqlId,Map map) throws Exception;
	
	public int updateOldExamine(String sqlId,Map map)throws Exception;
	
	public int insertNewExamine(String sqlId,Map map)throws Exception;
	
}