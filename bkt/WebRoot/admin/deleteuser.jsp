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
    
    <title>删除用户</title>
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
  			height:350,
  			width:1160,
  			columns:[[
  				{field:'ck',checkbox:true,width:2},
  				{field:'name',title:'用户名',width:80,sortable:true},
  				{field:'cardId',title:'身份证号',width:80},
  				{field:'email',title:'邮箱',width:80},
  				{field:'sex',title:'性别',width:80,align:'right'},
  				{field:'telephone',title:'联系电话',width:80,align:'right'},
  				{field:'address',title:'联系地址',width:80,align:'right'}
  			]],
  			toolbar:[{
  				text:'删除用户',
  				iconCls:'icon-cut',
  				handler:function(){
  					deleteUser();
  				}
  			}],
  			onLoadSuccess:function(){
  				$('#userlist').datagrid('clearSelections');
  			}
  		});
  	</script>
  	<script type="text/javascript">
  		function deleteUser(){
  			var row = $('#userlist').datagrid('getSelected');
  			$.messager.confirm('确认','确定要删除此用户吗？',function(r){
  				if(r){
  					$.ajax({
  						type:'post',
  						url:'deleteuser!deleteUser.action',
  						data:{name:row.name},
  						success:function(){
  							$.messager.alert('提示','删除成功','info',function(){
        						window.location.href="admin/deleteuser.jsp"; 
        					});
  						}
  					});
  				}
  			});
  		}
  	</script>
  </body>
</html>
