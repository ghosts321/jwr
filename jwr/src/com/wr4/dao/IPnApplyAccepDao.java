package com.wr4.dao;

import java.util.List;
import java.util.Map;

public interface IPnApplyAccepDao {
	public List pnApplyAccept(String sqlId, Map map) throws Exception;
	public List pnApplyAccept(String sqlId,Map map,int offset,int limit) throws Exception;
	public List applyAcceptGetTrain(String string, Map map) throws Exception;
}
