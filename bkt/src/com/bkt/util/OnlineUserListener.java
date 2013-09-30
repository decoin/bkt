package com.bkt.util;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

public class OnlineUserListener implements HttpSessionBindingListener {
	String username;
	public OnlineUserListener(){}
	public OnlineUserListener(String username){
		this.username = username;
	}
	public void valueBound(HttpSessionBindingEvent event){
		HttpSession session = event.getSession();
		ServletContext application = session.getServletContext();
		List onlineUserList = (List)application.getAttribute("onlineUserList");
		if(onlineUserList == null){
			onlineUserList = new ArrayList();
			application.setAttribute("onlineUserList", onlineUserList);
		}
		onlineUserList.add(this.username);
	}
	public void valueUnbound(HttpSessionBindingEvent event){
		HttpSession session = event.getSession();
		ServletContext application = session.getServletContext();
		List onlineUserList = (List)application.getAttribute("onlineUserList");
		onlineUserList.remove(this.username);
	}
}
