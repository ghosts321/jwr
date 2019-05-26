package com.wr4.service;

import java.util.List;
import java.util.Map;

public interface IPnApplyAccepService {
		public abstract List pnApplyAccept(String sqlId, Map map) throws Exception;
		public List pnApplyAccept(String sqlId,Map map,int offset,int limit) throws Exception;
		public abstract List applyAcceptGetTrain(String string, Map map) throws Exception;
}
