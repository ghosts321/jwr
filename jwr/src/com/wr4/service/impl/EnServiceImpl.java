package com.wr4.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import com.wr4.dao.EnDao;
import com.wr4.domain.CertificateInfo;
import com.wr4.domain.CheckOrg;
import com.wr4.domain.EnInfo;
import com.wr4.domain.EnPFInfo;
import com.wr4.domain.Examine;
import com.wr4.domain.FieldValueInfo;
import com.wr4.domain.ProblemRec;
import com.wr4.domain.RecNotice;
import com.wr4.domain.YearReport;
import com.wr4.service.EnService;
import com.wr4.service.IPnPageService;
import com.wr4.util.DateUtils;

public class EnServiceImpl<T> implements EnService<T> {
	private EnDao<T> enDao;
	private IPnPageService pnPageService;

	public EnDao<T> getEnDao() {
		return enDao;
	}


	public void setEnDao(EnDao<T> enDao) {
		this.enDao = enDao;
	}


	public IPnPageService getPnPageService() {
		return pnPageService;
	}


	public void setPnPageService(IPnPageService pnPageService) {
		this.pnPageService = pnPageService;
	}


	public List<T> selecteEnList(String sqlId, EnInfo enInfo, int start,
			int limit) throws Exception {
		 List<T> list = enDao.selectEnList(sqlId, enInfo, start, limit);
		 return list;
	}
	public List selecteEnList(String sqlId, Object object) throws Exception {
		 List  list = enDao.selecteEnList(sqlId,object);
		 return list;
	}
	/**
	 * 插入附加考评流程
	 * @param sqlId
	 * @param object
	 * @return
	 * @throws Exception
	 */
	public boolean  insertAddedExamine(String sqlId, Object object)throws Exception{
		 EnInfo enDetail=new EnInfo();
		 enDetail.setCid(((Map)object).get("certnumber").toString());
		EnInfo enInfo = this.enDao.getEnDetail("com.wr4.domain.MotEnInfo.getEnDetail", enDetail);
		((Map)object).put("results", "1");
		((Map)object).put("pid", enInfo.getPid());
		((Map)object).put("applyid", enInfo.getId());
		((Map)object).put("bustype", enInfo.getType2());
		boolean bol=false; 
		int i=enDao.insertAddedExamine( sqlId,  object);
		 if(i>0){
			 bol=true;
		 }else{
			 throw new Exception();
		 }
		 return bol;
	}
	
	 
	/**
	 * 返回List
	 * 此方法可共用
	 */
	public List  selecteFileList(String sqlId, FieldValueInfo fileValue, int start, 
			int limit)throws Exception{
		 List  list = enDao.selecteFileList(sqlId, fileValue, start, limit);
		 return list;
	}
	/**
	 * 可抽成公共查询 值列表方法
	 */
	public List  selecteFileList(String sqlId, String fileType)throws Exception{
		return enDao.selecteFileList(sqlId, fileType );
	}
	/**
	 * 查询详细信息
	 * 
	 */
	public EnPFInfo  selecteEnPfDetail(String sqlId, String pid)throws Exception{
		return enDao.selecteEnPfDetail(sqlId, pid );
		
	}
	public List<T> getYearReport(String sqlId, YearReport yearReport,
			int start, int limit) throws Exception {
		 List<T> list = enDao.getYearReport(sqlId, yearReport, start, limit);
		return list;
	}


	
	public ProblemRec getEnInfo(String sqlId, ProblemRec problemRec) throws Exception {
		ProblemRec problem = enDao.getEnInfo(sqlId, problemRec);
		return problem;
	}


	
	public List<T> getCertInfo(String sqlId, ProblemRec problemRec) throws Exception {
		List<T> list = enDao.getCertInfo(sqlId, problemRec);
		return list;
	}


	
	public boolean saveRecNotice(String sqlId, RecNotice recNotice) throws Exception {
		boolean flag=false;
		int num = this.enDao.saveRecNotice(sqlId, recNotice);
		if(num>0){
			flag=true;
		}
		return flag;
	}


	
	public EnInfo getEnDetail(String sqlId, EnInfo enDetail) throws Exception {
		EnInfo enInfo = this.enDao.getEnDetail(sqlId, enDetail);
		return enInfo;
	}
	
