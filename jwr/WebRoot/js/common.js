/***
 * 主管机关中文返回方法
 * @param key主管机关代码
 * @returns 主管机关中文
 */
function getMotVal(key){
	var adminmots ;
	//获取到本级及下级的主管机关名称 和 名称
	 $.ajax({
		    type:"POST",
		    async:false,
		    url:"/jwr/respInfo/getMotAction.action",
		    success:function(returnValue){
		   		var indexdata1=returnValue;
		   		adminmots=(eval("("+indexdata1+")")).Rows;
		    }
		});
	 //循环判断   adminmots[i].motcode  主管机关代码 为 key  则return
	 for(var i=0;i<adminmots.length;i++){
		 if(key==adminmots[i].motcode){
			 return adminmots[i].motname
		 }
	 }
}
/***
 * 业务类型中文返回
 * @param key 业务类型代码
 * @returns 业务类型中文
 */
function getBusTypeVal(key){
	//获取到业务类型对应中文
	var bustype;
	 $.ajax({
		    type:"POST",
		    async:false,
		    data:{filetype:'bustype'},
		    url:"/jwr/motControl/getFileIdTextAction.action",
		    success:function(returnValue){
		   		var indexdata1=returnValue;
		   		bustype=(eval("("+indexdata1+")"));
		    }
		});
	 //循环判断   bustype[i].fileid  fileid为 key  则return
	 for(var i=0;i<bustype.length;i++){
		 if(key==bustype[i].fileid){
			 return bustype[i].filetext
		 }
	 }
}

/***
 * 业务类型代码返回
 * @param key 业务类型值
 * @returns 业务类型代码
 */
function getBusTypeCode(key){
	//获取到业务类型值中文对应
	var bustype;
	 $.ajax({
		    type:"POST",
		    async:false,
		    data:{filetype:'bustype'},
		    url:"/jwr/motControl/getFileIdTextAction.action",
		    success:function(returnValue){
		   		var indexdata1=returnValue;
		   		bustype=(eval("("+indexdata1+")"));
		    }
		});
	 //循环判断   bustype[i].filetext  filetext为 key  则return
	 for(var i=0;i<bustype.length;i++){
		 if(key==bustype[i].filetext){
			 return bustype[i].fileid
		 }
	 }
}
function getCelltype(key){
	//获取到业务类别对应中文
	var bustype;
	 $.ajax({
		    type:"POST",
		    async:false,
		    data:{filetype:'busclass'},
		    url:"/jwr/motControl/getFileIdTextAction.action",
		    success:function(returnValue){
		   		var indexdata1=returnValue;
		   		bustype=(eval("("+indexdata1+")"));
		    }
		});
	 //循环判断   bustype[i].fileid  fileid为 key  则return
	 for(var i=0;i<bustype.length;i++){
		 if(key==bustype[i].fileid){
			 return bustype[i].filetext
		 }
	 }
}
/**
 * 获取所属省市中文
 * @param key
 * @returns
 */
function getcomefromVal(key){
	var bustype;
	$.ajax({
	    type:"POST",
	    async:false,
	    url:"/jwr/respInfo/getprovinceAction.action",
	    success:function(returnValue){
	   		var indexdata1=returnValue;
	   		bustype=(eval("("+indexdata1+")"));
	    }
	});
 for(var i=0;i<bustype.length;i++){
	 if(key==bustype[i].du_code){
		 return bustype[i].du_name;
	 }
 }

}
/**
 * 获取所属市中文
 * @param key
 * @returns
 */
function getcomefromValue(key){
	var bustype;
	$.ajax({
	    type:"POST",
	    async:false,
	    url:"/jwr/respInfo/getcitysAction.action",
	    success:function(returnValue){
	   		var indexdata1=returnValue;
	   		bustype=(eval("("+indexdata1+")"));
	    }
	});
 for(var i=0;i<bustype.length;i++){
	 if(key==bustype[i].du_code){
		 return bustype[i].du_name;
	 }
 }

}
function getChangeReason(key){
	var text={
		"0":"无" ,
		"1":"考评员：资格证书到期", 
		"2":"考评员：户籍所在地或常住地发生省际间变更", 
		"3":"企业：达标等级证书到期" ,
		"4":"考评机构：资质证书到期"	
	};
	 return text[key];
}
//处理键盘事件 禁止后退键（Backspace）密码或单行、多行文本框除外  
function banBackSpace(e){     
    var ev = e || window.event;//获取event对象     
    var obj = ev.target || ev.srcElement;//获取事件源     
      
    var t = obj.type || obj.getAttribute('type');//获取事件源类型    
      
    //获取作为判断条件的事件类型  
    var vReadOnly = obj.getAttribute('readonly');  
    var vEnabled = obj.getAttribute('enabled');  
    //处理null值情况  
    vReadOnly = (vReadOnly == null) ? false : vReadOnly;  
    vEnabled = (vEnabled == null) ? true : vEnabled;  
      
    //当敲Backspace键时，事件源类型为密码或单行、多行文本的，  
    //并且readonly属性为true或enabled属性为false的，则退格键失效  
    var flag1=(ev.keyCode == 8 && (t=="password" || t=="text" || t=="textarea")   
                && (vReadOnly==true || vEnabled!=true))?true:false;  
     
    //当敲Backspace键时，事件源类型非密码或单行、多行文本的，则退格键失效  
    var flag2=(ev.keyCode == 8 && t != "password" && t != "text" && t != "textarea")  
                ?true:false;          
      
    //判断  
    if(flag2){  
        return false;  
    }  
    if(flag1){     
        return false;     
    }     
}  
  
//禁止后退键 作用于Firefox、Opera  
document.onkeypress=banBackSpace;  
//禁止后退键  作用于IE、Chrome  
document.onkeydown=banBackSpace; 