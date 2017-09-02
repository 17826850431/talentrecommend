package com.talentrecd.service;

import java.util.List;

import com.talentrecd.model.Employee;
import com.talentrecd.util.Pagination;

public interface IEmployeeService {
	public Employee login(String username,String password);
	
	public List<Employee> employees();
	
	public void addEmployee(Employee employee);
	public void updateEmployee(Employee employee) ;
	public void deleteEmployee(int id);
	Pagination<Employee> employeesByPage(int pageNo,String text);
	public List<Employee> selectByUsername(String username);
	public void resetEmpPassword(int id);
}
