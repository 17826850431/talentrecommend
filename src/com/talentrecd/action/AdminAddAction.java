package com.talentrecd.action;

import java.awt.Font;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSON;
import com.talentrecd.model.Admin;
import com.talentrecd.model.Employee;
import com.talentrecd.model.Hr;
import com.talentrecd.model.Recruit;
import com.talentrecd.service.IDepartmentService;
import com.talentrecd.service.IEmployeeService;
import com.talentrecd.service.IHrService;
import com.talentrecd.service.IRecruitService;
import com.talentrecd.util.BaseAction;
import com.talentrecd.util.MD5Util;
import com.talentrecd.util.SendMailUtil;

@Controller("adminAddAction")
@Scope("prototype")
public class AdminAddAction  extends BaseAction {
      private static final long serialVersionUID = 1L;
      private Hr hr;
      private Employee employee;
      private int result;
      private String hrString;
      private String employeeString;
      private String username;
      private String email;
      private String sex;
      private String realname;
      private String password;
      private int score;
      private int id;
      private String department;
      private String recruitString;
      private JSONObject json;
      private Map<String, Object> dataMap; 
      private int number;
      private String place;
      private int isfte;
      private String years;
      private int emergent;
      private Date deadline;
      private String declaration;
      private String picture;
      private 
      @Autowired
      IHrService hrService;
      @Autowired 
      IEmployeeService employeeService;
      @Autowired
      IDepartmentService departmentService;
      @Autowired
      IRecruitService recruitService;
      public String addHr()
      {
          hr=JSON.parseObject(hrString, Hr.class);
    	  hr.setPassword(MD5Util.MD5Encode( hr.getPassword(),null));
    	  hr.setStatus(0);
	    		  hrService.addHr(hr);	 
				   return SUCCESS;
      }
      
      public String checkEmpUsername()
      {
    	  dataMap=new HashMap<String, Object>();
    	List<Employee> employees=employeeService.selectByUsername(username);
    	if(employees.size()>0)
    	{
    		dataMap.put("code", 0);
    	}
    	else
    	{
    		dataMap.put("code", 1);
    	}
    	json=JSONObject.fromObject(dataMap);
		    return SUCCESS;
      }
      
      
      public String checkHrUsername()
      {
    	  dataMap=new HashMap<String, Object>();
    	List<Hr> hr=hrService.selectByUsername(username);
    	if(hr.size()>0)
    	{
    		dataMap.put("code", 0);
    	}
    	else
    		dataMap.put("code", 1);
    	json=JSONObject.fromObject(dataMap);
		    return SUCCESS;
      }
      
      
      
      
      public String addEmployee()
      {
    	 
    	  employee=JSON.parseObject(employeeString, Employee.class);
    	  if(employee.getUsername()!=null)
    	  {
    	  }
    	  employee.setPassword(MD5Util.MD5Encode(employee.getPassword(),null));
    	  employee.setStatus(0);
    	  employeeService. addEmployee(employee);	 
				   return SUCCESS;
      }
      
    
      
      public String updateEmployee()
      {
    	 
    	  Employee  employee=new Employee();
    	  employee.setUsername(username);
    	  employee.setId(id);
    	  employee.setPassword(password);
    	  employee.setScore(score);
    	  employee.setRealname(realname);
    	  employee.setSex(sex);
    	  employee.setEmail(email);
    	  employee.setDepartment(department);
    	  employee.setDeclaration(declaration);
    	  employee.setPicture(picture);
    	 employeeService.updateEmployee(employee);	 
				   return SUCCESS;
      }
      public String updateHr()
      {
    	
    	  Hr  hr=new Hr();
    	  hr.setUsername(username);
    	  hr.setId(id);
    	  hr.setPassword(password);
    	  hr.setRealname(realname);
    	  hr.setSex(sex);
    	  hr.setEmail(email);
    	  hr.setDepartment(department);
    	  hr.setDeclaration(declaration);
    	  hr.setPicture(picture);
    	 hrService.updateHr(hr);	 
		return SUCCESS;
      }
      
      
      public String resetHrPassword()
      {
    	 dataMap=new HashMap<String, Object>();
    	 
    	try{
    	hrService.resetHrPassword(id);
    	dataMap.put("code", 1);  
    	}catch (Exception e) {
    		 dataMap.put("code", 0);
    		 e.printStackTrace();
    	}finally
    	{
    		json=JSONObject.fromObject(dataMap);
    	}
	     return SUCCESS;
      }
      
