package com.talentrecd.service;


import java.util.Date;
import java.util.List;

import com.talentrecd.model.Recruit;
import com.talentrecd.model.bean.RecruitBean;
import com.talentrecd.util.Pagination;


public interface IRecruitService {
	
	/**
	 * cy edit
	 */
	public List<Recruit> recruitList();
	
	public Pagination<RecruitBean> recruitByPage(int pageNo,String keyword);
	
	public Recruit load(int id);
	
	public Recruit recruitOne(int id);
	
	public void recruitEnd(int id);
	
	public Pagination<RecruitBean> recruitList(int hrID,int pageNo,String keyword);
	
	public void updateRecruit(Recruit recruits);
	
	/**
	 * cy edit
	 */
	
	public  List<Recruit> recruitlist(int emergent);
	
	public Pagination<Recruit> recruitlist(String keyword,int pageNo);
	
	public void addUser(Recruit recruit);
	
	public void update(Recruit recruit);
	
	public void delete(Recruit recruit);
	
	
	public void updateSomeMessage(int id,int number,String place,int isfte,String years,int emergent,Date deadline);
	public Pagination<Recruit> recruitByPage(int emergent,int pageNo,String text);
	
}
