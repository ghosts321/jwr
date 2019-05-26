package com.wr4.service.impl;

import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.wr4.dao.IPnPageDao;
import com.wr4.dao.impl.PnPageDaoImpl;
import com.wr4.domain.Examine;
import com.wr4.domain.PnApply;
import com.wr4.domain.PnRegInfo;
import com.wr4.service.IPnPageService;

public class PnPageServiceImpl implements IPnPageService {
    private IPnPageDao pnPageDao;
    
	public IPnPageDao getPnPageDao() {
		return pnPageDao;
	}

	public void setPnPageDao(IPnPageDao pnPageDao) {
		this.pnPageDao = pnPageDao;
	}

	public boolean insertPnApply(String sqlId, PnApply pnApply) throws Exception{
		boolean bol=false;
		int i=pnPageDao.insertPnApply(sqlId, pnApply);
		if(i>0){
			bol=true;
		}else{
			throw new Exception();
		}
		return bol;  
	}

	
	public String selectByUserId(Map map) throws Exception {
		return pnPageDao.selectByUserId(map);
	}

	
	public boolean insertExam(String sqlId, Examine examine) throws Exception {
		boolean bol=false;
		int i=pnPageDao.insertExam(sqlId, examine);
		if(i>0){
			bol=true;
		}else{
			throw new Exception();
		}
		return bol;
	}

	
	public boolean updateExam(String sqlId, Examine examine) throws Exception {
		boolean bol=false;
		int i=pnPageDao.updateExam(sqlId, examine);
		if(i>0){
			bol=true;
		}else{
			throw new Exception();
		}
		return bol;
	}

	
	public boolean updateOrgApply(String sqlId, Map map) throws Exception {
		boolean bol=false;
		int i=pnPageDao.updateOrgApply(sqlId,map);
		if(i>0){
			bol=true;
		}else{
			throw new Exception();
		}
		return bol;
	}

	
	public PnRegInfo selectByone(String sqlId, String userid) throws Exception {
		
		return pnPageDao.query(sqlId,userid);
	}
	
	public Object selectCountCert(String sqlId,String userpid)throws Exception{
		return pnPageDao.selectCountCert(sqlId,userpid);
	}
	public Object selectCount(String sqlId,Object object)throws Exception{
		int count= (Integer) pnPageDao.getCount(sqlId,object);
		 return count;
	}
	public List selectList(String sqlId,Object object)throws Exception{
		return  pnPageDao.selectList(sqlId,object);
	}
	
	public Object selectByone(String sqlId, Object object)throws Exception{
		return pnPageDao.getCount(sqlId,object);
	}
}
