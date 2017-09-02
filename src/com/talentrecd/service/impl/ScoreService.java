package com.talentrecd.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.talentrecd.dao.IScoreDao;
import com.talentrecd.model.Score;
import com.talentrecd.service.IScoreService;

@Service("scoreService")
public class ScoreService implements IScoreService{

	
	@Autowired
	IScoreDao scoreDao;
	@Override
	public List<Score> getScorelist(int emp_id) {
		String hql="select score from Score score where score.employee.id=?";   
	   return scoreDao.list(hql, emp_id);
	}
     
}
