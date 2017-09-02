package com.talentrecd.action;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;





import com.alibaba.fastjson.JSON;
import com.talentrecd.model.Department;
import com.talentrecd.model.Employee;
import com.talentrecd.model.Hr;
import com.talentrecd.model.Job;
import com.talentrecd.model.Recruit;
import com.talentrecd.service.IDepartmentService;
import com.talentrecd.service.IEmployeeService;
import com.talentrecd.service.IHrService;
import com.talentrecd.service.IJobService;
import com.talentrecd.service.IRecruitService;
import com.talentrecd.util.BaseAction;
import com.talentrecd.util.FileUtil;
import com.talentrecd.util.MD5Util;
import com.talentrecd.util.SendMailUtil;

@Controller("hrAction")
@Scope("prototype")
public class HrAction extends BaseAction{
	
	@Autowired
	private IHrService hrService;
	@Autowired
	private IJobService jobService;
	@Autowired
	private IRecruitService recruitService;
	@Autowired
	private IDepartmentService departmentService;
	@Autowired
	private IEmployeeService employeeService;
	private Map<String, Object> dataMap=new HashMap<String, Object>();;  
	private JSONObject json;
	private int depId;
	private int jobId;
	private Recruit recruit;
	private String name;//职位名称
	private String description;
	private String requirement;
	private String spe_demand;//特殊要求
	private int number;//招聘人数
	private String place;//工作地点
	private int isfte;
	private Date deadline;//截止日期
	private String years;//工作年限
	private int emergent;//是否紧急,1为紧急，0不紧急
	private String username;
	private String password;
	private String newPassword;
	private String email;
	private String sex;
	private String realname;
	private FileUtil fileUtil=new FileUtil();
	private String jobName;
	private String depName;
	private int recruitId;
	
	//个人信息
	public String persoinInfo(){
		Hr hr=(Hr) session.getAttribute("hr");
		dataMap=new HashMap<String, Object>();
		dataMap.put("hr", hr);
		json=JSONObject.fromObject(dataMap);
		return SUCCESS;
	}
	
	//更新个人信息
	public String updateInfo(){
		dataMap=new HashMap<String, Object>();
		Hr hr=(Hr) session.getAttribute("hr");
		if(hr.getPassword().equals(MD5Util.MD5Encode(password, null))){
			if(newPassword!=null){
				System.out.println(111);
				hr.setPassword(MD5Util.MD5Encode(newPassword, null));
			}
			hr.setEmail(email);
			hr.setUsername(username);
			hr.setRealname(realname);
			hr.setSex(sex);
			System.out.println(JSON.toJSONString(hr));
			hrService.update(hr);
			session.setAttribute("hr", hr);
			dataMap.put("code", 1);
			dataMap.put("hr", hr);
		}else{
			dataMap.put("code", -1);
			dataMap.put("message", "原始密码错误");
		}
		json=JSONObject.fromObject(dataMap);
		return SUCCESS; 
	}
	
