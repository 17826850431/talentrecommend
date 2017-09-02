package com.talentrecd.dao;

import com.talentrecd.model.Recommend;
import com.talentrecd.util.Pagination;




public interface IRecommendDao extends IBaseDao<Recommend> {
	public Pagination<Recommend> recommendList(String hql,int pageNo,Object[] args);
	
	
}
