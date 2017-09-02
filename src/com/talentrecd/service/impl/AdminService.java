package com.talentrecd.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.talentrecd.dao.IAdminDao;
import com.talentrecd.model.Admin;
import com.talentrecd.service.IAdminService;
import com.talentrecd.util.MD5Util;

@Service("adminmentService")
public class AdminService implements IAdminService{
	
	@Autowired 
	private IAdminDao adminDao;
	
	@Override
	public Admin login(String adminname, String password) {
		password=MD5Util.MD5Encode(password, null);
		String hql="select emp from Admin emp where adminname=? and password=?";
		Admin admin=(Admin) adminDao.queryByHql(hql, new Object[]{adminname,password});
		return admin;
	}

}
