package com.bkt.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.bkt.bean.Flight;
import com.bkt.bean.Orderlist;
import com.bkt.bean.User;
import com.bkt.service.FlightService;
import com.bkt.service.OrderlistService;
import com.bkt.util.CharacterUtils;
import com.bkt.util.WriteData;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @ClassName OrderlistAction
 * @Description TODO 订单业务逻辑处理
 * @author zyj jayzh1993@gmail.com
 * @date 2013-9-30
 */
public class OrderlistAction extends ActionSupport{
	private Orderlist orderlist;
	private OrderlistService orderlistservice;
	private FlightService flightservice;
	private User user;
	private Flight flight;
	private String orderno;
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
	public String getOrderno() {
		return orderno;
	}
	public void setOrderno(String orderno) {
		this.orderno = orderno;
	}
	public FlightService getFlightservice() {
		return flightservice;
	}
	public void setFlightservice(FlightService flightservice) {
		this.flightservice = flightservice;
	}
	public Orderlist getOrderlist() {
		return orderlist;
	}
	public void setOrderlist(Orderlist orderlist) {
		this.orderlist = orderlist;
	}
	public OrderlistService getOrderlistservice() {
		return orderlistservice;
	}
	public void setOrderlistservice(OrderlistService orderlistservice) {
		this.orderlistservice = orderlistservice;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Flight getFlight() {
		return flight;
	}
	public void setFlight(Flight flight) {
		this.flight = flight;
	}
	
	/** 
	 * @Method: buyTickets 
	 * @Description: TODO 用户购票
	 * @param @return
	 * @return String
	 */
	public String buyTickets(){
		//set订单号
		CharacterUtils characterutils = new CharacterUtils();
		String chars = characterutils.getRandomString(10);
		orderlist.setOrderno(chars);
		//set总金额
		flight = this.flightservice.getByflightno(orderlist.getFlightno());
		Float price = flight.getDollars();
		Float total = price * orderlist.getNum();
		orderlist.setTotal(total);
		//set订单日期
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy kk:mm:ss");
		String date = sdf.format(now);
		orderlist.setOrderdate(date);
		//余票更新
		int remain = flight.getRemains();
		remain = remain - orderlist.getNum();
		flight.setRemains(remain);
		this.flightservice.update(flight);
		//存入数据库
		this.orderlistservice.save(orderlist);
		WriteData.write("购买成功");
		return null;
	}
	/** 
	 * @Method: showOrderlist 
	 * @Description: TODO 显示用户购买记录
	 * @param @return
	 * @return String
	 */
	public String showOrderlist(){
		List<Orderlist> list = new ArrayList();
		List<Orderlist> pageList = new ArrayList();
		Map<String,Object> result = new HashMap<String, Object>();
		int total = 0;
		Map request = ActionContext.getContext().getSession();
		String tname = (String)request.get("username");
		list = this.orderlistservice.queryByName(tname);
		//获取总记录条数
		total = list.size();
		//获取当前页记录
		if(list.size()<=rows){
			pageList = list;
		}else{
			pageList = list.subList((page-1)*rows, rows);
		}
		//生成json对象
		result.put("total", total);
		result.put("rows", pageList);
		JSONObject json = JSONObject.fromObject(result);
		WriteData.write(json.toString());
		return null;
	}
	/** 
	 * @Method: refundTicket 
	 * @Description: TODO 用户退票
	 * @param @return
	 * @return String
	 */
	public String refundTicket(){
		orderlist = this.orderlistservice.queryByOrderno(orderno);
		this.orderlistservice.delete(orderlist);
		WriteData.write("机票退订成功!");
		return null;
	}
}
