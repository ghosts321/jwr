package com.wr4.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.struts2.ServletActionContext;

import net.sf.json.JSONArray;

import com.wr4.domain.CertificateInfo;
import com.wr4.domain.EnInfo;
import com.wr4.domain.EnPandect;
import com.wr4.domain.MotInfo;
import com.wr4.domain.OrgInfo;
import com.wr4.domain.StatisticsInfo;
import com.wr4.domain.StatisticsQueryInfo;
import com.wr4.domain.ValueTextBustype;
import com.wr4.service.EnPandectService;
import com.wr4.service.IMotService;
import com.wr4.service.IStatisticsService;
import com.wr4.util.CodeToCnUtil;
import com.wr4.util.ExportUtil;

public class StatisticsAction extends BaseAction{
	private IStatisticsService iStatisticsService;
	private List list;
	private StatisticsQueryInfo statisticsQueryInfo = new StatisticsQueryInfo();
	private IMotService<MotInfo> motService;
	private EnPandectService enPandectService;
	
	

	public EnPandectService getEnPandectService() {
		return enPandectService;
	}

	public void setEnPandectService(EnPandectService enPandectService) {
		this.enPandectService = enPandectService;
	}

	public IMotService<MotInfo> getMotService() {
		return motService;
	}

	public void setMotService(IMotService<MotInfo> motService) {
		this.motService = motService;
	}
	
