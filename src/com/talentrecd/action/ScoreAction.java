package com.talentrecd.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.talentrecd.model.Employee;
import com.talentrecd.model.Score;
import com.talentrecd.service.IScoreService;
import com.talentrecd.util.BaseAction;

@Controller("scoreAction")
@Scope("prototype")
public class ScoreAction extends BaseAction {

	@Autowired
	private IScoreService scoreService;
	private List<Score> scoreList;
	
	private Map<String, Object> dataMap;  
	private String result;
	private JSONObject json;
	
	//查看积分详情xjh
		public String scorelist(){
			Employee employee=(Employee)session.getAttribute("loginEmployee");
			scoreList=scoreService.getScorelist(employee.getId());
			dataMap=new HashMap<String, Object>();
			dataMap.put("scorelist", scoreList);
			json=JSONObject.fromObject(dataMap);
			return SUCCESS;
		}

		public List<Score> getScoreList() {
			return scoreList;
		}

		public void setScoreList(List<Score> scoreList) {
			this.scoreList = scoreList;
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
		
		
}
