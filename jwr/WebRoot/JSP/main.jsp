<%@ page language="java" import="java.util.*,java.io.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>交通运输企业安全生产标准化系统</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link type="text/css" href="/jwr/css/main.css" rel="stylesheet"/>
	<link type="text/css" href="/jwr/css/easyui/default/easyui.css" rel="stylesheet"/>
	<link type="text/css" href="/jwr/css/easyui/icon.css" rel="stylesheet"/>
	<link type="text/css" href="/jwr/js/gradejs/ligerUI/skins/Gray/css/all.css" rel="stylesheet"/>
    <link href="<%= path%>/js/gradejs/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="<%= path%>/js/gradejs/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
   <script src="<%= path%>/js/jquery-1.3.2.min.js" type="text/javascript"></script>
     <script src="<%= basePath%>js/gradejs/json2.js" type="text/javascript"></script>
    <script src="<%= path%>/js/gradejs/ligerUI/js/core/base.js" type="text/javascript"></script>
    <script src="<%= path%>/js/gradejs/ligerUI/js/plugins/ligerToolBar.js" type="text/javascript"></script>
    <script src="<%= path%>/js/gradejs/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
    <script src="<%= path%>/js/gradejs/ligerUI/js/plugins/ligerComboBox.js" type="text/javascript"></script>
    <script src="<%= path%>/js/gradejs/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script> 
     <script src="<%= path%>/js/gradejs/ligerUI/js/plugins/ligerForm.js" type="text/javascript"></script> 
      <script src="<%= path%>/js/gradejs/ligerUI/js/plugins/ligerTextBox.js" type="text/javascript"></script> 
    <script src="<%= path%>/js/gradejs/ligerUI/js/plugins/ligerFilter.js" type="text/javascript"></script>
    <script src="<%= path%>/js/gradejs/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script>
    <script src="<%= path%>/js/gradejs/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script>
    <script src="<%= path%>/js/gradejs/ligerUI/js/plugins/ligerTree.js" type="text/javascript"></script> 
    <script src="<%= path%>/js/gradejs/ligerUI/js/plugins/ligerGrid.showFilter.js" type="text/javascript"></script>
    <script src="js/gradejs/ligerUI/js/plugins/ligerWindow.js" type="text/javascript"></script>
    <script src="js/gradejs/ligerUI/js/plugins/ligerDateEditor.js" type="text/javascript"></script>
    <script src="js/gradejs/ligerUI/js/plugins/ligerSpinner.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/common.js"></script>
    <script type="text/javascript" src="js/echarts/esl.js"></script>
     <script src="js/popup.js" type="text/javascript"></script>
   <script type="text/javascript">
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
   
   
	var filePath = "";
	function upload() {
		$.ajax({
			type : "POST",
			async : true, //是否异步
			url : "/jwr/updown/uploadAction.action",
			success : function(returnValue) {
				filePath = returnValue;
			}
		});
	}

	/**
	* <input type="hidden" name ="bean.属性"  id="id+'*'"
	*/
	function afterItemclick(id){
		var styleid=id+"_";//显示上传成功
		var hiddenid=id+"*";//记录文件名
		var ostyleid = document.getElementById(styleid);
		var ohiddenid = document.getElementById(hiddenid);
		if(ostyleid!=null || ostyleid!=undefined){
			ostyleid.style.display = 'block';
			
			ohiddenid.value = windowRetrun;
		}
	}
	function itemclick(id) {
		stid=id;
		//  var m = $.ligerDialog.open({ url: 'JSP/pn/pnupload.jsp',width:800, height: 400, isResize: true }); 
		window.open(
			'/jwr/JSP/pn/pnupload.jsp',
			'newwindow',
			'height=100,width=400,top=100,left=100,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
		
	} 
	
	function  checkisSelect(g,rowdata,rowindex){
		//g 为 ligerui grid 对象   rowdata 当前选中行的数据
		if(g.getCheckedRows()){
			if(g.getCheckedRows().length>0){
				for(var i=0;i<g.getCheckedRows().length;i++){
					if(g.getCheckedRows()[i]['__index']!=rowindex){
						 g._removeSelected(g.getCheckedRows()[i]);
					}
				}
			}
		}
	}
	
	 /**
	*验证组织机构代码是否合法：组织机构代码为8位数字或者拉丁字母+“-”+1位校验码。
	*验证最后那位校验码是否与根据公式计算的结果相符。
	*编码规则请参看
	*http://wenku.baidu.com/view/d615800216fc700abb68fc35.html
	*/
	var ret=false;
	function isValidOrgCode(orgCode){
	   //return ""==orgCode || orgCode.length==10;
	   //return true;
	   var codeVal = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];
	   var intVal =    [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35];
	   var crcs =[3,7,9,10,5,8,4,2];
	   if(!(""==orgCode) && orgCode.length==10){
	      var sum=0;
	      for(var i=0;i<8;i++){
	         var codeI=orgCode.substring(i,i+1);
	         var valI=-1;
	         for(var j=0;j<codeVal.length;j++){
	             if(codeI==codeVal[j]){
	                valI=intVal[j];
	                break;
	             }
	         }
	         sum+=valI*crcs[i];
	      }
	      var crc=11- (sum%11);
	               
	      switch (crc){
				      case 10:{
			              crc="X";
			              break;
			          }
	                   case 11:{
	                       crc="0";
	                       break;
	                   }default:{
	                       break;
	                   }
	               }
	      //alert("crc="+crc+",inputCrc="+orgCode.substring(9));
	               //最后位验证码正确
	      if(crc==orgCode.substring(9)){
	                   ret=true;
	      }else{
	    	  	isValidNewOrgCode(orgCode);
	      }
	   }else if(""==orgCode){
	       	ret=false;
	   }else{
		   isValidNewOrgCode(orgCode);
	            }
	   return ret;
	}
	/**
	*    三证合一  编码规则
	*  第一部分（第1位）：登记管理部门代码，使用阿拉伯数字或英文字母表示。
	*  第二部分（第2位）：机构类别代码，使用阿拉伯数字或英文字母表示。
	*  第三部分（第3—8位）：登记管理机关行政区划码，使用阿拉伯数字表示。
	*  第四部分（第9—17位）：主体标识码（组织机构代码），使用阿拉伯数字或英文字母表示。
	*  第五部分（第18位）：校验码，使用阿拉伯数字或英文字母表示。
	*/
	function isValidNewOrgCode(orgCode){
		var newRule = "^[A-Za-z0-9]{1}[A-Za-z0-9]{1}[0-9]{6}[A-Za-z0-9]{9}[A-Za-z0-9]{1}$";
		var str = orgCode.match(newRule);
		if(str == null){
			ret = false;
		}else{
			ret = true;
		}
	}
	
	//身份证

	function checkDate( idcard ){
	var socialNo = idcard;
	var msg="";
	if(socialNo == "")  
	    {  
	     msg='输入身份证号码格式不正确,必须是15位到18位的身份证号';
	      //alert("输入身份证号码不能为空!");  
	    }  


	    if (socialNo.length != 15 && socialNo.length != 18)  
	    {  
	      msg='输入身份证号码格式不正确,必须是15位到18位的身份证号';
	     //alert("输入身份证号码格式不正确!");  
	    }  
	        
	   var area={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"};   
	       
	     if(area[parseInt(socialNo.substr(0,2))]==null) {  
	      msg='身份证号码不正确(地区非法),必须是15位到18位的身份证号';
	     //alert("身份证号码不正确(地区非法)!");  
	     }   
	            
	    if (socialNo.length == 15)  
	    {  
	       pattern= /^\d{15}$/;  
	       if (pattern.exec(socialNo)==null){  
	          msg='输入身份证号码格式不正确,必须是15位到18位的身份证号';
	         //alert("15位身份证号码必须为数字！");  
	      }  
	      var birth = parseInt("19" + socialNo.substr(6,2));  
	      var month = socialNo.substr(8,2);  
	      var day = parseInt(socialNo.substr(10,2));  
	      switch(month) {  
	          case '01':  
	          case '03':  
	          case '05':  
	          case '07':  
	          case '08':  
	          case '10':  
	          case '12':  
	              if(day>31) {  
	                  msg='输入身份证号码格式不正确,必须是15位到18位的身份证号';
	                 //alert('输入身份证号码不格式正确!');  
	              }  
	              break;  
	          case '04':  
	          case '06':  
	          case '09':  
	          case '11':  
	              if(day>30) {  
	                  msg='输入身份证号码格式不正确,必须是15位到18位的身份证号';
	                 //alert('输入身份证号码不格式正确!');  
	              }  
	              break;  
	          case '02':  
	              if((birth % 4 == 0 && birth % 100 != 0) || birth % 400 == 0) {  
	                  if(day>29) {  
	                      msg='输入身份证号码格式不正确,必须是15位到18位的身份证号';
	                     //alert('输入身份证号码不格式正确!');  
	                  }  
	              } else {  
	                  if(day>28) {  
	                      msg='输入身份证号码格式不正确,必须是15位到18位的身份证号';
	                     //alert('输入身份证号码不格式正确!');  
	                  }  
	              }  
	              break;  
	          default:  
	              msg='输入身份证号码格式不正确,必须是15位到18位的身份证号';
	             //alert('输入身份证号码不格式正确!');  
	      }  
	      var nowYear = new Date().getYear();  
	      if(nowYear - parseInt(birth)<15 || nowYear - parseInt(birth)>100) {  
	          msg='输入身份证号码格式不正确,必须是15位到18位的身份证号';
	         //alert('输入身份证号码不格式正确!');  
	      }  
	      msg='通过！';
	    }  
	      
	    var Wi = new Array(  
	              7,9,10,5,8,4,2,1,6,  
	              3,7,9,10,5,8,4,2,1  
	              );  
	    var   lSum        = 0;  
	    var   nNum        = 0;  
	    var   nCheckSum   = 0;  
	      
	      for (i = 0; i < 17; ++i)  
	      {  
	          if ( socialNo.charAt(i) < '0' || socialNo.charAt(i) > '9' )  
	          {  
	              msg='输入身份证号码格式不正确,必须是15位到18位的身份证号';
	             //alert("输入身份证号码格式不正确!");  
	          }  
	          else  
	          {  
	              nNum = socialNo.charAt(i) - '0';  
	          }  
	           lSum += nNum * Wi[i];  
	      }  
	      if( socialNo.charAt(17) == 'X' || socialNo.charAt(17) == 'x')  
	      {  
	          lSum += 10*Wi[17];  
	      }  
	      else if ( socialNo.charAt(17) < '0' || socialNo.charAt(17) > '9' )  
	      {  
	          msg='输入身份证号码格式不正确,必须是15位到18位的身份证号';
	         //alert("输入身份证号码格式不正确!");  
	      }  
	      else  
	      {  
	          lSum += ( socialNo.charAt(17) - '0' ) * Wi[17];  
	      }  
	      if ( (lSum % 11) == 1 )  
	      {  
	      }  
	      else  
	      {  
	          msg='输入身份证号码格式不正确,必须是15位到18位的身份证号';
	         //alert("输入身份证号码格式不正确!");  
	      }  
	      
	      return msg;
	  }
      
	//查看图片fileName项目路径名+文件名;id为页面显示图片div的id
        function seeImg(id,filename){
        	top.tab.addTabItem({ tabid : id,text: filename, url: "<%= basePath%>JSP/images.jsp?filename="+filename });
        }
	function look(freport){
		if(freport!=null && freport!=""){
	 			var ftype = freport.split('.');
	 			var filetype=ftype[1];
 			 if(filetype =='bmp'||filetype =='BMP'||filetype =='jpg'||filetype =='JPG'||filetype =='jpeg'||filetype =='JPEG'||filetype =='png'||filetype =='PNG'||filetype =='gif'||filetype =='GIF'){
	  				seeImg('img0',freport);
	  			}else{
	  				window.location.href='<%= basePath%>updown/downloadFileAction?file='+freport;
	  			} 
  		}else{
  			alert("没有上传相关文件");
  		}
	}
	
	function scanImg(id,filename){
		var path='<%=basePath%>images/';
    	var fileName=path+freport;
    	$.ligerDialog.open({
        	url:fileName,
        	width:800,
        	height:600,
        	title:'查看图片'
    	});
    	//document.getElementById(id).src=fileName;
    	//centerPopup();
		//loadPopup();
	}
	function initAttachment(name){
				name=name.split(',');
				for(var i=0;i<name.length;i++){
					if(name[i]!=''){
						var input=$('input[name="'+name[i]+'"]');
						//alert($('input[name="'+name[i]+'"]').val());
						if(input.length>0){
							var parent=input.parent().parent();
							if(input.val()==''){
								$('<span/>').appendTo(parent).html('未提交').css('color','#cccccc');
							}else{
								$('<a/>').appendTo(parent).html('查看')
									//.attr('target','_blank')
									.attr('file',input.val())
									.attr('href','javascript:void(0);')
									.click(function(){
										showfile($(this).attr('file'));
									});
							}
							input.parent().remove();
						}
					}
				}
			}
	function showfile(fileName){
		    	if(fileName!=null && fileName!=""){
			 			var ftype = fileName.split('.');
			 			var filetype=ftype[1];
		 			 if(filetype =='bmp'||filetype =='BMP'||filetype =='jpg'||filetype =='JPG'||filetype =='jpeg'||filetype =='JPEG'||filetype =='png'||filetype =='PNG'||filetype =='gif'||filetype =='GIF'){
			  				seeImg('img0',fileName);
			  			}else{
			  				window.location.href='<%= basePath%>updown/downloadFileAction?file='+fileName;
			  			} 
		  		}else{
		  			alert("没有上传相关文件");
		  		}
		  	}
		  	
	function zhankai(){
       		$("#deg").show();
       }
       function shouqi(){
       		$("#deg").hide();
       }
       function zhankai2(){
       		$("#deg2").show();
       }
       function shouqi2(){
       		$("#deg2").hide();
       }
       function zhankai3(){
       		$("#deg3").show();
       }
       function shouqi3(){
       		$("#deg3").hide();
       }
       function zhankai4(){
       		$("#deg4").show();
       }
       function shouqi4(){
       		$("#deg4").hide();
       }
       
       /* setTimeout(tip,10000);
       function tip (){
          alert("页面已10秒钟无任何操作，20分钟后系统将自动退出");
       } */
   </script> 
  </head>
  
  <body>
 <%
  	 String pro_mot_name = "";
	 Properties pro = new Properties();  
	 String realpath = request.getRealPath("/WEB-INF/classes");  
	 try{  
		 //读取配置文件
		 FileInputStream in = new FileInputStream(realpath+"/mot.properties");  
		 pro.load(in);  
	 }catch(FileNotFoundException e){  
	     out.println(e);  
	 }catch(IOException e){
		 out.println(e);
	 } 
	//通过key获取配置文件
	 pro_mot_name = pro.getProperty("mot.name"); 
 
%>
</body>
</html>
