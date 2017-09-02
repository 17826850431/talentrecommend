<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.talentrecd.model.Hr"%>
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
	   <link href="<%=path %>/css/emergency.css" > 
	  <%--  <link href="<%=path %>/css/bootstrap.min.css" rel="stylesheet"> --%>
	   <link href="<%=path %>/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
	   <link href="<%=path %>/css/datepicker3.css" rel="stylesheet">
	   <!-- SET: FAVICON -->
	   <link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" />
	   <!-- END: FAVICON -->
	   <!-- SET: STYLESHEET -->
	   <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
	   <!-- END: STYLESHEET -->
	   <!-- SET: SCRIPTS -->
	   <style type="text/css">
	   .nav-in ul li a:hover{
	   	 font-size: 18px;
	   }
	   </style>
	   <!-- END: SCRIPTS -->
	   <decorator:head />
</head>

<body style="padding-top:150px;">

<!-- wrapper starts -->
<div class="wrapper"> 
  <div style="position: fixed;width:100%;top:0;height:150px;z-index:3">
	  <!-- Header Starts -->
	  <div class="header">
	    <div class="header-container">
	      <div class="logo"> <a >人才推荐系统</a> </div>
	      <div class="toll-free">
	        <a href="#">退出 </a>
	      </div>
	       <div class="toll-free">
	      	<%if(session.getAttribute("hr")!=null){ %>
	      	<span style="color:#000">欢迎&nbsp;<%=((Hr)session.getAttribute("hr")).getUsername() %></span>
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
	      	<li></li>
	        <li ><a href="hr/postRecruit.jsp">发布招聘</a></li>
	        <li><a href="hr/myRecruit.jsp">我的招聘</a></li>
	        <li><a href="hr/recruitList.jsp">招聘列表</a></li>
	        <li ><a href="hr/personInfo.jsp">个人资料 </a></li>
	      </ul>
	      <div class="clear"></div>
	    </div>
	  </div>
	  <!-- Nav end --> 
  
  </div>
  
  <decorator:body/>
 </div>
<!-- wrapper ends -->
</body>

</html>
