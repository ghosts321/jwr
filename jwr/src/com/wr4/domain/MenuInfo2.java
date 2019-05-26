package com.wr4.domain;


public class MenuInfo2 {
	
	public MenuInfo2() {
	    // TODO Auto-generated constructor stub
    }
	private String name;
	private String id;
	private String type;  //  1 表示一级菜单    2 表示二级菜单     3 表示三级菜单  
	private String url;
	private String text;
	private String state;//需要定义为叶节点的state设置为空或者'open'
	private String isleaf;//是否叶子节点
	private String parentid;//上级id
	private boolean btnClickToToggleOnly=true;//是否只在点击 展开/收缩 按钮时才 展开/收缩节点{Bool} 
    private String  icon;//图标

    
	public String getIcon() {
		return icon;
	}


	public void setIcon(String icon) {
		this.icon = icon;
	}


	public boolean isBtnClickToToggleOnly() {
		return btnClickToToggleOnly;
	}


	public void setBtnClickToToggleOnly(boolean btnClickToToggleOnly) {
		this.btnClickToToggleOnly = btnClickToToggleOnly;
	}
	public String getIsleaf() {
		return isleaf;
	}


	public void setIsleaf(String isleaf) {
		this.isleaf = isleaf;
	}


	public String getParentid() {
		return parentid;
	}


	public void setParentid(String parentid) {
		this.parentid = parentid;
	}


	public String getState() {
		return state;
	}


	public void setState(String state) {
		this.state = state;
	}


	public String getText() {
		return text;
	}


	public void setText(String text) {
		this.text = text;
	}


	public String getUrl() {
    	return url;
    }


	public void setUrl(String url) {
    	this.url = url;
    }
 
	public String getName() {
    	return name;
    }
	public void setName(String name) {
    	this.name = name;
    }
	public String getId() {
    	return id;
    }
	public void setId(String id) {
    	this.id = id;
    }
	public String getType() {
    	return type;
    }
	public void setType(String type) {
    	this.type = type;
    }
 
	
	
}