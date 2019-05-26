<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../main.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
    <script type="text/javascript">
     var msg='<%=request.getAttribute("returnValue")%>';
    if(msg!=null&&msg!='null'){
		if(msg=="yes"){
				alert("提交成功，窗口将关闭");
				 window.parent.iniData();
				 window.parent.ligerwindow.close();
		}else{
			alert(msg);
		}
    }
    var indexdata="";
    var busclass;
    var busdata="";
    var totalSize="";
	var reportname="";
    function cell4Enter(){
    	 $('.xz').each(function(index){
		    	var s=($(this).text());  
		    	$(this).text("");
		    	var ss=s.match(/([0-9]\.)|([0-9]\、)|([0-9]\．)|(（[0-9]+）)/g);
		    	
		    	if(ss==null || ss.length==0)return;
		    	
		    	var sidx=s.indexOf(ss[0]);
		    	if(sidx>0){
		    		$('<div/>').append(s.substring(0,sidx)).appendTo($(this));
		    	}		    	
		    	if(ss!=null && ss.length>0){
			    	for(var i=1;i<=ss.length;i++){    		    		 
			    		var idx=s.indexOf(ss[i]);
			    		if(ss.length==i)idx=s.length;
			    		var _s=s.substring(sidx,idx);
			    		$('<div/>').append(_s).appendTo($(this));
			    		sidx=idx;
			    	}
		    	}
   		 });
     }
  
    
    //这个例子展示了本地过滤，你也可以在服务器端过滤(将过滤规则组成json，以一个参数提交给服务器)
    //相见ligerGrid.showFilter.js
        $(function ()
        {  
        	  $.ajax({
        		    type:"POST",
        		    async:false,
        		    url:"/jwr/enControl/getEndbZpDetailAction.action?type=<%=request.getParameter("type")%>",
        		    success:function(returnValue){
        		    	indexdata=eval("("+returnValue+")");
        		    }
        		});
        		
       	 var cell1=indexdata[0].cell1;
	   	 var cell2=indexdata[1].cell2;
	   	 var cell3=indexdata[2].cell3;
	   	 var cell4=indexdata[3].cell4;
	   	 var cell1rowspan=indexdata[4].td1rowspan;
	   	 var cell2rowspan=indexdata[5].td2rowspan;
	   	 var score=indexdata[6].scoreList;
   		 var scoresum=indexdata[7].scoresum;
   		 reportname=indexdata[8].reportname;
   		 $("#sum").val(scoresum);
   		 
		 //先创建所有的行
		 var tbod=$("#tbody");
		 if(tbod!=null){
			 var trh="";
			 for(var i=0;i<cell3.length;i++){
				 trh+="<tr id='tr"+i+"'> </tr>";
			 }
			 tbod.html(trh);
			 var y=0,row1=0,row2=0,t2=0,r1=0,r2=0,r10=0,r20=0;
			
			 for(var i=0;i<cell3.length;i++){
				 var star;
				 var td1="",td2="",td3="",td4="",td5="",td6="",td7="";
				 if(cell3[i].star=='1'){
					 star="★"; 
				 }else if(cell3[i].star=='2'){
					 star="★★"; 
				 }else if(cell3[i].star=='3'){
					 star="★★★"; 
				 }else{
					 star="";
				 }
		   		if(i==0){
		    		td1+="<td rowspan='"+cell1rowspan[row1].i+"' >"+cell1[y].name+" </td> ";
		    		y++;
		    		row1++;
		    		td2+="<td rowspan='"+cell2rowspan[row2].j+" ' >"+cell2[t2].j+"."+cell2[t2].name+" </td> "
		    		t2++;
		    		row2++;
		    	} 
		   		if(row1==1){
			   		if(i==parseInt(r1) +parseInt(cell1rowspan[r10].i)){
			   			td1+="<td rowspan='"+cell1rowspan[row1].i+"' >"+cell1[y].name+" </td> ";
			    		r1=i;
			    		y++;
			    		r10++;
			    		row1++;
			    		
			   		}
		   		}else{
		   			if(i==parseInt(r1) +parseInt(cell1rowspan[r10].i)){
			   			td1+="<td rowspan='"+cell1rowspan[row1].i+"' >"+cell1[y].name+" </td> ";
			    		r1=i;
			    		y++;
			    		r10++;
			    		row1++;
			    		
			   		}
		   		}
		   		
		   		if(row2==1&&row2!=0){
			   		if(i==parseInt(r2) +parseInt(cell2rowspan[r20].j)){
			   			td2+="<td rowspan='"+cell2rowspan[row2].j+" ' >"+cell2[t2].j+"."+cell2[t2].name+" </td> "
			    		r2=i;
			    		t2++;
			    		r20++;
			    		row2++;
			    		
			   		}
		   		}else{
		   			if(i==parseInt(r2) +parseInt(cell2rowspan[row2-1].j)){
			   			td2+="<td rowspan='"+cell2rowspan[row2].j+" ' >"+cell2[t2].j+"."+cell2[t2].name+" </td> "
			    		r2=i;
			    		t2++;
			    		r20++;
			    		row2++;
			   		}
		   		}
		   		td3+="<td style='width:550px'>"+cell3[i].name+"</td> ";
		   		if(cell4[i] ==null){
		   			td7+="<td style='width:550px'> </td> "; //新增考评细则
		   		}else{
		   			td7+="<td style='width:550px'>"+cell4[i].name+"</td> "; //新增考评细则
		   		}
		   		
	    		td4+="<td align='right'>"+cell3[i].score+"</td> ";
	    		td5+="<td > <font color='red'>"+star+"</font> </td> ";
	    		td6+="<td align='right'><span class='spinner'>"+
	    			"<input class='easyui-numberspinner spinner-text validatebox-text'"+ 
	    			"group='score'readonly=true id='trscore"+i+"' increment='1'  max="+score[i][i]+" min='0'   score="+score[i][i]+" star="+cell3[i].star+" style='width: 20px; ' value="+score[i][i]+">"+
	    			"<span class='spinner-arrow'><span class='spinner-arrow-up'>"+
	    			"</span><span class='spinner-arrow-down'></span></span>"+
	    			"</span></td>";
	    		$("#tr"+i+"").html(td1+td2+td3+td7+td4+td5+td6);
		   		
			  }
			 
			 cell4Enter();
		 }
		 
		 /**
	   	 alert(cell3.length)
	   	 for(var i=1;i<cell3.length;i++){
	   		if(i==1){
	    		td1+="<td rowspan='7' >"+td1list[y].name+" </td>";
	    		y++;
	    		td2+="<td rowspan='"+td2jlist[0].j+""' >"+td2list[t2].name+" </td>"
	    		t2++;
	    		$("#"+i+"").html(td1+td2);
	    	}
	   	 }*/
	   	 
        	//initAttachment('reportname');
        });
    
        /**
         * 指标评分计算分值
         */
        function esp_get_score() {
            // 校验所申请等级的打星是否全部满足
            var grade = $('#grade').val()
            var cond = 'input[group="score"]'
            switch (grade) {
                case "1":
                    cond += '[star!="0"]';
                    break;
                case "2":
                    cond += '[star!="0"][star!="1"]';
                    break;
                case "3":
                    cond += '[star="3"]';
                    break;
                default:
                    break;
            }
            var scores_grade = $(cond)
            var err = false
            scores_grade.each(function(i, e) {
                if (parseFloat($(e).val()) != parseFloat($(e).attr('max'))) {
                    alert("提示：所申请等级中对应打星号的项必须全部满分。")
                    $('#sum').val('0')
                    err = true
                    return false; // 停止循环
                }
            })
            if (err) return;

            // 计算分数
            var scores = $('input[group="score"]')
            var s = ""
            var err = false
            scores.each(function(i, e) {
                var v = $(e).val()
                if (isNaN(parseInt(v))) {
                    err = true
                } else {
                    s += v + '+'
                }
            })
            if (err) {
                alert("有未打分项")
                $('#sum').val('0')
            } else {
                var sum = eval(s + "0")
                $('#sum').val(sum)
            }
        }
        
        /**
         * 指标评分选择申请级别（1 一级 2 二级 3 三级）
         */
        function esp_stand_grade() {
            var tips = ["一级企业必须完全满足所有标<font color=red>★、★★、★★★</font>的项", "二级企业必须完全满足所有标<font color=red>★★、★★★</font>的项", "三级企业必须完全满足所有标<font color=red>★★★</font>的项"]
            var grade = $('#grade').val()
            $('#tip').html(tips[grade - 1])
        }
       function chakan(){
	  		var freport=reportname;
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
       $(function(){
    	   var grades = document.getElementById("grade").options;
    	   for(var i=0;i<grades.length;i++){
    		   if(grades[i].value == <%=request.getParameter("grade")%>){
    			   grades[i].selected = true;
    		   }
    	   }
    	   esp_stand_grade();
       });
    </script>
    
</head>

<body style="padding:10px;">
<form action="" method="post">
	<h2>
		<label>请选择申请达标级别：</label><select id="grade" name="enPFInfo.leval"
			onchange="esp_stand_grade()"><option value="2">二级</option>
			<option value="3">三级</option></select>
	</h2>
	<div class="eui-info">
		<div class="eui-tip icon-tip"></div>
		<div>
			<span id="tip">二级企业必须完全满足所有标<font color="red">★★、★★★</font>的项
			</span>
		</div>
	</div>
	<table border="1" class="wr3table">
	<caption><script type="text/javascript">document.write(getCelltype('<%=request.getParameter("type")%>'))</script></caption>
	<thead><tr><th>考核内容</th><th colspan="2">考核要点</th><th  >考评细则</th><th nowrap="1">分数</th><th>星级</th><th>自评分</th></tr></thead>
	<tbody id="tbody">
	</tbody>
	<tfoot>
			<tr>
				<td colspan="6"><h2>
						注：“<font color="red">★</font>”为一级必备条件；“<font color="red">★★</font>”为二级必备条件；“<font
							color="red">★★★</font>”为三级必备条件。即：<br>
						<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;一级企业必须完全满足所有标<font
							color="red">★、★★、★★★</font>的项；二级企业必须完全满足所有标<font color="red">★★、★★★</font>的项；三级企业必须完全满足所有标<font
							color="red">★★★</font>的项。
					</h2></td>
			</tr>
		</tfoot>
		</table>
		<br>
		自评总分：
		<input id="sum" name="enPFInfo.scoresum" readonly="true" style="width:70px; font-size:16px; color:green" value="0">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;自评报告：
		<input class="easyui-validatebox validatebox-text" id="report" name="report" type="hidden" value="">
		<span> <a href="javascript:void(0)" onclick="chakan()">查看</a></span>
		</form>
    <script type="text/javascript">
    function formsub(){
    	if(  $('#sum').val()=='0'){
    		alert("计算总分为:0,请先打分并点击计算总分!");
    		return;
    	}
    	
    	//获取所有的自评分
 	   var scores = $('input[group="score"]');
 	   var s="";
    	//jquery each循环
 	  scores.each(function(i, e) {
 		  //i 为坐标
          var v = $(e).val()
          if (isNaN(parseInt(v))) {
              err = true
          } else {
              s +="{"+i+":"+v+"},";
          }
      });
    	document.forms[0].action="<%= basePath%>/enControl/insertPingfenAction.action?type=<%=request.getParameter("type")%>&score="+s;
    	document.forms[0].submit();
 }
 
    </script>
</body>
</html>
