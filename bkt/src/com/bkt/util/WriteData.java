package com.bkt.util;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

public class WriteData {
	public static void write(String msg){
		HttpServletResponse response = ServletActionContext.getResponse();
		try {
			ServletActionContext.getRequest().setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		response.setContentType("text/html;charset=utf-8");
		try {
			response.getWriter().write(msg);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
