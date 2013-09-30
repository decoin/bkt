package com.bkt.dao;

import java.util.List;

import com.bkt.bean.Flight;
import com.bkt.util.Pagination;

public interface FlightDao {
	
	public void save(Flight flight);
	
	public void delete(Flight flight);
	
	public void deleteById(Integer id);
	
	public Flight getById(Integer id);
	
	public List<Flight> queryByAddress(String saddress,String laddress);
	
	public List<Flight> findAll();
	
	//分页查询所有航班
	public List<Flight> findAll(Pagination pagination);
	
	public void update(Flight flight);
	
	//根据多个条件模糊查询航班
	public List<Flight> query(String no,String starta,String lasta,String date);
	
	//分页模糊查询航班
	public List<Flight> query(String no,String starta,String lasta,String date,Pagination pagination);
	
	public Flight getByflightno(String flightno);
}
