package com.bkt.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import net.sf.json.JSON;
import net.sf.json.JSONObject;

import com.bkt.bean.Flight;
import com.bkt.service.FlightService;
import com.bkt.util.Pagination;
import com.bkt.util.WriteData;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @ClassName FlightAction
 * @Description TODO 航班业务逻辑处理
 * @author zyj jayzh1993@gmail.com
 * @date 2013-9-30
 */
public class FlightAction extends ActionSupport{

	private Flight flight;
	private FlightService flightservice;
	private int page;
	private int rows;
	
	
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
	
	
	/** 
	 * @Method: flightList 
	 * @Description: TODO 分页显示所有航班列表
	 * @param @return
	 * @param @throws Exception
	 * @return String
	 */
	public String flightList() throws Exception {
		List<Flight> list = new ArrayList();
		List<Flight> pageList = new ArrayList();
		Map<String,Object> result = new HashMap<String, Object>();
		int total = 0;
		//定义分页并注入传递的值
		Pagination p = new Pagination();
		p.setCurrentPage(page);
		p.setSize(rows);
		//根据分页获取航班记录
		pageList = this.flightservice.findAll(p);
		//记录条数
		list = this.flightservice.findAll();
		total = list.size();
		//通过result生成json对象
		result.put("total", total);
		result.put("rows", pageList);
		JSON json = JSONObject.fromObject(result);
		Map request = (Map)ActionContext.getContext().get("request");
		request.put("list", list);
		WriteData.write(json.toString());
		return null;
	}
	/** 
	 * @Method: queryFlight 
	 * @Description: TODO 分页模糊查询航班
	 * @param @return
	 * @return String
	 */
	public String queryFlight(){
		List<Flight> list = new ArrayList();
		List<Flight> pageList = new ArrayList();
		Map<String,Object> result = new HashMap<String, Object>();
		int total = 0;
		//获取date参数
		ActionContext ac = ActionContext.getContext();
		HttpServletRequest request = (HttpServletRequest)ac.get(ServletActionContext.HTTP_REQUEST);
		String date = request.getParameter("date");
		//获取总条数
		list = this.flightservice.query(flight.getFlightNo(), flight.getStartAddress(), flight.getLastAddress(), date);
		total = list.size();
		//根据分页获取航班记录
		if(list.size()<=rows){
			pageList = list;
		}else{
			pageList = list.subList((page-1)*rows, rows);
		}
		//根据查询记录生成json对象
		result.put("total", total);
		result.put("rows", pageList);
		JSON json = JSONObject.fromObject(result);
		WriteData.write(json.toString());
		return null;
	}
	/** 
	 * @Method: getDomestic 
	 * @Description: TODO 分页显示国内航班列表
	 * @param @return
	 * @return String
	 */
	public String getDomestic(){
		List<Flight> list = new ArrayList();
		List<Flight> pageList = new ArrayList();
		Map<String,Object> result = new HashMap<String, Object>();
		//获取总记录条数
		int total = 0;
		list = this.flightservice.findAll();
		for(java.util.Iterator<Flight> it = list.iterator();it.hasNext();){
			Flight f = it.next();
			if(f.getFlightNo().length() > 5){
				it.remove();
			}
		}
		total = list.size();
		//根据分页获取国内航班记录
		pageList = list.subList((page-1)*rows, rows);
		//生成json对象
		result.put("total", total);
		result.put("rows", pageList);
		JSON json = JSONObject.fromObject(result);
		WriteData.write(json.toString());
		return null;
	}
	/** 
	 * @Method: getForeign 
	 * @Description: TODO 分页显示国际航班列表
	 * @param @return
	 * @return String
	 */
	public String getForeign(){
		List<Flight> list = new ArrayList();
		List<Flight> pageList = new ArrayList();
		Map<String,Object> result = new HashMap<String, Object>();
		int total = 0;
		//获取国际航班列表记录条数
		list = this.flightservice.findAll();
		for(java.util.Iterator<Flight> it = list.iterator();it.hasNext();){
			Flight f = it.next();
			if(f.getFlightNo().length() < 6){
				it.remove();
			}
		}
		total = list.size();
		//获取当前页记录
		pageList = list.subList((page-1)*rows, rows);
		//生成json对象
		result.put("total", total);
		result.put("rows", pageList);
		JSON json = JSONObject.fromObject(result);
		WriteData.write(json.toString());
		return null;
	}
	
}
