<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.talentrecd.model.Admin"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
  <head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
   <title><decorator:title /></title>
   <link href="<%=path %>/css/bootstrap.min.css" rel="stylesheet">
   <link href="<%=path %>/css/datepicker3.css" rel="stylesheet">
   <link href="<%=path %>/css/styles.css" rel="stylesheet">
   
  
   <!-- SET: FAVICON -->
   <link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" />
   <!-- END: FAVICON -->
   <!-- SET: STYLESHEET -->
   <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
   <!-- END: STYLESHEET -->
   <!-- SET: SCRIPTS -->
   <script type="text/javascript"></script>
   <!-- END: SCRIPTS -->
   <decorator:head />
</head>

<body>

<!-- wrapper starts -->
<div class="wrapper"> 
  
  <div style="position:fixed;z-index:3;width:100%"> 
  <!-- Header Starts -->
  <div class="header"  >
    <div class="header-container">
      <div class="logo"> <a href="#">人才推荐</a> </div>
      <div class="toll-free">
        <a href="#" onclick="clearSession()">退出 </a>
      </div>
       <div class="toll-free">
      	<%if(session.getAttribute("admin")!=null){ %>
      	欢迎&nbsp;<%=((Admin)session.getAttribute("admin")).getAdminname() %>
      	<%}else{ %>
      	<a href="login.jsp">登录 </a>
      	<%} %>
      </div>
      <div class="clear"></div>
    </div>
  </div>
  <!-- Header ends --> 
  
  <!-- Nav start -->
  <div class="nav" >
    <div class="nav-in">
      <ul>
        <li class="last" id="emergency"><a href="admin/emergency.jsp">紧急招聘</a></li>
        <li id="normal"><a href="admin/normal.jsp">普通招聘 </a></li>
        <li id="resume"><a href="admin/talent.jsp">简历库 </a></li>
        <li id="employee"><a href="admin/employee.jsp">员工信息</a></li>
        <li id="hr"><a href="admin/hr.jsp">HR信息 </a></li>
      </ul>
      <div class="clear"></div>
    </div>
  </div>
  </div>
  <div style="padding-top:120px;"> 
  <!-- Nav end --> 
  <decorator:body/>
  </div>
 </div>
<!-- wrapper ends -->
<script >
function clearSession()
{
  session.getAttribute("admin").value=null;
}
</script>
</body>
</html>