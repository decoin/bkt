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
    
    <title>航班订票系统管理员首页</title>
	<link rel="stylesheet" type="text/css"
			href="/bkt/jquery-easyui-1.3.2/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css"
			href="/bkt/jquery-easyui-1.3.2/themes/icon.css">
	<script src="/bkt/js/jquery-1.3.2.min.js">
	</script>
	<script src="/bkt/js/laster.js">
	</script>
	<script type="text/javascript"
			src="/bkt/jquery-easyui-1.3.2/jquery-1.8.0.min.js">
	</script>
	<script type="text/javascript"
			src="/bkt/jquery-easyui-1.3.2/jquery.easyui.min.js">
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
  	  
  	<div id="panel" class="easyui-panel" title="管理员<%=session.getAttribute("name")%>,欢迎回来!" 
  		style="width:500px;height:150px;background-color:#eeeeee;" 
  		data-options="iconCls:'icon-sum',closable:false,collapsible:false,minimizable:false,maximizable:false,maximized:true">
  		<div id="content" class="easyui-layout" style="height:100%;width:100%">   
    		<div id="left" data-options="region:'west',title:'功能管理',split:true" style="width:200px;">
    			<ul id="tree"></ul>
    		</div>   
    		<div id="center" data-options="region:'center',fit:'true',border:'true'" style="background:#eee;">
    			<div id="tab" class="easyui-tabs" fit="true">
    				<div title="首页" href="admin/admin.jsp"></div>
    			</div>
    		</div>   
		</div>
  	</div>
  	
  	<script>
    	$("#tree").tree({
    		url:'admin/admin_tree_data.json',
    		onClick:function(node){
    			if(node.text == "用户列表"){
    				$("#tab").tabs('add',{
						title:node.text,
						content:'<iframe id="uslf" style=width:100%;height:100%; src=http://localhost:8080/bkt/admin/userlist.jsp frameborder=0></iframe>',
						closable:true
					});
    			}
    			if(node.text == "删除用户"){
    				$("#tab").tabs('add',{
						title:node.text,
						content:'<iframe id="duf" style=width:100%;height:100%; src=http://localhost:8080/bkt/admin/deleteuser.jsp frameborder=0></iframe>',
						closable:true
					});
    			}
    			if(node.text == "发布航班"){
    				$("#tab").tabs('add',{
						title:node.text,
						content:'<iframe id="pff" style=width:100%;height:100%; src=http://localhost:8080/bkt/admin/publishflight.jsp frameborder=0></iframe>',
						closable:true
					});
    			}
    			if(node.text == "取消航班"){
    				$("#tab").tabs('add',{
						title:node.text,
						content:'<iframe id="rff" style=width:100%;height:100%; src=http://localhost:8080/bkt/admin/removeflight.jsp frameborder=0></iframe>',
						closable:true
					});
    			}
    			if(node.text == "更新航班"){
    				$("#tab").tabs('add',{
						title:node.text,
						content:'<iframe id="uff" style=width:100%;height:100%; src=http://localhost:8080/bkt/admin/updateflight.jsp frameborder=0></iframe>',
						closable:true
					});
    			}
    			if(node.text == "增加管理员"){
    				$("#tab").tabs('add',{
						title:node.text,
						content:'<iframe id="adf" style=width:100%;height:100%; src=http://localhost:8080/bkt/admin/addadmin.jsp frameborder=0></iframe>',
						closable:true
					});
    			}
			}
    	});
    </script>
  </body>
</html>
