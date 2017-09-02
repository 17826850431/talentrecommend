package com.talentrecd.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.talentrecd.dao.ITalentDao;
import com.talentrecd.model.Talent;
import com.talentrecd.service.ITalentService;
import com.talentrecd.util.Pagination;

@Service("talentService")
public class TalentService implements ITalentService{

	
	@Autowired
	ITalentDao talentDao;
	@Override
	public List<Talent> getTalentlist() {
		String hql="select tal from Talent tal";   
	   return (talentDao.list(hql));
	}
     
	@Override
	public Pagination<Talent> getTalentlist(int pageNo) {
		String hql="select tal from Talent tal";   
		   return (talentDao.getTalentlist(hql,pageNo));
	}
}
