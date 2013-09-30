<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>注册</title>
    <link rel="stylesheet" type="text/css" href="css/css.css">
	<link rel="stylesheet" type="text/css"
			href="jquery-easyui-1.3.2/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css"
			href="jquery-easyui-1.3.2/themes/icon.css">
	<script type="text/javascript"
			src="jquery-easyui-1.3.2/jquery-1.8.0.min.js">
	</script>
	<script type="text/javascript"
			src="jquery-easyui-1.3.2/jquery.easyui.min.js">
	</script>
	
	<script type="text/javascript">
		$.fn.validatebox.defaults.rules.email.message = '邮箱格式不正确';
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
  	 	function reguser(){
  	 		$.messager.progress();
  	 		$('#regform').form('submit',{
  	 			url:'userreg!regUser.action',
  	 			onSubmit:function(){
  	 				var isValid = $(this).form('validate');
  	 				if(!isValid){
  	 					$.messager.progress('close');
  	 					$.messager.alert('提示','表单填写不完整','info');
  	 				}
  	 				return isValid;
  	 			},
  	 			success:function(data){
  	 				$.messager.progress('close');
  	 				$.messager.alert('提示',data,'info',function(){
  	 					window.location.href="login.jsp";
  	 				});
  	 			}
  	 		});
  	 	}
  	 </script>
  </head>
  
  <body>
     <div id="navhead">
  		<img src="image/head.jpg" style="height:150px; width:100%; "/>
  	 </div>
  	 <div id="regpanel" class="easyui-panel" title="所在位置:用户注册" style="width:500px;height:150px;background:#fafafa;" 
  		data-options="closable:false,collapsible:false,minimizable:false,maximizable:false,maximized:true">
  		<div style="font-size: 10;text-align: right;font-weight: bold"><a class="easyui-linkbutton" href="login.jsp">返回首页</a></div>
  		<form id="regform" method="post">   
    		<div>   
        		<label for="name">用户名:</label>   
        		<input class="easyui-validatebox" type="text" id="name" name="user.name" data-options="required:true,missingMessage:'该项为必填项'" />   
    		</div>   
    		<div>   
        		<label for="cardId">身份证号码:</label>   
        		<input class="easyui-validatebox" type="text" id="cardId" name="user.cardId" data-options="required:true,missingMessage:'该项为必填项'" />   
    		</div>
    		<div>   
        		<label for="password">密码:</label>   
        		<input class="easyui-validatebox" type="password" id="password" name="user.password" data-options="required:true,missingMessage:'该项为必填项'" />   
    		</div>
    		<div>   
        		<label for="repassword">重复密码:</label>   
        		<input class="easyui-validatebox" type="password" id="repassword" name="repassword" required="required" validType="equals['#password']" />   
    		</div>
    		<div>
    			<label for="email">邮箱:</label>
    			<input class="easyui-validatebox" type="text" id="email" name="user.email" data-options="required:true,validType:'email',missingMessage:'该项为必填项'" />
    		</div>
    		<div>
    			<label for="sex">性别:</label>
    			<input type="radio" value="男" name="user.sex" checked />男
    			<input type="radio" value="女" name="user.sex" />女
    		</div>
    		<div>
    			<label for="telephone">手机:</label>
    			<input class="easyui-validatebox" type="text" id="telephone" name="user.telephone" data-options="required:false" />
    		</div>
    		<div>
    			<label for="address">地址:</label>
    			<input class="easyui-validatebox" type="text" id="address" name="user.address" data-options="required:false" />
    		</div>
    		<div>
    			<a id="regbtn" onclick="reguser();" class="easyui-linkbutton">注册</a>
    		</div>   
		</form>
  	 </div>
  	 
  	
  </body>
</html>
