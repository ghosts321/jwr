package com.wr4.dao;

import java.util.List;

import com.wr4.domain.CertInfo;
import com.wr4.domain.PnInfo;

public interface ICertrevocationDao<T> {
	
	public List<CertInfo> selectCertByCid(String sqlId, CertInfo certInfo) throws Exception;
	public PnInfo selectPnInfo(String sqlId, CertInfo certInfo) throws Exception;
	
}
