package com.wr4.service;

import java.util.List;
import java.util.Map;

import com.wr4.domain.PnApply;

public interface IExchangeCertService {
	public   List getCertByUserid(String sqlId,String userid) throws Exception;
	public   boolean exchangeSubmit(String sqlId,Map map) throws Exception;
	public   PnApply getDetialById(String sqlId,String id) throws Exception;
	public   boolean enexchangeSubmit(String sqlId, Map map) throws Exception;
	public   boolean enexchangeSubmit(String sqlId, Object object) throws Exception;
}
