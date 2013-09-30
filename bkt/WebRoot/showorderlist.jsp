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
    
    <title>我的订单</title>
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
  		<table id="showorderlist">
  		</table>
  	</div>
  	
  	<script type="text/javascript">
  		$('#showorderlist').datagrid({
  			url:'showorderlist!showOrderlist.action',
  			title:'购票记录',
  			method:'post',
  			striped: true,
  			fitColumns:true,
  			pagination:true,
  			height:350,
  			width:1160,
  			columns:[[
  				{field:'ck',checkbox:true,width:2},
  				{field:'orderno',title:'订单号',width:80,sortable:true},
  				{field:'flightno',title:'航班编号',width:80},
  				{field:'num',title:'购买数量',width:80,align:'right'},
  				{field:'total',title:'总金额',width:80,align:'right'},
  				{field:'orderdate',title:'订票时间',width:80,align:'right'}
  			]],
  			toolbar:[{
  				text:'删除记录',
  				iconCls:'icon-cut',
  				handler:function(){
  					
  				}
  			}],
  			onLoadSuccess:function(){
  				$('#showorderlist').datagrid('clearSelections');
  			}
  		});
  	</script>
  </body>
</html>
