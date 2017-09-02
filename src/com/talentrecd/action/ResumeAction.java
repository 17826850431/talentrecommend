package com.talentrecd.action;


import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSON;
import com.talentrecd.model.Department;
import com.talentrecd.model.Employee;
import com.talentrecd.model.Hr;
import com.talentrecd.model.Job;
import com.talentrecd.model.Recommend;
import com.talentrecd.model.Recruit;
import com.talentrecd.model.Resume;
import com.talentrecd.service.IDepartmentService;
import com.talentrecd.service.IHrService;
import com.talentrecd.service.IJobService;
import com.talentrecd.service.IRecommendService;
import com.talentrecd.service.IResumeService;
import com.talentrecd.util.BaseAction;
import com.talentrecd.util.FileUtil;
import com.talentrecd.util.MD5Util;
import com.talentrecd.util.Pagination;

@Controller("resumeAction")
@Scope("prototype")
public class ResumeAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	private Recommend recommend;
	private Resume resume;
	
	private int resid;
	private IResumeService resumeService;
	private IRecommendService recommendService;
	private List<Resume> resumes;
	private Map<String, Object> dataMap;  
	private String result;
	private JSONObject json;
	private File file;
	FileUtil fileUtil = new FileUtil();
	private int[] resids;//批量
	
	private String text;//分页
	private int pageNo;
	
	//update add
	private int resumeId;
	private String name;
	private String position;
	private String degree;
	private String sex;
	private String email;
	private String school;
	private int is_study;
	private String gra_time;
	private String major;
	private String phone;
	private String skill;
	private String picture;
	private SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	Date date = new Date();
	//查看简历库xjh
	public String resumelist(){
		Employee employee=(Employee)session.getAttribute("loginEmployee");
		resumes=resumeService.resumes(employee.getId());
		dataMap=new HashMap<String, Object>();
		dataMap.put("resumes", resumes);
		json=JSONObject.fromObject(dataMap);
		return SUCCESS;
	}
	public String getResumelist() throws IOException{
		   
		   System.out.println(text);
		   Employee employee=(Employee)session.getAttribute("loginEmployee");
			Pagination<Resume> list=resumeService.resumeByPage(pageNo,text,employee.getId());
			
			resumes=list.getList();
			
			list.setList(resumes);
			dataMap=new HashMap<String, Object>();
			dataMap.put("resumes", list);
			json=JSONObject.fromObject(dataMap);
			return SUCCESS;
		}
	//上传简历xjh
		public String upload() throws IOException{
			System.out.println(file.getAbsolutePath());
			Employee employee = (Employee) session.getAttribute("loginEmployee");
			
			String newfilename =fileUtil.resumeFile(file,employee.getUsername());
			System.out.println(resid);
			resume = resumeService.load(resid);
			resume.setFile_name(newfilename);
			resumeService.update(resume);
			response.sendRedirect("resume.jsp");
			return SUCCESS;
		}
	
	//简历详情xjh
	public String resumeDetail(){
		System.out.println(resid);
		Resume  resumeDetail = resumeService.resumeOne(resid);
		System.out.println(resumeDetail.getEmail());
		dataMap=new HashMap<String, Object>();
		dataMap.put("resume", resumeDetail);
		json=JSONObject.fromObject(dataMap);
		return SUCCESS;
	}
	//更新简历xjh
	@SuppressWarnings("finally")
	public String updateResume() {
		try {
			System.out.println(resumeId+","+name+","+sex+","+is_study+","+gra_time);
			Resume theResume =new Resume();
			theResume = resumeService.load(resumeId);
			theResume.setName(name);
			theResume.setPosition(position);
			theResume.setDegree(degree);
			theResume.setSex(sex);
			theResume.setEmail(email);
			theResume.setSchool(school);
			theResume.setIs_study(is_study);
			date=sdf.parse(gra_time);System.out.println(date);
			theResume.setGra_time(date);
			theResume.setMajor(major);
			theResume.setPhone(phone);
			theResume.setSkill(skill);
			System.out.println(JSON.toJSONString(theResume));
			resumeService.update(theResume);
			dataMap=new HashMap<String, Object>();
			dataMap.put("code", 1);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			dataMap.put("code", 0);
			
			e.printStackTrace();
		}finally{
			json=JSONObject.fromObject(dataMap);
			return SUCCESS;
		}
	}
	
	//添加简历xjh
		@SuppressWarnings("finally")
		public String addResume() {
			try {
				System.out.println(resumeId+","+name+","+sex+","+is_study+","+gra_time);
				Employee employee=(Employee)session.getAttribute("loginEmployee");
				Resume theResume =new Resume();
				theResume.setEmployee(employee);
				theResume.setName(name);
				theResume.setPosition(position);
				theResume.setDegree(degree);
				theResume.setSex(sex);
				theResume.setEmail(email);
				theResume.setSchool(school);
				theResume.setIs_study(is_study);
				date=sdf.parse(gra_time);System.out.println(date);
				theResume.setGra_time(date);
				theResume.setMajor(major);
				theResume.setPhone(phone);
				theResume.setSkill(skill);
				theResume.setFile_name("");
				theResume.setStatus(0);
				theResume.setPicture(picture);
				System.out.println(JSON.toJSONString(theResume));
				resumeService.addResume(theResume);
				dataMap=new HashMap<String, Object>();
				dataMap.put("code", 1);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				dataMap=new HashMap<String, Object>();
				dataMap.put("code", 0);
				
				e.printStackTrace();
			}finally{
				json=JSONObject.fromObject(dataMap);
				return SUCCESS;
			}
		}
	
	//删除简历xjh
	public String resumeDelete(){
		Resume res=resumeService.load(resid);
			recommendService.resumeIdDelete(resid);
			resumeService.delete(res);
			dataMap=new HashMap<String, Object>();
			dataMap.put("code", 1);
			
		
		json=JSONObject.fromObject(dataMap);
		return SUCCESS;
		
	}
	//批量删除xjh
	public String resumeDeleteAll(){
		for(int i :resids){
			Resume res=resumeService.load(i);
			recommendService.resumeIdDelete(i);
			resumeService.delete(res);
			dataMap=new HashMap<String, Object>();
			dataMap.put("code", 1);
		}
		
		json=JSONObject.fromObject(dataMap);
		return SUCCESS;
		
		
	}
	
	public Resume getResume() {
		return resume;
	}

	public void setResume(Resume resume) {
		this.resume = resume;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	
	public IResumeService getResumeService() {
		return resumeService;
	}

	@Resource
	public void setResumeService(IResumeService resumeService) {
		this.resumeService = resumeService;
	}

	
	
	public Recommend getRecommend() {
		return recommend;
	}
	
	public void setRecommend(Recommend recommend) {
		this.recommend = recommend;
	}
	
	
	public IRecommendService getRecommendService() {
		return recommendService;
	}
	@Resource
	public void setRecommendService(IRecommendService recommendService) {
		this.recommendService = recommendService;
	}

	public List<Resume> getResumes() {
		return resumes;
	}

	public void setResumes(List<Resume> resumes) {
		this.resumes = resumes;
	}
	
	

	public int getResid() {
		return resid;
	}

	public void setResid(int resid) {
		this.resid = resid;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public Map<String, Object> getDataMap() {
		return dataMap;
	}

	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public JSONObject getJson() {
		return json;
	}

	public void setJson(JSONObject json) {
		this.json = json;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getDegree() {
		return degree;
	}

	public void setDegree(String degree) {
		this.degree = degree;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public int getIs_study() {
		return is_study;
	}

	public void setIs_study(int is_study) {
		this.is_study = is_study;
	}

	
	public int getResumeId() {
		return resumeId;
	}

	public void setResumeId(int resumeId) {
		this.resumeId = resumeId;
	}

	public String getGra_time() {
		return gra_time;
	}

	public void setGra_time(String gra_time) {
		this.gra_time = gra_time;
	}

	public SimpleDateFormat getSdf() {
		return sdf;
	}

	public void setSdf(SimpleDateFormat sdf) {
		this.sdf = sdf;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getSkill() {
		return skill;
	}

	public void setSkill(String skill) {
		this.skill = skill;
	}

	public int[] getResids() {
		return resids;
	}

	public void setResids(int[] resids) {
		this.resids = resids;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	
	
	
}
