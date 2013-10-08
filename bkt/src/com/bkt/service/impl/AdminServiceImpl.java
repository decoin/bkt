package com.bkt.service.impl;

import com.bkt.bean.Admin;
import com.bkt.dao.AdminDao;
import com.bkt.service.AdminService;

public class AdminServiceImpl implements AdminService{
	private AdminDao admindao;
	

	public AdminDao getAdmindao() {
		return admindao;
	}


	public void setAdmindao(AdminDao admindao) {
		this.admindao = admindao;
	}


	public Admin queryByName(String name) {
		return this.admindao.queryByName(name);
	}
	
	public void save(Admin admin){
		this.admindao.save(admin);
	}
}
