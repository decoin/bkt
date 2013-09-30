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
    
    <title>航班发布</title>
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
		$.extend($.fn.validatebox.defaults.rules,{
			intOrFloat:{
				validator:function(value){
					return /^\d+(\.\d+)?$/i.test(value);
				},
				message:'请输入数字,并确保格式正确.'
			},
			integer:{
				validator:function(value){
					return /^[+]?[1-9]+\d*$/i.test(value);
				},
				message:'请输入整数.'
			}
		});
	</script>
	<script type="text/javascript">
		function showWindow(){
			$('#win').window('open');
		}
		function publishFlight(){
			$('#publish').form('submit',{
				url:'publishflight!publishFlight.action',
				onSubmit:function(){
  	 				var isValid = $(this).form('validate');
  	 				if(!isValid){
  	 					$.messager.alert('提示','航班信息填写不完整','info');
  	 				}
  	 				return isValid;
  	 			},
  	 			success:function(data){
  	 				$.messager.alert('提示',data,'info',function(){
  	 					$('#showflight').datagrid('reload');
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
  	<div id="win" class="easyui-window" title="发布航班" style="height: 350;width: 300;text-align: center;padding-top: 20px" 
  		data-options="iconCls:'icon-add',modal:true,resizable:false,maximizable:false,collapsible:false,minimizable:false,closed:true">
  		<form id="publish" method="post">
  			<div>
  				<label for="flightNo">航班编号:</label>
  				<input class="easyui-validatebox" name="flight.flightNo" data-options="required:true,missingMessage:'航班号不能为空'" />
  			</div>
  			<div>
  				<label for="startAddress">出发城市:</label>
  				<input class="easyui-combobox" name="flight.startAddress" data-options="valueField:'text',textField:'text',url:'city_data.json'" />
  			</div>
  			<div>
  				<label for="lastAddress">到达城市:</label>
  				<input class="easyui-combobox" name="flight.lastAddress" data-options="valueField:'text',textField:'text',url:'city_data.json'" />
  			</div>
  			<div>
  				<label for="starttime">出发时间:</label>
  				<input class="easyui-datetimebox" name="flight.starttime" data-options="showSeconds:false" />
  			</div>
  			<div>
  				<label for="lasttime">到达时间:</label>
  				<input class="easyui-datetimebox" name="flight.lasttime" data-options="showSeconds:false" />
  			</div>
  			<div>
  				<label for="dollars">价格:</label>
  				<input class="easyui-validatebox" name="flight.dollars" validType="intOrFloat" />
  			</div>
  			<div>
  				<label for="num">座数:</label>
  				<input class="easyui-validatebox" name="flight.number" validType="integer" />
  			</div>
  		</form>
  		<div><a id="orbtn" onclick="publishFlight();" class="easyui-linkbutton">添加</a></div>
  	</div>
  	
  	<script type="text/javascript">
  		$('#showflight').datagrid({
  			url:'flightlist!flightList.action',
  			title:'航班列表',
  			method:'post',
  			striped: true,
  			fitColumns:true,
  			pagination:true,
  			height:400,
  			width:1150,
  			columns:[[
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
  				text:'发布航班',
  				iconCls:'icon-add',
  				handler:function(){
  					showWindow();
  				}
  			}]
  		});
  	</script>
  </body>
</html>
