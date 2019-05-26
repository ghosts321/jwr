package com.wr4.dao;

import java.util.List;

import com.wr4.domain.EnPandect;

public interface EnPandectDao {

	
	//统计企业注册申报信息
	public List<EnPandect> getEnPandectList(String sqlId) throws Exception;                                                                                                                                  
}
