package com.wr4.service;

import java.util.List;
import java.util.Map;

import com.wr4.domain.CertificateInfo;

public interface CertificateService {
	public List<CertificateInfo> selectAll(String sqlId, CertificateInfo certificateInfo, int start, int limit) throws Exception;
	public CertificateInfo selectOne(String sqlId, CertificateInfo certificateInfo) throws Exception;
	public CertificateInfo insertCertNo(String sqlId,String string, String string2, String string3, 
			CertificateInfo certificateInfo, String certnum, String usertype) throws Exception;
	public void updateApply(String sqlId,CertificateInfo certificateInfo) throws Exception;
	public int updateCertByUserIdAndCertType(String sqlId,Map map) throws Exception;
}
