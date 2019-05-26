package com.wr4.service;

import java.util.List;
import java.util.Map;

import com.wr4.domain.IndexInfo;
import com.wr4.domain.MotInfo;
import com.wr4.domain.User;

public interface IMotService<T> {
    //查询主管机关表
	public List<T> selectMot(String sqlId, MotInfo motInfo, int start, int limit)throws Exception;
	public MotInfo selectMotOne(String sqlId, MotInfo motInfo)throws Exception;
	
	public int selectCount(String sqlId, MotInfo motInfo)throws Exception;
	
	public int motAdd(String sqlId, MotInfo motInfo)throws Exception;
	
	public int motUpdate(String sqlId, MotInfo motInfo)throws Exception;
	
	public int indexMotInsert(String sqlId, IndexInfo indexInfo)throws Exception;
	
	
	public List getIndexList(String sqlId)throws Exception;
	public IndexInfo getIndexData(String sqlId,String id)throws Exception;
	public boolean updateIndexData(String sqlId,IndexInfo indexInfo)throws Exception;
	public List getIndexListFromType(String sqlId,String type)throws Exception;
	
	
	public IndexInfo getIndexInfoById(String sqlId,Map map)throws Exception;
	public int updateIndexInfoById(String sqlId,Map map)throws Exception;
	public List  selectMot(String sqlId, String motInfo, int start, int limit)throws Exception;
	public User  selectUserDetail(String sqlId, String motInfo )throws Exception;
	public int updateObject(String sqlId,Object object)throws Exception;
	/**
	 * 获取字段 对应中文
	 * @param sqlId
	 * @param object
	 * @return
	 * @throws Exception
	 */
	public List fileText(String sqlId,Object object)throws Exception;
	
	public int resetPwd(String sqlId,Map map)throws Exception;
}
