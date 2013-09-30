package com.bkt.bean;


public class Orders {
	
	public Integer orders_id;	
	private String orderNo;
	private String orderdate;
	private float total;
	private User user;
	
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
	public Integer getOrders_id() {
		return orders_id;
	}
	public void setOrders_id(Integer ordersId) {
		orders_id = ordersId;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public float getTotal() {
		return total;
	}
	public void setTotal(float total) {
		this.total = total;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	

}
