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
import com.talentrecd.model.Hr;
import com.talentrecd.model.Recruit;
import com.talentrecd.model.bean.RecruitBean;
import com.talentrecd.service.IRecruitService;
import com.talentrecd.util.BaseAction;
import com.talentrecd.util.FileUtil;
import com.talentrecd.util.Pagination;

@Controller("recruitAction")
@Scope("prototype")
public class RecruitAction extends BaseAction{
	@Autowired
	private IRecruitService recruitService;
	private int emergent;
	private Map<String, Object> dataMap;  
	private JSONObject json;
	private Recruit recruit;
	private String recruitString;
	private String keyword;
	private int recruitId;
	private int pageNo;
	private String text;
	private FileUtil fileUtil=new FileUtil();
	
	/**
	 * cy edit
	 * @return
	 */
	//招聘信息详情
	public String recruitDetail() throws IOException{
		recruit=recruitService.recruitOne(recruitId);
		System.out.println(JSON.toJSONString(recruit));
		String description = fileUtil.readDesFile(recruit.getDescription());
		String requirement=fileUtil.readReqFile(recruit.getRequirement());
		recruit.setDescription(description);
		recruit.setRequirement(requirement);
		System.out.println(JSON.toJSONString(recruit));
		dataMap=new HashMap<String, Object>();
		dataMap.put("recruit", recruit);
		json=JSONObject.fromObject(dataMap);
		return SUCCESS;
	}
	
	public String recruitEnd(){
		try {
			recruitService.recruitEnd(recruitId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String recruitList(){
		try {
			Pagination<RecruitBean> list=recruitService.recruitByPage(pageNo,keyword);
			dataMap=new HashMap<String, Object>();
			dataMap.put("RecruitBeanList", list );
			json=JSONObject.fromObject(dataMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	
	public String myRecruitList(){
		Hr hr=(Hr)session.getAttribute("hr");
		Pagination<RecruitBean>  list=recruitService.recruitList(hr.getId(),pageNo,keyword);
		System.out.println(JSON.toJSONString(list));
		dataMap=new HashMap<String, Object>();
		dataMap.put("RecruitBeanList", list );
		json=JSONObject.fromObject(dataMap);
		return SUCCESS;
	}
	
	//不用了。
	public String updateRecruit(){
//		JSONObject jsonObject = JSONObject.fromObject(recruitString);
		try {
			Recruit recruit=(Recruit)JSON.parseObject(recruitString,Recruit.class);
			System.out.println(JSON.toJSONString(recruit));
			
			Recruit recruit2=recruitService.recruitOne(recruit.getId());
			
			String desFilename=recruit2.getDescription();
			fileUtil.descriptionFile(recruit.getDescription(), desFilename);
			
			String reqFilename=recruit2.getRequirement();
			fileUtil.requirementFile(recruit.getRequirement(), reqFilename);
			
			recruit.setRequirement(reqFilename);
			recruit.setDescription(desFilename);
			recruitService.updateRecruit(recruit);
			
			dataMap=new HashMap<String, Object>();
			json=JSONObject.fromObject(dataMap);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * cy edit
	 * @return
	 */
	
	//所有招聘xjh
	public String recruitlist() throws IOException{
			List<Recruit> list=recruitService.recruitlist(emergent);
			dataMap=new HashMap<String, Object>();
			dataMap.put("recruits", list );
			json=JSONObject.fromObject(dataMap);
			return SUCCESS;
	}
		
	public String getRecruitlist() throws IOException{
		Pagination<Recruit> list=recruitService.recruitByPage(emergent,pageNo,text);
		dataMap=new HashMap<String, Object>();
		dataMap.put("recruits", list );
		json=JSONObject.fromObject(dataMap);
		return SUCCESS;
}
	/**
	 * xujiahui edit
	 * @return
	 */
	
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
	public Recruit getRecruit() {
		return recruit;
	}
	public void setRecruit(Recruit recruit) {
		this.recruit = recruit;
	}
	public String getRecruitString() {
		return recruitString;
	}
	public void setRecruitString(String recruitString) {
		this.recruitString = recruitString;
	}

	public int getRecruitId() {
		return recruitId;
	}

	public void setRecruitId(int recruitId) {
		this.recruitId = recruitId;
	}

	public IRecruitService getRecruitService() {
		return recruitService;
	}

	public void setRecruitService(IRecruitService recruitService) {
		this.recruitService = recruitService;
	}

	public int getEmergent() {
		return emergent;
	}

	public void setEmergent(int emergent) {
		this.emergent = emergent;
	}

	public FileUtil getFileUtil() {
		return fileUtil;
	}

	public void setFileUtil(FileUtil fileUtil) {
		this.fileUtil = fileUtil;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}
	
	
}
