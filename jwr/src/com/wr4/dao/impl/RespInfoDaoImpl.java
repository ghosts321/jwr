package com.wr4.dao.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.wr4.dao.ICertrevocationDao;
import com.wr4.dao.RespInfoDao;
import com.wr4.domain.CertInfo;
import com.wr4.domain.EnApplyDetail;
import com.wr4.domain.EnPFInfo;
import com.wr4.domain.OrgReg;
import com.wr4.domain.PnInfo;
import com.wr4.domain.ValueTextBustype;
import com.wr4.service.EnService;

public class RespInfoDaoImpl implements RespInfoDao {
	
	private SqlSessionTemplate sqlSessionTemplate;
	
	public SqlSessionTemplate getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	
	public List getMot(String sqlId, Map map) throws Exception {
		List list=sqlSessionTemplate.selectList(sqlId, map);
		return list;
	}
	
	
	public List getListByMot(String sqlId, Map map) throws Exception {
		List list=sqlSessionTemplate.selectList(sqlId, map);
		return list;
	}

	
	public EnApplyDetail getEnDetail(String sqlId, Map map) throws Exception {
		EnApplyDetail enApplyDetail=sqlSessionTemplate.selectOne(sqlId, map);
		return enApplyDetail;
	}

	
	public List getPnListByPid(String sqlId, Map map) throws Exception {
		List list=sqlSessionTemplate.selectList(sqlId, map);
		return list;
	}

	
	public void saveAdvice(String sqlId, Map map) throws Exception {
		sqlSessionTemplate.update(sqlId, map);
	}

	
	public OrgReg getOrgRegInfo(String sqlId, Map map) throws Exception {
		OrgReg orgReg=sqlSessionTemplate.selectOne(sqlId,map);
		return orgReg;
	}

	
	public List getBusType(String sqlId, Map map) throws Exception {
		List list =sqlSessionTemplate.selectList(sqlId, map);
		return list;
	}

	
	public int updateOldExamine(String sqlId, Map map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update(sqlId, map);
	}

	
	public int insertNewExamine(String sqlId, Map map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert(sqlId, map);
	}
	
	
	

}
