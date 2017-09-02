package com.talentrecd.service;

import java.util.List;

import com.talentrecd.model.Score;


public interface IScoreService {
	
	//积分查询xjh
  public List<Score> getScorelist(int emp_id);
  
}
