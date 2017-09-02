package com.talentrecd.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSON;
import com.opensymphony.xwork2.ActionSupport;
import com.talentrecd.model.Department;
import com.talentrecd.model.Employee;
import com.talentrecd.model.Hr;
import com.talentrecd.model.Recommend;
import com.talentrecd.model.Recruit;
import com.talentrecd.model.Resume;
import com.talentrecd.model.Talent;
import com.talentrecd.service.IDepartmentService;
import com.talentrecd.service.IEmployeeService;
import com.talentrecd.service.IHrService;
import com.talentrecd.service.IRecommendService;
import com.talentrecd.service.IRecruitService;
import com.talentrecd.service.IResumeService;
import com.talentrecd.service.ITalentService;
import com.talentrecd.util.FileUtil;
import com.talentrecd.util.Pagination;

@Controller("adminSelectAction")
@Scope("prototype")
public class AdminSelectAction  extends ActionSupport{
	/*private */
	
   /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Autowired
   private IResumeService resumeService;
	
	@Autowired
	   private IRecruitService recruitService;
	
	@Autowired
	   private IHrService hrService;
	
	@Autowired
	   private IEmployeeService employeeService;
	@Autowired
	private ITalentService talentService;
	  @Autowired
      IDepartmentService departmentService;
	  @Autowired
      IRecommendService recommendService;
   
   private Map<String, Object> dataMap;  
	private String result;
	private JSONObject json;
	private List<Hr> hrs;
	private List<Resume> resumes;
	private List<Employee> employees;
	private List<Recruit> recruits;
	private List<Talent> talents;
	private List<Recommend> recommends;
	private String keyword;
	private int emergent;
	private List<Department> departments;
	private Recruit recruit;
	private int id;
	private int pageNo;
	private String text;
	private int recruitId;
	private FileUtil fileUtil=new FileUtil();
	
	 
   public String getTalentlist()
   {
	  // System.out.println("jehe");
	 //  talents=talentService.getTalentlist();
	   Pagination<Resume> list=resumeService.resumeByPage(pageNo, "", 22);
	   dataMap=new HashMap<String, Object>();
	  // System.out.println(talents.toString());
	   dataMap.put("talents", list);
	    json=JSONObject.fromObject(dataMap);
		return SUCCESS;
   }
   
   
  /* public String getHrlist()
   {
	   hrs=hrService.hrs();
	   dataMap=new HashMap<String, Object>();
	   dataMap.put("hrs", hrs);
	    json=JSONObject.fromObject(dataMap);
		return SUCCESS;
   }*/
   
   public String getHrlist()
   {
		Pagination<Hr> list=hrService.getHrlistByPage(pageNo,text);
	   dataMap=new HashMap<String, Object>();
	   dataMap.put("hrs", list);	   
	    json=JSONObject.fromObject(dataMap);
		return SUCCESS;
   }
   
   public String getEmployeelist()
   {
	  
	  // employees=employeeService.employees();
	   Pagination<Employee> list=employeeService.employeesByPage(pageNo,text);
	   dataMap=new HashMap<String, Object>();
	   dataMap.put("employees", list);
	    json=JSONObject.fromObject(dataMap);
		return SUCCESS;
   }
   
   
  /* public String getRecruitlist() throws IOException{
		//Pagination<Recruit> list=recruitService.recruitByPage(pageNo);
		recruits=recruitService.recruitlist(emergent);
		for(int i=0;i<recruits.size();i++)
		{
		//System.out.println(JSON.toJSONString(recruits.get(i)));
		String description = fileUtil.readDesFile(recruits.get(i).getDescription());
		String requirement=fileUtil.readReqFile(recruits.get(i).getRequirement());
		recruits.get(i).setDescription(description);
		recruits.get(i).setRequirement(requirement);
		}
		dataMap=new HashMap<String, Object>();
		dataMap.put("recruits", recruits);
		json=JSONObject.fromObject(dataMap);
		return SUCCESS;
	}*/
   
   
   public String getRecruitlist() throws IOException{
	   
		Pagination<Recruit> list=recruitService.recruitByPage(emergent,pageNo,text);
		//recruits=recruitService.recruitlist(emergent);
		/*recruits=list.getList();
		for(int i=0;i<recruits.size();i++)
		{
		//System.out.println(JSON.toJSONString(recruits.get(i)));
		String description = fileUtil.readDesFile(recruits.get(i).getDescription());
		String requirement=fileUtil.readReqFile(recruits.get(i).getRequirement());
		if(description!=null||requirement!=null)
		{
		recruits.get(i).setDescription(description);
		recruits.get(i).setRequirement(requirement);
		}
		}
		list.setList(recruits);*/
		dataMap=new HashMap<String, Object>();
		dataMap.put("recruits", list);
		json=JSONObject.fromObject(dataMap);
		return SUCCESS;
	}
   
