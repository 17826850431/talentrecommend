package com.talentrecd.service;

import java.util.List;

import com.talentrecd.model.Hr;
import com.talentrecd.model.Recruit;
import com.talentrecd.util.Pagination;

public interface IHrService {
	public Hr login(String username,String password);
	//发布招聘信息
	public void add(Recruit recruit);
	
	public void addHr(Hr hr);
	public Hr getHr(String username);
	
	public Hr load(int id);
	public List<Hr> hrs();
	
	public Hr persoinInfo(int id);
	
	public void update(Hr hr);
	
	public void updateHr(Hr hr);
	
	public void deleteHr(int id);
	Pagination<Hr> getHrlistByPage(int pageNo,String text);
	public List<Hr> selectByUsername(String username);
	
	public void resetHrPassword(int id);
}
