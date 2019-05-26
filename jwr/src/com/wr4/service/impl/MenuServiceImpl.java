package com.wr4.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wr4.dao.IMenuDao;
import com.wr4.dao.impl.MenuDaoImpl;
import com.wr4.domain.MenuInfo;
import com.wr4.domain.MenuInfo2;
import com.wr4.service.IMenuService;

/**
 * 类说明：业务逻辑层接口
 * 
 * @author 作者: zhangli
 * @version 创建时间：2013年10月29日 15:11:27
 */
 
public class MenuServiceImpl <T> implements IMenuService<T>{
	private IMenuDao<T> menuDao;
	
	public IMenuDao<T> getMenuDao() {
		return menuDao;
	}

	public void setMenuDao(IMenuDao<T> menuDao) {
		this.menuDao = menuDao;
	}

	/**
	 * 查询登录用户菜单
	 * @param type 菜单类型  1 1级菜单 2 2级菜单 3 3级菜单
	 * @param rols 用户拥有的菜单id
	 * @param menuID 指定菜单ID 查询所属下级
	 * @return
	 * @throws Exception
	 */
	public List<T> queryMenu(String menuID,String rols, String sql) throws Exception{
		List<T> list  = new ArrayList();
		List isLeafList=new ArrayList();
		List leafList=new ArrayList();
		try{
			
			if(menuID!=null&&!menuID.equals("")){
				List<T> relList=menuDao.queryMenu(menuID, rols,"com.wr4.domain.User.selectMenuByparentid");
				if(relList!=null&&relList.size()>0){
					for(int i=0;i<relList.size();i++){
					  MenuInfo men=(MenuInfo)relList.get(i);
					  //判断是否叶子节点 1 是  0不是   1的情况  封装到 menuInfo中  0 封装menuInfo2后 set到menuInfo中的children属性中
					  if(men.getIsleaf()!=null&&"0".equals(men.getIsleaf())){
						  MenuInfo men2= (MenuInfo)relList.get(i);
						  list.add((T)men2);
					  }else{
						  list.add((T)men);
					  }
					}
				 }
			}	else{
				
				List<T> relList=menuDao.queryMenu(menuID, rols,sql);
				
				if(relList!=null&&relList.size()>0){
					for(int i=0;i<relList.size();i++){
					  MenuInfo men=(MenuInfo)relList.get(i);
					  //判断是否叶子节点 1 是  0不是   1的情况  封装到 menuInfo中  0 封装menuInfo2后 set到menuInfo中的children属性中
					  if(men.getIsleaf()!=null&&"0".equals(men.getIsleaf())){
						  MenuInfo men2= (MenuInfo)relList.get(i);
						  list.add((T)men2);
					  }else{
						  list.add((T)men);
					  }
					}
				 }
			}
			
		}catch(Exception e){
			e.printStackTrace();
			
		} 
		
		return list;
	}
	
	/**
	 * 查询登录用户菜单
	 * @param type 菜单类型  1 1级菜单 2 2级菜单 3 3级菜单
	 * @param rols 用户拥有的菜单id
	 * @param menuID 指定菜单ID 查询所属下级
	 * @return
	 * @throws Exception
	 */
	public List<T> queryAllMenu(String menuID,String rols, String sql) throws Exception{
		List<T> list  = new ArrayList();
		try{
			list=menuDao.queryMenu(menuID, rols,sql);
			
		}catch(Exception e){
			e.printStackTrace();
			
		} 
		
		return list;
	}
	/**
	 * 添加菜单
	 * @param menuInfo
	 * @return
	 * @throws Exception
	 */
	public  boolean menuInsert(MenuInfo2 menuInfo) throws Exception{
		
		return menuDao.menuInsert( menuInfo);
	}
	
	
	/**
	 * 删除菜单
	 * @param menuInfo
	 * @return
	 * @throws Exception
	 */
	public  boolean menuDeletes(String  menuIds) throws Exception{
		String [] id=menuIds.split(",");
		String ids="";
		for(int i=0;i<id.length;i++){
			if(i!=id.length&&id.length>1){
				ids+=""+id[i]+",";
			}else{
				ids+=""+id[i]+"";
			}
		}
	 
		return menuDao.menuDeletes( ids);
	}
	
	/**
	 * 管理用户菜单
	 * @param menuInfo
	 * @return
	 * @throws Exception
	 */
	public  boolean menuInsert(String sqlid,Map map) throws Exception{
		return menuDao.menuInsert( sqlid,map);
	}
	/**
	 * 通用 查询 返回一个对象结果
	 * @param sqlid
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public  Object selectOne(String sqlid,Map map) throws Exception{
		return menuDao.selectOne( sqlid,map);
	}
}