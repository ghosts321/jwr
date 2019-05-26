package com.wr4.service;

import java.util.List;
import java.util.Map;

import com.wr4.domain.PnTrain;

public interface IPnService<T> {
    //查询考评员培训考试记录
	public List<T> selectPnTrain(String sqlId, Map map, int start, int limit) throws Exception;
}
