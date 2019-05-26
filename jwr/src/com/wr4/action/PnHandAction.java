package com.wr4.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.wr4.domain.PnTrain;
import com.wr4.service.IPnService;
import com.wr4.util.DateUtils;
import com.wr4.util.JsonConfigUtil;

public class PnHandAction extends BaseAction {
	private PnTrain pnTrain;
	private IPnService<PnTrain> pnService;
    
	public IPnService<PnTrain> getPnService() {
		return pnService;
	}

	public void setPnService(IPnService<PnTrain> pnService) {
		this.pnService = pnService;
	}

	public void pnTrainList() {
		List<PnTrain> list = null;
		try {
			Map map = new HashMap();
			String pn_id = request.getSession().getAttribute("pn_id") == null ? ""
					: request.getSession().getAttribute("pn_id").toString();
			String name = request.getParameter("name");
			String type = request.getParameter("type");
			String train_id = request.getParameter("train_id");
			String adminmot = request.getSession().getAttribute("mot").toString();
			//System.out.println("name="+name+" ,type="+type+" ,train_id="+train_id);
			
			pn_id = "pn-532525199002121019";
			if (pnTrain != null) {
				pnTrain.setPn_id(pn_id);
			} else {
				pnTrain = new PnTrain();
				pnTrain.setPn_id(pn_id);
				if(name!=null&&!"".equals(name)){
					pnTrain.setName(name);
				}
				if(train_id!=null&&!"".equals(train_id)){
					pnTrain.setTrain_id(train_id);
				}
				if(type!=null&&!"".equals(type)){
					pnTrain.setType(type);
				}
			}
			String userid = (String)request.getSession().getAttribute("userid");
			map.put("userid", userid);
			map.put("adminmot", adminmot);
			getPageParameters();
			// System.out.println(page);
			list = pnService.selectPnTrain(
					"com.wr4.domain.PnTrain.pnApplyList", map, offset,
					limit);
			writeLigerJson(list,0,JsonConfigUtil.configJson());
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(pnTrain!=null){
				pnTrain = null;
			}
		}
	}

	public static void main(String[] args) {

	}

	public PnTrain getPnTrain() {
		return pnTrain;
	}

	public void setPnTrain(PnTrain pnTrain) {
		this.pnTrain = pnTrain;
	}

}
