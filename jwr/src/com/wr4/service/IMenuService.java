package com.wr4.service;

import java.util.List;
import java.util.Map;

import com.wr4.domain.MenuInfo2;

/**
 * 类说明：业务逻辑层接口
 * 
 * @author 作者: zhangli
 * @version 创建时间：2013年10月29日 15:11:27
 */
public interface IMenuService<T> {

	/**
	 * 查询登录用户菜单
	 * @param type 菜单类型  1 1级菜单 2 2级菜单 3 3级菜单
	 * @param rols 用户拥有的菜单id
	 * @param menuID 指定菜单ID 查询所属下级
	 * @return
	 * @throws Exception
	 */
	public List<T> queryAllMenu(String menuID,String rols, String sql) throws Exception;
	/**
	 * 查询登录用户菜单
	 * @param type 菜单类型  1 1级菜单 2 2级菜单 3 3级菜单
	 * @param rols 用户拥有的菜单id
	 * @param menuID 指定菜单ID 查询所属下级
	 * @return
	 * @throws Exception
	 */
	public List<T> queryMenu(String menuID,String rols, String sql) throws Exception;
	/**
	 * 添加菜单
	 * @param menuInfo
	 * @return
	 * @throws Exception
	 */
	public  boolean menuInsert(MenuInfo2 menuInfo) throws Exception;
	/**
	 * 删除菜单
	 * @param menuInfo
	 * @return
	 * @throws Exception
	 */
	public  boolean menuDeletes(String  menuIds) throws Exception;
	/**
	 * 管理用户菜单
	 * @param menuInfo
	 * @return
	 * @throws Exception
	 */
	public  boolean menuInsert(String sqlid,Map map) throws Exception;
	/**
	 * 通用 查询 返回一个对象结果
	 * @param sqlid
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public  Object selectOne(String sqlid,Map map) throws Exception;
}