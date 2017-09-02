package com.talentrecd.dao;

import com.talentrecd.model.Employee;

import com.talentrecd.util.Pagination;

public interface IEmployeeDao extends IBaseDao<Employee>{
	Pagination<Employee> employeeDao(String sql,int pageNo,Object[] args);
	Employee selectByUsername(String sql);
}