	/**
	 * 发布招聘信息
	 */
	@SuppressWarnings("finally")
	public String addRecruit(){
		try {
			System.out.println("depId:"+depId+"jobId:"+jobId+"name:"+name+"description:"+description+"requirement:"+requirement+"spe_demand:"+spe_demand+"number:"+number+"place:"+place+"isfte:"+isfte+"deadline:"+deadline+"years:"+years+"emergent:"+emergent);
			Hr hr=(Hr) session.getAttribute("hr");
			//将description存到文件中，文件名为时间。
			String fileDesUrl=String.valueOf(new Date().getTime())+".txt";
			fileUtil.descriptionFile(description, fileDesUrl);
			String fileReqUrl=String.valueOf(new Date().getTime())+".txt";
			fileUtil.requirementFile(requirement, fileReqUrl);
			Job job=jobService.load(jobId);
			Department dep=departmentService.load(depId);
			recruit=new Recruit();
			recruit.setCreatedate(new Date());
			recruit.setHr(hr);
			recruit.setDepartment(dep);
			recruit.setJob(job);
			recruit.setDeadline(deadline);
			recruit.setDescription(fileDesUrl);
			recruit.setEmergent(emergent);
			recruit.setIs_fte(isfte);
			recruit.setName(name);
			recruit.setNumber(number);
			recruit.setPlace(place);
			recruit.setRequirement(fileReqUrl);
			recruit.setSpe_demand(spe_demand);
			recruit.setYears(years);
			System.out.println(JSON.toJSONString(recruit));
			hrService.add(recruit);
			dataMap.put("code",1);
			List<Employee> employees=null;
			if(emergent==1){
				 employees=employeeService.employees();
				 for(int i=0;i<employees.size();i++){
					 SendMailUtil.sendMail(hr.getEmail(),employees.get(i).getEmail(), "有新的招聘信息啦！", "HR"+hr.getRealname()+"发布新的紧急招聘信息啦，请前往查看");
				 }
			}
		} catch (Exception e) {
			dataMap.put("code",0);
			e.printStackTrace();
		} finally{
			json=JSONObject.fromObject(dataMap);
			return SUCCESS;
		}
	}
	
	//更新招聘简历
	@SuppressWarnings("finally")
	public String updateRecruit(){
		try {
			System.out.println("depName:"+depName+"jobName:"+jobName+"name:"+name+"description:"+description+"requirement:"+requirement+"spe_demand:"+spe_demand+"number:"+number+"place:"+place+"isfte:"+isfte+"deadline:"+deadline+"years:"+years+"emergent:"+emergent);
			Hr hr=(Hr) session.getAttribute("hr");
			//将description存到文件中，文件名为时间。
			Job job=jobService.loadByName(jobName);
			Department dep=departmentService.loadByName(depName);
			recruit=recruitService.recruitOne(recruitId);
			recruit.setJob(job);
			recruit.setDepartment(dep);
			recruit.setDeadline(deadline);
			recruit.setEmergent(emergent);
			recruit.setIs_fte(isfte);
			recruit.setName(name);
			recruit.setNumber(number);
			recruit.setPlace(place);
			recruit.setSpe_demand(spe_demand);
			recruit.setYears(years);
			
			String desFilename=recruit.getDescription();
			fileUtil.descriptionFile(description, desFilename);
			
			String reqFilename=recruit.getRequirement();
			fileUtil.requirementFile(requirement, reqFilename);
			
			System.out.println(JSON.toJSONString(recruit));
			recruitService.updateRecruit(recruit);
			dataMap.put("code",1);
		} catch (Exception e) {
			dataMap.put("code",0);
			e.printStackTrace();
		} finally{
			json=JSONObject.fromObject(dataMap);
			return SUCCESS;
		}
	}
	
	
	public int getDepId() {
		return depId;
	}
	public void setDepId(int depId) {
		this.depId = depId;
	}
	public int getJobId() {
		return jobId;
	}
	public void setJobId(int jobId) {
		this.jobId = jobId;
	}
	public Recruit getRecruit() {
		return recruit;
	}
	public void setRecruit(Recruit recruit) {
		this.recruit = recruit;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getRequirement() {
		return requirement;
	}

	public void setRequirement(String requirement) {
		this.requirement = requirement;
	}

	public String getSpe_demand() {
		return spe_demand;
	}

	public void setSpe_demand(String spe_demand) {
		this.spe_demand = spe_demand;
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

	public Date getDeadline() {
		return deadline;
	}

	public void setDeadline(Date deadline) {
		this.deadline = deadline;
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

	public String getJobName() {
		return jobName;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	public String getDepName() {
		return depName;
	}

	public void setDepName(String depName) {
		this.depName = depName;
	}

	public int getRecruitId() {
		return recruitId;
	}

	public void setRecruitId(int recruitId) {
		this.recruitId = recruitId;
	}

	
	
	
}
