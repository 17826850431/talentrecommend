package com.talentrecd.service;

import com.talentrecd.model.Admin;

public interface IAdminService {
	public Admin login(String adminname, String password);
}
