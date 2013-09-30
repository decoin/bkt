package com.bkt.util;

import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class UserLoginInterceptor extends AbstractInterceptor {

	@Override
	public void init(){
		super.init();
	}
	
	@Override
	public void destroy(){
		super.destroy();
	}
	
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		Map<String,Object> session = invocation.getInvocationContext().getSession();
		if(session.get("user") != null){
			return invocation.invoke();
		}else{
			return Action.LOGIN;
		}
	}
	
}
