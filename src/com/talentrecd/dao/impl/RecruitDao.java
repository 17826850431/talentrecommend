package com.talentrecd.dao.impl;


import java.math.BigInteger;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.alibaba.fastjson.JSON;
import com.talentrecd.dao.IRecruitDao;
import com.talentrecd.model.Recruit;
import com.talentrecd.util.Pagination;


@Repository("recruitDao")
@SuppressWarnings("unchecked")
public class RecruitDao extends BaseDao<Recruit> implements IRecruitDao {

private final int pageSize=10;
	
	@Override
	public Pagination<Recruit> recruitByPage(String hql, int pageNo) {
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

	@Override
	public Pagination<Recruit> recruitList(String hql, int pageNo,Object[] args) {
		Query q = this.getSession().createQuery(hql);
		if(args!=null) {
			for(int i=0;i<args.length;i++) {
				q.setParameter(i, args[i]);
			}
		}
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
		if(args!=null) {
			for(int i=0;i<args.length;i++) {
				cq.setParameter(i, args[i]);
			}
		}
		List<Recruit> datas = q.list();
		long x =(Long) cq.uniqueResult();
		int totalRecord= (int) x;
		return new Pagination(pageNo,pageSize,totalRecord,datas);
	}

	@Override
	public Pagination<Object[]> recruitSql(String sql, int pageNo, Object[] args) {
		Query q = this.getSession().createSQLQuery(sql);
		if(args!=null) {
			for(int i=0;i<args.length;i++) {
				q.setParameter(i, args[i]);
			}
		}
		q.setFirstResult((pageNo-1)*pageSize).setMaxResults(pageSize);
		//得到查询所有的记录总数的sql
		String s = sql.substring(0,sql.indexOf("from"));
		if(s==null||s.trim().equals("")) {
			sql = "select count(*) "+sql;
		} else {
			sql = sql.replace(s, "select count(*) ");
		}
		String cSql = sql.replace("fetch", "");
		Query cq = this.getSession().createSQLQuery(cSql);
		if(args!=null) {
			for(int i=0;i<args.length;i++) {
				cq.setParameter(i, args[i]);
			}
		}
		List<Object[]> datas = q.list();
		BigInteger b =(BigInteger) cq.uniqueResult();
		int totalRecord=b.intValue();
//		int totalRecord= (int) x;
		return new Pagination(pageNo,pageSize,totalRecord,datas);
	}
	
}
