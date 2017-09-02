package com.talentrecd.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.talentrecd.dao.ITalentDao;
import com.talentrecd.model.Recruit;
import com.talentrecd.model.Talent;
import com.talentrecd.util.Pagination;

@Repository("talentDao")
@SuppressWarnings("unchecked")
public class TalentDao extends BaseDao<Talent> implements ITalentDao{
	
	
private final int pageSize=10;
	@Override
	public Pagination<Talent> getTalentlist(String hql, int pageNo) {
		Query q = this.getSession().createQuery(hql);
		//从第几条记录开始，取出几条记录
		q.setFirstResult((pageNo-1)*pageSize).setMaxResults(pageSize);
		//得到查询所有的记录总数的sql
		String s = hql.substring(0,hql.indexOf("from"));
		if(s==null||s.trim().equals("")) {
			hql = "select count(*) "+hql;
		} else {
			hql = hql.replace(s, "select count(*) ");
		}
		String cHql = hql.replace("fetch", "");
		Query cq = this.getSession().createQuery(cHql);
		List<Recruit> datas = q.list();
		long x =(Long) cq.uniqueResult();
		int totalRecord= (int) x;
		return new Pagination(pageNo,pageSize,totalRecord,datas);
	}
	
}
