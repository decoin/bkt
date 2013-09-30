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
    
    <title>密码更改</title>
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
		$.extend($.fn.validatebox.defaults.rules, {    
    		equals: {    
        		validator: function(value,param){    
            		return value == $(param[0]).val();    
        		},    
        		message: '输入的密码不一致'   
    		}    
		});  
	</script>
	<script type="text/javascript">
		function changepwd(){
			$('#chgpwd').form('submit',{
				url:'chgpwd!changePwd.action',
				success:function(data){
					if(data == "success"){
						$.messager.alert('提示','密码修改成功','info',function(){
							$('#chgpwd').form('clear');
						});
					}else{
						$.messager.alert('提示','修改失败,原密码不正确','warning',function(){
							$('#chgpwd').form('clear');
						});
					}
				}
			});
		}
	</script>
  </head>
  
  <body>
  	<div>
  	<form id="chgpwd" method="post">
  		<div>
  			<label for="password">原密码:</label>
  			<input class="easyui-validatebox" type="password" id="password" name="password">
  		</div>
  		<div>   
        	<label for="newpassword">新密码:</label>   
        	<input class="easyui-validatebox" type="password" id="newpassword" name="newpassword" />   
    	</div>
    	<div>   
        	<label for="repassword">重复密码:</label>   
        	<input class="easyui-validatebox" type="password" id="repassword" name="repassword" validType="equals['#newpassword']" />   
    	</div>
    	<div>
    		<a id="chgbtn" onclick="changepwd();" class="easyui-linkbutton">更改</a>
    	</div>
  	</form>
  	</div>
  </body>
</html>
