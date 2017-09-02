package com.talentrecd.util;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public abstract class BaseAction extends ActionSupport implements SessionAware, ServletRequestAware, ServletResponseAware {

	/**
	 * HttpServletRequest
	 */
	private static final long serialVersionUID = 1L;

//	protected Map<String, Object> session;

	protected HttpServletRequest request;

	protected HttpServletResponse response;
	
	protected HttpSession session;
	
	protected ServletContext application;
	
	public void setServletContext(ServletContext application){
		this.application=application;
	}
	

	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
		this.session=this.request.getSession();
//		session.getAttribute("tbUsersinfo");   action里面可以这么用
//		session.removeAttribute("tbUsersinfo");
	}
	
	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		
	}

	/*public void setSession(Map<String, Object> session) {
		this.session = session;
	}*/



}
