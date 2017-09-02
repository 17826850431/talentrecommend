package com.talentrecd.action;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.mail.MessagingException;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.talentrecd.model.Employee;
import com.talentrecd.model.Hr;
import com.talentrecd.model.Recommend;
import com.talentrecd.model.Recruit;
import com.talentrecd.model.Resume;
import com.talentrecd.service.IRecommendService;
import com.talentrecd.service.IRecruitService;
import com.talentrecd.service.IRecommendService;
import com.talentrecd.service.IResumeService;
import com.talentrecd.util.BaseAction;
import com.talentrecd.util.Pagination;
import com.talentrecd.util.SendMailUtil;

@Controller("recommendAction")
@Scope("prototype")
public class RecommendAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	private Recommend recommend;
	private Resume resume;
	private Recruit recruit;
	private int pageNo;
	private int recid;
	private int resumeid;
	private int recruitid;
	private int score;
	@Autowired
	private IRecommendService recommendService;
	@Autowired
	private IResumeService resumeService;
	@Autowired
	private IRecruitService recruitService;
	private Pagination<Recommend> recommends;
	private Map<String, Object> dataMap;  
	private String result;
	private JSONObject json;
	private int empid;
	private int status;
	private String recommendIds;
	private int recommendId;
	private int hrId;
	private String text;
	private int[] resumeids;//批量
	private int[] recommendids;
	private Employee employee;
	
	//cy edit
	public String changeStatus(){
		dataMap=new HashMap<String, Object>();
		try {
			Hr hr=(Hr) session.getAttribute("hr");
			recommendService.updateRecommend(recommendId,status,score);
			Recommend recommend = recommendService.load(recommendId);
			dataMap.put("code", 1);
			SendMailUtil.sendMail(hr.getEmail(),recommend.getResume().getEmployee().getEmail(), "有新消息了", recommend.getResume().getName()+"简历有了新的进展");
		} catch (Exception e) {
			dataMap.put("code", 0);
			dataMap.put("mgs", "更新数据有误");
			e.printStackTrace();
		}
		json=JSONObject.fromObject(dataMap);
		return SUCCESS;
	}
		
	public String recommendList(){
		Hr hr=(Hr) session.getAttribute("hr");
		Pagination<Recommend> list=recommendService.recommendList(hr.getId(), pageNo, status);
		dataMap=new HashMap<String, Object>();
		dataMap.put("recommendList", list);
		json=JSONObject.fromObject(dataMap);
		return SUCCESS;
	}
	
	//hr推荐简历给其他hr
	public String pushResume(){
		recommendService.updateRecommend(recommendIds, hrId, recruitid);
		return SUCCESS;
	}
	
	//显示某个简历的应聘人员
	public String recmmendPeople(){
		System.out.println(status);
		Pagination<Recommend> list=recommendService.recmmendPeople(recruitid,pageNo,status);
		dataMap=new HashMap<String, Object>();
		dataMap.put("recommendList", list);
		json=JSONObject.fromObject(dataMap);
		return SUCCESS;
	}
	
	public String recommendDetail(){
		Recommend recommend=recommendService.recommendDetail(recommendId);
		dataMap=new HashMap<String, Object>();
		dataMap.put("recommend", recommend);
		json=JSONObject.fromObject(dataMap);
		return SUCCESS;
	}
		
		//cy edit

		//批量删除xjh
		public String recommendDeleteAll(){
			for(int i:recommendids){
				Recommend rec=recommendService.load(i);
				if(rec!=null){
					recommendService.delete(rec);
				}
			}
			return SUCCESS;
		}
		
	
	
	
	//个人推荐进度查询xjh
		
			
		public String recommendlist(){
			employee=(Employee)session.getAttribute("loginEmployee");
			recommends=recommendService.recommendlist(employee.getId(),pageNo,text);
			dataMap=new HashMap<String, Object>();
			dataMap.put("recommendlist", recommends);
			json=JSONObject.fromObject(dataMap);
			return SUCCESS;
		}
		
		public String recommendDelete(){
			Recommend rec=recommendService.load(recid);
			if(rec!=null){
				recommendService.delete(rec);
			}
			return SUCCESS;
		}
		
		//推荐xjh
		public String recommendAdd() throws MessagingException{
				dataMap=new HashMap<String, Object>();
				if(recommendService.ever_Recommend(resumeid, recruitid)==0){
					employee=(Employee)session.getAttribute("loginEmployee");
					String postAddress=employee.getEmail();
					recruit = recruitService.load(recruitid);
					String getAddress = recruit.getHr().getEmail();
					resume = resumeService.load(resumeid);
					resume.setStatus(1);
					recommend = new Recommend();
					recommend.setRecruit(recruit);
					recommend.setResume(resume);
					recommend.setStatus(-1);
					recommend.setEmp_id(resume.getEmployee().getId());
					recommend.setHr_id(recruit.getHr().getId());
					
					recommendService.add(recommend);
					int j=SendMailUtil.sendMail(postAddress, getAddress, "通过这次的检查 发现了有很大的问题，请尽快处理，收到请回复。通过这次的检查 发现了有很大的问题，请尽快处理，收到请回复。通过这次的检查 发现了有很大的问题，请尽快处理，收到请回复。通过这次的检查 发现了有很大的问题，请尽快处理，收到请回复。通过这次的检查 发现了有很大的问题，请尽快处理，收到请回复。通过这次的检查 发现了有很大的问题，请尽快处理，收到请回复。通过这次的检查 发现了有很大的问题，请尽快处理，收到请回复。", "招聘职位名称为'"+recruit.getName()+"'的招聘有新的应聘人员，请前往查看！");
					System.out.println(j);
					if(j==1)
					{
					 dataMap.put("code", 2);  
					 json=JSONObject.fromObject(dataMap);
					}
					else
					{
					dataMap.put("code", 1);  
					json=JSONObject.fromObject(dataMap);
					}
				}else{

					dataMap.put("code",0);
					json=JSONObject.fromObject(dataMap);
				}
		     return SUCCESS;
		}
		//批量推荐xjh
		public String recommendAddAll() throws MessagingException{
			dataMap=new HashMap<String, Object>();
			try {
				for(int i :resumeids){
				
				if(recommendService.ever_Recommend(i, recruitid)==0){
					employee=(Employee)session.getAttribute("loginEmployee");
					String postAddress=employee.getEmail();
					recruit = recruitService.load(recruitid);
					String getAddress = recruit.getHr().getEmail();
					resume = resumeService.load(i);
					resume.setStatus(1);
					recommend = new Recommend();
					recommend.setRecruit(recruit);
					recommend.setResume(resume);
					recommend.setStatus(-1);
					recommend.setEmp_id(resume.getEmployee().getId());
					recommend.setHr_id(recruit.getHr().getId());
					recommendService.add(recommend);

					int j=SendMailUtil.sendMail(postAddress, getAddress, "通过这次的检查 发现了有很大的问题，请尽快处理，收到请回复。通过这次的检查 发现了有很大的问题，请尽快处理，收到请回复。通过这次的检查 发现了有很大的问题，请尽快处理，收到请回复。通过这次的检查 发现了有很大的问题，请尽快处理，收到请回复。通过这次的检查 发现了有很大的问题，请尽快处理，收到请回复。通过这次的检查 发现了有很大的问题，请尽快处理，收到请回复。通过这次的检查 发现了有很大的问题，请尽快处理，收到请回复。", "招聘职位名称为'"+recruit.getName()+"'的招聘有新的应聘人员，请前往查看！");
					System.out.println(j);
					if(j==1)
					{
					 dataMap.put("code", 2);  
					}
					else
					{
					dataMap.put("code", 1);  
					}
				}else{
					dataMap.put("code",0);
				}
				}
			} catch (Exception e) {
				dataMap.put("code",-1);
				e.printStackTrace();
			}finally
	    	{
	    		json=JSONObject.fromObject(dataMap);
	    	}
		     return SUCCESS;
		}


	public Recommend getRecommend() {
		return recommend;
	}

	public void setRecommend(Recommend recommend) {
		this.recommend = recommend;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	
	public IRecommendService getRecommendService() {
		return recommendService;
	}

	@Resource
	public void setRecommendService(IRecommendService recommendService) {
		this.recommendService = recommendService;
	}


	public Pagination<Recommend> getRecommends() {
		return recommends;
	}

	public void setRecommends(Pagination<Recommend> recommends) {
		this.recommends = recommends;
	}

	public int getRecid() {
		return recid;
	}

	public void setRecid(int recid) {
		this.recid = recid;
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

	public Resume getResume() {
		return resume;
	}

	public void setResume(Resume resume) {
		this.resume = resume;
	}

	public Recruit getRecruit() {
		return recruit;
	}

	public void setRecruit(Recruit recruit) {
		this.recruit = recruit;
	}

	public int getEmpid() {
		return empid;
	}

	public void setEmpid(int empid) {
		this.empid = empid;
	}

	public int getResumeid() {
		return resumeid;
	}

	public void setResumeid(int resumeid) {
		this.resumeid = resumeid;
	}

	public int getRecruitid() {
		return recruitid;
	}

	public void setRecruitid(int recruitid) {
		this.recruitid = recruitid;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getRecommendIds() {
		return recommendIds;
	}

	public void setRecommendIds(String recommendIds) {
		this.recommendIds = recommendIds;
	}

	public int getHrId() {
		return hrId;
	}

	public void setHrId(int hrId) {
		this.hrId = hrId;
	}

	public int getRecommendId() {
		return recommendId;
	}

	public void setRecommendId(int recommendId) {
		this.recommendId = recommendId;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public int[] getResumeids() {
		return resumeids;
	}

	public void setResumeids(int[] resumeids) {
		this.resumeids = resumeids;
	}

	public int[] getRecommendids() {
		return recommendids;
	}

	public void setRecommendids(int[] recommendids) {
		this.recommendids = recommendids;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}
	
	
	
}
