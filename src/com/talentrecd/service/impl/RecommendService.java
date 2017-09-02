package com.talentrecd.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.talentrecd.dao.IEmployeeDao;
import com.talentrecd.dao.IRecommendDao;
import com.talentrecd.dao.IRecruitDao;
import com.talentrecd.dao.IResumeDao;
import com.talentrecd.dao.IScoreDao;
import com.talentrecd.model.Employee;
import com.talentrecd.model.Recommend;
import com.talentrecd.model.Recruit;
import com.talentrecd.model.Resume;
import com.talentrecd.model.Score;
import com.talentrecd.service.IRecommendService;
import com.talentrecd.util.Pagination;

@Service("recommendService")
public class RecommendService implements IRecommendService {
	@Autowired
	private IRecommendDao recommendDao;
	@Autowired
	private IRecruitDao recruitDao;
	@Autowired
	private IResumeDao resumeDao;
	@Autowired
	private IScoreDao scoreDao;
	@Autowired
	private IEmployeeDao employeeDao;
	
	/**
	 * 删除招聘
	 */
	@Override
	public void delete(Recommend recommend){
		recommendDao.delete(recommend.getId());
	}
	
	/**
	 * 添加招聘
	 */
	@Override
	public void add(Recommend recommend){
		recommendDao.add(recommend);
	}
	
	/**
	 * 更新招聘
	 */
	@Override
	public void update(Recommend recommend) {
		if(recommend!=null){
			recommendDao.update(recommend);
		}
	}
	
	@Override
	public Recommend load(int id) {
		return recommendDao.load(id);
	}
	

	//用户个人推荐xjh
			@Override
             public Pagination<Recommend> recommendlist(int empid,int pageNo,String text) {
				text="%"+text+"%";
				String hql = "select rec from Recommend rec where rec.emp_id= ? and (rec.resume.name like ? or rec.recruit.name like ? or rec.recruit.place like ? or rec.recruit.department.name like ?)";
				return recommendDao.find(hql,pageNo,new Object[]{empid,text,text,text,text});
			}
			@Override
			//删除简历时同时删除推荐xjh
			public  void resumeIdDelete(int resid){
				String hql="select rec from Recommend rec where rec.resume.id=?";
				List<Recommend> theRecommends=recommendDao.list(hql, resid);
				for(Recommend recommend : theRecommends){
					System.out.println(recommend.getId());
					recommendDao.delete(recommend);
				}
			}
			
			@Override
			//查询是否重复推荐xjh
			public int ever_Recommend(int resumeid,int recruitid){
				String hql="select rec from Recommend rec where rec.resume.id=? and rec.recruit.id=?";
				List<Recommend> theRecommends=recommendDao.list(hql,new Object[]{resumeid,recruitid});
				System.out.println(theRecommends.isEmpty());
				if(theRecommends.isEmpty()){
					return 0;
				}else {
					return 1;
				}
			}
	
			/**
			 * cy edit
			 */

			//hr可以推荐给其他招聘的应聘者
			@Override
			public Pagination<Recommend> recommendList(int hrId, int pageNo,int status) {
				String hql="select rec from Recommend rec where  rec.hr_id=? and rec.status=? order by rec.id desc";
				return recommendDao.recommendList(hql,pageNo,new Object[]{hrId,status});
			}

			//hr推荐给其他招聘，转简历
			@Override
			public void updateRecommend(String recommendIds, int hrId, int recruitId) {
				String[] strs=recommendIds.split(",");
				for(String str : strs){
					int id=Integer.parseInt(str);
					Recommend r = recommendDao.load(id);
					Recruit recruit=recruitDao.load(recruitId);
					r.setRecruit(recruit);
					r.setHr_id(hrId);
					r.setStatus(-1);
					r.setNote("hr转推荐的");
					recommendDao.update(r);
				}
			}

			//显示某个简历的应聘人员,天假查询
			@Override
			public Pagination<Recommend> recmmendPeople(int recruitId,int pageNo,int status) {
				if(status==-2){
					String hql="select rec from Recommend rec where rec.recruit.id=? order by emp_id";
					return recommendDao.recommendList(hql,pageNo,new Object[]{recruitId});
				}else{
					String hql="select rec from Recommend rec where rec.recruit.id=? and rec.status=? order by emp_id";
					return recommendDao.recommendList(hql,pageNo,new Object[]{recruitId,status});
				}
			}

			@Override
			public Recommend recommendDetail(int recommendId) {
				String hql="select rec from Recommend rec where id=? ";
				return (Recommend) recommendDao.queryByHql(hql, recommendId);
			}

			//hr管理简历流程，然后加积分
			@Override
			public void updateRecommend(int recommendId, int status,int score) {
				String hql="select rec from Recommend rec where id=? ";
				try {
					Recommend recommend=(Recommend) recommendDao.queryByHql(hql, recommendId);
					Resume r=recommend.getResume();
					if(status==0||status==4||status==6||status==8||status==10){
						//修改这些人的简历状态，还是改成0，可以再次推荐
						r.setStatus(0);
						resumeDao.update(r);
					}else if(status==1||status==5||status==7||status==9){//emp的socre得更新，然后score对象得插入新值
						Score s=new Score();
						s.setScore(score);
						s.setCreatetime(new Date());
						s.setEmployee(r.getEmployee());
						s.setHr_id(recommend.getHr_id());
						s.setRecruit_name(recommend.getRecruit().getName());
						s.setResume_name(r.getName());
						s.setStatus(status);
						scoreDao.add(s);
						Employee employee=recommend.getResume().getEmployee();
						employee.setScore(employee.getScore()+score);
						employeeDao.update(employee);
					}
					recommend.setStatus(status);
					recommendDao.update(recommend);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

			@Override
			public List<Recommend> list() {
				return null;
			}

			/**
			 * cy edit
			 */


}
