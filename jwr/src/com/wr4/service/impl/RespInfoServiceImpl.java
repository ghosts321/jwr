package com.wr4.service.impl;

import java.util.List;
import java.util.Map;

import com.wr4.dao.ICertrevocationDao;
import com.wr4.dao.RespInfoDao;
import com.wr4.domain.CertInfo;
import com.wr4.domain.EnApplyDetail;
import com.wr4.domain.EnPFInfo;
import com.wr4.domain.OrgReg;
import com.wr4.domain.PnInfo;
import com.wr4.domain.ValueTextBustype;
import com.wr4.service.EnService;
import com.wr4.service.ICertrevocationService;
import com.wr4.service.RespInfoService;

public class RespInfoServiceImpl implements RespInfoService {
	private RespInfoDao respInfoDao;

	public RespInfoDao getRespInfoDao() {
		return respInfoDao;
	}

	public void setRespInfoDao(RespInfoDao respInfoDao) {
		this.respInfoDao = respInfoDao;
	}

	
	public List getMot(String sqlId, Map map) throws Exception {
		List list=respInfoDao.getMot(sqlId,map);
		return list;
	}
	
	public List getListByMot(String sqlId, Map map) throws Exception {
		List list = respInfoDao.getListByMot(sqlId,map);
		return list;
	}

	
	public EnApplyDetail getEnDetail(String sqlId, Map map) throws Exception {
		EnApplyDetail enApplyDetail=respInfoDao.getEnDetail(sqlId,map);
		return enApplyDetail;
	}

	
	public List getPnListByPid(String sqlId, Map map) throws Exception {
		List list = respInfoDao.getPnListByPid(sqlId,map);
		return list;
	}

	
	public void saveAdvice(String sqlId, Map map,EnService enService,EnPFInfo enPFInfo) throws Exception {
		if(map.get("flagType").equals("0")){
			map.put("resp", "不同意");
//			//不同意 更新申请表
//				int p=respInfoDao.updateOldExamine("com.wr4.domain.enManage.updateEnApply", map);
//				if(p<1){
//					throw new Exception();
//				}
		}else{
			map.put("resp", "同意");
		}
		map.put("kpresult", map.get("flagType"));
		boolean i=enService.savePingFen("com.wr4.domain.MotEnInfo.updateKaoPingfen", enPFInfo);
		//更新流程表
		int j=respInfoDao.updateOldExamine("com.wr4.domain.enManage.updateOldExamine", map);
		//插入流程表
		int k=respInfoDao.insertNewExamine("com.wr4.domain.enManage.insertNewExamine", map);
		//更新申请表
		int z=respInfoDao.updateOldExamine("com.wr4.domain.enManage.updateEnApply", map);
		if(j+k+z<3&&!i){
			throw new Exception();
		}
	}

	
	public OrgReg getOrgRegInfo(String sqlId, Map map) throws Exception {
		OrgReg orgReg=respInfoDao.getOrgRegInfo(sqlId,map);
		return orgReg;
	}

	
	public List getBusType(String sqlId, Map map) throws Exception {
		List list =respInfoDao.getBusType(sqlId,map);
		return list;
	}
	
}
