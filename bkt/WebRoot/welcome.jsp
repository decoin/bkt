<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="checksession.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>欢迎</title>
	<link rel="stylesheet" type="text/css"
			href="jquery-easyui-1.3.2/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css"
			href="jquery-easyui-1.3.2/themes/icon.css">
	<script src="js/jquery-1.3.2.min.js">
	</script>
	<script src="js/laster.js">
	</script>
	<script type="text/javascript"
			src="jquery-easyui-1.3.2/jquery-1.8.0.min.js">
	</script>
	<script type="text/javascript"
			src="jquery-easyui-1.3.2/jquery.easyui.min.js">
	</script>
  </head>
  
  <body>
		<div style="background-color: #eeeeee;height: 100%" align="center">
			<div id="showcount" style="text-align: left;font-weight: bold;font-size: 12px;">
				当前在线用户数:<%=session.getAttribute("count")%>人
			</div>
			<div id="showtime">
				
			</div>
			<div style="text-align:right; font-weight:bold; font-size: 12px; padding-right: 200px">
				<a id="logoutbtn" class="easyui-linkbutton" onclick="logout();">退出系统</a>
			</div>
			<div style="font-family:华文行楷; font-size:50px; line-height:80px;">
				<p>欢迎使用航空订票系统</p>
			</div>
		</div>
		
	<script type="text/javascript">
		function logout(){
			$.ajax({
				type:"POST",
				url:"userlogout!logoutUser.action",
				success:function(data){
					$.messager.confirm('确认','您确认要退出吗？',function(r){    
    					if (r){    
        					$.messager.alert('提示',data,'info',function(){
        						window.location.href="login.jsp"; 
        					});
    					}    
					}); 
					
				}
			});
		}
	</script>
	<script>
		function refreshTime(){
			$('#showtime').text(new Date().toString());
		}
		function refreshCount(){
			$('#showcount').text('当前在线用户数:<%=session.getAttribute("count")%>人');
		}  
		$(document).ready(function (){
			$('#showtime').text(new Date().toString());
		});
		$(document).ready(function (){ 
			setInterval("refreshTime()",5000); 
		});
		$(document).ready(function (){ 
			setInterval("refreshCount()",60000); 
		});
	</script>
  </body>
</html>