	public List showOrgAdvice(String sqlId, Map map) throws Exception {
		List list = this.enDao.showOrgAdvice(sqlId, map);
		return list;
	}


	public boolean saveOrg(String sqlId, CheckOrg org) throws Exception {
		boolean flag = false;
		int num = enDao.saveOrg(sqlId, org);
		if(num>0){
			flag=true;
		}
		return flag;
	}
	
	public boolean savePingFen(String sqlId, EnPFInfo enPFInfo)throws Exception{
		
		boolean flag = false;
		int num = enDao.savePingFen(sqlId, enPFInfo);
		if(num>0){
			flag=true;
		}else{
			throw new Exception();
		}
		return flag;
	}

	public List getEnByCon(String sqlId, Map map,int offset,int limit) throws Exception {
		return enDao.getEnByCon(sqlId, map,  offset,  limit);
	}


	
	public int getApplyNum(String sqlId, EnInfo enInfo) throws Exception {
		return enDao.getApplyNum(sqlId, enInfo);
	}


	
	public boolean insertEnApply(String sqlId, EnInfo enInfo) throws Exception {
		boolean flag=false;
		int num = enDao.insertEnApply(sqlId, enInfo);
		if(num>0){
			flag = true;
		}else{
			throw new Exception();
		}
		return flag;
	}


	
	public List getEnByConAll(String slqId, Map map) throws Exception {
		return enDao.getEnByConAll(slqId, map);
	}


	
	public List<T> getRecListInfos(String sqlId, RecNotice recNotice)
			throws Exception {
		List<T> list = enDao.getRecListInfos(sqlId, recNotice);
		return list;
	}


	
	public boolean saveRecReport(String sqlId, RecNotice recNotice)
			throws Exception {
		boolean flag=false;
		int num = enDao.saveRecReport(sqlId, recNotice);
		if(num>0){
			flag=true;
		}else{
			throw new Exception();
		}
		return flag;
	}


	
	public boolean saveEnApply(String sqlId, EnInfo enInfo, Examine examine)
			throws Exception {
		boolean flag=false;
		boolean flag1 = enDao.insertEnApply("com.wr4.domain.MotEnInfo.insertEnApply", enInfo)>0?true:false;
		EnInfo en = this.enDao.getEnDetail("com.wr4.domain.MotEnInfo.getApplyId", enInfo);
		examine.setApplyId(String.valueOf(en.getId()));
		boolean flag2 = pnPageService.insertExam("com.wr4.domain.PnTrain.examInsert", examine);
		if(flag1&&flag2){
			flag=true;
		}else{
			throw new Exception();
		}
		return flag;
	}


	
	public boolean submitExam(String sqlId, Examine examine,String usertype,String examFlag) throws Exception {
		boolean flag=false;
		boolean flag1=false;
		boolean flag2 = false;
		
		if("pn".equals(usertype)){
			flag1 = pnPageService.updateExam("com.wr4.domain.PnTrain.updateApply",examine);
			if(flag1){
				examine.setStatus("待发证");
				pnPageService.updateExam("com.wr4.domain.PnTrain.insertPnExam",examine);
				flag2 = true;
			}
		}else if("pn1".equals(usertype)){
			flag1 = pnPageService.updateExam( sqlId,examine);
			boolean bol1=false;
			boolean bol2=false;
			if("0".equals(examine.getResults())){
				//删除原申请数据   逻辑删除
				bol2 = pnPageService.updateExam( "com.wr4.domain.PnTrain.updateOldPnApply",examine);
				//删除证书表
				bol1= pnPageService.updateExam( "com.wr4.domain.PnTrain.updateChangeCert",examine);
			}else{
				//更新证书表证书为有效
				bol1= pnPageService.updateExam( "com.wr4.domain.PnTrain.updateApplyCert",examine);
				bol2=true;
			}
			
			if(flag1&&bol1&&bol2){
				flag2 = true;
			}
		}else{
			
			if(!"org".equals(usertype)&&examine.getBeiyong4()!=null){
				//添加证书前先判断是否已经拥有证书
				CertificateInfo certificateInfo=new CertificateInfo();
				certificateInfo.setUserid(examine.getBeiyong4());
				certificateInfo.setBussinestype(examine.getBeiyong3());
				List ss= (List)enDao.selectByone("com.wr4.domain.CertificateInfo.isHaveCert",  certificateInfo);
				
				if(ss!=null&&ss.size()>0){
					flag=false;
					return flag;
				}
			}
			if(examine.getResults().equals("0")){
				flag1 = pnPageService.updateExam("com.wr4.domain.PnTrain.updateExam",examine);
				if("en".equals(usertype)){
					boolean flag3 =  pnPageService.updateExam("com.wr4.domain.PnTrain.enApplyUpdate", examine);
					if(flag1){
						 flag1=flag3;
					}
				}
				if("org".equals(usertype)){
					Map map=new HashMap();
					map.put("resp", "不同意");
					map.put("advice", examine.getAdvice().trim());
					map.put("applyid", examine.getApplyId());
					map.put("respdate", DateUtils.getDateFormatString().substring(0, 19));
					boolean flag3 = pnPageService.updateOrgApply("com.wr4.domain.PnTrain.updateOrgApply",map);
					if(flag1){
						flag1=flag3;
					}
				}
				if(flag1){
					flag2 = true;
				}
			}else{
				examine.setHandletype(usertype);
				//表示二级主管机关初审核
				if("1".equals(examFlag)){
					examine.setResults("2");
				}
				flag1 = pnPageService.updateExam("com.wr4.domain.PnTrain.updateExam",examine);
				flag2 = pnPageService.insertExam("com.wr4.domain.PnTrain.examInsert", examine);
				if("en".equals(usertype)){
					//如果字段auditer为空 说明没有指定考评机构 此时应该是二级主管机关初受理
					if(StringUtils.isBlank(examine.getAuditer())){
						examine.setResults("2");
					}
					//表示二级主管机关初审核
					if("1".equals(examFlag)){
						examine.setResults("2");
					}
					boolean flag3 =  pnPageService.updateExam("com.wr4.domain.PnTrain.enApplyUpdate", examine);
					if(flag1&&flag2){
						 flag1=flag3;
					}
				}
				if("org".equals(usertype)){
					Map map=new HashMap();
					map.put("resp", "同意");
					map.put("applyid", examine.getApplyId());
					map.put("advice", examine.getAdvice().trim());
					map.put("respdate", DateUtils.getDateFormatString().substring(0, 19));
					pnPageService.updateOrgApply("com.wr4.domain.PnTrain.updateOrgApply",map);
				}
			}
		}
		if(flag1&&flag2){
			flag=true;
		}else{
			throw new Exception();
		}
		return flag;
	}


	
	public boolean delEnApplyInfo(String sqlId, int id) throws Exception {
		boolean flag=false;
		int num = enDao.delEnApplyInfo(sqlId, id);
		if(num>0){
			flag=true;
		}else{
			throw new Exception();
		}
		return flag;
	}


	
	public boolean checkOrg(String sqlId, EnInfo enInfo) throws Exception {
		boolean flag=false;
		int num = enDao.checkOrg(sqlId, enInfo);
		if(num>0){
			flag=true;
		}else{
			throw new Exception();
		}
		return flag;
	}

	
	public List getPnByConAll(String sqlId, Map map) throws Exception {
		return enDao.getPnByConAll(sqlId,map);
	}


	
	public List getPnByCon(String sqlId, Map map, int offset, int limit)
			throws Exception {
		// TODO Auto-generated method stub
		return enDao.getPnByCon(sqlId, map, offset, limit);
	}


	
	public List<T> getSchedule(String sqlId, Examine ex) throws Exception {
		return enDao.getSchedule(sqlId, ex);
	}


	
	public int getCount(String sqlId, EnInfo enInfo) throws Exception {
		List list = enDao.getCount(sqlId, enInfo);
		return list.size();
	}
	
