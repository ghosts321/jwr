package com.wr4.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.wr4.domain.MenuInfo;
import com.wr4.domain.MenuInfo2;
import com.wr4.domain.RoleInfo;
import com.wr4.service.IMenuService;

/**
 * 类说明：菜单Action
 * 
 * @author 作者: zhangli
 * @version 创建时间：2013年10月29日 15:08:47
 */

public class MenuInfoAction extends BaseAction {
	private IMenuService<MenuInfo> menuService;
	private MenuInfo2 menuInfo;

	public MenuInfo2 getMenuInfo() {
		return menuInfo;
	}

	public void setMenuInfo(MenuInfo2 menuInfo) {
		this.menuInfo = menuInfo;
	}

	public IMenuService<MenuInfo> getMenuService() {
		return menuService;
	}

	public void setMenuService(IMenuService<MenuInfo> menuService) {
		this.menuService = menuService;
	}
	public void getUserRoleMenu(){
		try{
			//判断用户以什么角色登录系统
			String usertype = request.getParameter("usertype");
			String userid=request.getParameter("userid");
			String motcode=request.getSession().getAttribute("mot").toString();
			String menuId = "";
			if(usertype!=null && !("".equals(usertype))){
				if(usertype.equals("en")){
					menuId = "01";
				}else if(usertype.equals("pn")){
					menuId = "02";
				}else if(usertype.equals("mot")){
					menuId = "03";
				}else{
					menuId = "04";
				}
			}
			Map map=new HashMap();
			map.put("userid", userid);
			map.put("usertype", usertype);
			RoleInfo roleInfo=(RoleInfo) menuService.selectOne("com.wr4.domain.MotInfo.selectUserRole",map);
			String [] menuids=new String [0];
			String menuid="";
			if(roleInfo!=null){
				menuid=roleInfo.getMenuserids();
				menuids=menuid.split(",");
			} 
			 writer(menuid);
		}catch(Exception e){
			e.printStackTrace();
		}
	
	}
	public void menuList() {
		List list = null;
		try {
			String mID = request.getParameter("menuID");
			String usertype = request.getParameter("usertype");
			String menuId = "";
			if(usertype!=null && !("".equals(usertype))){
				if(usertype.equals("en")){
					menuId = "01";
				}else if(usertype.equals("pn")){
					menuId = "02";
				}else if(usertype.equals("mot")){
					menuId = "03";
				}else{
					menuId = "04";
				}
			}
			list = menuService.queryAllMenu(menuId, "", "com.wr4.domain.User.selectAllMenu");
			if (list != null && list.size() > 0) {
				List listnew=new ArrayList();
				for(int i=0;i<list.size();i++){
					MenuInfo2 menu= (MenuInfo2)list.get(i);
					if(menu!=null&&(menu.getId().equals("030701")||menu.getId().equals("030702")||menu.getId().equals("030302"))){
						
					}else{
						listnew.add(list.get(i));
					}
				}
				JSONArray jsonObject = JSONArray.fromObject(listnew);
				String js = jsonObject.toString();
				js =  jsonObject.toString()  ;
			    writer(js);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
	}

	public void menuRemoveSession() {
		request.getSession().removeAttribute("menus");
	}

	public void menuAllList() {
		List list = new ArrayList();
		try {
			//判断用户以什么角色登录系统
			String usertype = (String)request.getSession().getAttribute("usertype");
			String userid=request.getSession().getAttribute("userid").toString();
			String motcode=request.getSession().getAttribute("mot").toString();
			String menuId = "";
			if(usertype!=null && !("".equals(usertype))){
				if(usertype.equals("en")){
					menuId = "01";
				}else if(usertype.equals("pn")){
					menuId = "02";
				}else if(usertype.equals("mot")){
					menuId = "03";
				}else{
					menuId = "04";
				}
			}
			Map map=new HashMap();
			map.put("userid", userid);
			map.put("usertype", usertype);
			List lists = menuService.queryAllMenu(menuId, "", "selectAllMenu");
			RoleInfo roleInfo=(RoleInfo) menuService.selectOne("com.wr4.domain.MotInfo.selectUserRole",map);
			String [] menuids=new String [0];
			if(roleInfo!=null){
				String menuid=roleInfo.getMenuserids();
				menuids=menuid.split(",");
			}else{
				list=lists;
			}
			//判断下用户是否拥有此菜单权限
			for(int x=0;x<menuids.length;x++){
				for (int i = 0; i < lists.size(); i++) {
					MenuInfo2 menu = (MenuInfo2) lists.get(i);
					if(menuids[x].length()>2&&menuids[x].equals( menu.getId())){
						if(usertype.equals("mot")&&!motcode.equals("07")
						 &&(menuids[x].equals("030701")||menuids[x].equals("030702")||menuids[x].equals("030302"))){
						}else{
							 menu.setId(menuids[x]);
							 list.add(menu);
						}
					}
				}
			}
			if (list != null && list.size() > 0) {
				
				String s = "";
				int x = 1;
				for (int i = 0; i < list.size(); i++) {
					MenuInfo2 menu = (MenuInfo2) list.get(i);
					if (menu.getIsleaf() != null && menu.getIsleaf().equals("1")) {
						if (x != 1 || i == list.size()) {
							s += "</div>  ";
							s += "   <div title='" + menu.getText()
									+ "' class='l-scroll'>  ";
						} else {
							x++;
							s += "   <div title='" + menu.getText()
									+ "' class='l-scroll'>  ";
						}
						for (int y = 0;  y< list.size(); y++) {
							MenuInfo2 menu2 = (MenuInfo2) list.get(y);
							if("030707".equals(menu2.getId()) && 2 !=motcode.length()){
								menu2.setParentid(null);
							}
							if(menu2.getParentid()!=null&&menu2.getParentid().equals(menu.getId())){
								s += " <a class='l-link'" +
										" iconcls='"+menu2.getIcon()+"' " +
										"href='javascript:f_addTab(\""
										+ menu2.getId() + "\",\"" + menu2.getText()
										+ "\",\"" + menu2.getUrl()
										+ "\")'>" 
										+"<span class='l-btn-left'> " +
										"<span class='l-btn-text "+menu2.getIcon()+"' style='padding-left: 20px; '>"  
										+ menu2.getText()
										+"</span>" 
										+"</span>"
										+ "</a> ";
							}
						}
					
					}  
					if (i == list.size() - 1) {
						s += "</div>";
					}

				}
			
				request.getSession().setAttribute("menus", s);
				writer(s);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
	}
	 
	public void menuInsert() {
		try {
			boolean bol = menuService.menuInsert(menuInfo);
			if (bol) {
				writer("添加成功");
			} else {
				writer("添加失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void roleInsert() {
		try {
			boolean bol = menuService.menuInsert(menuInfo);
			if (bol) {
				writer("添加成功");
			} else {
				writer("添加失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void menuDeletes() {
		try {
			String ids = request.getParameter("ids");
			boolean bol = menuService.menuDeletes(ids);
			if (bol) {
				writer("删除成功");
			} else {
				writer("删除失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void removeSession(){
		try{
			request.getSession().invalidate();
			writer("yes");
		}catch(Exception e){
			try {
				writer("error");
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
	}
	public  static String[] getDistinct(String num[]) {
        List list = new java.util.ArrayList();
        for (int i = 0; i < num.length; i++) {
            if (!list.contains(num[i])) {//如果list数组不包括num[i]中的值的话，就返回true。
                list.add(num[i]); //在list数组中加入num[i]的值。已经过滤过。
            }
        }
        return   (String[]) list.toArray(new String[list.size()]); 
   }
	/**
	 * 用户管理菜单
	 * @param arg
	 */
	public void menuRoleInsert() {
		try {
			String userid=request.getParameter("userid");
			String usertype=request.getParameter("usertype");
			String menuids=request.getParameter("checkids");
			String [] menuid=menuids.split(",");
			String []menus=getDistinct(menuid);
			menuids="";
			for (int i=0; i < menus.length; i++)
			{
				menuids+=","+menus[i];
			}
			if(menuids.equals("")){
				writer("添加失败");
				return;
			}
			if(menuids.length()>1){
				menuids=menuids.substring(1,menuids.length());
			}
			
			Map map=new HashMap();
			map.put("userid", userid);
			map.put("usertype", usertype);
			map.put("menuids", menuids);
			boolean bol = menuService.menuInsert("com.wr4.domain.MotInfo.insertMenuRole",map);
			if (bol) {
				writer("yes");
			} else {
				writer("添加失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public static void main(String[] arg) {
		MenuInfoAction m = new MenuInfoAction();
		m.menuList();

	}

}
