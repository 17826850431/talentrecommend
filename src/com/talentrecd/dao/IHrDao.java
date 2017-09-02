package com.talentrecd.dao;

import com.talentrecd.model.Hr;
import com.talentrecd.util.Pagination;

public interface IHrDao extends IBaseDao<Hr>{
	public Pagination<Hr> getHrlistByPage(String hql,int pageNo,Object[] args);
}
