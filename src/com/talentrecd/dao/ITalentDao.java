package com.talentrecd.dao;

import com.talentrecd.model.Talent;
import com.talentrecd.util.Pagination;

public interface ITalentDao extends IBaseDao<Talent> {
	Pagination<Talent> getTalentlist(String hql,int pageNo);
}
