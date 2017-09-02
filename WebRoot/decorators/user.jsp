<%@page import="com.talentrecd.model.Employee"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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
   
   <!-- END: SCRIPTS -->
   <decorator:head />
</head>

<body>

<!-- wrapper starts -->
<div class="wrapper"> 
  
  <!-- Header Starts -->
  <div class="header">
    <div class="header-container">
      <div class="logo"> <a href="#">人才推荐</a> </div>
      <div class="toll-free">
        <a href="login.jsp">退出 </a>
      </div>
      <div class="toll-free">
      	<%if(session.getAttribute("loginEmployee")!=null){ %>
      	欢迎&nbsp;<%=((Employee)session.getAttribute("loginEmployee")).getRealname() %>
      	<%}else{ %>
      	<a href="login.jsp">登录 </a>
      	<%} %>
      </div>
      
      <div class="clear"></div>
    </div>
  </div>
  <!-- Header ends --> 
  
  <!-- Nav start -->
  <div class="nav">
    <div class="nav-in">
      <ul>
        <li class="last"><a href="user/emergency.jsp">紧急招聘</a></li>
        <li><a href="user/normal.jsp">普通招聘 </a></li>
        <li><a href="user/resume.jsp">简历库 </a></li>
        <li><a href="user/myrecommend.jsp">我的推荐 </a></li>
        <li><a href="user/personInfo.jsp">个人资料 </a></li>
      </ul>
      <div class="clear"></div>
    </div>
  </div>
  <!-- Nav end --> 
  <decorator:body/>
 </div>
<!-- wrapper ends -->
</body>
</html>
