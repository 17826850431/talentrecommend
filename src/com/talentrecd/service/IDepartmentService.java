package com.talentrecd.service;

import java.util.List;

import com.talentrecd.model.Department;

public interface IDepartmentService {
	
	public Department load(int id);
	
	public List<Department> depList();
	
	public Department loadByName(String name);

}
