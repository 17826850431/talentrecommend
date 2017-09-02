package com.talentrecd.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.talentrecd.dao.IEmployeeDao;
import com.talentrecd.model.Employee;
import com.talentrecd.model.Recruit;
import com.talentrecd.util.Pagination;


@Repository("employeeDao")
@SuppressWarnings("unchecked")
public class EmployeeDao extends BaseDao<Employee> implements IEmployeeDao{
	private final int pageSize=6;
	@Override
	public Pagination<Employee> employeeDao(String hql, int pageNo,Object[] args) {
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
	public Employee selectByUsername(String sql) {
		/*Query query=this.getSession().createQuery(sql);
		return query.list();*/
		return null;
	}
}
