package com.wr4.dao;

import java.util.List;
import java.util.Map;

import com.wr4.domain.EnRegInfo;
import com.wr4.domain.MotRegInfo;

public interface IRegRespDao {
	public List queryMotReg(String sqlId, MotRegInfo motRegInfo, int start, int limit) throws Exception;
	public List queryMotReg(String sqlId, MotRegInfo motRegInfo) throws Exception;
	public List queryEnReg(String sqlId, EnRegInfo enRegInfo, int start, int limit) throws Exception ;
	public List queryEnReg(String sqlId, EnRegInfo enRegInfo) throws Exception ;
	public List queryRegList(String sqlId, Object object, int start, int limit) throws Exception;
	public List queryRegList(String sqlId, Object object) throws Exception;
	
	public Object queryMotRegDetail(String sqlId,String pid) throws Exception;
	public int regRespUpdate(String sqlId,Object object) throws Exception;
	public int regRespDelete(String sqlId, Object object) throws Exception;
	public List selectCommon(String sqlId,Map map)throws Exception;
	
	public Map<String,String> queryRespSum(String sqlId,Map map) throws Exception;
	public Map<String,String> queryRegRespSum(String sqlId,Map map) throws Exception;
}
