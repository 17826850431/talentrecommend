package com.talentrecd.dao.impl;

import org.springframework.stereotype.Repository;

import com.talentrecd.dao.IAdminDao;
import com.talentrecd.model.Admin;

@Repository("adminDao")
@SuppressWarnings("unchecked")
public class AdminDao extends BaseDao<Admin> implements IAdminDao{

}
