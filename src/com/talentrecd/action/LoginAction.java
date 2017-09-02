package com.talentrecd.action;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.talentrecd.model.Admin;
import com.talentrecd.model.Employee;
import com.talentrecd.model.Hr;
import com.talentrecd.service.IAdminService;
import com.talentrecd.service.IEmployeeService;
import com.talentrecd.service.IHrService;
import com.talentrecd.util.BaseAction;

@Controller("loginAction")
@Scope("prototype")
public class LoginAction extends BaseAction{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Autowired 
	private IHrService hrService;
	@Autowired
	private IEmployeeService employeeService;
	
	@Autowired 
	private IAdminService adminService; 
	
	private String username;
	private String password;
	private Map<String, Object> dataMap;  
	private JSONObject json;
	private int type;//0 管理员 1Hr 2普通员工
	
	public String login() throws ServletException, IOException{
		if(type==0){
			Admin admin=adminService.login(username,password);
			if(admin!=null){
				session.setAttribute("admin", admin );
				response.sendRedirect("http://119.23.238.197:80/talentrecommend/admin/admin_emergency.jsp");
				return "admin_success";
		}else{
			ActionContext.getContext().put("message", "用户名或者密码错误");
			return "fail";
		}
		}
		else if(type==1){
			Hr hr=hrService.login(username,password);
			if(hr!=null){
//				ActionContext.getContext().getSession().put("hr", hr);
				session.setAttribute("hr", hr );
				response.sendRedirect("http://119.23.238.197:80/talentrecommend/hr/postRecruit.jsp");
				return "hr_success";
			}else{
				ActionContext.getContext().put("message", "用户名或者密码错误");
				return "fail";
			}
		}else{
			Employee employee =employeeService.login(username,password);
			if(employee!=null){
//				ActionContext.getContext().getSession().put("hr", hr);
				session.setAttribute("loginEmployee", employee );
				response.sendRedirect("http://119.23.238.197:80/talentrecommend/user/emergency.jsp");
				return "employee_success";
			}else{
				ActionContext.getContext().put("message", "用户名或者密码错误");
				return "fail";
			}		
		}
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

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}
	
	/*public String Login(){
		System.out.println("进入了登录。。。。。");
		 try {
			UsernamePasswordToken token = new UsernamePasswordToken(username, MD5Util.MD5Encode(password, null));
			Subject currentUser = SecurityUtils.getSubject();  
            if (!currentUser.isAuthenticated()){
                //使用shiro来验证  
                token.setRememberMe(true);  
                currentUser.login(token);//验证角色和权限  
            } 
		 } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			dataMap=new HashMap<String, Object>();
			dataMap.put("success", true);
			json=JSONObject.fromObject(dataMap);
			return SUCCESS;
	}
	
	 public String logout() {   
	        Map<String, Object> result = new HashMap<String, Object>();
	        result.put("success", true);
	        Subject currentUser = SecurityUtils.getSubject();       
	        currentUser.logout();    
	        return JSON.toJSONString(result);
	    }  
*/
	
	
}
