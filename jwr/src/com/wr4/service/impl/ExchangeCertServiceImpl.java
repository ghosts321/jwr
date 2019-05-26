package com.wr4.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.wr4.dao.IExchangeCertDao;
import com.wr4.domain.EnInfo;
import com.wr4.domain.PnApply;
import com.wr4.service.CertificateService;
import com.wr4.service.IExchangeCertService;

public class ExchangeCertServiceImpl implements IExchangeCertService {
	private IExchangeCertDao iExchangeCertDao;
	private CertificateService certificateService;
	
	public CertificateService getCertificateService() {
		return certificateService;
	}
	public void setCertificateService(CertificateService certificateService) {
		this.certificateService = certificateService;
	}
	public IExchangeCertDao getiExchangeCertDao() {
		return iExchangeCertDao;
	}
	public void setiExchangeCertDao(IExchangeCertDao iExchangeCertDao) {
		this.iExchangeCertDao = iExchangeCertDao;
	}

	
	public List getCertByUserid(String sqlId, String userid) throws Exception {
		return iExchangeCertDao.getCertByUserid(sqlId, userid);
	}
	/***
	 * 换证申请提交的两个动作，更新pn_reg表和cert表，如果有一个动作失败，事物回滚，不提交数据库
	 */
	
	public boolean exchangeSubmit(String sqlId, Map map) throws Exception {
		boolean flag = false;
		//更新pn_reg表此考评员记录的changereason字段，将换证原因更新
		boolean flag1 = iExchangeCertDao.exchangeSubmit(sqlId, map)>0?true:false;
		//更新cert证书表，将这个证书的状态改为已经换证
		int back = certificateService.updateCertByUserIdAndCertType("com.wr4.domain.CertificateInfo.updateCertByUserIdAndCertType", map);
		if(flag1&&back>0){
			flag = true;
		}else{
			throw new Exception();
		}
		return flag;
	}

	
	public PnApply getDetialById(String sqlId, String id) throws Exception {
		return iExchangeCertDao.getDetialById(sqlId,id);
	}
	/***
	 * 换证申请提交的两个动作，更新pn_reg表和cert表，如果有一个动作失败，事物回滚，不提交数据库
	 */
	
	public boolean enexchangeSubmit(String sqlId, Map map) throws Exception {
		boolean flag = false;
		//更新en_apply表此考评员记录的changereason字段，将换证原因更新
	//	boolean flag1 = iExchangeCertDao.exchangeSubmit(sqlId, map)>0?true:false;
		//更新cert证书表，将这个证书的状态改为已经换证
		int back = certificateService.updateCertByUserIdAndCertType("com.wr4.domain.CertificateInfo.updateCertByUserIdAndCertType", map);
		if( back>0){
			flag = true;
		}else{
			throw new Exception();
		}
		return flag;
	}
	public boolean enexchangeSubmit(String sqlId, Object object) throws Exception {
		boolean flag = false;
		//更新en_apply表此考评员记录的changereason字段，将换证原因更新
		boolean flag1 = iExchangeCertDao.exchangeSubmit(sqlId, object)>0?true:false;
		Map map =new HashMap();
		map.put("userid", ((EnInfo) object).getUserId());
		map.put("cid", ((EnInfo) object).getCid());
		boolean bol=enexchangeSubmit(sqlId, map);
		  if(flag1&&bol){
			  flag=true;
		  }else{
				throw new Exception();
			}
		return flag;
	}
}
