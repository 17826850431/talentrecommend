<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>个人信息</title>
    
	<link rel="stylesheet" type="text/css" href="../css/sweet-alert.css" >

	  <link href="../css/bootstrap.min.css" rel="stylesheet">
	  <link href="../css/font-awesome.min.css" rel="stylesheet">
	  <link href="../css/prettyPhoto.css" rel="stylesheet">
	  <link href="../css/animate.min.css" rel="stylesheet">
	  <link href="../css/main.css" rel="stylesheet">
	  <link href="../css/responsive.css" rel="stylesheet">

	  <!--[if lt IE 9]>
	  <script src="../js/html5shiv.js"></script>
	  <script src="../js/respond.min.js"></script>
	  <![endif]-->
	  <link rel="shortcut icon" href="images/ico/favicon.ico">
	  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../images/ico/apple-touch-icon-144-precomposed.png">
	  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../images/ico/apple-touch-icon-114-precomposed.png">
	  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../images/ico/apple-touch-icon-72-precomposed.png">
	  <link rel="apple-touch-icon-precomposed" href="../images/ico/apple-touch-icon-57-precomposed.png">

	<style type="text/css">
		.table{
			font-size: 14px;
		}
		.btn:hover{
			background-color: #c52d2f;
			border-color: #c52d2f;
		}
		a:hover{
			cursor: pointer;
		}
	</style>
  </head>
 	
  <body>
  	<header id="header">
        <div class="top-bar">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-xs-4">
                    </div>
                    <div class="col-sm-6 col-xs-8">
                       <div class="social">
                           <ul class="social-share">
                                <li class="dropdown active">
                                 <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i></a>
                                  <ul class="dropdown-menu" style="text-align: center;background-color: black;">
                                       <li ><a href="<%=path %>/hr/personInfo.jsp" style="width: 180px;">个人设置</a></li>
		                              <li ><a href="<%=path %>/login.jsp" style="width: 180px;">注销</a></li>
                                 </ul>
                                </li>
                            </ul>
                            <div class="search">
                                <form role="form">
                                    <input type="text" class="search-form" autocomplete="off" placeholder="搜索">
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
						  <li><a href="<%=path %>/index.jsp">首页</a></li>
						  <li ><a href="<%=path %>/hr/postRecruit.jsp">发布招聘</a></li>
						  <li ><a href="<%=path %>/hr/myRecruit.jsp">我的招聘</a></li>
						  <li ><a href="<%=path %>/hr/recruitList.jsp">招聘列表</a></li>
					  </ul>
				 </div>
            </div><!--/.container-->
        </nav><!--/nav-->
        
    </header><!--/header-->


 	<div  class="container" style="margin-top:130px;background-color: white;width:500px;">
    	<div class="information" style="margin-top:30px;background-color: white;">
	       	<div class="table_cont">
	             <div ng-app="personInfo" ng-controller="personInfoContrellor">
			  		<div class="content">
				  		<div class="form-group">
				  			<label> 用  户  名：  </label><input class="form-control" id="username" ng-model="hr.username"  name="username" required type="text" style="display:inline;width:300px;" disabled="disabled"><br>
				  		</div>
				  		<div class="form-group">
				  			<label> *真实姓名：  </label><input class="form-control" id="realname"  ng-model="hr.realname" name="realname" required type="text" style="display:inline;width:300px;"><br>
				  		</div>
				  		
				  		 
				  		
				  		<!-- <div class="form-group">
				  			<label> 性 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：  </label><input class="form-control" id="sex" value="{{hr.sex}}" name="username" required type="text" style="display:inline;width:30%;"><br>
				  		</div> -->
			  			<div class="form-group">
				  			<label>*原 密 码：</label><input class="form-control"  ng-model="oldpassword" name="oldpassword" required type="password" style="display:inline;width:300px;" /><br>
				  		</div>
				  		<div class="form-group">
				  			<label>修改密码：</label><input class="form-control" ng-model="newpassword"  name="newpassword" required type="password" style="display:inline;width:300px;"><br>
				  		</div>
				  		<div class="form-group">
				  			<label>重复密码：</label><input class="form-control"  ng-model="newpasswordSec" name="newpasswordSec" required type="password" style="display:inline;width:300px;"><br>
				  		</div>
				  		<div class="form-group" >
				    		<label>*性 &nbsp;&nbsp;&nbsp;&nbsp;别：</label>
				    		<select class="form-control" ng-model="hr.sex" id="sex" required style="display:inline;width:300px;" >
					    		<option>男</option>
					    		<option>女</option>
				    		</select><br>
				    	</div>
				  		<div class="form-group">
				  			<label>*电子邮箱：</label><input class="form-control" id="email"  ng-model="hr.email" name="email" required type="email" style="display:inline;width:300px;"><br>
				  		</div>
				  		<!-- <div class="form-group">
				  			<label>联系方式：</label><input class="form-control"  name="username" required type="text" style="display:inline;width:40%;"><br>
				  		</div> -->
				  		<div class="form-group" style="margin-bottom: 10px;">
				    		<button id="buttom" class="btn btn-primary"  ng-click="update()"  type="submit" style="padding:8px 20px;margin-left:140px;">确认修改</button>
				    	</div>
			  		</div>
			    </div>
	       	</div>
      	</div>
    </div>
   
      <div class="site-footer" style="position:fixed;bottom:0px;width:100%">    
    <section id="bottom" style="background: white;padding: 10px 0;">
        
    </section><!--/#bottom-->
    	
 	<footer id="footer" class="midnight-blue">
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
  	<script type="text/javascript" src="js/sweet-alert.js"></script>
    <script type="text/javascript">
    	var personInfoContrellor = angular.module('personInfo', []);
     	personInfoContrellor.controller('personInfoContrellor', ["$filter","$scope","$http",function($filter,$scope ,$http) {
      	  $scope.show=function(){
      	  	 $http(
					{
			        url : '<%=path%>/hr/hrContrellor!persoinInfo',
					method : 'post',
				}).success(function(data) {
					console.log(data.hr);
					$scope.hr=data.hr;
				}).error(function(data, status, headers, config) {
					alert("false");
				});
      	  };
      	  
      	  $scope.show();
      	  
      	  $scope.update=function(){
      	  	  if($scope.newpassword!=$scope.newpasswordSec){
      	  	  	swal("信息有误", "两次密码不一致!", "error");
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
			        url : '<%=path%>/hr/hrContrellor!updateInfo',
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
						$scope.hr=data.hr;
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
