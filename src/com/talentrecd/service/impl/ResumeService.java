package com.talentrecd.service.impl;

import java.awt.geom.RectangularShape;

import java.util.List;
import java.util.concurrent.RecursiveAction;

import javax.annotation.Resource;

import org.aspectj.apache.bcel.generic.RET;
import org.springframework.stereotype.Service;

import com.talentrecd.dao.IResumeDao;
import com.talentrecd.model.Employee;
import com.talentrecd.model.Recruit;
import com.talentrecd.model.Resume;
import com.talentrecd.service.IRecruitService;
import com.talentrecd.service.IResumeService;
import com.talentrecd.util.Pagination;

@Service("resumeService")
public class ResumeService implements IResumeService {
	private IResumeDao resumeDao;
	
	/**
	 * 删除简历
	 */
	@Override
	public void delete(Resume resume){
		resumeDao.delete(resume.getId());
	}
	
	/**
	 * 添加
	 */
	@Override
	public void addResume(Resume resume){
		resumeDao.add(resume);
	}
	
	/**
	 * 更新
	 */
	@Override
	public void update(Resume resume) {
		if(resume!=null){
			resumeDao.update(resume);
		}
	}
	
	
	@Override
	public Resume load(int id) {
		return resumeDao.load(id);
	}

	
	public IResumeDao getResumeDao() {
		return resumeDao;
	}
	@Resource
	public void setResumeDao(IResumeDao resumeDao) {
		this.resumeDao = resumeDao;
	}
	
	//查看
	@Override
	public Pagination<Resume> resumeByPage(int pageNo,String text,int emp_id) {
		text="%"+text+"%";
		String sql="select r from Resume r where (r.name like ? or r.sex like ? or r.major like ? or r.degree like ?) and r.employee.id=? order by id desc";
		
		return resumeDao.resumeList(sql,pageNo,new Object[]{text,text,text,text,emp_id});
	}
	
	//查看个人简历库xjh
	@Override
	public List<Resume> resumes(int emp_id) {
		System.out.println(emp_id);
		String hql = "select res from Resume res where res.employee.id=? ";
		return resumeDao.list(hql,emp_id);
	}

	@Override
	public List<Resume> adminResumes() {
		
		String hql = "select res from Resume res order by id desc";
		return resumeDao.list(hql);
	}

	@Override
	public Resume resumeOne(int id) {
		String hql="select res from Resume res where res.id=?";
		System.out.println(id);
		return (Resume)resumeDao.queryByHql(hql, id);
	}

}
