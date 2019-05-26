package com.wr4.service;

import java.util.List;
import java.util.Map;

import com.wr4.domain.Examine;
import com.wr4.domain.PnApply;
import com.wr4.domain.PnRegInfo;

public interface IPnPageService{
    //考评员注册申请
	public boolean insertPnApply(String sqlId, PnApply pnApply)throws Exception;
	public boolean insertExam(String sqlId, Examine examine)throws Exception;
	public String selectByUserId(Map map)throws Exception;
	public boolean updateExam(String sqlId, Examine examine)throws Exception;
	public boolean updateOrgApply(String sqlId,Map map)throws Exception;
	public PnRegInfo selectByone(String sqlId,String userid)throws Exception;
	public Object selectCountCert(String sqlId,String userpid)throws Exception;
	public Object selectCount(String sqlId,Object object)throws Exception;
	public List selectList(String sqlId,Object object)throws Exception;
	
	public Object selectByone(String sqlId, Object object)throws Exception;
}
