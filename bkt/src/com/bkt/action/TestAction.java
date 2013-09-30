package com.bkt.action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


import com.bkt.bean.User;

public class TestAction extends ActionSupport {
	
	
	public String userList(){
		List<User> list = new ArrayList();
		Map<String,Object> result = new HashMap<String,Object>();
		int total = 0;
		User us1 = new User();
		User us2 = new User();
		us1.setName("习近平");
		us1.setCardId("000001");
		us1.setSex("男");
		us2.setName("胡锦涛");
		us2.setCardId("000002");
		us2.setSex("男");
		list.add(us1);
		list.add(us2);
		total = list.size();
		result.put("total", total);
		result.put("rows", list);
		JSONObject json = JSONObject.fromObject(result);
		
		HttpServletResponse response = ServletActionContext.getResponse();
		try {
			ServletActionContext.getRequest().setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		response.setContentType("text/html;charset=utf-8");
		try {
			response.getWriter().write(json.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}
}
