package com.bkt.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.bkt.bean.Admin;
import com.bkt.bean.User;
import com.bkt.dao.AdminDao;

public class AdminDaoImpl extends HibernateDaoSupport implements AdminDao{

	@SuppressWarnings("unchecked")
	public Admin queryByName(String name) {
		String hql = "from Admin admin where name='"+name+"'";
		List a = getHibernateTemplate().find(hql);
		if(a != null && a.size()>=1)
		{
			return (Admin)a.get(0);
		}
		return null;
	}
	
	public void save(Admin admin){
		this.getHibernateTemplate().save(admin);
	}

}
