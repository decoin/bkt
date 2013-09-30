package com.bkt.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSON;
import net.sf.json.JSONObject;

import com.bkt.bean.Admin;
import com.bkt.bean.Flight;
import com.bkt.bean.User;
import com.bkt.service.AdminService;
import com.bkt.service.FlightService;
import com.bkt.service.UserService;
import com.bkt.util.WriteData;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @ClassName AdminAction
 * @Description TODO 管理员业务逻辑处理
 * @author zyj jayzh1993@gmail.com
 * @date 2013-9-30
 */
public class AdminAction extends ActionSupport{
	private Admin admin;
	private Flight flight;
	private AdminService adminservice;
	private UserService userservice;
	private FlightService flightservice;
	private String name;
	private String password;
	private int page;
	private int rows;
	private static int count = 0;
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	
	public Flight getFlight() {
		return flight;
	}
	public void setFlight(Flight flight) {
		this.flight = flight;
	}
	public FlightService getFlightservice() {
		return flightservice;
	}
	public void setFlightservice(FlightService flightservice) {
		this.flightservice = flightservice;
	}
	public UserService getUserservice() {
		return userservice;
	}
	public void setUserservice(UserService userservice) {
		this.userservice = userservice;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	public AdminService getAdminservice() {
		return adminservice;
	}
	public void setAdminservice(AdminService adminservice) {
		this.adminservice = adminservice;
	}
	
	/** 
	 * @Method: loginAdmin 
	 * @Description: TODO 管理员登陆
	 * @param @return
	 * @return String
	 */
	public String loginAdmin(){
		Admin ad = this.adminservice.queryByName(admin.getName());
		if(ad == null){
			WriteData.write("notexist");
		}else{
			if(ad.getPassword().equals(admin.getPassword())){
				Map request = ActionContext.getContext().getSession();
				request.put("admin", ad);
				request.put("name", admin.getName());
				count++;
				request.put("count", count);
				WriteData.write("success");
			}else{
				WriteData.write("fail");
			}
		}
		return null;
	}
	/** 
	 * @Method: logoutAdmin 
	 * @Description: TODO 管理员注销
	 * @param @return
	 * @return String
	 */
	public String logoutAdmin(){
		Map session = ActionContext.getContext().getSession();
		session.clear();
		count--;
		session.put("count", count);
		WriteData.write("成功退出");
		return null;
	}
	/** 
	 * @Method: userList 
	 * @Description: TODO 管理员分页查询所有用户
	 * @param @return
	 * @return String
	 */
	public String userList(){
		List<User> list = new ArrayList();
		List<User> pageList = new ArrayList();
		Map<String,Object> result = new HashMap<String, Object>();
		int total = 0;
		list = this.userservice.findAll();
		//总记录条数
		total = list.size();
		//当前页记录
		if(list.size()<=rows){
			pageList = list;
		}else{
			pageList = list.subList((page-1)*rows, rows);
		}
		//生成json对象
		result.put("total", total);
		result.put("rows", pageList);
		JSON json = JSONObject.fromObject(result);
		WriteData.write(json.toString());
		return null;
	}
	/** 
	 * @Method: deleteUser 
	 * @Description: TODO 管理员删除用户
	 * @param @return
	 * @return String
	 */
	public String deleteUser(){
		User us = this.userservice.queryByName(name);
		this.userservice.delete(us);
		return null;
	}
	/** 
	 * @Method: publishFlight 
	 * @Description: TODO 管理员发布航班
	 * @param @return
	 * @return String
	 */
	public String publishFlight(){
		this.flight.setRemains(flight.getNumber());
		this.flightservice.save(flight);
		WriteData.write("航班发布成功!");
		return null;
	}
}
