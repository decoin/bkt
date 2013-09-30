package com.bkt.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.bkt.bean.Flight;
import com.bkt.dao.FlightDao;
import com.bkt.util.Pagination;
import com.bkt.util.HibernateUtils;

public class FlightDaoImpl extends HibernateDaoSupport implements FlightDao{

	public void delete(Flight flight) {
		this.getHibernateTemplate().delete(flight);
		
	}

	@SuppressWarnings("unchecked")
	public void deleteById(Integer id) {
		String hql= "from Flight flight where flight_id = "+id;
		List<Flight> flights = (List<Flight>)this.getHibernateTemplate().find(hql);
		this.getHibernateTemplate().delete(flights.get(0));
		
	}
	
	@SuppressWarnings("unchecked")
	public Flight getById(Integer id) {
		String hql = "from Flight flight where flight_id = '"+id+"'";
		List<Flight> list= this.getHibernateTemplate().find(hql);
		 if(list.size()!=0)
		 {
			 Flight flight = list.get(0);
			 return flight;
		 }
		 return null;
		
	}

	@SuppressWarnings("unchecked")
	public List<Flight> queryByAddress(String saddress, String laddress) {
		String hql = "from Flight flight where startaddress='+saddress' and lastaddress='+laddress'";
		List<Flight> flights = (List<Flight>)this.getHibernateTemplate().find(hql);
		return flights;
	}

	public void save(Flight flight) {
		this.getHibernateTemplate().save(flight);
		
	}

	@SuppressWarnings("unchecked")
	public List<Flight> findAll() {
		String hql = "from Flight flight order by flight.flight_id";
		return this.getHibernateTemplate().find(hql);
	}
	
	public List<Flight> findAll(Pagination pagination){
		Session s = HibernateUtils.getSession();
		String hql = "from Flight flight order by flight.flight_id";
		Query query = s.createQuery(hql);
		//设定第一条数据及最大记录数
		query.setFirstResult(pagination.getStart()).setMaxResults(pagination.getSize());
		//返回flight对象列表
		List<Flight> list = query.list();
		//关闭session对象
		s.close();
		return list;
	}
	
	public void update(Flight flight)
	{
		this.getHibernateTemplate().update(flight);
	}
	
//	@SuppressWarnings("unchecked")
//	public List<Flight> query(String no, String starta, String lasta,
//			String date) {
//		String hql =
//			"from Flight flight where flightno = '"+no+"' or startAddress ='"+starta+"' or lastAddress='"+lasta+"'or starttime='"+date+"'";
//		System.out.println(hql);
//		List<Flight> flights = (List<Flight>)this.getHibernateTemplate().find(hql);
//		return flights;
//		
//	}
	
	//多条件模糊查询
	@SuppressWarnings("unchecked")
	public List<Flight> query(String no, String starta, String lasta,String date){
		String hql = "from Flight flight where 1=1"+" ";
		if(!("".equals(no))){
			hql+="and flightno = '"+no+"'"+" ";
		}
		if(!("".equals(starta))){
			hql+="and startAddress ='"+starta+"'"+" ";
		}
		if(!("".equals(lasta))){
			hql+="and lastAddress ='"+lasta+"'"+" ";
		}
		if(!("".equals(date))){
			hql+="and starttime like "+"'%"+date+"%'"+" ";
		}
		List<Flight> flights = (List<Flight>)this.getHibernateTemplate().find(hql);
		return flights;
	}
	
	//分页模糊查询
	public List<Flight> query(String no,String starta,String lasta,String date,Pagination pagination){
		String hql = "from Flight flight where 1=1"+" ";
		if(!("".equals(no))){
			hql+="and flightno = '"+no+"'"+" ";
		}
		if(!("".equals(starta))){
			hql+="and startAddress ='"+starta+"'"+" ";
		}
		if(!("".equals(lasta))){
			hql+="and lastAddress ='"+lasta+"'"+" ";
		}
		if(!("".equals(date))){
			hql+="and starttime like "+"'%"+date+"%'"+" ";
		}
		Session s = HibernateUtils.getSession();
		Query query = s.createQuery(hql);
		query.setFirstResult(pagination.getStart()).setMaxResults(pagination.getSize());
		List<Flight> flights = query.list();
		s.close();
		return flights;
	}
	
	@SuppressWarnings("unchecked")
	public Flight getByflightno(String flightno) {
		String hql = "from Flight flight where flightno = '"+flightno+"'";
		List<Flight> list= this.getHibernateTemplate().find(hql);
		 if(list.size()!=0)
		 {
			 Flight flight = list.get(0);
			 return flight;
		 }
		 return null;
		
	}

}
