package com.wr4.dao.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.wr4.dao.IMenuDao;
import com.wr4.domain.MenuInfo2;

/**
 * 类说明：菜单dao实现
 * 
 * @author 作者: zhangli
 * @version 创建时间：2013年10月29日 15:10:04
 */
@Repository
public class MenuDaoImpl<T> implements IMenuDao<T> {
	private SqlSessionTemplate sqlSessionTemplate;
	
	public SqlSessionTemplate getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	public List<T> queryMenu(String menuID,String rols,String sql) throws Exception{
		List<T> list=null;
		if(menuID!=null&&!menuID.equals("")){
			list=sqlSessionTemplate.selectList(sql,menuID );
		}else{
			list=sqlSessionTemplate.selectList(sql);
			//分页调用
//			sqlSessionTemplate.selectList("", sql, new RowBounds(offset, limit));
		}
	    
		return list ;
	}
	
	/**
	 * 添加菜单
	 * @param menuInfo
	 * @return
	 * @throws Exception
	 */
	public  boolean menuInsert(MenuInfo2 menuInfo) throws Exception{
		boolean r=false;
		try{
			int i=	sqlSessionTemplate.insert("com.wr4.domain.User.insertMenu",menuInfo);
			//调用分页的方法
//			sqlSessionTemplate.selectList("", menuInfo, new RowBounds(1,1));
			if(i==1){
				r=true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return r; 
	}
	
	
	/**
	 *删除菜单
	 * @param ids
	 * @return true or false
	 * @throws Exception
	 */
	public  boolean menuDeletes(String ids) throws Exception{
		boolean bol=false;
		try{
			int i=sqlSessionTemplate.delete("com.wr4.domain.User.deleteMenu", ids);
			if(i>0){
				bol=true;
			}
		}catch(Exception e){
			bol=false;
			e.printStackTrace();
		}
		return bol;
	}
	
	/**
	 * 管理用户菜单
	 * @param menuInfo
	 * @return
	 * @throws Exception
	 */
	public  boolean menuInsert(String sqlid,Map map) throws Exception{
		boolean bol=false;
		try{
			int i= sqlSessionTemplate.insert( sqlid,map);
			if(i>0){
				bol=true;
			}
		}catch(Exception e){
			bol=false;
			e.printStackTrace();
		}
		return bol;
	}
	/**
	 * 通用 查询 返回一个对象结果
	 * @param sqlid
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public  Object selectOne(String sqlid,Map map) throws Exception{
		return sqlSessionTemplate.selectOne( sqlid,map);
	}
}
