package com.bkt.service;

import com.bkt.bean.Admin;

public interface AdminService {
	
	public Admin queryByName(String name);
	
	public void save(Admin admin);
}