      public String resetEmpPassword()
      {
    	 dataMap=new HashMap<String, Object>();
    	 
    	try{
    	employeeService.resetEmpPassword(id);
    	dataMap.put("code", 1);  
    	}catch (Exception e) {
    		 dataMap.put("code", 0);
    		 e.printStackTrace();
    	}finally
    	{
    		json=JSONObject.fromObject(dataMap);
    	}
	     return SUCCESS;
      }
      
      public String updateRecruit()
      {
    	 dataMap=new HashMap<String, Object>();
    	 
    	try{
			 Admin admin=(Admin)session.getAttribute("admin");
			 String postAddress=admin.getEmail();
    		Recruit	recruit=recruitService.load(id);
    		String getAddress=recruit.getHr().getEmail();
    	int i=SendMailUtil.sendMail(postAddress, getAddress, "通过这次的检查 发现了有很大的问题，请尽快处理，收到请回复。通过这次的检查 发现了有很大的问题，请尽快处理，收到请回复。通过这次的检查 发现了有很大的问题，请尽快处理，收到请回复。通过这次的检查 发现了有很大的问题，请尽快处理，收到请回复。通过这次的检查 发现了有很大的问题，请尽快处理，收到请回复。通过这次的检查 发现了有很大的问题，请尽快处理，收到请回复。通过这次的检查 发现了有很大的问题，请尽快处理，收到请回复。", "招聘职位名称为'"+recruit.getName()+"'的招聘信息被管理员修改，请前往查看！");	
   	      recruitService.updateSomeMessage(id,number,place,isfte,years,emergent,deadline);   
    	if(i==1)
    	{
    	 dataMap.put("code", 2);  
    	}
    	else
    	{
    	dataMap.put("code", 1);  
    	}
    	}catch (Exception e) {
    		 dataMap.put("code", 0);
    		 e.printStackTrace();
    	}finally
    	{
    		json=JSONObject.fromObject(dataMap);
    	}
	     return SUCCESS;
      }
      
	public Hr getHr() {
		return hr;
	}
	public void setHr(Hr hr) {
		this.hr = hr;
	}
	public int getResult() {
		return result;
	}
	
	public String getEmployeeString() {
		return employeeString;
	}
	public void setEmployeeString(String employeeString) {
		this.employeeString = employeeString;
	}
	public void setResult(int result) {
		this.result = result;
	}
	public String getHrString() {
		return hrString;
	}
	public void setHrString(String hrString) {
		this.hrString = hrString;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getRecruitString() {
		return recruitString;
	}

	public void setRecruitString(String recruitString) {
		this.recruitString = recruitString;
	}

	public JSONObject getJson() {
		return json;
	}

	public void setJson(JSONObject json) {
		this.json = json;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public int getIsfte() {
		return isfte;
	}

	public void setIsfte(int isfte) {
		this.isfte = isfte;
	}

	public String getYears() {
		return years;
	}

	public void setYears(String years) {
		this.years = years;
	}

	public int getEmergent() {
		return emergent;
	}

	public void setEmergent(int emergent) {
		this.emergent = emergent;
	}

	public Date getDeadline() {
		return deadline;
	}

	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}

	public String getDeclaration() {
		return declaration;
	}

	public void setDeclaration(String declaration) {
		this.declaration = declaration;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	

	

	
      
      
}
