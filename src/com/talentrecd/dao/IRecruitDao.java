package com.talentrecd.dao;

import com.talentrecd.model.Recruit;
import com.talentrecd.util.Pagination;


public interface IRecruitDao extends IBaseDao<Recruit> {
	
	public Pagination<Recruit> recruitByPage(String hql,int pageNo);
	
	public Pagination<Recruit> recruitList(String hql,int pageNo, Object[] args);

	public Pagination<Object[]> recruitSql(String sql,int pageNo,Object[] args);

}
