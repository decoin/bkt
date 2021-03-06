<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="checkadminsession.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户列表</title>
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
  	<div>
  		<table id="userlist">
  		</table>
  	</div>
  	
  	<script type="text/javascript">
  		$('#userlist').datagrid({
  			url:'userlist!userList.action',
  			title:'用户列表',
  			method:'post',
  			singleSelect:true,
  			striped: true,
  			fitColumns:true,
  			pagination:true,
			pageList:[5,10,20],  			
  			height:350,
  			width:1160,
  			columns:[[
  				{field:'name',title:'用户名',width:80,sortable:true},
  				{field:'cardId',title:'身份证号',width:80},
  				{field:'email',title:'邮箱',width:80},
  				{field:'sex',title:'性别',width:80,align:'right'},
  				{field:'telephone',title:'联系电话',width:80,align:'right'},
  				{field:'address',title:'联系地址',width:80,align:'right'}
  			]]
  		});
  	</script>
  </body>
</html>
