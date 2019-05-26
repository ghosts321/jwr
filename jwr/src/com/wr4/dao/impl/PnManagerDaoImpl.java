package com.wr4.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;

import com.wr4.dao.IPnManagerDao;
import com.wr4.domain.PnInfo;

public class PnManagerDaoImpl implements IPnManagerDao {
	private SqlSessionTemplate sqlSessionTemplate;
	
	public SqlSessionTemplate getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	
	public List<PnInfo> selectPnList(String sqlId, PnInfo pnInfo, int start,
			int limit) {
		return sqlSessionTemplate.selectList(sqlId, pnInfo);
	}

	
	public PnInfo selectOne(PnInfo pnInfo) {
		return sqlSessionTemplate.selectOne("com.wr4.domain.PnInfo.selectOne",pnInfo.getCertnumber());
	}

	
	public List selecteSignOrg(String userid) {
		return sqlSessionTemplate.selectList("com.wr4.domain.MotOrgInfo.getAttrOrg", userid);
	}

	
	public List selectAllInOrg(String sqlid, Map map, int offset, int limit) {
		return sqlSessionTemplate.selectList(sqlid, map);
	}

	
	public List selectePnListAll(String sqlId, PnInfo pnInfo) {
		return sqlSessionTemplate.selectList(sqlId, pnInfo);
	}

	
	public List selectAllInOrgAll(String sqlId, Map map) {
		return sqlSessionTemplate.selectList(sqlId, map);
	}

	public List isPwd(String sqlId, Map map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList(sqlId, map);
	}

	public int resetPwd(String sqlId, Map map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update(sqlId, map);
	}

}
