package com.wr4.dao;

import java.util.List;
import java.util.Map;

public interface IEnFileManageDao {
	//本机构专兼职考评员
	public abstract List parttimeData(String sqlId,Map map) throws Exception;
	//考评员学历一览
	public abstract List pneduData(String sqlId,Map map) throws Exception;
	//考评员培训考试
	public abstract List pnTrainData(String sqlId,Map map) throws Exception;
}
