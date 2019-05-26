<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String username=request.getSession().getAttribute("username").toString();
String usertype=request.getSession().getAttribute("usertype")==null?"mot":request.getSession().getAttribute("usertype").toString();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>交通运输企业安全生产标准化系统主页</title> 
    <link href="<%= basePath%>/framework/style/css/ligerui-all.css" rel="stylesheet" type="text/css" /> 
     <link href="<%= basePath%>/css/easyui/icon.css" rel="stylesheet" type="text/css" /> 
    <link rel="<%= basePath%>/stylesheet" href="framework/style/css/common.css" type="text/css" />
    <script src="<%= basePath%>/framework/jquery/jquery-1.3.2.min.js" type="text/javascript"></script> 
    <script src="<%= basePath%>/framework/jquery/ligerui.min.js" type="text/javascript"></script> 
     <script type="text/javascript" src="<%= basePath%>/framework/jquery/jquery.easyui.min.js"></script>
        <script type="text/javascript">
	        var indexdata="";
	         $.ajax({
			    type:"POST",
			    async:false,
			    url:"/jwr/menu/menuAllListAction.action",
			    success:function(returnValue){
			   		indexdata=returnValue;
			    }
			 });
	        //alert(indexdata);
            var tab = null;
            var accordion = null;
            var tree = null;
             var manager=null;
             tree = $("#tree1").ligerGetTreeManager();
            $(function ()
            {

                //布局
                $("#layout1").ligerLayout({ leftWidth: 190, height: '100%',heightDiff:-34,space:4, onHeightChanged: f_heightChanged });

                var height = $(".l-layout-center").height();

                //Tab
                $("#framecenter").ligerTab({ height: height });

                //面板
                $("#accordion1").ligerAccordion({ height: height - 24, speed: null });

                $(".l-link").hover(function ()
                {
                    $(this).addClass("l-link-over");
                }, function ()
                {
                    $(this).removeClass("l-link-over");
                });
                 //创建一个indexdata =ajax调用返回的json
                var indexdata;
               /*
                 $.post("/jwr/menu/menuListAction.action",function(returnValue){
                 indexdata=returnValue;
                  alert(indexdata);
                 }); */
        
                tab = $("#framecenter").ligerGetTabManager();
                accordion = $("#accordion1").ligerGetAccordionManager();
               
                $("#pageloading").hide();

            });
            function f_heightChanged(options)
            {
                if (tab)
                    tab.addHeight(options.diff);
                if (accordion && options.middleHeight - 24 > 0)
                    accordion.setHeight(options.middleHeight - 24);
            }
            function f_addTab(tabid,text, url)
            { 
                tab.addTabItem({ tabid : tabid,text: text, url: url });
            } 
            /**
            **
            ** 用户退出将session 初始化 invalidate
            */
            function userexit() {
            	 var uname='<%=username%>';
            	 var basep='<%=basePath%>';
            	 $.ajax({
     			    type:"POST",
     			    url:"<%=basePath%>/menu/removeSessionAction.action",
     			    success:function(returnValue){
     			   		if(returnValue=='yes'){
     			   		 	alert("已将用户："+ uname +"注销"); 
             	        	window.location.href = basep;
     			   		} 
     			   		 	
     			    },
     			    error:function(ss){
     			    	alert(" 用户："+ uname +"注销时系统异常，请联系系统管理员！"); 
 			   		 	return false;
     			    }
     			 });
            	  
            }
     </script> 
