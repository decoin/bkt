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
    
    <title>航班订票系统首页</title>
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
		function showmsg(){
			$.messager.show({
				title:'登录消息',
				msg:'欢迎登陆航班订票系统,提示信息将在3秒后关闭。',
				timeout:3000,
				showType:'slide'
			});
		}
	</script>
  </head>
  
  <body onload="showmsg();">
  	<div id="navhead">
  		<img src="image/head.jpg" style="height:150px; width:100%; "/>
  	</div>
  	  
  	<div id="panel" class="easyui-panel" title="<%=session.getAttribute("username")%>,欢迎使用航空订票系统" 
  		style="width:500px;height:150px;background:#fafafa;" 
  		data-options="iconCls:'icon-sum',closable:false,collapsible:false,minimizable:false,maximizable:false,maximized:true">
  		<div id="content" class="easyui-layout" style="height:100%;width:100%">   
    		<div id="left" data-options="region:'west',title:'功能管理',split:true" style="width:200px;">
    			<ul id="tree"></ul>
    		</div>   
    		<div id="center" data-options="region:'center',fit:'true',border:'true'" style="background:#eee;">
    			<div id="tab" class="easyui-tabs" fit="true">
    				<div title="首页" href="welcome.jsp"></div>
    				<div title="测试">我是测试</div>
    			</div>
    		</div>   
		</div>
  	</div>
  	
  	<script>
    	$("#tree").tree({
    		url:'tree_data.json',
    		onClick:function(node){
				if(node.text == "用户信息"){
					$("#tab").tabs('add',{
						title:node.text,
						content:'<iframe id="usif" style=width:100%;height:100%; src=http://localhost:8080/bkt/showuser.jsp frameborder=0></iframe>',
						closable:true,
						tools:[{
							iconCls:'icon-mini-refresh',
							handler:function(){
								$.messager.alert('提示','数据已刷新','info',function(){
									$('#usif').attr('src','http://localhost:8080/bkt/showuser.jsp');
								});
							}
						}]
					});
				}
				if(node.text == "密码修改"){
					$('#tab').tabs('add',{
						title:node.text,
						content:'<iframe id="chpw" style=width:100%;height:100%; src=http://localhost:8080/bkt/changepwd.jsp frameborder=0></iframe>',
						closable:true
					});
				}
				if(node.text == "航班查询"){
					$('#tab').tabs('add',{
						title:node.text,
						content:'<iframe id="qryf" style=width:100%;height:100%; src=http://localhost:8080/bkt/queryflight.jsp frameborder=0></iframe>',
						closable:true
					});
				}
				if(node.text == "国内航班"){
					$('#tab').tabs('add',{
						title:node.text,
						content:'<iframe id="dmf" style=width:100%;height:100%; src=http://localhost:8080/bkt/domesticflight.jsp frameborder=0></iframe>',
						closable:true
					});
				}
				if(node.text == "国际航班"){
					$('#tab').tabs('add',{
						title:node.text,
						content:'<iframe id="fnf" style=width:100%;height:100%; src=http://localhost:8080/bkt/foreignflight.jsp frameborder=0></iframe>',
						closable:true
					});
				}
				if(node.text == "已购机票"){
					$('#tab').tabs('add',{
						title:node.text,
						content:'<iframe id="olf" style=width:100%;height:100%; src=http://localhost:8080/bkt/showorderlist.jsp frameborder=0></iframe>',
						closable:true
					});
				}
				if(node.text == "机票退订"){
					$('#tab').tabs('add',{
						title:node.text,
						content:'<iframe id="rtf" style=width:100%;height:100%; src=http://localhost:8080/bkt/refundticket.jsp frameborder=0></iframe>',
						closable:true
					});
				}
			}
    	});
    </script>
  </body>
</html>
