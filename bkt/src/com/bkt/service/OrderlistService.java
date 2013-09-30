package com.bkt.service;

import java.util.List;

import com.bkt.bean.Orderlist;

public interface OrderlistService {
	
	public void save(Orderlist orderlist);
	
	public Orderlist queryByflightno(String flightno);
	
	public List<Orderlist> findAll();
	
	public void update(Orderlist orderlist);
	
	public Orderlist queryById(int id);
	
	public void delete(Orderlist orderlist);

	public List<Orderlist> queryByName(String name);
	
	public Orderlist queryByOrderno(String orderno);
}
