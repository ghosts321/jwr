package com.wr4.dao;

import java.util.List;
import java.util.Map;

import com.wr4.domain.PnApply;

public interface IExchangeCertDao {
	public abstract List getCertByUserid(String sqlId,String userid) throws Exception;
	public abstract int exchangeSubmit(String sqlId,Map map) throws Exception;
	public   int exchangeSubmit(String sqlId,Object object) throws Exception;
	public abstract PnApply getDetialById(String sqlId, String id) throws Exception;
	public abstract int updateCertByUserIdAndCertType(String sqlId,Map map) throws Exception;
}