<style type="text/css"> 
    body,html{height:100%;}
    body{ padding:0px; margin:0;   overflow:hidden;}  
    .l-link{ display:block; height:26px; line-height:26px; padding-left:10px; text-decoration:underline; color:#333;}
    .l-link2{text-decoration:underline; color:white; margin-left:2px;margin-right:2px;}
    .l-layout-top{background:#102A49; color:White;}
    .l-layout-bottom{ background:#E5EDEF; text-align:center;}
    #pageloading{position:absolute; left:0px; top:0px; background:white url('loading.gif') no-repeat center; width:100%; height:100%;z-index:99999;}
    .l-link{ display:block; line-height:22px; height:22px; padding-left:16px;border:1px solid white; margin:4px;}
    .l-link-over{ background:#FFEEAC; border:1px solid #DB9F00;} 
    .l-winbar{ background:#2B5A76; height:30px; position:absolute; left:0px; bottom:0px; width:100%; z-index:99999;}
    .space{ color:#E7E7E7;}
    /* 顶部 */ 
    .l-topmenu{ margin:0; padding:0; height:100px; line-height:31px;  position:relative; border-top:1px solid #1D438B;padding-top: 0px;  }
    .l-cnetermenu{ margin:0; padding:0; height:40px; line-height:31px;  position:relative; border-top:1px solid #1D438B;padding-top: 0px;  }
    
 </style>
</head>
<body >  
<div class="header_content">
	<%if(usertype.equals("mot")) {%>
     <div class="logo" style="background:url('<%= basePath%>img/banner-mot.png');background-repeat: repeat-x;">
          <img src="<%= basePath%>img/banner-mot.png">
     </div>
   <%} %>
   <%if(usertype.equals("en")) {%>
     <div class="logo" style="background:url('<%= basePath%>img/banner-en.png');background-repeat: repeat-x;">
          <img src="<%= basePath%>img/banner-en.png">
     </div>
   <%} %>
   <%if(usertype.equals("pn")) {%>
     <div class="logo" style="background:url('<%= basePath%>img/banner-pn.png');background-repeat: repeat-x;">
          <img src="<%= basePath%>img/banner-pn.png">
     </div>
   <%} %>
   <%if(usertype.equals("org")) {%>
     <div class="logo" style="background:url('<%= basePath%>img/banner-org.png');background-repeat: repeat-x;">
          <img src="<%= basePath%>img/banner-org.png">
     </div>
   <%} %>
</div>
  
  <div id="l-cnetermenu">
       <table align="center" width="100%">
					<div style="position: absolute; right: 10px; top: 10px; color: lightgray"  id="layout_north_mot" class="layout_north_mot">
						当前用户: <span id="wr3user" style="color:lightgray; font-weight:bold"><%= username %></span>&nbsp;&nbsp;&nbsp;<a
							href="javascript:void(0)" onclick="userexit()"><font style="color: #FFF">退出</font></a>
					</div>
			<!--
          <TR>
           <TD>
           <img src="<%= basePath%>/framework/style/images/nav_pre.gif" align="absMiddle"> 欢迎[<%= username %>] 光临 
           </TD>
           <td width="25%" > 
		        系统当前时间：
		        <script>
				           	var weekDayLabels = new Array("星期日","星期一","星期二","星期三","星期四","星期五","星期六");
										var now = new Date();
									    var year=now.getFullYear();
										var month=now.getMonth()+1;
									 	var day=now.getDate()
									    var currentime = year+"年"+month+"月"+day+"日 "+weekDayLabels[now.getDay()]
									 	document.write(currentime)
			  	</script>
           </td>
         
         </TR>
         -->
       </table>
  </div>
  
  <div id="layout1" style="width:99.2%; margin:0 auto; margin-top:4px; "> 
     <div position="left"  title="主要菜单" id="accordion1"> 
            <script>  
                 $("#accordion1").html(indexdata); 
            </script>
        		
        	
        </div>
        <div position="center" id="framecenter"> 
        	<div tabid="home" title="我的主页" style="height:300px" >
                <iframe frameborder="0" name="home" id="home" src="<%= basePath%>right.htm"></iframe>
            </div> 
        </div> 
        
    </div>
    <div  style="height:32px; line-height:32px; text-align:center;">
            	版权所有：吉林省交通厅V1.0    信息维护：安全监督处
    </div>
    <div style="display:none"></div>
    	<script>
        			        $.ajax({
						    type:"POST",
						    url:"/jwr/menu/menuRemoveSessionAction.action"
						  });
        		</script>
</body>
</html>

