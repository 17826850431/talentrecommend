package com.talentrecd.dao.impl;

import org.springframework.stereotype.Repository;

import com.talentrecd.dao.IScoreDao;
import com.talentrecd.model.Score;

@Repository("scoreDao")
@SuppressWarnings("unchecked")
public class ScoreDao extends BaseDao<Score> implements IScoreDao{

}
