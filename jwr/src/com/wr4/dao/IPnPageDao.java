package com.wr4.dao;

import java.util.List;
import java.util.Map;

import com.wr4.domain.Examine;
import com.wr4.domain.PnApply;
import com.wr4.domain.PnRegInfo;

public interface IPnPageDao {
	
	 //考评员注册申请
		public int insertPnApply(String sqlId, PnApply pnApply)throws Exception;
		public int insertExam(String sqlId, Examine examine)throws Exception;
		public String selectByUserId(Map map)throws Exception;
		public int updateExam(String sqlId, Examine examine)throws Exception;
		public int updateOrgApply(String sqlId,Map map)throws Exception;
		public PnRegInfo query(String sqlId, String userid);
		public Object selectCountCert(String sqlId,String userpid)throws Exception;
		public Object getCount(String sqlId,Object object)throws Exception;
		public List selectList(String sqlId,Object object)throws Exception;
}
