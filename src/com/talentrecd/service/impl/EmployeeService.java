package com.talentrecd.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.talentrecd.dao.IEmployeeDao;
import com.talentrecd.model.Employee;
import com.talentrecd.model.Hr;
import com.talentrecd.service.IEmployeeService;
import com.talentrecd.util.MD5Util;
import com.talentrecd.util.Pagination;

@Service("employeeService")
public class EmployeeService implements IEmployeeService{

	@Autowired
	private IEmployeeDao employeeDao;

	
	@Override
	public List<Employee> employees()  {
		String hql="select employee from Employee employee order by id desc";
		return employeeDao.list(hql);
	}	

	@Override
	public Employee login(String username, String password) {
		password=MD5Util.MD5Encode(password, null);
		String hql="select emp from Employee emp where username=? and password=?";
		Employee employee=(Employee) employeeDao.queryByHql(hql, new Object[]{username,password});
		if(employee!=null)
		{
		if(employee.getStatus()==1)
		{
			return employee;
		}
		else
		{
			employee.setStatus(1);
			employeeDao.update(employee);
			return employee;
		}
		}
		else
			return null;
		
	}

	@Override
	public void addEmployee(Employee employee) {
		try {
			employeeDao.add(employee);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@Override
	public void updateEmployee(Employee employee) {
		try {
			employeeDao.update(employee);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@Override
	public void deleteEmployee(int id) {
		
		try {
			employeeDao.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public Pagination<Employee> employeesByPage(int pageNo,String text) {
		 text="%"+text+"%";
		String sql="select employee from Employee employee where employee.realname like ? or employee.username like ? or employee.department like ? order by id desc";
		return employeeDao.employeeDao(sql,pageNo,new Object[]{text,text,text});
	}

	@Override
	public List<Employee> selectByUsername(String username) {
		String hql="select employee from Employee employee where username=? ";
		List<Employee> employees=employeeDao.list(hql,new Object[]{username});
		return employees;
	}
	@Override
	public void resetEmpPassword(int id) {
		String password=MD5Util.MD5Encode("123456", null);
		String hql="update Employee set password=? where id=?";
		employeeDao.executeByHql(hql,new Object[]{password,id});
	}
	
	
}
