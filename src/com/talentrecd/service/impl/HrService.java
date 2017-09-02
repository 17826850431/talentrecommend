package com.talentrecd.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.sun.org.apache.bcel.internal.generic.NEW;
import com.talentrecd.dao.IDepartmentDao;
import com.talentrecd.dao.IHrDao;
import com.talentrecd.dao.IJobDao;
import com.talentrecd.dao.IRecruitDao;
import com.talentrecd.model.Employee;
import com.talentrecd.model.Hr;
import com.talentrecd.model.Recruit;
import com.talentrecd.service.IHrService;
import com.talentrecd.util.MD5Util;
import com.talentrecd.util.Pagination;

@Service("hrService")
public class HrService implements IHrService{

	@Autowired
	private IHrDao hrDao;
	@Autowired
	private IRecruitDao recruitDao;
	@Autowired
	private IDepartmentDao departmentDao;
	@Autowired
	private IJobDao jobDao;
	
	
	@Override
	public List<Hr> hrs() {
		String hql="select hr from Hr hr order by id desc";
		return hrDao.list(hql);
		
	}
	@Override
	public void add(Recruit recruit) {
		try {
			recruitDao.add(recruit);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void addHr(Hr hr) {
		try {
			hrDao.add(hr);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	@Override
	public Hr getHr(String username) {
		String hql="select hr from Hr hr where hr.name=? order by id desc";
		return (Hr) hrDao.queryByHql(hql, username);
	}


	@Override
	public Hr load(int id) {
		return hrDao.load(id);
	}
	
	@Override
	public void deleteHr(int id) {
		hrDao.delete(id);
	}

	@Override
	public Hr login(String username, String password) {
		password=MD5Util.MD5Encode(password, null);
		String hql="select hr from Hr hr where username=? and password=? ";
		Hr hr=(Hr) hrDao.queryByHql(hql, new Object[]{username,password});
		if(hr!=null)
		{
			if(hr.getStatus()==1)
			{
				return hr;
			}
			else
			{
				hr.setStatus(1);
				System.out.println(JSON.toJSONString(hr));
				hrDao.update(hr);
				return hr;
			}
		}
		else
			return null;
	}


	@Override
	public Hr persoinInfo(int id) {
		String hql="select hr from Hr hr where hr.id=? order by id desc";
		return (Hr) hrDao.queryByHql(hql, id);
	}


	@Override
	public void update(Hr hr) {
		hrDao.update(hr);
	}
 
	
	@Override
	public void updateHr(Hr hr) {
		hrDao.update(hr);
	}
	
	@Override
	public Pagination<Hr> getHrlistByPage(int pageNo,String text) {
		 text="%"+text+"%";
		String sql="select hr from Hr hr where hr.realname like ? or hr.username like ? or hr.department like ? order by id desc";
		return hrDao.getHrlistByPage(sql,pageNo,new Object[]{text,text,text});
	}
	
	@Override
	public List<Hr> selectByUsername(String username) {
		String hql="select hr from Hr hr where username=? ";
		List<Hr> hrs=hrDao.list(hql,new Object[]{username});
		return hrs;
	}
	
	@Override
	public void resetHrPassword(int id) {
		String password=MD5Util.MD5Encode("123456", null);
		String hql="update Hr hr set hr.password=? where hr.id=? ";
		hrDao.executeByHql(hql,new Object[]{password,id});
	}

}
