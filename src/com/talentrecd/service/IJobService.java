package com.talentrecd.service;

import java.util.List;

import com.talentrecd.model.Job;

public interface IJobService {
	
	public Job load(int id);
	
	public List<Job> jobList();
	
	public Job loadByName(String name);

}
