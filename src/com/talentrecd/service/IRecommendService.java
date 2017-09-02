package com.talentrecd.service;


import java.util.List;

import com.talentrecd.model.Recommend;
import com.talentrecd.util.Pagination;


public interface IRecommendService {
	
	/**
	 * cy edit
	 */
	//hr可以推荐给其他招聘的应聘者
	public Pagination<Recommend> recommendList(int hrId,int pageNo,int status);
	//hr推荐给其他招聘，转简历
	public void updateRecommend(String recommendIds,int hrId,int recruitId);
	////显示某个简历的应聘人员,天假查询功能
	public Pagination<Recommend> recmmendPeople(int recruitId,int pageNo,int status);
	
	public Recommend recommendDetail(int recommendId);
	//hr操作简历流程，加积分
	public void updateRecommend(int recommendId,int status,int score);
	/**
	 * cy edit
	 */
	
	public Pagination<Recommend> recommendlist(int empid,int pageNo,String text);//查
	
	public void add(Recommend recommend);
	
	public void update(Recommend recommend);
	
	public void delete(Recommend recommend);
	
	public Recommend load(int id);
	public int ever_Recommend(int resumeid, int recruitid);
	public void resumeIdDelete(int resid);
	
	public List<Recommend> list();

}
