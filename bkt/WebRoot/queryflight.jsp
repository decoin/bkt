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
    
    <title>航班查询</title>
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
		function searchFlight(){
			var options = $('#showflight').datagrid('getPager').data("pagination").options;
			var cur = options.pageNumber;
			var max = options.pageSize;
			$.messager.progress();
			$('#quyform').form('submit',{
				url:'queryflight!queryFlight.action',
				onSubmit:function(param){
					param.page = cur;
					param.rows = max;
				},
				success:function(data){
					data = eval("(" + data + ")");
					$.messager.progress('close');
					$('#showflight').datagrid('loadData',data);
				}
			});
		}
		function clearForm(){
			$('#quyform').form('clear');
		}
		function showOrderWindow(){
			$('#win').window('open');
			
		}
		function orderTicket(){
			$('#buytk').form('submit',{
				url:'buyticket!buyTickets.action',
				success:function(data){
					$.messager.alert('提示',data,'info',function(){
  	 					$('#win').window('close');
  	 				});
				}
			});
		}
	</script>
  </head>
  
  <body>
  	<div>
  		<form id="quyform" method="post">
  			<table>
  				<tr>
  					<td>航班编号:<input name="flight.flightNo" type="text" style="width: 200px" /></td>
  					<td>出发地:<input name="flight.startAddress" style="width: 200px" class="easyui-combobox" 
  						data-options="valueField:'text',textField:'text',url:'city_data.json'" /></td>
  					<td align="center"><a onclick="searchFlight();" class="easyui-linkbutton" iconCls="icon-search">查询</a></td>
  				</tr>
  				<tr>
  					<td>航班时间:<input name="date" type="text" class="easyui-datebox" /></td>
  					<td>目的地:<input name="flight.lastAddress" style="width: 200px" class="easyui-combobox" 
  						data-options="valueField:'text',textField:'text',url:'city_data.json'" /></td>
  					<td align="center"><a onclick="clearForm();" class="easyui-linkbutton" iconCls="icon-cancel">清空</a></td>
  				</tr>
  			</table>
  		</form>
  	</div>
  	<div>
  		<table id="showflight">   
		</table>
  	</div>
  	<div id="win" class="easyui-window" title="购买" style="height: 350;width: 300;text-align: center;padding-top: 20px" 
  		data-options="iconCls:'icon-add',modal:true,resizable:false,maximizable:false,collapsible:false,minimizable:false,closed:true">
  		<form id="buytk" method="post">
  			<div>
  				<label for="name">购票人:</label>
  				<input type="text" name="orderlist.name" value="<%=session.getAttribute("username")%>" readonly />
  			</div>
  			<div>
  				<label for="flightno">航班号:</label>
  				<input id="fno" type="text" name="orderlist.flightno" value="" readonly />
  			</div>
  			<div>
  				<label for="startcity">起飞城市:</label>
  				<input id="stc" type="text" name="startcity" value="" readonly />
  			</div>
  			<div>
  				<label for="lastcity">到达城市:</label>
  				<input id="ltc" type="text" name="lastcity" value="" readonly />
  			</div>
  			<div>
  				<label for="time">航班时间:</label>
  				<input id="time" type="text" name="time" value="" readonly />
  			</div>
  			<div>
  				<label for="price">价格:</label>
  				<input id="price" type="text" name="price" value="" readonly />
  			</div>
  			<div>
  				<label for="num">票数:</label>
  				<input class="easyui-combobox" name="orderlist.num" data-options="panelHeight:'100',valueField:'id',textField:'text',url:'num_data.json'" />
  			</div>
  		</form>
  		<div><a id="orbtn" onclick="orderTicket();" class="easyui-linkbutton">购买</a></div>
  	</div>
  	<script type="text/javascript">
  		$('#showflight').datagrid({
  			url:'flightlist!flightList.action',
  			title:'航班列表',
  			method:'post',
  			singleSelect:true,
  			striped: true,
  			fitColumns:true,
  			pagination:true,
  			pageSize:5,
  			pageList:[5,10,20],
  			height:330,
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
  				text:'购买',
  				iconCls:'icon-add',
  				handler:function(){
  					getFlight();
  				}
  			},'-',{
  				text:'加入购物车',
  				iconCls:'icon-save',
  				handler:function(){
  					
  				}
  			}],
  			onLoadSuccess:function(){
  				$('#showflight').datagrid('clearSelections');
  			}
  		});
  	</script>
  	<script type="text/javascript">
  		function getFlight(){
  			var row = $('#showflight').datagrid('getSelected');
  			document.getElementById("fno").value=row.flightNo;
  			document.getElementById("stc").value=row.startAddress;
  			document.getElementById("ltc").value=row.lastAddress;
  			document.getElementById("time").value=row.starttime;
  			document.getElementById("price").value="￥"+row.dollars;
  			showOrderWindow();
  		}
  	</script>
  </body>
</html>
