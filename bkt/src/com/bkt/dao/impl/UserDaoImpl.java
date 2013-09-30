package com.bkt.dao.impl;

import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.bkt.bean.User;
import com.bkt.dao.UserDao;
import com.bkt.util.HibernateUtils;

public class UserDaoImpl extends HibernateDaoSupport implements UserDao {
	
	public long getCount(String name)
	{
		//获取session对象
		Session s = HibernateUtils.getSession();
		String hql = "select count(*) from User user where name like ?";
		Query query = s.createQuery(hql);
		query.setString(0, "%"+name+"%");
		long c = (Long)query.uniqueResult();
		s.close();
		return c;
	}

	public void delete(User user) {
		this.getHibernateTemplate().delete(user);
		
	}

	@SuppressWarnings("unchecked")
	public void deleteById(Integer id) {
		String hql="from User user where id="+id;
		List<User> users = (List<User>)this.getHibernateTemplate().find(hql);
		this.getHibernateTemplate().delete(users.get(0));
	}

	public User getById(Integer id) {
		//String hql="from User user where id="+id;
		User user = (User)this.getHibernateTemplate().get(User.class, id);
		return user;
	}

	public void save(User user) {
		this.getHibernateTemplate().save(user);
		
	}
	
	public void update(User user){
		this.getHibernateTemplate().update(user);
	}
	
	@SuppressWarnings("unchecked")
	public List<User> findAlL(){
		String hql = "from User user order by user.id";
		return (List<User>) this.getHibernateTemplate().find(hql);
	}

	@SuppressWarnings("unchecked")
	public List<User> queryByAddress(String address) {
		String hql = "from User user where address = "+address;
		return (List<User>)this.getHibernateTemplate().find(hql);
	}

	@SuppressWarnings("unchecked")
	public List<User> queryByCardId(String cardId) {
		String hql = "from User user where cardid = "+cardId;
		return (List<User>)this.getHibernateTemplate().find(hql);
	}

	@SuppressWarnings("unchecked")
	public List<User> queryByNameandPassword(String name, String password) {
		String hql = "from User user where name=? and password =?";
		return (List<User>)this.getHibernateTemplate().find(hql);
	}

	@SuppressWarnings("unchecked")
	public User queryByName(String name) {
		String hql = "from User user where user.name='"+name+"'";
		List u = getHibernateTemplate().find(hql);
		if(u != null && u.size()>=1)
		{
			return (User)u.get(0);
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	public List<User> query(String name, String cardid) {
		String hql ="from User user where name ='"+name+"' or cardid = '"+cardid+"' ";
		List<User> users = this.getHibernateTemplate().find(hql);
		return users;
	}


}
