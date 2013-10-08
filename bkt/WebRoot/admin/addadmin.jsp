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
    
    <title>增加管理员</title>
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
  	 	function addAdmin(){
  	 		$('#addadm').form('submit',{
  	 			url:'addadmin!addAdmin.action',
  	 			onSubmit:function(){
  	 				var isValid = $(this).form('validate');
  	 				if(!isValid){
  	 					$.messager.alert('提示','管理员信息填写不完整','info');
  	 				}
  	 				return isValid;
  	 			},
  	 			success:function(data){
  	 				$.messager.alert('提示',data,'info',function(){
  	 					$('#addadm').form('clear');
  	 				});
  	 			}
  	 		});
  	 	}
  	 </script>
  </head>
  
  <body>
  	<div>
  		<form id="addadm" method="post">
  			<div>   
        		<label for="name">管理员账号:</label>   
        		<input class="easyui-validatebox" type="text" name="admin.name" data-options="required:true,missingMessage:'账号不能为空'" />   
    		</div>
    		<div>   
        		<label for="name">管理员密码:</label>   
        		<input class="easyui-validatebox" type="password" name="admin.password" data-options="required:true,missingMessage:'密码不能为空'" />   
    		</div>
    		<div>
    			<a id="admbtn" onclick="addAdmin();" class="easyui-linkbutton">添加</a>
    		</div>
  		</form>
  	</div>
  </body>
</html>
