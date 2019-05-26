package com.wr4.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.wr4.dao.EnDao;
import com.wr4.dao.OrgDao;
import com.wr4.domain.CertInfo;
import com.wr4.domain.EnInfo;
import com.wr4.domain.OrgInfo;
import com.wr4.domain.OrgList;
import com.wr4.domain.OrgYearReport;
import com.wr4.domain.RecNotice;
import com.wr4.service.EnService;
import com.wr4.service.OrgService;
import com.wr4.util.DateUtils;

public class OrgServiceImpl<T> implements OrgService<T> {
	private OrgDao<T> orgDao;
	
	public OrgDao<T> getOrgDao() {
		return orgDao;
	}

	public void setOrgDao(OrgDao<T> orgDao) {
		this.orgDao = orgDao;
	}

	
	public List<T> selecteOrgBookList(String sqlId, OrgInfo orgInfo, int start,
			int limit) throws Exception{
		 List<T> list = orgDao.selectOrgBookList(sqlId, orgInfo, start, limit);
		 return list;
	}
	
	
	public List<T> selecteOrgList(String sqlId,OrgList orgList, int start,
			int limit) throws Exception{
		 List<T> list = orgDao.selectOrgList(sqlId, orgList,start, limit);
		 return list;
	}

	
	public OrgInfo scanDetail(Map map) throws Exception{
		OrgInfo orgInfo = orgDao.scanDetail(map);
		return orgInfo;
	}

	
	public OrgInfo applyDetail(Map map) throws Exception{
		OrgInfo orgInfo = orgDao.applyDetail(map);
		return orgInfo;
	}

	
	public String queryNoNum(String sqlId, Map map) throws Exception{
		String num=orgDao.queryNoNum(sqlId,map);
		return num;
	}

	
	public void insertCertNo(String sqlId, Map map) throws Exception{
		int i=orgDao.insertCertNo(sqlId,map);
		if(i<1){
			throw new Exception();
		}
	}

	
	public void insertExamin(String sqlId,Map map) throws Exception{
		int i=orgDao.insertExamin(sqlId,map);
		if(i<1){
			throw new Exception();
		}
	}

	
	
	
	public Map updateApplyCertNo(String sqlId, OrgService orgService,Map map) throws Exception{
		//生成证书号
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String curDate=sdf.format(date);
		/*String certDate=curDate.substring(0, 4);
		map.put("certDate", certDate);*/
		map.put("curDate", curDate);
		/*//当日证书号个数
		String NoNum;
			NoNum = orgDao.queryNoNum("com.wr4.domain.MotOrgInfo.queryNoNum",map);
		if(NoNum.length()!=6){
			int temp=NoNum.length();
			for(int i=0;i<(6-temp);i++){
				NoNum="0".concat(NoNum);
			}
		}
		certDate=certDate+"-"+map.get("adminmot")+"-"+NoNum;
		//添加记录到证书表
		map.put("NoNum", NoNum);*/
		//map.put("certDate", certDate);
		map.put("fzdate", DateUtils.getDateFormatString().substring(0,19));
		map.put("certstatus", "1");
		map.put("del", "0");
		//添加证书号到证书表
		int i=orgDao.insertCertNo("com.wr4.domain.MotOrgInfo.insertCertNo",map);
		map.put("sqlId", "com.wr4.domain.MotOrgInfo.applyDetail");
		//流程表添加记录 状态为已发证
		int j=orgDao.insertExamin("com.wr4.domain.MotOrgInfo.insertExamin",map);
		//申请表加证书号
//		orgService.updateApplyCertNo("com.wr4.domain.MotOrgInfo.updateApplyCertNo",orgService ,map);
		int k=orgDao.updateApplyCertNo("com.wr4.domain.MotOrgInfo.updateApplyCertNo",map);
		//map.put("cid", curDate.concat(NoNum));
		if(i+j+k<3){
			throw new Exception();
		}
		return map;
	}
		


	
	public OrgInfo getOrgInfo(String sqlId, Map map) throws Exception{
		OrgInfo orgInfo = orgDao.getOrgInfo(sqlId,map);
		return orgInfo;
	}

	
	public Integer saveRecNotice(String sqlId, RecNotice recNotice) throws Exception{
		int flag = orgDao.saveRecNotice(sqlId,recNotice);
		if(flag<1){
			throw new Exception();
		}
		return flag;
	}

	
	public Integer updateAdvice(String sqlId, CertInfo certInfo,Map map) throws Exception{
		//更新证书表del
		int re=0;
		int flag=orgDao.updateAdvice(sqlId,certInfo);
		//更新申请表 cid=null
		int flag2=orgDao.updateApply("com.wr4.domain.MotOrgInfo.updateApply",certInfo);
		//插入流程表数据
		int flag3=orgDao.insertExamine("com.wr4.domain.MotOrgInfo.insertExamine",map);
		if((flag+flag2+flag3)==3){
			re=1;
		}else{
			throw new Exception();
		}
		return re;
	}
	public Integer updateEnAdvice(String sqlId, CertInfo certInfo,Map map) throws Exception{
		//更新证书表del
		int flag=orgDao.updateAdvice(sqlId,certInfo);
		//更新申请表 cid=null
		int flag2=orgDao.updateApply("com.wr4.domain.MotOrgInfo.updateEnApply",certInfo);
		//插入流程表数据
		int flag3=orgDao.insertExamine("com.wr4.domain.MotOrgInfo.updateEnCancelExamine",map);
		if((flag+flag2+flag3)==3){
			return 1;
		}else{
			throw new Exception();
		}
	}
	public Integer updatePnAdvice(String sqlId, CertInfo certInfo,Map map) throws Exception{
		//更新证书表del
		int flag=orgDao.updateAdvice(sqlId,certInfo);
		//更新申请表 cid=null
		int flag2=orgDao.updateApply("com.wr4.domain.MotOrgInfo.updatePnApply",certInfo);
		//插入流程表数据
		//int flag3=orgDao.insertExamine("com.wr4.domain.MotOrgInfo.updateEnCancelExamine",map);
		if((flag+flag2)==2){
			return 1;
		}else{
			throw new Exception();
		}
	}
	
