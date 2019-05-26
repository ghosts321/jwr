package com.wr4.service;

import com.wr4.domain.EnRegInfo;
import com.wr4.domain.MotRegInfo;
import com.wr4.domain.OrgRegInfo;
import com.wr4.domain.PnRegInfo;

public interface IRegService {
	/**
	 * 主管机关用户注册
	 * @return
	 * @throws Exception
	 */
	public int motReg(String sqlId,MotRegInfo motRegInfo)throws Exception;
	/**
	 * 企业用户注册
	 * @return
	 * @throws Exception
	 */
	public int enReg(String sqlId,EnRegInfo enRegInfo)throws Exception;
	/**
	 * 考评机构用户注册
	 * @return
	 * @throws Exception
	 */
	public int orgReg(String sqlId,OrgRegInfo orgRegInfo)throws Exception;
	/**
	 * 考评员用户注册
	 * @return
	 * @throws Exception
	 */
	public int pnReg(String sqlId,PnRegInfo pnRegInfo)throws Exception;
}
