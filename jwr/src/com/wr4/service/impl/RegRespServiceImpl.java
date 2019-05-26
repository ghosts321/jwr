package com.wr4.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import net.sf.json.JSONObject;

import com.wr4.dao.ILoginDao;
import com.wr4.dao.IRegRespDao;
import com.wr4.domain.EnRegInfo;
import com.wr4.domain.MotRegInfo;
import com.wr4.domain.OrgRegInfo;
import com.wr4.domain.PnRegInfo;
import com.wr4.domain.PnTrain;
import com.wr4.domain.TaskAssignation;
import com.wr4.domain.User;
import com.wr4.service.IRegRespService;
import com.wr4.util.DateUtils;

public class RegRespServiceImpl implements IRegRespService {
	private IRegRespDao regRespDao;
	private ILoginDao loginDao;
	
	public ILoginDao getLoginDao() {
		return loginDao;
	}

	public void setLoginDao(ILoginDao loginDao) {
		this.loginDao = loginDao;
	}
	
	public IRegRespDao getRegRespDao() {
		return regRespDao;
	}


	public void setRegRespDao(IRegRespDao regRespDao) {
		this.regRespDao = regRespDao;
	}


	public List queryMotReg(String sqlId,MotRegInfo motRegInfo, int start, int limit) throws Exception {
		return regRespDao.queryMotReg(sqlId,motRegInfo,start,limit);
	}
	public List queryMotReg(String sqlId,MotRegInfo motRegInfo) throws Exception {
		return regRespDao.queryMotReg(sqlId,motRegInfo);
	}
	public List queryEnReg(String sqlId, EnRegInfo enRegInfo, int start, int limit)
			throws Exception {
		return regRespDao.queryEnReg(sqlId,enRegInfo,start,limit);
	}
	public List queryEnReg(String sqlId, EnRegInfo enRegInfo)
			throws Exception {
		return regRespDao.queryEnReg(sqlId,enRegInfo);
	}
	public List queryRegList(String sqlId, Object object, int start, int limit) throws Exception{
		return regRespDao.queryRegList(sqlId,object,start,limit);
	}
	public List queryRegList(String sqlId, Object object) throws Exception{
		return regRespDao.queryRegList(sqlId,object);
	}
	public List queryPnReg(String sqlId, PnTrain pnTrain, int start, int limit)
			throws Exception {
		return null;
	}


	public List queryOrgReg(String sqlId, PnTrain pnTrain, int start, int limit)
			throws Exception {
		return null;
	}
	