	public List<T> selectOrgList(String sqlId, OrgInfo orgInfo) throws Exception{
		List<T> list = orgDao.selectOrgList(sqlId, orgInfo);
		return list;
	}

	
	public List<T> getYearReport(String sqlId, OrgYearReport orgYearReport,
			int start, int limit) throws Exception{
		List list=orgDao.getYearReport(sqlId,orgYearReport,start,limit);
		return list;
	}

	
	public List getOrgByCon(String sql, Map map,int start, int limit) throws Exception {
		return orgDao.getOrgByCon(sql, map,start,limit);
	}

	
	public List getOrgByConAll(String sqlId, Map map) throws Exception {
		return orgDao.getOrgByConAll(sqlId, map);
	}

	
	public List<T> selecteOrgList(String sqlId, OrgList orgList)
			throws Exception {
		List<T> list = orgDao.selectOrgList(sqlId, orgList);
		 return list;
	}

	
	public Map updateEnApplyCertNo(String sqlId, OrgService orgService, Map map)
			throws Exception {
		//生成证书号
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String curDate=sdf.format(date);
		/*String certDate=curDate.substring(0, 4);
		map.put("certDate", certDate);*/
		map.put("curDate", curDate);
		//当日证书号个数
		/*String NoNum;
			NoNum = orgDao.queryNoNum("com.wr4.domain.MotOrgInfo.queryNoNum",map);
		if(NoNum.length()!=6){
			int temp=NoNum.length();
			for(int i=0;i<(6-temp);i++){
				NoNum="0".concat(NoNum);
			}
		}
		certDate=certDate+"-"+map.get("adminmot")+"-"+NoNum;
		map.put("certDate", certDate);*/
		//添加记录到证书表
		//map.put("NoNum", NoNum);
		//map.put("fzdate", DateUtils.getDateFormatString().substring(0,19));
		map.put("certstatus", "1");
		map.put("del", "");
		//添加证书号到证书表
		int i=orgDao.insertCertNo("com.wr4.domain.MotOrgInfo.insertCertNo",map);
		map.put("sqlId", "com.wr4.domain.MotOrgInfo.applyDetail");
		//流程表添加记录 状态为已发证
		int j=orgDao.insertExamin("com.wr4.domain.MotOrgInfo.insertEnExamin",map);
		//申请表加证书号
//		orgService.updateApplyCertNo("com.wr4.domain.MotOrgInfo.updateApplyCertNo",orgService ,map);
		int k=orgDao.updateApplyCertNo("com.wr4.domain.MotOrgInfo.updateEnApplyCertNo",map);
		//map.put("cid", curDate.concat(NoNum));
		if(i+j+k<3){
			throw new Exception();
		}
		return map;
	}

	
	public List getMotYearReportList(String sqlId, Map map, int start, int limit)
			throws Exception {
		// TODO Auto-generated method stub
		return orgDao.getMotYearReportList(sqlId,map,start,limit);
	}

	
	public List getMotYearReportAllList(String sqlId, Map map) throws Exception {
		// TODO Auto-generated method stub
		return orgDao.getMotYearReportAllList(sqlId,map);
	}

	
	public List getWorkProList(String sqlId, Map map, int start, int limit)
			throws Exception {
		return orgDao.getWorkProList(sqlId,map,start,limit);
	}

	
	public List getWorkProAllList(String sqlId, Map map) throws Exception {
		// TODO Auto-generated method stub
		return orgDao.getWorkProAllList(sqlId,map);
	}
	
	public Object updateEmployPn(String sqlId,Map map) throws Exception{
		int i= (Integer) orgDao.updateEmployPn(sqlId,map);
		if(i<0){
			throw new Exception();
		}
		return i;
		
	}
	
	
	public String selecteBusName(String sqlId, Map map) throws Exception {
		// TODO Auto-generated method stub
		return orgDao.selecteBusName(sqlId,map);
	}


}
