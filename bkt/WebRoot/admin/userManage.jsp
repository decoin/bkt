<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户管理</title>
	<link rel="stylesheet" type="text/css"
			href="/bkt/jquery-easyui-1.3.2/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css"
			href="/bkt/jquery-easyui-1.3.2/themes/icon.css">
	<script type="text/javascript"
			src="/bkt/jquery-easyui-1.3.2/jquery-1.8.0.min.js">
	</script>
	<script type="text/javascript"
			src="/bkt/jquery-easyui-1.3.2/jquery.easyui.min.js">
	</script>
	
	<script src="/bkt/js/laster.js"></script>
	
	<script type="text/javascript"> 
		//新增用户 
		function addrow(){
			showWindow({  
            title:'增加用户信息',  
            href:'user/popWindow',  
            width:300,  
            height:250,  
            onLoad: function(){  
                $('#userForm').form('clear');  
            }  
              
        	}); 
		}
		function updaterow(){
			var rows = $('#userTable').datagrid('getSelections');  
        //<span style="color: #ff0000;">这里有一个jquery easyui datagrid的一个小bug，必须把主键单独列出来，要不然不能多选</span>  
  
  
        if(rows.length==0){  
            $.messager.alert('提示',"请选择你要更新的用户",'info');  
            return;  
        }  
        if(rows.length > 1){  
            $.messager.alert('提示',"只能选择一位用户进行更新",'info');  
            return;  
        }  
        showWindow({  
            title:'更新用户信息',  
            href:'user/popWindow',  
            width:300,  
            height:250,  
            onLoad: function(){  
            //自动将数据填充到表单中，无需再查询数据库
 
            //如果用的是struts2，它的表单元素的名称都是user.id这样的，那load的时候不能加.user要.form('load', rows[0]);
  
            //而spring mvc中表单元素的名称不带对象前缀，直拉就是id，所以这里load的时候是：.form('load', rows[0].user)  
  
  
                $("#userForm").form('load', rows[0].user);  
            }  
        	}); 
		}
		//删除数据 
		function deleterow(){
			$.messager.confirm('提示','确定要删除吗?',function(result){  
            if (result){  
                var rows = $('#userTable').datagrid('getSelections');  
                var ps = "";  
                $.each(rows,function(i,n){  
                    if(i==0)   
                        ps += "?uid="+n.id;  
                    else  
                        ps += "&uid="+n.id;  
                });  
                $.post('user/delete'+ps,function(data){  
                    $('#userTable').datagrid('reload');   
                    $.messager.alert('提示',data.mes,'info');  
                });  
            }  
        });
		}
		//表格查询  
    	function searchUser(){  
        var params = $('#userTable').datagrid('options').queryParams; //先取得 datagrid 的查询参数  
        var fields =$('#queryForm').serializeArray(); //自动序列化表单元素为JSON对象  
        $.each( fields, function(i, field){  
            params[field.name] = field.value; //设置查询参数  
        });   
        $('#userTable').datagrid('reload'); //设置好查询参数 reload 一下就可以了  
    	}  
    	//清空查询条件  
    	function clearForm(){  
        $('#queryForm').form('clear');  
        searchUser();  
    	}
	</script>
  </head>
  
  <body>
  	<form id="queryForm" style="margin:10;text-align: center;">  
        <table width="100%">  
            <tr>  
            <td>用户名：<input name="name" style="width: 200"></td>  
            <td>年龄：<input class="easyui-numberspinner" name="age" min="1" max="120" increment="1" style="width:200px;"></input></td>  
            <td align="center"><a href="#" onclick="clearForm();" class="easyui-linkbutton" iconCls="icon-cancel">清空</a></td>  
            </tr>  
            <tr>  
            <td>性别：<input name="sex" style="width: 200" class="Wdate" onClick="WdatePicker()"></td>  
            <td align="center"><a href="#" onclick="searchUser();" class="easyui-linkbutton" iconCls="icon-search">查询</a></td>  
            </tr>  
        </table>  
    </form>
    <div style="padding:10" id="tabdiv">
    	<table id="userTable" class="easyui-datagrid" data-options="title:'用户列表',method:'post',iconCls:'icon-edit',height:380,
    	striped:true,collapsible:true,sortName:'UserId',sortOrder:'desc',idField:'UserId',queryParams:{},pagination:true,
    	url:'test.action',fitColumns:true,singleSelect:false,rownumbers:true" toolbar="#tb">
    		<thead>   
        		<tr>
        		   	<th data-options="field:'ck',checkbox:true,width:2"></th>
            		<th data-options="field:'name',width:20">姓名</th>   
            		<th data-options="field:'address',width:20">地址</th>   
            		<th data-options="field:'sex',width:20,align:'right'">性别</th>   
        		</tr>   
    		</thead>
    		<tbody>
	    	</tbody>
	    </table>
	    <div id="tb">
	    	<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addrow()">新增</a>    
    		<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="updaterow()">更新</a>    
    		<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="deleterow()">删除</a>
	    </div>
    </div>
  </body>
</html>
