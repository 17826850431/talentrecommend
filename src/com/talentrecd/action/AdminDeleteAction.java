package com.talentrecd.action;

import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.talentrecd.model.Employee;
import com.talentrecd.model.Hr;
import com.talentrecd.service.IDepartmentService;
import com.talentrecd.service.IEmployeeService;
import com.talentrecd.service.IHrService;
import com.talentrecd.util.BaseAction;


@Controller("adminDeleteAction")
@Scope("prototype")
public class AdminDeleteAction extends BaseAction{
	
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
     private JSONObject json;
     private String department;
     private Map<String, Object> dataMap;
     @Autowired
     IHrService hrService;
     @Autowired 
     IEmployeeService employeeService;
     @Autowired
     IDepartmentService departmentService;
     
     @SuppressWarnings("finally")
	public String deleteEmployee()
     {
    	 dataMap=new HashMap<String, Object>();
    	 try{
    	 employeeService.deleteEmployee(id);
    	 dataMap.put("code", 1);
		}catch (Exception e) {
			dataMap.put("code",0);
			e.printStackTrace();
		} 
 	 finally{
 			json=JSONObject.fromObject(dataMap);	
 			return SUCCESS; 
 	 }
     }
     
     @SuppressWarnings("finally")
	public String deleteHr()
     {
    	 dataMap=new HashMap<String, Object>();
    	 try{
    	
    	 hrService.deleteHr(id);
    	 dataMap.put("code", 1);
		}catch (Exception e) {
			dataMap.put("code",0);
			e.printStackTrace();
		} 
    	 finally{
    			json=JSONObject.fromObject(dataMap);	
    			return SUCCESS; 
    	}
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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
