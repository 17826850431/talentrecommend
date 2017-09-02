package com.talentrecd.dao.impl;


import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.alibaba.fastjson.JSON;
import com.talentrecd.dao.IResumeDao;
import com.talentrecd.model.Resume;
import com.talentrecd.util.Pagination;


@Repository("resumeDao")
@SuppressWarnings("unchecked")
public class ResumeDao extends BaseDao<Resume> implements IResumeDao {
	protected int pageSize=4;
	@Override
	public Pagination<Resume> resumeList(String hql, int pageNo,Object[] args) {
		Query q = this.getSession().createQuery(hql);
//		System.out.println("RecruitDao");
		/*q.setString("text","%"+args[args.length-1]+"%");*/
		if(args!=null) {
			for(int i=0;i<args.length;i++) {
				q.setParameter(i, args[i]);
			}
		}
		//从第几条记录开始，取出几条记录
		q.setFirstResult((pageNo-1)*pageSize).setMaxResults(pageSize);
		//得到查询所有的记录总数的sql
		String s = hql.substring(0,hql.indexOf("from"));
		System.out.println(JSON.toJSONString(q));
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
		List<Resume> datas = q.list();
		System.out.println(JSON.toJSONString(datas));
		long x =(Long) cq.uniqueResult();
		int totalRecord= (int) x;
		return new Pagination(pageNo,pageSize,totalRecord,datas);
	}
}
