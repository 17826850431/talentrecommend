<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>个人信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
 <link href="<%=path %>/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=path %>/css/font-awesome.min.css" rel="stylesheet">
    <link href="<%=path %>/css/prettyPhoto.css" rel="stylesheet">
    <link href="<%=path %>/css/animate.min.css" rel="stylesheet">
    <link href="<%=path %>/css/main.css" rel="stylesheet">
    <link href="<%=path %>/css/responsive.css" rel="stylesheet">
    <script src="<%=path %>/js/jQuery-2.1.4.min.js"></script>
    <script src="<%=path %>/js/angular.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/sweet-alert.css" >
	<script type="text/javascript" src="js/sweet-alert.js"></script>
    
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="<%=path %>/images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="<%=path %>/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="<%=path %>/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="<%=path %>/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="<%=path %>/images/ico/apple-touch-icon-57-precomposed.png">
	<style type="text/css">
		.container2{
			margin-top: 10px;
			background-color: #fff;
			border-radius:10px;
			width:60%;
			text-align: center;
		}
		.row{
			margin-top:6px;
		}
		
	</style>
  </head>
 	
  <body>
  <div class="page-wrap">
      <header id="header">
        <div class="top-bar">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-xs-4">
                    <div class="top-number"><p><i class="fa fa-phone-square"></i>  +0123 456 70 90</p></div>
                    </div>
                    <div class="col-sm-6 col-xs-8">
                       <div class="social">
                           <ul class="social-share">
                           <%if(session.getAttribute("loginEmployee")!=null){ %>
						      <li class="dropdown active">
                                 <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="line-height:25px"><i class="fa fa-user"></i></a>
                                  <ul class="dropdown-menu" style="text-align: center;background-color: black;">
                                      <li ><a href="<%=path %>/admin/personInfo.jsp" style="width: 180px;">个人设置</a></li>
		                              <li ><a href="<%=path %>/login.jsp" style="width: 180px;">注销</a></li>
                                 </ul>
                                </li>
						      	<%}else{ 
						      	request.getRequestDispatcher("../login.jsp").forward(request, response);%>
						      	<li >
						      	<a href="login.jsp" style="width:40px">登录 </a>
						      	</li>
						      	<%} %>
                                
                            </ul>
                            &nbsp;&nbsp;&nbsp;
                            <div class="search" ng-click="search()">
                                <form role="form" >
                                    <input type="text" class="search-form" autocomplete="off" placeholder="搜索" id="search">
                                    <i class="fa fa-search"></i>
                                </form>
                           </div>
                            
                            
                       </div>
                    </div>
                </div>
            </div><!--/.container-->
        </div><!--/.top-bar-->

        <nav class="navbar navbar-inverse" role="banner">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" ><img src="<%=path%>/images/logo.png" alt="logo" style="max-height:65px;min-width:116px;"></a>
                </div>
                
                <div class="collapse navbar-collapse navbar-right">
                    <ul class="nav navbar-nav">
                       <li><a href="index.jsp">首页</a></li>
                        <li><a href="<%=path %>/admin/admin_emergency.jsp">紧急招聘</a></li>
                        <li><a href="<%=path %>/admin/admin_normal.jsp">普通招聘</a></li>
                        <li><a href="<%=path %>/admin/admin_resume.jsp">简历库</a></li>
                        <li ><a href="<%=path %>/admin/admin_employee.jsp">教职工</a></li> 
                        <li><a href="<%=path %>/admin/admin_hr.jsp">人事部</a></li>
                                             
                    </ul>
                </div>
            </div><!--/.container-->
        </nav><!--/nav-->
        
    </header><!--/header-->
     <div class="container2" ng-app="personInfo" ng-controller="personInfoContrellor" style="overflow:auto;height:450px;width:100%">
  		<div class="content">
	  		<div class="form-group">
	  			<label> 用  户  名：  </label><input class="form-control" id="username"   name="username" required type="text" style="display:inline;width:30%;" disabled="disabled"><br>
	  		</div>
	  		<div class="form-group">
	  			<label> *真实姓名：  </label><input class="form-control" id="realname"  name="realname" required type="text" style="display:inline;width:30%;"><br>
	  		</div>
	  		
	  		 
	  		
	  		<!-- <div class="form-group">
	  			<label> 性 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：  </label><input class="form-control" id="sex" value="{{hr.sex}}" name="username" required type="text" style="display:inline;width:30%;"><br>
	  		</div> -->
  			<div class="form-group">
	  			<label>*原 密 码：</label><input class="form-control"  name="oldpassword" required type="password" style="display:inline;width:30%;" /><br>
	  		</div>
	  		<div class="form-group">
	  			<label>修改密码：</label><input class="form-control"  name="newpassword" required type="password" style="display:inline;width:30%;"><br>
	  		</div>
	  		<div class="form-group">
	  			<label>重复密码：</label><input class="form-control"  name="newpasswordSec" required type="password" style="display:inline;width:30%;"><br>
	  		</div>
	  		<div class="form-group" >
	    		<label>*性 &nbsp;&nbsp;&nbsp;&nbsp;别：</label>
	    		<select class="form-control"  id="sex" required style="display:inline;width:30%;" >
		    		<option>男</option>
		    		<option>女</option>
	    		</select><br>
	    	</div>
	  		<div class="form-group">
	  			<label>*电子邮箱：</label><input class="form-control" id="email"   name="email" required type="email" style="display:inline;width:30%;"><br>
	  		</div>
	  		<div class="form-group">
	  			<input class="form3-control" id="score" ng-model="emp.score"  name="score" required type="text" style="display:inline;width:30%;" disabled="disabled"><br>
	  			
	  		</div>
	  		<div class="form-group">
	  		</div>
	  		<!-- <div class="form-group">
	  			<label>联系方式：</label><input class="form-control"  name="username" required type="text" style="display:inline;width:40%;"><br>
	  		</div> -->
	  		<div class="form-group" style="margin-bottom: 10px;">
	    		<button id="buttom" class="btn btn-primary"  ng-click="update()"  type="submit" style="padding:8px 20px;">确认修改</button>
	    	</div>
  		</div>
  		
  		
  		
    </div>
    </div>
    
     <div class="site-footer">
    <section id="bottom" style="background: white;padding: 10px 0;">
        
    </section><!--/#bottom-->
    	
 <footer id="footer" class="midnight-blue" style="bottom:0px;">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                      Copyright &copy; 2017 码客工作室 版权所有.
                </div>
                
            </div>
        </div>
    </footer>
    </div>
    
    <script src="<%=path %>/js/jQuery-2.1.4.min.js"></script>
  	<script src="<%=path %>/js/bootstrap.min.js"></script>
  	<script src="<%=path %>/js/angular.min.js"></script>
    <script type="text/javascript">
    	var personInfoContrellor = angular.module('personInfo', []);
     	personInfoContrellor.controller('personInfoContrellor', ["$filter","$scope","$http",function($filter,$scope ,$http) {
      	  $scope.show=function(){
      	  	 $http(
					{
			        url : '<%=path%>/user/employeeAction!personInfo',
					method : 'post',
				}).success(function(data) {
					console.log(data.employee);
					$scope.emp=data.employee;
				}).error(function(data, status, headers, config) {
					alert("false");
				});
      	  };
      	  
      	  $scope.detail=function(){
      	  	 $http(
					{
			        url : '<%=path%>/scoreAction!scorelist',
					method : 'post',
				}).success(function(data) {
					console.log(data.employee);
					$scope.scorelist=data.scorelist;
				}).error(function(data, status, headers, config) {
					alert("false");
				});
      	  };
      	  
      	  $scope.show();
      	  
      	  $scope.update=function(){
      	  	  if($scope.newpassword!=$scope.newpasswordSec){
      	  	  	swal("信息有误", "两次密码不一致", "error");
      	  	  	return false;
      	  	  }
      	  	  var email=document.getElementById("email").value;
      	  	  var username=document.getElementById("username").value;
      	  	  var realname=document.getElementById("realname").value;
      	  	  var sex=document.getElementById("sex").value;
      	  	 if(email==''||email==null){
      	  	  	swal("信息有误", "电子邮箱不能为空!", "error");
      	  	  	return false;
      	  	  }
      	  	  var patt = new RegExp("^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$");
      	  	  if(!patt.test(email)){
      	  	  	swal("信息有误", "邮箱格式不正确!", "error");
      	  	  	return false;
      	  	  }
      	  	  if(realname==''||realname==null){
      	  	  	swal("信息有误", "真实姓名不能为空!", "error");
      	  	  	return false;
      	  	  }
      	  	  if(sex==''||sex==null){
      	  	  	swal("信息有误", "性别不能为空！", "error");
      	  	  	return false;
      	  	  }
      	  	  if(username==''||username==null){
      	  	  	swal("信息有误", "用户名不能为空！", "error");
      	  	  	return false;
      	  	  }
	      	  $http(
					{
			        url : '<%=path%>/user/employeeAction!updateInfo',
					method : 'post',
					params:{
						'password':$scope.oldpassword,
						'newPassword':$scope.newpassword,
						'email':email,
						'username':username,
						'realname':realname,
						'sex':sex
					}
				}).success(function(data) {
					console.log(data.code);
					if(data.code==-1){
						swal("信息有误", data.message, "error");
					}else if(data.code==1){
						$scope.emp=data.employee;
						swal({
							title: "修改成功!",
							confirmButtonText:"确认",
							closeOnConfirm: false,
							showLoaderOnConfirm: true,
							type:"success",
							text:"You clicked the button!",
							html: true
						},function(s){
						   if(s==true){
						     location.reload();
						   }
						});
					}
				}).error(function(data, status, headers, config) {
					alert("false");
				});
      	  };
    	   
     }]);
    </script>
  </body>
</html>