	public Object queryMotRegDetail(String sqlId,String pid) throws Exception{
		
		return regRespDao.queryMotRegDetail(sqlId,pid);
	}
	public int regRespDelete(String sqlId, Object object) throws Exception{
		
		int i=regRespDao.regRespDelete(sqlId,object);
		if(i<1){
			throw new Exception();
		}
		return i;
	}
	
	
	public int regRespUpdate(String sqlId,Object object) throws Exception{
		int i=		regRespDao.regRespUpdate(sqlId, object);
		JSONObject jsonss=JSONObject.fromObject(object);
		 
		if(i>0){
			
				//插入不通用户
				Map map=new HashMap();
				if(object.getClass().getName().equals(MotRegInfo.class.getName())){
					JSONObject json=JSONObject.fromObject(object);
					MotRegInfo motRegInfo =(MotRegInfo) regRespDao.queryMotRegDetail("com.wr4.domain.User.getMotDetail",  json.get("id").toString());
					json=JSONObject.fromObject(motRegInfo);
					map.put("commonname", json.get("motname").toString())	;
					map.put("paperid", json.get("pid").toString())	;
					map.put("telephonenumber", json.get("tel").toString())	;
	//				map.put("fax", json.get("tax").toString())	;
					map.put("mobiletelephone", json.get("mobile").toString())	;
					map.put("email", json.get("email").toString())	;
					map.put("usertype","mot")	;
					map.put("registerdate",DateUtils.getDateFormatString())	;
					map.put("user_id", json.get("userid").toString())	;
					map.put("user_pass", json.get("userpass").toString())	;
					map.put("del", '0')	;
					map.put("city", json.get("city")+"");
					map.put("mot", json.get("adminmot").toString())	;
					map.put("contact", json.get("contact")==null?"": json.get("contact"))	;
					map.put("fax", json.get("tax")==null?"": json.get("tax"))	;
					map.put("address", json.get("address")==null?"": json.get("address"))	;
					map.put("legalp", json.get("legalp")==null?"": json.get("legalp"));
					if(jsonss.get("regresp").toString().equals("1")){
						int z =regRespDao.regRespUpdate("com.wr4.domain.User.insertMotUser", map);
						if(z<1){
							throw new Exception();
						}
					}
				}else if(object.getClass().getName().equals(OrgRegInfo.class.getName())){
					JSONObject json=JSONObject.fromObject(object);
					OrgRegInfo motRegInfo =(OrgRegInfo) regRespDao.queryMotRegDetail("com.wr4.domain.MotInfo.getOrgDetail",  json.get("id").toString());
					json=JSONObject.fromObject(motRegInfo);
					map.put("commonname", json.get("orgname"))	;
					map.put("paperid", json.get("pid"))	;
					map.put("telephonenumber", json.get("tel"))	;
	//				map.put("fax", json.get("fax"))	;
					map.put("mobiletelephone", json.get("mobile"))	;
					map.put("province", json.get("province"))	;
					map.put("email", json.get("email"))	;
					map.put("usertype","org")	;
					map.put("registerdate",DateUtils.getDateFormatString())	;
					map.put("user_id", json.get("userid"))	;
					map.put("user_pass", json.get("userpass"))	;
					map.put("del", '0')	;
					map.put("mot", json.get("adminmot"))	;
					map.put("contact", json.get("contact")==null?"": json.get("contact"))	;
					map.put("fax", json.get("fax")==null?"": json.get("fax"))	;
					map.put("address", json.get("address")==null?"": json.get("address"))	;
					map.put("legalp", json.get("legalp")==null?"": json.get("legalp"));
					map.put("bustype",json.get("bustype"))	;
					map.put("buclass",json.get(""))	;
					map.put("city",json.get("city"))	;
					if(jsonss.get("regresp").toString().equals("1")){
						int z =regRespDao.regRespUpdate("com.wr4.domain.User.insertUser", map);
						if(z<1){
							throw new Exception();
						}
					}
				}if(object.getClass().getName().equals(PnRegInfo.class.getName())){
					JSONObject json=JSONObject.fromObject(object);
					PnRegInfo motRegInfo =(PnRegInfo) regRespDao.queryMotRegDetail("com.wr4.domain.MotInfo.getPnDetail",  json.get("id").toString());
					json=JSONObject.fromObject(motRegInfo);
					map.put("commonname", json.get("username"))	;
					map.put("paperid", json.get("pid"))	;
					map.put("telephonenumber", json.get("tel"))	;
	//				map.put("fax", json.get("fax"))	;
					map.put("mobiletelephone", json.get("mobile"))	;
					map.put("province", json.get("comefrom"))	;
					map.put("email", json.get("email"))	;
					map.put("usertype","pn")	;
					map.put("registerdate",DateUtils.getDateFormatString())	;
					map.put("user_id", json.get("userid"))	;
					map.put("user_pass", json.get("userpass"))	;
					map.put("provincename", json.get("comefrom"))	;
					map.put("del", '0')	;
					map.put("mot", json.get("admin"))	;
					map.put("contact",json.get("username"))	;
					map.put("bustype",json.get("type"))	;
					map.put("fax", json.get("fax")==null?"": json.get("fax"))	;
					map.put("address", json.get("address")==null?"": json.get("address"))	;
					map.put("legalp", json.get("legalp")==null?"": json.get("legalp"));
					map.put("buclass",json.get(""))	;
					map.put("city",json.get("city"))	;
					
					if(jsonss.get("regresp").toString().equals("1")){
						int z =regRespDao.regRespUpdate("com.wr4.domain.User.insertUser", map);
						if(z<1){
							throw new Exception();
						}
					}
				}if(object.getClass().getName().equals(EnRegInfo.class.getName())){
					JSONObject json=JSONObject.fromObject(object);
					EnRegInfo motRegInfo =(EnRegInfo) regRespDao.queryMotRegDetail("com.wr4.domain.MotInfo.getEnDetail",  json.get("id").toString());
					json=JSONObject.fromObject(motRegInfo);
					map.put("commonname", json.get("username"))	;
					map.put("paperid", json.get("pid"))	;
					map.put("telephonenumber", json.get("tel"))	;
	//				map.put("fax", json.get("tax"))	;
					map.put("mobiletelephone", json.get("mobile"))	;
					map.put("province", json.get("province"))	;
					map.put("email", json.get("email"))	;
					map.put("usertype","en")	;
					map.put("registerdate",DateUtils.getDateFormatString())	;
					map.put("user_id", json.get("userid"))	;
					map.put("user_pass", json.get("userpass"))	;
					map.put("del", '0')	;
					map.put("mot", json.get("adminmot"))	;
					map.put("contact", json.get("contact")==null?"": json.get("contact"))	;
					map.put("fax", json.get("tax")==null?"": json.get("tax"))	;
					map.put("address", json.get("address")==null?"": json.get("address"))	;
					map.put("legalp", json.get("legalp")==null?"": json.get("legalp"));
					map.put("bustype",json.get("bustype"))	;
					map.put("buclass",json.get("celltype"))	;
					map.put("city", json.get("city"));
					if(jsonss.get("regresp").toString().equals("1")){
						int z =regRespDao.regRespUpdate("com.wr4.domain.User.insertUser", map);
						if(z<1){
							throw new Exception();
						}
					}
				}
				//记录审批日志
				//记录登录成功
				String userid=ServletActionContext.getRequest().getSession().getAttribute("userid").toString();
				String role=ServletActionContext.getRequest().getSession().getAttribute("mot").toString();
				String pid=ServletActionContext.getRequest().getSession().getAttribute("paperid").toString();
				JSONObject jsons= JSONObject.fromObject(object);
				String respuserid=jsons.get("userid").toString() ;
				String regresp=jsons.get("regresp").toString() ;
				
				User user2=new User();
				if("1".equals(regresp)){
					user2.setRemark("同意"); 
				}else{
					user2.setRemark("不同意"); 
				}
					 
				user2.setUser_id(respuserid);
				user2.setPaperid(map.get("paperid").toString());
				user2.setMot(map.get("mot").toString());
				user2.setUsertype(map.get("usertype").toString());
				user2.setCommonname(map.get("commonname").toString());
				user2.setCreatedate(DateUtils.getDateFormatString());
				user2.setRespuserid(userid);
				int z=(Integer) loginDao.insertLoginLog(user2);
				if(z<1){
					throw new Exception();
				}
		}else{
			throw new Exception();
		}
		return i;
	}

	
	public List selectCommon(String sqlId, Map map) throws Exception {
		// TODO Auto-generated method stub
		return regRespDao.selectCommon(sqlId,map);
	}

	@Override
	public Map<String,String> queryRespSum(String sqlId,Map map) throws Exception {
		return regRespDao.queryRespSum(sqlId,map);
	}

	@Override
	public Map<String, String> queryRegRespSum(String sqlId, Map map)
			throws Exception {
		return regRespDao.queryRegRespSum(sqlId,map);
	}

}
