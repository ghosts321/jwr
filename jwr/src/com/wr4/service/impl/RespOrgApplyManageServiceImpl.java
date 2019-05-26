package com.wr4.service.impl;

import java.util.List;
import java.util.Map;

import com.wr4.dao.RespOrgApplyManageDao;
import com.wr4.domain.ExchangeInfo;
import com.wr4.domain.RespOrgApplyDetail;
import com.wr4.service.RespOrgApplyManageService;

public class RespOrgApplyManageServiceImpl<T> implements RespOrgApplyManageService<T> {
	private RespOrgApplyManageDao<T> respOrgDao;

	public RespOrgApplyManageDao<T> getRespOrgDao() {
		return respOrgDao;
	}

	public void setRespOrgDao(RespOrgApplyManageDao<T> respOrgDao) {
		this.respOrgDao = respOrgDao;
	}

	
	public List getOrgApplyList(String sqlId, Map map) throws Exception {
		List list=respOrgDao.getOrgApplyList(sqlId,map);
		return list;
	}

	
	public List getOrgApplyAllList(String sqlId, Map map,int offset,int limit) throws Exception {
		List list=respOrgDao.getOrgApplyAllList(sqlId,map,offset,limit);
		return list;
	}

	
	public RespOrgApplyDetail scanOrgDetail(String sqlId, Map map)
			throws Exception {
		RespOrgApplyDetail respOrgApplyDetail=respOrgDao.scanOrgDetail(sqlId,map);
		return respOrgApplyDetail;
	}

	
	public int delOrgApply(String sqlId, Map map) throws Exception {
		int result=respOrgDao.delOrgApply(sqlId,map);
		if(result<1){
			throw new Exception();
		}
		return result;
	}

	
	public List getOrgExchangeList(String sqlId, Map map, int offset, int limit)
			throws Exception {
		List list=respOrgDao.getOrgExchangeList(sqlId,map,offset,limit);
		return list;
	}

	
	public List getOrgExchangeAllList(String sqlId, Map map) throws Exception {
		List list=respOrgDao.getOrgExchangeAllList(sqlId,map);
		return list;
	}

	
	public ExchangeInfo selectExchangeById(String sqlId, Map map)
			throws Exception {
		ExchangeInfo exchangeInfo=respOrgDao.selectExchangeById(sqlId,map);
		return exchangeInfo;
	}

	
	public int updateAdviceById(String sqlId, Map map,Map map1) throws Exception {
		int result=0;
		String flag = map1.get("flag").toString();
		String type = map1.get("type").toString();
		String reason = map1.get("reason").toString();
		String content = map1.get("content").toString();
		int b=0;
		if("0".equals(flag)){
			map.put("resp", "申请拒绝");
			result=respOrgDao.updateAdviceById(sqlId,map);
			if(result<1){
				throw new Exception();
			}
		}else if("1".equals(flag)){
			map.put("resp", "申请通过");
			int k =respOrgDao.updateAdviceById(sqlId,map);
			int j=0;
			if("en".equals(type)){
				if("1".equals(reason)){
					map.put("legalp", content);
				}else if("2".equals(reason)){
					map.put("enname", content);
				}else if("3".equals(reason)){
					map.put("address", content);
				}
				int n = respOrgDao.updateRegAndApply("com.wr4.domain.MotEnInfo.updateReg", map);
				int m = respOrgDao.updateRegAndApply("com.wr4.domain.MotEnInfo.updateApply", map);
				int z = respOrgDao.updateRegAndApply("com.wr4.domain.MotEnInfo.updateuser", map);
				if(n>0&&(m>0||m==0)&&(z>0||z==0)){
					j=1;
				}
				
			}else if("org".equals(type)){
				
				if("1".equals(reason)){
					map.put("legalp", content);
				}else if("2".equals(reason)){
					map.put("orgname", content);
				}else if("3".equals(reason)){
					map.put("address", content);
				}else if("4".equals(reason)||"5".equals(reason)){
					map.put("otherreason", content);
				}
				int n = respOrgDao.updateRegAndApply("com.wr4.domain.RespOrg.updateReg", map);
				int m = respOrgDao.updateRegAndApply("com.wr4.domain.RespOrg.updateApply", map);
				if("2".equals(reason)){
					 b = respOrgDao.updateRegAndApply("com.wr4.domain.RespOrg.updateuser", map);
				}
				if(n>0&&(m>0||m==0)&&(b>0||b==0)){
					j=1;
				}
			}
			if(j>0&&k>0){
				result=1;
			}else{
				throw new Exception();
			}
		}
		return result;
	}

	
	public List getCertChangeList(String sqlId, Map map, int offset, int limit)
			throws Exception {
		List list=respOrgDao.getCertChangeList(sqlId,map,offset,limit);
		return list;
	}

	
	public List getCertChangeList(String sqlId, Map map) throws Exception {
		List list=respOrgDao.getCertChangeList(sqlId,map);
		return list;
	}

	
	public RespOrgApplyDetail scanCertChangeDetail(String sqlId, Map map)
			throws Exception {
		RespOrgApplyDetail respOrgApplyDetail=respOrgDao.RespOrgApplyDetail(sqlId,map);
		return respOrgApplyDetail;
	}

	
	public int delCertChangeById(String sqlId, Map map) throws Exception {
		int result=respOrgDao.delCertChangeById(sqlId,map);
		if(result<1){
			throw new Exception();
		}
		return result;
	}

	
	public Boolean updateRegAndApply(String sqlId, Map map) throws Exception {
		boolean flag=false;
		int num = respOrgDao.updateRegAndApply(sqlId, map);
		if(num>0){
			flag=true;
		}else{
			throw new Exception();
		}
		return flag;
	}

	
	public int delCertChangeById(Map map) throws Exception {
		
		if(null!=map.get("resaultno")){
			int resalut=0;
			int resa=0;
			// TODO Auto-generated method stub
			int res=respOrgDao.delApply("com.wr4.domain.RespOrg.delChangeApply",map);
			if(res<0){
				throw new Exception();
			}else {
				resa=respOrgDao.delApply("com.wr4.domain.RespOrg.updatecert",map);
			}
			return resa;
		}else{
		
			int resalut=0;
			int res2=0;
			int res3=0;
			// TODO Auto-generated method stub
			int res=respOrgDao.delApply("com.wr4.domain.RespOrg.delApply",map);
			if(res > 0){
				res2=respOrgDao.delCert("com.wr4.domain.RespOrg.delCert",map);
				if(res2>0){
					res3=respOrgDao.delCert("com.wr4.domain.RespOrg.updateorgapply",map);
				}
			}else{
				throw new Exception();
			}
			return res3;
		}
	}

	
	
}	
