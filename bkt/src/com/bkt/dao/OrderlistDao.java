package com.bkt.dao;

import java.util.List;

import com.bkt.bean.Orderlist;

public interface OrderlistDao {
	
	public void save(Orderlist orderlist);

	public Orderlist queryByflightno(String flightno);
	
	public List<Orderlist> findAll();
	
	public void update(Orderlist orderlist);
	
	public Orderlist queryById(int id);
	
	public void delete(Orderlist orderlist);
	
	public List<Orderlist> queryByName(String name);
	
	public Orderlist queryByOrderno(String orderno);
}
