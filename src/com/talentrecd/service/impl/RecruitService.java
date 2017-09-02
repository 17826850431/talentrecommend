package com.talentrecd.service.impl;

import java.util.ArrayList;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.talentrecd.dao.IRecruitDao;
import com.talentrecd.model.Recruit;
import com.talentrecd.model.bean.RecruitBean;
import com.talentrecd.service.IRecruitService;
import com.talentrecd.util.Pagination;

@Service("recruitService")
public class RecruitService implements IRecruitService {
	@Autowired
	private IRecruitDao recruitDao;
		
	
	  @Resource
		private SessionFactory sessionFactory;
	     
		public Session getSession() {
			return sessionFactory.openSession();
		}

		public void updateRecruit(Recruit recruits) {
			recruitDao.update(recruits);
		}
		
		@Override
		public Recruit recruitOne(int id) {
			String hql="select r from Recruit r where r.id=? order by createdate desc";
			return (Recruit) recruitDao.queryByHql(hql, id);
		}
		
		@Override
		public void recruitEnd(int id) {
			String hql="update Recruit set status=1 where id = ? ";
			recruitDao.executeByHql(hql, id);
		}
		
		
		@Override
		public Pagination<RecruitBean> recruitByPage(int pageNo,String keyword) {
			keyword="%"+keyword+"%";
			String sql="select a.id,a.place,a.years,b.id,b.username,c.id,c.name,d.id,d.name as depName,a.name as recruitName,a.number,a.status,a.deadline,b.realname from t_recruit a LEFT JOIN t_hr b on a.hr_id=b.id LEFT JOIN t_department c on a.dep_id=c.id left join t_job d on d.id=a.job_id where a.name like ? or b.username like ? or c.name like ? or place like ? order by createdate desc";
			Pagination<Object[]> list=recruitDao.recruitSql(sql, pageNo, new Object[]{keyword,keyword,keyword,keyword});
			List<RecruitBean> RecruitBeanList=new ArrayList<RecruitBean>();
			for(Object[] object:list.getList()){
				RecruitBean recruitBean=new RecruitBean();
				recruitBean.setRecruitId( (Integer) object[0]);
				recruitBean.setPlace((String) object[1]);
				recruitBean.setYears((String) object[2]);
				recruitBean.setHrId((Integer) object[3]);
				recruitBean.setUsername((String) object[4]);
				recruitBean.setDepId((Integer) object[5]);
				recruitBean.setDepName((String) object[6]);
				recruitBean.setJobId((Integer) object[7]);
				recruitBean.setJobName((String) object[8]);
				recruitBean.setName((String) object[9]);
				recruitBean.setNumber((Integer) object[10]);
				recruitBean.setStatus((Integer) object[11]);
				recruitBean.setDeadline((Date) object[12]);
				recruitBean.setRealname((String) object[13]);
				RecruitBeanList.add(recruitBean);
			}
			return new Pagination<RecruitBean>(list.getPageNo(), list.getPageSize(), list.getTotalCount(), RecruitBeanList);
		}
		
		@Override
		public Pagination<RecruitBean> recruitList(int hrID,int pageNo,String keyword) {
			keyword="%"+keyword+"%";
			String sql="select a.id,a.place,a.years,b.id,b.username,c.id,c.name,d.id,d.name as depName ,a.name as recruitName,a.number,a.status,a.deadline,b.realname from t_recruit a LEFT JOIN t_hr b on a.hr_id=b.id LEFT JOIN t_department c on a.dep_id=c.id left join t_job d on d.id=a.job_id where  ( a.name like ? or c.name like ? or place like ? ) and a.hr_id = ? order by createdate desc";
			Pagination<Object[]> list=recruitDao.recruitSql(sql, pageNo, new Object[]{keyword,keyword,keyword,hrID});
			List<RecruitBean> RecruitBeanList=new ArrayList<RecruitBean>();
			for(Object[] object:list.getList()){
				RecruitBean recruitBean=new RecruitBean();
				recruitBean.setRecruitId( (Integer) object[0]);
				recruitBean.setPlace((String) object[1]);
				recruitBean.setYears((String) object[2]);
				recruitBean.setHrId((Integer) object[3]);
				recruitBean.setUsername((String) object[4]);
				recruitBean.setDepId((Integer) object[5]);
				recruitBean.setDepName((String) object[6]);
				recruitBean.setJobId((Integer) object[7]);
				recruitBean.setJobName((String) object[8]);
				recruitBean.setName((String) object[9]);
				recruitBean.setNumber((Integer) object[10]);
				recruitBean.setStatus((Integer) object[11]);
				recruitBean.setDeadline((Date) object[12]);
				recruitBean.setRealname((String) object[13]);
				RecruitBeanList.add(recruitBean);
			}
			System.out.println(JSON.toJSONString(RecruitBeanList));
			return new Pagination<RecruitBean>(list.getPageNo(), list.getPageSize(), list.getTotalCount(), RecruitBeanList);
		}

		/**
		 * cy edit
		 */
	
	
	/**
	 * 删除招聘
	 */
	@Override
	public void delete(Recruit recruit){
		recruitDao.delete(recruit.getId());
	}
	
	/**
	 * 添加招聘
	 */
	@Override
	public void addUser(Recruit recruit){
		recruitDao.add(recruit);
	}
	
	/**
	 * 更新招聘
	 */
	@Override
	public void update(Recruit recruit) {
		if(recruit!=null){
			recruitDao.update(recruit);
		}
	}
	
	
	@Override
	public Recruit load(int id) {
		return recruitDao.load(id);
	}

	
	//紧急招聘
	@Override
	public List<Recruit> recruitlist(int emergent) {
		String hql="select rec from Recruit rec where emergent =  ? order by createdate desc";
		return recruitDao.list(hql,emergent);
	}

	@Override
	public Pagination<Recruit> recruitlist(String keyword, int pageNo) {
		return null;
	}

	@Override
	public List<Recruit> recruitList() {
		String hql="select r from Recruit r order by createdate desc";
		return recruitDao.list(hql);
	}


	@Override
	public Pagination<Recruit> recruitByPage(int emergent,int pageNo,String text) {
		text="%"+text+"%";
		String sql="select r from Recruit r where r.emergent=? and (r.name like ? or r.place like ? or r.department.name like ? or r.hr.realname like ?) order by createdate desc";
		return recruitDao.recruitList(sql,pageNo,new Object[]{emergent,text,text,text,text});
	}
	
	@Override
	public void updateSomeMessage(int id,int number, String place, int isfte,
			String years, int emergent, Date deadline) {
		String hql="update Recruit r set r.number=?, r.place=?,r.is_fte=?,r.years=?,r.emergent=?,r.deadline=? where r.id=? order by createdate desc";
		Query query =getSession().createQuery(hql);
		query.setLong(0, number);
		query.setString(1, place);
		query.setLong(2, isfte);
		query.setString(3, years);
		query.setLong(4, emergent);
		query.setDate(5, deadline);
		query.setLong(6, id);
		query.executeUpdate();
		getSession().close();
		//recruitDao.queryByHql(hql,new Object[]{number,place,isfte,years,emergent,deadline,id});
	
	}


}
