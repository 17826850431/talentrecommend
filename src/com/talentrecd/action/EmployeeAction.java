package com.talentrecd.action;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSON;
import com.talentrecd.model.Department;
import com.talentrecd.model.Employee;
import com.talentrecd.model.Job;
import com.talentrecd.model.Recruit;
import com.talentrecd.service.IDepartmentService;
import com.talentrecd.service.IEmployeeService;
import com.talentrecd.service.IHrService;
import com.talentrecd.service.IJobService;
import com.talentrecd.util.BaseAction;
import com.talentrecd.util.FileUtil;
import com.talentrecd.util.MD5Util;

@Controller("employeeAction")
@Scope("prototype")
public class EmployeeAction extends BaseAction{
	
	@Autowired
	private IEmployeeService employeeService ;

	private Map<String, Object> dataMap=new HashMap<String, Object>();;  
	private JSONObject json;
	private String username;
	private String password;
	private String newPassword;
	private String email;
	private String sex;
	private String realname;
	private FileUtil fileUtil=new FileUtil();
	
	//个人信息
	public String personInfo(){
		Employee employee=(Employee)session.getAttribute("loginEmployee");
		dataMap=new HashMap<String, Object>();
		dataMap.put("employee", employee);
		json=JSONObject.fromObject(dataMap);
		return SUCCESS;
	}
	
	//更新个人信息
	public String updateInfo(){
		dataMap=new HashMap<String, Object>();
		Employee employee=(Employee) session.getAttribute("loginEmployee");
		if(employee.getPassword().equals(MD5Util.MD5Encode(password, null))){
			if(newPassword!=null){
				System.out.println(111);
				employee.setPassword(MD5Util.MD5Encode(newPassword, null));
			}
			employee.setEmail(email);
			employee.setUsername(username);
			employee.setRealname(realname);
			employee.setSex(sex);
			System.out.println(JSON.toJSONString(employee));
			employeeService.updateEmployee(employee);
			session.setAttribute("loginEmployee", employee);
			dataMap.put("code", 1);
			dataMap.put("employee", employee);
		}else{
			dataMap.put("code", -1);
			dataMap.put("message", "原始密码错误");
		}
		json=JSONObject.fromObject(dataMap);
		return SUCCESS; 
	}
	

	public Map<String, Object> getDataMap() {
		return dataMap;
	}

	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
	}

	public JSONObject getJson() {
		return json;
	}

	public void setJson(JSONObject json) {
		this.json = json;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	
	
	
}
