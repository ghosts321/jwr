package com.wr4.dao;

import java.util.List;
import java.util.Map;

import com.wr4.domain.CertificateInfo;

public interface CertificateDao {
	public List<CertificateInfo> selectAll(String sqlId, CertificateInfo certificateInfo, int start, int limit) throws Exception;
	public CertificateInfo selectOne(String sqlId, CertificateInfo certificateInfo) throws Exception;
	public int insertCertNo(String sqlId, CertificateInfo certificateInfo) throws Exception;
	public int updateApply(String sqlId, CertificateInfo certificateInfo) throws Exception;
	public int updateCertByUserIdAndCertType(String sqlId,Map map) throws Exception;
}
