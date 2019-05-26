package com.wr4.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.logging.SimpleFormatter;

import com.wr4.dao.CertificateDao;
import com.wr4.domain.CertificateInfo;
import com.wr4.service.CertificateService;

import freemarker.template.SimpleDate;

public class CertificateServiceImpl implements CertificateService{
	private CertificateDao certificateDao;
	public CertificateDao getCertificateDao() {
		return certificateDao;
	}
	public void setCertificateDao(CertificateDao certificateDao) {
		this.certificateDao = certificateDao;
	}
	
	public List<CertificateInfo> selectAll(String sqlId,
			CertificateInfo certificateInfo, int start, int limit) throws Exception{
		return certificateDao.selectAll(sqlId, certificateInfo, start, limit);
	}
	
	public CertificateInfo selectOne(String sqlId,
			CertificateInfo certificateInfo) throws Exception {
		return certificateDao.selectOne(sqlId, certificateInfo);
	}
	
	public void updateApply(String sqlId, CertificateInfo certificateInfo) throws Exception {
		certificateDao.updateApply(sqlId, certificateInfo);
	}
	
	public int updateCertByUserIdAndCertType(String sqlId, Map map) throws Exception {
		int back = certificateDao.updateCertByUserIdAndCertType(sqlId, map);
		return back;
	}
	
	public CertificateInfo insertCertNo(String sqlId, String string, String string2,
			String string3, CertificateInfo certificateInfo, String certnum,
			String usertype) throws Exception {
		int j=certificateDao.insertCertNo(sqlId, certificateInfo);
		certificateInfo = selectOne(string, certificateInfo);
		certificateInfo.setUsertype(usertype);
		certificateInfo.setAuditer_mot("");
		certificateInfo.setAuditer("");
		certificateInfo.setAudittype("");
		certificateInfo.setResults("");
		certificateInfo.setAuditname("");
//		certificateDao.insertCertNo(string2,certificateInfo);
		if(certificateInfo.getCertnumber()==null||"".equals(certificateInfo.getCertnumber())){
			certificateInfo.setCertnumber(certnum);
			certificateInfo.setFzdate(new SimpleDateFormat("yyyy年MM月dd日").format(new Date()));
		}
//		updateApply("com.wr4.domain.CertificateInfo.updateApply", certificateInfo);
		int i=certificateDao.updateApply("com.wr4.domain.CertificateInfo.updateApply", certificateInfo);
		if(j+i<2){
			throw new Exception();
		}
		return certificateInfo;
	}

}
