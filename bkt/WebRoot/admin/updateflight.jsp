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
    
    <title>航班更新</title>
	<link rel="stylesheet" type="text/css" href="css/css.css">
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
  		function updateFlight(){
  			$('#update').form('submit',{
  				url:'updateflight!updateFlight.action',
  				success:function(data){
					$.messager.alert('提示',data,'info',function(){
  	 					$('#win').window('close');
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
  	<div id="win" class="easyui-window" title="更新航班" style="height: 350;width: 300;text-align: center;padding-top: 20px" 
  		data-options="iconCls:'icon-pencil',modal:true,resizable:false,maximizable:false,collapsible:false,minimizable:false,closed:true">
  		<form id="update" method="post">
  			<div>
  				<input id="fid" type="hidden" name="flight.flight_id">
  			</div>
  			<div>
  				<label for="flightNo">航班编号:</label>
  				<input id="fno" class="easyui-validatebox" name="flight.flightNo" data-options="required:true,missingMessage:'航班号不能为空'" />
  			</div>
  			<div>
  				<label for="startAddress">出发城市:</label>
  				<input id="stc" class="easyui-combobox" name="flight.startAddress" data-options="valueField:'text',textField:'text',url:'city_data.json'" />
  			</div>
  			<div>
  				<label for="lastAddress">到达城市:</label>
  				<input id="ltc" class="easyui-combobox" name="flight.lastAddress" data-options="valueField:'text',textField:'text',url:'city_data.json'" />
  			</div>
  			<div>
  				<label for="starttime">出发时间:</label>
  				<input id="stt" class="easyui-datetimebox" name="flight.starttime" data-options="showSeconds:false" />
  			</div>
  			<div>
  				<label for="lasttime">到达时间:</label>
  				<input id="ltt" class="easyui-datetimebox" name="flight.lasttime" data-options="showSeconds:false" />
  			</div>
  			<div>
  				<label for="dollars">价格:</label>
  				<input id="price" class="easyui-validatebox" name="flight.dollars" validType="intOrFloat" />
  			</div>
  			<div>
  				<label for="num">座数:</label>
  				<input id="num" class="easyui-validatebox" name="flight.number" validType="integer" />
  			</div>
  		</form>
  		<div><a id="upbtn" onclick="updateFlight();" class="easyui-linkbutton">更新</a></div>
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
  				{field:'flight_id',title:'ID',hidden:true},
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
  				text:'更新航班',
  				iconCls:'icon-edit',
  				handler:function(){
  					getSelect();
  				}
  			}],
  			onLoadSuccess:function(){
  				$('#showflight').datagrid('clearSelections');
  			}
  		});
  	</script>
  	<script type="text/javascript">
  		function getSelect(){
  			var row = $('#showflight').datagrid('getSelected');
  			document.getElementById('fid').value=row.flight_id;
  			document.getElementById('fno').value=row.flightNo;
  			document.getElementById('price').value=row.dollars;
  			document.getElementById('num').value=row.number;
  			$('#stc').combobox('setValue',row.startAddress);
  			$('#ltc').combobox('setValue',row.lastAddress);
  			$('#stt').datetimebox('setValue',row.starttime);
  			$('#ltt').datetimebox('setValue',row.lasttime);
  			showWindow();
  		}
  	</script>
  </body>
</html>
