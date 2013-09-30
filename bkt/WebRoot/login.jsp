<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登陆</title>
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
		function loguser(){
			if(check()){
				success();
			}
		}
		function check(){
			var usn = $('#us_name').val();
			var upw = $('#us_pw').val();
			if(usn == null||usn == ""){
				$.messager.alert('提示','用户名不能为空','info');
				return false;
			}else{
				if(upw == null||upw ==""){
					$.messager.alert('提示','密码不能为空','info');
					return false;
				}else{
					return true;
				}
			}
		}
		function success(){
			$.ajax({
				type:"POST",
				url:"userlogin!loginUser.action",
				data:{username:$("#us_name").val(),password:$("#us_pw").val()},
				success:function(data){
					if(data =="notexist"){
						$.messager.alert('提示','用户名不存在','warning');
					}else{
						if(data == "success"){
							window.location.href="index.jsp";
						}else{
							$.messager.alert('提示','用户名或密码错误','error');
						}
					}
				}
			});
		}
		function logadmin(){
			if(checkAdm){
				$('#adminform').form('submit',{
					url:'adminlogin!loginAdmin.action',
					success:function(data){
						if(data == "notexist"){
							$.messager.alert('提示','管理员账号不存在','warning');
						}else{
							if(data == "success"){
								window.location.href="admin/index.jsp";
							}else{
								$.messager.alert('提示','账号或密码错误','error');
							}
						}
					}
				});
			}
		}
		function checkAdm(){
			var an = $('#ad_name').val();
			var ap = $('#ad_pw').val();
			if(an == null||an == ""){
				$.messager.alert('提示','账号不能为空','info');
				return false;
			}else{
				if(ap == null||ap ==""){
					$.messager.alert('提示','密码不能为空','info');
					return false;
				}else{
					return true;
				}
			}
		}
	</script>
  </head>
  
  <body>
    <div id="navhead">
  		<img src="image/head.jpg" style="height:150px; width:100%; "/>
  	</div>
  	<div id="logpanel" class="easyui-panel" title="航班列表" style="width:500px;height:150px;background:#fafafa;" 
  		data-options="iconCls:'icon-sum',closable:false,collapsible:false,minimizable:false,maximizable:false,maximized:true">
  		<div id="logcontent" class="easyui-layout" data-options="fit:true" style="height:100%;width:100%">
  			<div id="main" data-options="region:'center',fit:'true',border:'true'" style="background:#eee;">
	  			<table id="flightlist" class="easyui-datagrid" style="width:1050px;height:420px"   
	        		data-options="url:'flightlist!flightList.action' ,fitColumns:true,singleSelect:true,pagination:true">   
	    			<thead>   
	        			<tr>   
	            			<th data-options="field:'flightNo',width:100">航班编号</th>   
	            			<th data-options="field:'startAddress',width:100">起飞城市</th>
	            			<th data-options="field:'lastAddress',width:100">到达城市</th>
	            			<th data-options="field:'starttime',width:100">起飞时间</th>
	            			<th data-options="field:'lasttime',width:100">到达时间</th>
	            			<th data-options="field:'dollars',width:100,align:'right'">价格</th>
	            			<th data-options="field:'number',width:100,align:'right'">座位</th>
	            			<th data-options="field:'remains',width:100,align:'right'">余票</th>   
	        			</tr>   
	    			</thead>
	    			<tbody>
	    			</tbody>   
				</table>
  			</div>
  			<div id="login" data-options="region:'east',title:'登陆'" style="width:300px;height:100%;">
  				<div id="acrd" class="easyui-accordion" data-options="fit:true" style="width:300px;height:100%">   
    				<div title="用户登录" data-options="iconCls:'icon-reload',selected:true">   
	       	 			<form id="userform" method="post">   
	    					<div style="padding-top:20px; font-size:16px; text-align:right; padding-right:10%">   
	        					<label for="name">用户名:</label>   
	        					<input id="us_name" class="easyui-validatebox" type="text" name="name" />   
	    					</div>   
	    					<div style="padding-top:20px; font-size:16px; text-align:right; padding-right:10%">   
	        					<label for="password">密码:</label>   
	        					<input id="us_pw" class="easyui-validatebox" type="password" name="password" />   
	    					</div> 
						</form>
						<div style="text-align:right; padding-right:10%">
							<a id="ulogbtn" onclick="loguser();" class="easyui-linkbutton">登陆</a>
						</div>
						<div style="text-align:right; padding-right:10%; padding-top:20px">
						没有账号?<a href="regist.jsp">立即注册</a>
						</div>    
    				</div>   
    				<div title="管理员登陆" data-options="iconCls:'icon-reload'">   
        				<form id="adminform" method="post">   
	    					<div style="padding-top:20px; font-size:16px; text-align:right; padding-right:10%">   
	        					<label for="name">账号:</label>   
	        					<input id="ad_name" class="easyui-validatebox" type="text" name="admin.name" />   
	    					</div>   
	    					<div style="padding-top:20px; font-size:16px; text-align:right; padding-right:10%">   
	        					<label for="password">密码:</label>   
	        					<input id="ad_pw" class="easyui-validatebox" type="password" name="admin.password" />   
	    					</div> 
						</form>
						<div style="text-align:right; padding-right:10%">
							<a id="alogbtn" onclick="logadmin();" class="easyui-linkbutton">登陆</a>
						</div>    
    				</div>   
				</div>
  			</div>
  		</div>
  	</div>
  </body>
</html>
