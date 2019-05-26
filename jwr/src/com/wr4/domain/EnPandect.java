package com.wr4.domain;



/**
 * 企业注册审批汇总
 * @author user
 *
 */
public class EnPandect {

	private String motCode;
	private String motName;
	private int yzc; //已注册
	private int ysl; //已受理
	private int ysh; //已审核
	private int ykp; //已考评
	public String getMotCode() {
		return motCode;
	}
	public void setMotCode(String motCode) {
		this.motCode = motCode;
	}
	public String getMotName() {
		return motName;
	}
	public void setMotName(String motName) {
		this.motName = motName;
	}
	public int getYzc() {
		return yzc;
	}
	public void setYzc(int yzc) {
		this.yzc = yzc;
	}
	public int getYsl() {
		return ysl;
	}
	public void setYsl(int ysl) {
		this.ysl = ysl;
	}
	public int getYsh() {
		return ysh;
	}
	public void setYsh(int ysh) {
		this.ysh = ysh;
	}
	public int getYkp() {
		return ykp;
	}
	public void setYkp(int ykp) {
		this.ykp = ykp;
	}
	
}
