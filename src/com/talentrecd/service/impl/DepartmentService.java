package com.talentrecd.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.talentrecd.dao.IDepartmentDao;
import com.talentrecd.dao.IJobDao;
import com.talentrecd.model.Department;
import com.talentrecd.model.Job;
import com.talentrecd.service.IDepartmentService;
import com.talentrecd.service.IJobService;

@Service("departmentService")
public class DepartmentService implements IDepartmentService{

	@Autowired
	private IDepartmentDao departmentDao;

	@Override
	public List<Department> depList() {
		String hql="select dep from Department dep order by dep.id";
		List<Department> list=departmentDao.list(hql);
		return list;
	}

	@Override
	public Department load(int id) {
		return departmentDao.load(id);
	}

	@Override
	public Department loadByName(String name) {
		String hql="select dep from Department dep where dep.name=?";
		return (Department) departmentDao.queryByHql(hql, name);
	}

}