	public Object  getOrgName(String sqlId,String sorg)throws Exception{
		return enDao. getOrgName(sqlId,sorg);
	}
	/**
	 * 企业换证申请审批提交
	 * zhangli
	 * @param sqlId
	 * @param object
	 * @return
	 * @throws Exception
	 */
	public boolean submitAuditChangeCert(String sqlId,Object object)throws Exception{
		boolean rbol=false;
		if("0".equals(((Map)object).get("changeresault"))){
			//<!-- 更新该条换证申请  审批状态  意见  及日期-->
			boolean bol2=enDao. submitAuditChangeCert("com.wr4.domain.MotEnInfo.updateEnApplyChange",object);
			if(bol2){
				rbol=true;
			}
		}else if("1".equals(((Map)object).get("changeresault"))){
			//将换证申请审批分为三步
			//  <!-- 更新原证书申请数据 en_apply 中的数据   del=1 -->
			boolean bol=enDao. submitAuditChangeCert("com.wr4.domain.MotEnInfo.updateOldEnApplyChange",object);
			//<!-- 更新原证书 cert   del=1 -->
			boolean bol1=enDao. submitAuditChangeCert("com.wr4.domain.MotEnInfo.updateOldEnCertChange",object);
			//<!-- 更新该条换证申请  审批状态  意见  及日期-->
			boolean bol2=enDao. submitAuditChangeCert("com.wr4.domain.MotEnInfo.updateEnApplyChange",object);
			if(bol&&bol1&&bol2){
				rbol=true;
			}
		}
		if(!rbol){
			throw new Exception();
		}
		return rbol;
	}


	
	public String queryNoNum(String sqlId, Map map) throws Exception {
		String num = enDao.queryNoNum(sqlId, map);
		return num;
	}


