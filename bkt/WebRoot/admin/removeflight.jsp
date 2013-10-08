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
    
    <title>取消航班</title>
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
	
	<script type="text/javascript">
  		function removeFlight(){
  			var row = $('#showflight').datagrid('getSelected');
  			$.messager.confirm('确认','确定要删除该航班吗？',function(r){
  				if(r){
  					$.ajax({
  						type:'post',
  						url:'removeflight!removeFlight.action',
  						data:{flightNo:row.flightNo},
  						success:function(){
  							$.messager.alert('提示','删除成功','info',function(){
  								$('#showflight').datagrid('clearSelections');
        						$('#showflight').datagrid('reload');
        					});
  						}
  					});
  				}
  			});
  		}
  	</script>
  </head>
  
  <body>
  	<div>
  		<table id="showflight">   
		</table>
  	</div>
  	
  	<script type="text/javascript">
  		$('#showflight').datagrid({
  			url:'flightlist!flightList.action',
  			title:'航班列表',
  			method:'post',
  			striped: true,
  			singleSelect:true,
  			fitColumns:true,
  			pagination:true,
  			height:400,
  			width:1150,
  			columns:[[
  				{field:'ck',checkbox:true,width:2},
  				{field:'flightNo',title:'航班编号',width:80,sortable:true},
  				{field:'startAddress',title:'起飞城市',width:80},
  				{field:'lastAddress',title:'到达城市',width:80},
  				{field:'starttime',title:'起飞时间',width:80},
  				{field:'lasttime',title:'到达时间',width:80},
  				{field:'dollars',title:'价格',width:60,align:'right'},
  				{field:'number',title:'座位',width:60,align:'right'},
  				{field:'remains',title:'余票',width:60,align:'right'},
  			]],
  			toolbar:[{
  				text:'取消航班',
  				iconCls:'icon-cut',
  				handler:function(){
  					removeFlight();
  				}
  			}],
  			onLoadSuccess:function(){
  				$('#showflight').datagrid('clearSelections');
  			}
  		});
  	</script>
  </body>
</html>
