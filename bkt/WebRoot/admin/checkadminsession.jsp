<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if(session.getAttribute("name")==null){
	//管理员没有登陆
	response.sendRedirect("/bkt/login.jsp");
}
%>

