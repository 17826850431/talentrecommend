package com.talentrecd.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.talentrecd.dao.IJobDao;
import com.talentrecd.model.Job;
import com.talentrecd.service.IJobService;

@Service("jobService")
public class JobService implements IJobService{

	@Autowired
	private IJobDao jobDao;

	@Override
	public List<Job> jobList() {
		String hql="select j from Job j order by j.id";
		List<Job> list=jobDao.list(hql);
		return list;
	}

	@Override
	public Job load(int id) {
		return jobDao.load(id);
	}

	@Override
	public Job loadByName(String name) {
		String hql="select j from Job j where j.name=?";
		return (Job) jobDao.queryByHql(hql, name);
	}

}
