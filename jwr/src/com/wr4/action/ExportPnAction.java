package com.wr4.action;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;

import com.wr4.domain.PnInfo;
import com.wr4.service.IPnManagerService;

public class ExportPnAction extends BaseAction {
	private IPnManagerService iPnManagerService;
	private List<PnInfo> pnList;
	private PnInfo pnInfo;
	
	public PnInfo getPnInfo() {
		return pnInfo;
	}
	public void setPnInfo(PnInfo pnInfo) {
		this.pnInfo = pnInfo;
	}
	public List<PnInfo> getPnList() {
		return pnList;
	}
	public void setPnList(List<PnInfo> pnList) {
		this.pnList = pnList;
	}
	public IPnManagerService getiPnManagerService() {
		return iPnManagerService;
	}
	public void setiPnManagerService(IPnManagerService iPnManagerService) {
		this.iPnManagerService = iPnManagerService;
	}
	public void findAllPn(){
		try {
			getPageParameters();
			pnList = iPnManagerService.selectePnList("com.wr4.domain.PnInfo.selectAll", pnInfo, offset,limit);
	} catch (Exception e) {
		e.printStackTrace();
	}
}
}
