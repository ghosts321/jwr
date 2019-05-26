package com.wr4.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;

import com.wr4.dao.IRegDao;
import com.wr4.domain.EnRegInfo;
import com.wr4.domain.MotRegInfo;
import com.wr4.domain.OrgRegInfo;
import com.wr4.domain.PnRegInfo;
import com.wr4.service.IRegService;

public class RegDaoImpl implements IRegDao{
	private SqlSessionTemplate sqlSessionTemplate;
	
	public SqlSessionTemplate getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	/**
	 * 主管机关用户注册
	 */
	public int motReg(String sqlId,MotRegInfo motRegInfo) throws Exception {
		return sqlSessionTemplate.insert(sqlId, motRegInfo);
	}
	/**
	 * 企业用户注册
	 */
	public int enReg(String sqlId,EnRegInfo enRegInfo) throws Exception {
		return sqlSessionTemplate.insert(sqlId, enRegInfo);
	}
	/**
	 * 考评机构用户注册
	 */
	public int orgReg(String sqlId,OrgRegInfo orgRegInfo) throws Exception {
		return sqlSessionTemplate.insert(sqlId, orgRegInfo);
	}
	/**
	 * 考评员用户注册
	 */
	public int pnReg(String sqlId,PnRegInfo pnRegInfo) throws Exception {
		return sqlSessionTemplate.insert(sqlId, pnRegInfo);
	}

}
