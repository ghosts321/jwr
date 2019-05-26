package com.wr4.service.impl;

import java.util.List;
import java.util.Map;

import com.wr4.dao.IMotDao;
import com.wr4.domain.IndexInfo;
import com.wr4.domain.MotInfo;
import com.wr4.domain.User;
import com.wr4.service.IMotService;

public class MotServiceImpl<T> implements IMotService<T> {
	private IMotDao<T> motDao;

	public IMotDao<T> getMotDao() {
		return motDao;
	}

	public void setMotDao(IMotDao<T> motDao) {
		this.motDao = motDao;
	}

	
	public List<T> selectMot(String sqlId, MotInfo motInfo, int start, int limit)throws Exception {
		List<T> list = motDao.selectMot(sqlId, motInfo, start, limit);
		return list;
	}
	public List  selectMot(String sqlId,String motInfo, int start, int limit)throws Exception {
		List  list = motDao.selectMot(sqlId, motInfo, start, limit);
		return list;
	}
	public User  selectUserDetail(String sqlId, String motInfo )throws Exception{
		  
		return  motDao.selectMot(sqlId, motInfo );
	}
	
	public MotInfo selectMotOne(String sqlId, MotInfo motInfo)throws Exception {
		MotInfo m = motDao.selectMotOne(sqlId, motInfo);
		return m;
	}
	
	public int selectCount(String sqlId, MotInfo motInfo)throws Exception{
		return motDao.selectCount(sqlId, motInfo);
	}
	public int motAdd(String sqlId, MotInfo motInfo)throws Exception{
		int i= motDao.motAdd(sqlId, motInfo);
		if(i<1){
			throw new Exception();
		}
		return i;
	}
	
	public int motUpdate(String sqlId, MotInfo motInfo)throws Exception{
		int i= motDao.motUpdate(sqlId, motInfo);
		if(i<1){
			throw new Exception();
		}
		return i;
	}
	
	public int indexMotInsert(String sqlId, IndexInfo indexInfo)throws Exception{
		int i= motDao.indexMotInsert(sqlId, indexInfo);
		if(i<1){
			throw new Exception();
		}
		return i;
	}
	
	public List getIndexList(String sqlId)throws Exception{
		return motDao.getIndexList(sqlId);
	}
	public IndexInfo getIndexData(String sqlId,String id)throws Exception{
		return motDao.getIndexData(sqlId,id);
	}
	public boolean updateIndexData(String sqlId,IndexInfo indexInfo)throws Exception{
		boolean bol=false;
		int i=motDao.updateIndexData(sqlId,indexInfo);
		if(i>0){
			bol=true;
		}else{
			throw new Exception();
		}
		return bol;
	}

	public List getIndexListFromType(String sqlId, String type)throws Exception{
	return motDao.getIndexListFromType(sqlId,type);	
	}

	
	public IndexInfo getIndexInfoById(String sqlId, Map map) throws Exception {
		return motDao.getIndexInfoById(sqlId, map);
	}

	
	public int updateIndexInfoById(String sqlId, Map map) throws Exception {
		int i= motDao.updateIndexInfoById(sqlId, map);
		if(i<1){
			throw new Exception();
		}
		return i;
	}
	
	public int updateObject(String sqlId,Object object)throws Exception{
		int i= motDao.updateObject(sqlId, object);
		int j =0;
		User user =(User)object;
		if(null!=user.getUsertype()){
			if(user.getUsertype().equals("mot")){
				j = motDao.updateObject("com.wr4.domain.MotInfo.updateMotreg", object);
			}else if(user.getUsertype().equals("en")){
				j = motDao.updateObject("com.wr4.domain.MotInfo.updateEnreg", object);
			}else if(user.getUsertype().equals("pn")){
				j = motDao.updateObject("com.wr4.domain.MotInfo.updatePnreg", object);
			}else if(user.getUsertype().equals("org")){
				j = motDao.updateObject("com.wr4.domain.MotInfo.updateOrgreg", object);
			}
		}
	    
		if(i<1 && j<1){
			throw new Exception();
		}
		return i;
	}
	
	/**
	 * 获取字段 对应中文
	 * @param sqlId
	 * @param object
	 * @return
	 * @throws Exception
	 */
	public List fileText(String sqlId,Object object)throws Exception{
		return motDao.fileText(sqlId, object);
	}

	public int resetPwd(String sqlId, Map map) throws Exception {
		// TODO Auto-generated method stub
		int i=motDao.resetPwd(sqlId, map);
		if(i<1){
			throw new Exception();
		}
		return i;
	}
}
