package com.talentrecd.dao;

import com.talentrecd.model.Resume;
import com.talentrecd.util.Pagination;


public interface IResumeDao extends IBaseDao<Resume> {
	public Pagination<Resume> resumeList(String hql,int pageNo, Object[] args);
}