	public StatisticsQueryInfo getStatisticsQueryInfo() {
		return statisticsQueryInfo;
	}
	public void setStatisticsQueryInfo(StatisticsQueryInfo statisticsQueryInfo) {
		this.statisticsQueryInfo = statisticsQueryInfo;
	}
	public IStatisticsService getiStatisticsService() {
		return iStatisticsService;
	}
	public void setiStatisticsService(IStatisticsService iStatisticsService) {
		this.iStatisticsService = iStatisticsService;
	}
	public void statistics() {
		String nameorcertnum = request.getParameter("nameorcertnum");
		String admin = request.getParameter("admin");
		String type = request.getParameter("type");
		String mot = request.getSession().getAttribute("mot").toString();
		getPageParameters();
		statisticsQueryInfo = new StatisticsQueryInfo();
		statisticsQueryInfo.setMot(mot);
	    if(StringUtils.isNotBlank(nameorcertnum)){
	    	statisticsQueryInfo.setPnname(nameorcertnum);
	    }
		 
		if(!"".equals(admin)&&!"0".equals(admin)){
			statisticsQueryInfo.setAdmin(admin);
		}
		if(!"".equals(type)&&!"0".equals(type)){
			statisticsQueryInfo.setBustype(type);
		}
		try {
			List allList = iStatisticsService.selectPntrainAll("statistics.getByNameOrNum", statisticsQueryInfo);
			list = iStatisticsService.selectPntrain("statistics.getByNameOrNum", statisticsQueryInfo,offset,limit);
			if (list != null && list.size() > 0) {
				JSONArray jsonObject = JSONArray.fromObject(list);
				String js = jsonObject.toString();
				js = "{Rows: " + jsonObject.toString() + ",Total:"
						+ allList.size() + "}";
				writer(js);
			} else {
				list = new ArrayList();
				JSONArray jsonObject = JSONArray.fromObject(list);
				String js = jsonObject.toString();
				js = "{Rows: " + jsonObject.toString() + ",Total:"
						+ allList.size() + "}";
				writer(js);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//进行各个维度统计（业务类型，主管机关，文化程度）
	public void statisticsByBustype(){
		String barId = request.getParameter("barId");
		String mot = request.getSession().getAttribute("mot").toString();
		String userid = request.getSession().getAttribute("userid").toString();
		Map map = new HashMap();
		map.put("mot", mot);
		map.put("userid", userid);
		List list =null;
		try {
			if("bustype".equals(barId)){
				list = iStatisticsService.statisticsByBustype("statistics.statisticsByBustype",map);
			}else if("adminmot".equals(barId)){
				list = iStatisticsService.statisticsByMot("statistics.statisticsByMot",map);
			}else if("edu".equals(barId)){
				list = iStatisticsService.statisticsByEdu("statistics.statisticsByEdu",map);
			}else{
				list = new ArrayList();
			}
			if (list != null && list.size() > 0) {
				String head = "{",category="category: [",total = "total:[",foot = "}";
				for(int i=0;i<list.size();i++){
					StatisticsInfo m=(StatisticsInfo)list.get(i);
					if("bustype".equals(barId)){
						category+="'"+CodeToCnUtil.getBustypeCnVal(m.getDimension())+"',";
					}else if("adminmot".equals(barId)){
						category+="'"+m.getDimensname()+"',";
					}else if("edu".equals(barId)){
						category+="'"+m.getDimension()+"',";
					}else{
						category+="";
					}
					total+=m.getTotal()+",";
				}
				category = category.substring(0, category.length()-1)+"],";
				total = total.substring(0, total.length()-1)+"]";
				String js = head+category+total+foot;
				writer(js);
			}else{
				writer(list.toString());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/***
	 * 主管机关登录考评员培训考试 图形统计action
	 */
	public void statisticsPntrain(){
		String mot = request.getSession().getAttribute("mot").toString();
		String userid = request.getSession().getAttribute("userid").toString();
		Map map = new HashMap();
		map.put("mot", mot);
		map.put("userid", userid);
		List list =null;
		try {
			list = iStatisticsService.statisticsPntrain("statistics.statisticsPntrain",map);
			if (list != null && list.size() > 0) {
				String head = "{",category="category: [",total = "total:[",foot = "}";
				for(int i=0;i<list.size();i++){
					StatisticsInfo m=(StatisticsInfo)list.get(i);
					category+="'"+m.getDimension()+"',";
					total+=m.getTotal()+",";
				}
				category = category.substring(0, category.length()-1)+"],";
				total = total.substring(0, total.length()-1)+"]";
				String js = head+category+total+foot;
				writer(js);
			}else{
				writer(list.toString());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/***
	 * 主管机关登录考评员培训考试 图形统计action
	 */
	public void statisticsPntrainLine(){
		String mot = request.getSession().getAttribute("mot").toString();
		String userid = request.getSession().getAttribute("userid").toString();
		Map map = new HashMap();
		map.put("mot", mot);
		map.put("userid", userid);
		List list =null;
		try {
			list = iStatisticsService.statisticsPntrainLine("statistics.statisticsPntrainLine",map);
			if (list != null && list.size() > 0) {
				String head = "{",category="category: [",total = "total:[",foot = "}";
				for(int i=0;i<list.size();i++){
					StatisticsInfo m=(StatisticsInfo)list.get(i);
					category+="'"+m.getDimension()+"',";
					total+=m.getTotal()+",";
				}
				category = category.substring(0, category.length()-1)+"],";
				total = total.substring(0, total.length()-1)+"]";
				String js = head+category+total+foot;
				writer(js);
			}else{
				writer(list.toString());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 返回到企业统计查询页面
	 * @return
	 */
	public String enStatistics(){
		return "en";
	}
	//进行各个维度统计（业务类型，主管机关，等级）
	public void enCountQuery(){
		String barId = request.getParameter("barId");
		String mot = request.getSession().getAttribute("mot").toString();
		String userid = request.getSession().getAttribute("userid").toString();
		Map map = new HashMap();
		map.put("mot", mot);
		map.put("userid", userid);
		List list =null;
		try {
			if("bustype".equals(barId)){
				list = iStatisticsService.statisticsByBustype("statistics.enStatisticsByBustype",map);
			}else if("adminmot".equals(barId)){
				list = iStatisticsService.statisticsByMot("statistics.enStatisticsByMot",map);
			}else if("grade".equals(barId)){
				list = iStatisticsService.statisticsByEdu("statistics.enStatisticsByGrade",map);
			}else{
				list = new ArrayList();
			}
			if (list != null && list.size() > 0) {
				String head = "{",category="category: [",total = "total:[",foot = "}";
				for(int i=0;i<list.size();i++){
					StatisticsInfo m=(StatisticsInfo)list.get(i);
					
					if("bustype".equals(barId)){
						category+="'"+CodeToCnUtil.getBustypeCnVal(m.getDimension())+"',";
					}else if("adminmot".equals(barId)){
						MotInfo motInfo = new MotInfo();
						motInfo.setMotcode(m.getDimension());
						String motName = motService.selectMotOne("com.wr4.domain.MotInfo.selectMot", motInfo).getMotname();
						category+="'"+motName+"',";
					}else if("grade".equals(barId)){
						if("2".equals(m.getDimension().trim())){
							category+="'二级',";
						}else if("1".equals(m.getDimension().trim())){
							category+="'一级',";
						}else if("3".equals(m.getDimension().trim())){
							category+="'三级',";
						}else{
						category+="'"+m.getDimension()+"',";
						}
					}else{
						category+="";
					}
					total+=m.getTotal()+",";
				}
				category = category.substring(0, category.length()-1)+"],";
				total = total.substring(0, total.length()-1)+"]";
				String js = head+category+total+foot;
				writer(js);
			}else{
				writer(list.toString());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void enQuery() {
		String nameorcertnum = request.getParameter("nameorcertnum");
		String admin = request.getParameter("admin");
		String type = request.getParameter("type");
		String grade = request.getParameter("grade");
		getPageParameter();
		statisticsQueryInfo = new StatisticsQueryInfo();
		 if(StringUtils.isNotBlank(nameorcertnum)){
			 statisticsQueryInfo.setPnname(nameorcertnum);
		 }
		if(!"".equals(admin)&&!"0".equals(admin)){
			statisticsQueryInfo.setAdmin(admin);
		}
		if(!"".equals(type)&&!"0".equals(type)){
			statisticsQueryInfo.setBustype(type);
		}
		if(!"".equals(grade)&&!"0".equals(grade)){
			statisticsQueryInfo.setGrade(grade);
		}
		statisticsQueryInfo.setMot(request.getSession().getAttribute("mot").toString());
		try {
			//List allList = iStatisticsService.selectPntrainAll("statistics.queryEnInfosCount", statisticsQueryInfo);
			int count = getCount("statistics.queryEnInfosCount", statisticsQueryInfo);
			statisticsQueryInfo.setStart(start);
			statisticsQueryInfo.setPagesize(pagesize);
			list = iStatisticsService.selectPntrain("statistics.queryEnInfos", statisticsQueryInfo,offset,limit);
			if (list != null && list.size() > 0) {
				JSONArray jsonObject = JSONArray.fromObject(list);
				String js = jsonObject.toString();
				js = "{Rows: " + jsonObject.toString() + ",Total:"
						+ count + "}";
				writer(js);
			} else {
				list = new ArrayList();
				JSONArray jsonObject = JSONArray.fromObject(list);
				String js = jsonObject.toString();
				js = "{Rows: " + jsonObject.toString() + ",Total:"
						+ count + "}";
				writer(js);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 返回到考评机构统计查询页面
	 * @return
	 */
	public String orgStatistics(){
		return "org";
	}
	
	/**
	 * 考评机构统计查询列表查询
	 */
	public void orgQuery() {
		String nameorcertnum = request.getParameter("nameorcertnum");
		String admin = request.getParameter("admin");
		String type = request.getParameter("type");
		String grade = request.getParameter("grade");
		getPageParameters();
		String mot=request.getSession().getAttribute("mot").toString();
		statisticsQueryInfo = new StatisticsQueryInfo();
		statisticsQueryInfo.setMot(mot);
	 
			statisticsQueryInfo.setPnname(nameorcertnum);
		if(!"".equals(admin)&&!"%".equals(admin)){
			statisticsQueryInfo.setAdmin(admin);
		}
		if(!"".equals(type)&&!"0".equals(type)){
			statisticsQueryInfo.setBustype(type);
		}
		if(!"".equals(grade)&&!"0".equals(grade)){
			statisticsQueryInfo.setGrade(grade);
		}
		try {
			List allList = iStatisticsService.selectPntrainAll("statistics.queryOrgInfosCount", statisticsQueryInfo);
			OrgInfo  org=(OrgInfo)allList.get(0);
			int count =org.getId();
			list = iStatisticsService.selectPntrain("statistics.queryOrgInfos", statisticsQueryInfo,offset,limit);
			writeLigerJson(list, count );
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//进行各个维度统计（业务类型，主管机关，等级）
		public void orgCountQuery(){
			String barId = request.getParameter("barId");
			String mot = request.getSession().getAttribute("mot").toString();
			String userid = request.getSession().getAttribute("userid").toString();
			String busname=request.getParameter("busname")==null?"":request.getParameter("busname").toString().trim();
			String motPara=request.getParameter("motPara")==null?"":request.getParameter("motPara").toString().trim();
			Map map = new HashMap();
			map.put("mot", mot);
			map.put("userid", userid);
			map.put("busname", busname);
			map.put("motPara", motPara);
			List list =null;
			try {
				if("bustype".equals(barId)){
					list = iStatisticsService.statisticsByBustype("statistics.orgStatisticsByBustype",map);
				}else if("adminmot".equals(barId)){
					list = iStatisticsService.statisticsByMot("statistics.orgStatisticsByMot",map);
				}else if("grade".equals(barId)){
					list = iStatisticsService.statisticsByEdu("statistics.orgStatisticsByGrade",map);
				}else if("lowerbustype".equals(barId)){
					list = iStatisticsService.statisticsByBustype("statistics.orgStatisticsByLowerBustype",map);
				}else if("lowergrade".equals(barId)){
					list = iStatisticsService.statisticsByBustype("statistics.orgStatisticsByLowerGrade",map);
				}else{
					list = new ArrayList();
				}
				if (list != null && list.size() > 0) {
					String head = "{",category="category: [",total = "total:[",foot = "}";
					for(int i=0;i<list.size();i++){
						StatisticsInfo m=(StatisticsInfo)list.get(i);
						if("bustype".equals(barId)){
							category+="'"+CodeToCnUtil.getBustypeCnVal(m.getDimension())+"',";
						}else if("adminmot".equals(barId)){
							category+="'"+m.getDimensname()+"',";
						}else if("grade".equals(barId)){
							if("2".equals(m.getDimension().trim())){
								category+="'二级',";
							}else if("1".equals(m.getDimension().trim())){
								category+="'一级',";
							}else if("3".equals(m.getDimension().trim())){
								category+="'三级',";
							}else{
							category+="'"+m.getDimension()+"',";
							}
						}else if("lowerbustype".equals(barId)){
							String []motcs=m.getDimension().split(":");
							Map newmap=new HashMap();
							newmap.put("motcode", motcs[0]);
							String ss=(String) iStatisticsService.getMotText("statistics.orgStatisticsGetMotName",newmap);
							m.setDimension(ss+":"+motcs[1]);
							category+="'"+m.getDimension()+"',";
						}else if("lowergrade".equals(barId)){
							String []motcs=m.getDimension().split(":");
							Map newmap=new HashMap();
							newmap.put("motcode", motcs[0]);
							String ss=(String) iStatisticsService.getMotText("statistics.orgStatisticsGetMotName",newmap);
							m.setDimension(ss+":"+motcs[1]);
							String str=m.getDimension().trim();
							String str2=str.split(":")[1];
							if(str2!=null&&"1".equals(str2)){
								str=str.split(":")[0]+"：一级";
							}else if(str2!=null&&"2".equals(str2)){
								str=str.split(":")[0]+"：二级";
							}else if(str2!=null&&"3".equals(str2)){
								str=str.split(":")[0]+"：三级";
							}
							category+="'"+str+"',";
						}else{
							category+="";
						}
						total+=m.getTotal()+",";
					}
					category = category.substring(0, category.length()-1)+"],";
					total = total.substring(0, total.length()-1)+"]";
					String js = head+category+total+foot;
					writer(js);
				}else{
					writer(list.toString());
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		public void enPandect(){
			
			try {
				List<EnPandect> list=enPandectService.getEnPandectList("statistics.enPandectCountList");
				
				writeLigerJson(list, list.size());
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		public void getLowerList(){
			try{
			Map map=new HashMap();
			String adminmot=request.getSession().getAttribute("mot").toString();
			map.put("adminmot", adminmot);
			list = iStatisticsService.getLowerList("statistics.getLowerList",map);
			writeLigerJson(list, list.size());
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		public void getLowerGradeList(){
			try{
			Map map=new HashMap();
			String adminmot=request.getSession().getAttribute("mot").toString();
			map.put("adminmot", adminmot);
			list = iStatisticsService.getLowerList("statistics.getLowerGradeList",map);
			writeLigerJson(list, list.size());
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		public void getLowerListCount(){
			try{
				Map map=new HashMap();
				String adminmot=request.getSession().getAttribute("mot").toString();
				map.put("adminmot", adminmot);
				list = iStatisticsService.getLowerListCount("statistics.getLowerListCount",map);
				writeLigerJson(list, list.size());
				}catch(Exception e){
					e.printStackTrace();
				}
		}
		
		public void getLowerListFiletext(){
			try{
				Map map=new HashMap();
				String adminmot=request.getSession().getAttribute("mot").toString();
				map.put("adminmot", adminmot);
				list = iStatisticsService.getLowerListFiletext("statistics.getLowerListFiletext",map);
				writeLigerJson(list, list.size());
				}catch(Exception e){
					e.printStackTrace();
				}
		}
	 
		public void getLowerGradeListFiletext(){
			try{
				Map map=new HashMap();
				String adminmot=request.getSession().getAttribute("mot").toString();
				map.put("adminmot", adminmot);
				list = iStatisticsService.getLowerListFiletext("statistics.getLowerGradeListFiletext",map);
				writeLigerJson(list, list.size());
				}catch(Exception e){
					e.printStackTrace();
				}
		}
}

