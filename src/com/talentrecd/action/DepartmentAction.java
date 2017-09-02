package com.talentrecd.action;

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
import com.talentrecd.model.Job;
import com.talentrecd.service.IDepartmentService;
import com.talentrecd.service.IJobService;

@Controller("departmentAction")
@Scope("prototype")
public class DepartmentAction extends ActionSupport{
	
	@Autowired
	private IDepartmentService departmentService;
	private Map<String, Object> dataMap;  
	private JSONObject json;
	
	public String depList(){
		List<Department> depList=departmentService.depList();
//		System.out.println(JSON.toJSON(depList));
		dataMap=new HashMap<String, Object>();
		dataMap.put("depList", depList );
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
	
}
