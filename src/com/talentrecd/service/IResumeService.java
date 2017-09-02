package com.talentrecd.service;


import java.util.List;

import com.talentrecd.model.Employee;
import com.talentrecd.model.Resume;
import com.talentrecd.util.Pagination;


public interface IResumeService {
	
	
	public List<Resume> resumes(int emp_id);//xjh
	
	public void addResume(Resume resume);//xjh
	
	public void update(Resume resume);//xjh
	
	public void delete(Resume resume);//xjh
	
	public Resume load(int id);//xjh
	
	public Resume resumeOne(int id);//xjh
	
	public List<Resume> adminResumes();

	public Pagination<Resume> resumeByPage(int pageNo, String text, int emp_id);

}