   public String recruitDetail() throws IOException{
   recruit=recruitService.recruitOne(recruitId);
	String description = fileUtil.readDesFile(recruit.getDescription());
	String requirement=fileUtil.readReqFile(recruit.getRequirement());
	recruit.setDescription(description);
	recruit.setRequirement(requirement);
	dataMap=new HashMap<String, Object>();
	dataMap.put("recruit", recruit);
	json=JSONObject.fromObject(dataMap);
	return SUCCESS;
   }
   
   public String getDepartmentlist()
   {
 	  departments=departmentService.depList();
 	  //System.out.println(departments);
 	  dataMap=new HashMap<String, Object>();
		dataMap.put("departments", departments);
		json=JSONObject.fromObject(dataMap);
 	  return SUCCESS;
   }
   
   
  public String showRecruit() throws IOException
  {
	  recruit=recruitService.recruitOne(id);
	  String description = fileUtil.readDesFile(recruit.getDescription());
		String requirement=fileUtil.readReqFile(recruit.getRequirement());
		recruit.setDescription(description);
		recruit.setRequirement(requirement);
	  dataMap=new HashMap<String, Object>();
		dataMap.put("recruit", recruit);
		json=JSONObject.fromObject(dataMap);
	  return SUCCESS;
  }
  

public int getRecruitId() {
	return recruitId;
}


public void setRecruitId(int recruitId) {
	this.recruitId = recruitId;
}


public List<Resume> getResumes() {
	return resumes;
}

public void setResumes(List<Resume> resumes) {
	this.resumes = resumes;
}

public IResumeService getResumeService() {
	return resumeService;
}

public void setResumeService(IResumeService resumeService) {
	this.resumeService = resumeService;
}

public Map<String, Object> getDataMap() {
	return dataMap;
}

public void setDataMap(Map<String, Object> dataMap) {
	this.dataMap = dataMap;
}

public String getResult() {
	return result;
}

public void setResult(String result) {
	this.result = result;
}

public JSONObject getJson() {
	return json;
}

public void setJson(JSONObject json) {
	this.json = json;
}


public void setHrs(List<Hr> hrs) {
	this.hrs = hrs;
}





public List<Recruit> getRecruits() {
	return recruits;
}


public void setRecruits(List<Recruit> recruits) {
	this.recruits = recruits;
}


public void setEmployees(List<Employee> employees) {
	this.employees = employees;
}



public List<Hr> getHrs() {
	return hrs;
}


public List<Employee> getEmployees() {
	return employees;
}


public String getKeyword() {
	return keyword;
}


public void setKeyword(String keyword) {
	this.keyword = keyword;
}


public int getEmergent() {
	return emergent;
}


public void setEmergent(int emergent) {
	this.emergent = emergent;
}

public List<Department> getDepartments() {
	return departments;
}

public void setDepartments(List<Department> departments) {
	this.departments = departments;
}


public Recruit getRecruit() {
	return recruit;
}


public void setRecruit(Recruit recruit) {
	this.recruit = recruit;
}


public int getId() {
	return id;
}


public void setId(int id) {
	this.id = id;
}


public int getPageNo() {
	return pageNo;
}


public List<Talent> getTalents() {
	return talents;
}


public void setTalents(List<Talent> talents) {
	this.talents = talents;
}


public List<Recommend> getRecommends() {
	return recommends;
}


public void setRecommends(List<Recommend> recommends) {
	this.recommends = recommends;
}


public String getText() {
	return text;
}


public void setText(String text) {
	this.text = text;
}


public void setPageNo(int pageNo) {
	this.pageNo = pageNo;
}


}