	public boolean updateEnApply(String sqlId, EnInfo enInfo, Examine examine)
			throws Exception {
		boolean flag=false;
		boolean flag1 = enDao.updateEnApply("com.wr4.domain.MotEnInfo.updateForEnApply", enInfo)>0?true:false;
		if(flag1){
			flag=true;
		}else{
			throw new Exception();
		}
		return flag;
	}


	@Override
	public List getEnApplyByCityAndType(String sqlId, Map map) throws Exception {
		List list = enDao.getEnApplyByCityAndType(sqlId,map);
		return list;
	}
	
	@Override
	public boolean updateKhyd(String sqlId, Map map) throws Exception {
		return enDao.updateKhyd(sqlId, map);
	}
	@Override
	public boolean updateKpxz(String sqlId, Map map) throws Exception {
		return enDao.updateKpxz(sqlId, map);
	}
	@Override
	public boolean addKhyd(String sqlId, Map map) throws Exception {
		return enDao.addKhyd(sqlId, map);
	}
	@Override
	public boolean addKpxz(String sqlId, Map map) throws Exception {
		return enDao.addKpxz(sqlId, map);
	}
	@Override
	public boolean deleteKhyd(String sqlId, Map map) throws Exception {
		return enDao.deleteKhyd(sqlId, map);
	}
	@Override
	public boolean deleteKpxz(String sqlId, Map map) throws Exception {
		return enDao.deleteKpxz(sqlId, map);
	}
}
