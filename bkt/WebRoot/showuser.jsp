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
    
    <title>用户信息</title>
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
		function upload(){
			$.messager.progress();
			$('#upimg').form('submit',{
				url:'upload!uploadPhoto.action',
				onSubmit:function(){
					if($('#myphoto').val() == ""){
						$.messager.progress('close');
						$.messager.alert('提示','未选择文件','info');
					}
					return false
				},
				success:function(data){
					$.messager.progress('close');
					$.messager.alert('提示',data,'info',function(){
  	 					window.location.reload();
  	 				});
				}
			});
		}
	</script>
  </head>
  
  <body>
  	<table>
  	<tr>
  		<td>
  		<table id="usinfo" class="easyui-propertygrid" style="width:400px"   
        	data-options="url:'usershow!queryUser.action',showGroup:true">
        </table>
        </td>
        <td>
        	<table style="padding-left: 30px">
        		<tr>
        			<td>
  					<font style="font-size: 1;font-weight: bold">用户头像:</font>
  					</td>
  				</tr>
  				<tr>
  					<td>
  					<img id="myphoto" height="100px" width="100px" src="upload/<%=session.getAttribute("photo")%>">
  					</td>
  				</tr>
  				<tr>
  					<td style="padding-top: 20px">
  						<form id="upimg" method="post" enctype="multipart/form-data">
  							<input id="myphoto" type="file" name="image">
  						</form>
  						<a id="change" class="easyui-linkbutton" onclick="upload();">点击更换</a>
  					</td>
  				</tr>
  			</table>
  		</td>
  	</tr>	
  	</table>
  </body>
</html>
