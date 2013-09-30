package com.bkt.service;

import java.util.List;

import com.bkt.bean.User;

public interface UserService {
	
	//保存user,如果有主键，更新数据；如果没有主键，添加数据
	public void save(User user);
	
	//删除一个user实例
	public void delete(User user);
	
	//根据主键删除一个user实例
	public void deleteById(Integer id);
	
	//根据主键得到usesr实例
	public User getById(Integer id);
	
	public void update(User user);
	
	public List<User> findAll();
	
	public List<User> queryByAddress(String address);
	
	public List<User> queryByCardId(String cardId);
	
	public List<User> queryByNameandPassword(String name,String password);
	
	public User queryByName(String name);
	
	public List<User> query(String name,String cardid);

	public User modifyPhoto(User curUser,User newUser);

}
