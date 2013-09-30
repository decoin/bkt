package com.bkt.bean;

public class Orderlist {
	
	private Integer orderlist_id;
	private String orderno;
	private String flightno;
	private String name;
	private int num;
	private Float total;
	private String orderdate;
	public Integer getOrderlist_id() {
		return orderlist_id;
	}
	public void setOrderlist_id(Integer orderlistId) {
		orderlist_id = orderlistId;
	}
	public String getOrderno() {
		return orderno;
	}
	public void setOrderno(String orderno) {
		this.orderno = orderno;
	}
	public String getFlightno() {
		return flightno;
	}
	public void setFlightno(String flightno) {
		this.flightno = flightno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public Float getTotal() {
		return total;
	}
	public void setTotal(Float total) {
		this.total = total;
	}
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
	
}
