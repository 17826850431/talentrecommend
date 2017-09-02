<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<title>我的招聘</title>
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
			color:#fff;
		}
		a:hover{
			cursor: pointer;
		}
		th,td
		{
		  width:107px;
		}
	</style>

  </head>
  
  <body ng-app="myRecruit" ng-controller="myRecruitContrellor">
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
						  <li class="active"><a href="<%=path %>/hr/myRecruit.jsp">我的招聘</a></li>
						  <li ><a href="<%=path %>/hr/recruitList.jsp">招聘列表</a></li>
					  </ul>
				  </div>

			  </div><!--/.container-->
		  </nav><!--/nav-->

	  </header><!--/header-->


	  <div  class="container" style="background-color: white;margin-top:114px;" >
		  <div class="information" style="background-color: white;">
				
			  <div class="table_cont">
			  	  <div style="color:black;font-size:26px;text-align: center;font-weight:bold;font-family:'楷体';margin:30px 0 20px 0;">
				    	<span>我的招聘</span>
				  </div>
				  <table class="table table-hover" style="margin:5px 50px 0px -5px;align-content: center">
					  <thead>
						  <tr>
							  <th>编号</th>
							  <th>职位名称</th>
							  <th>部门</th>
							  <th>职能类别</th>
							  <th>招聘人数</th>
							  <th>工作地点</th>
							  <th>工作年限</th>
							  <th>状态</th>
							  <th>详情</th>
							  <th style="width:170px;">操作</th>
						  </tr>
					  </thead>
					  <tbody id="list" >
						  <tr ng-repeat="recruit in RecruitBeanList">
							  <td ng-bind="recruit.recruitId"></td>
							  <td ng-bind="recruit.name"></td>
							  <td ng-bind="recruit.depName"></td>
							  <td ng-bind="recruit.jobName"></td>
							  <td ng-bind="recruit.number"></td>
							  <td ng-bind="recruit.place"></td>
							  <td ng-bind="recruit.years"></td>
							  <td ng-switch="recruit.status">
								  <span ng-switch-when="0" >进行中</span>
								  <span ng-switch-when="1" style="color:#c52d2f;">已完成</span>
							  </td>
							  <td>
							  	<a class="btn btn-default"  href="<%=path%>/hr/recruitDetail.jsp?id={{recruit.recruitId}}" >详情</a>
							  </td>
							  <td style="width:170px;">
								  
								  <a class="btn btn-default"  href="<%=path%>/hr/recPeople.jsp?id={{recruit.recruitId}}" >应聘人员</a>
								  <a class="btn btn-default"  ng-if="recruit.status==0" ng-click="recruitEnd(recruit.recruitId)" >完成</a>
								  <button class="btn btn-default disabled"  ng-if="recruit.status==1"  data-toggle="tooltip" data-placement="right" title="招聘已完成" >完成</button>
							  </td>
						  </tr>
					  </tbody>
				  </table>
			  </div>
		  </div>
	  </div>

	 <div class="floor" style="margin-left:60%;">
		  <ul class="pagination" id="index">
			  <li><a ng-click="show(1)">&laquo;</a></li>
			  <li class="page-pre"><a  ng-click="show(page.prePage)">&lt;</a></li>
			  <li><a id="one" ng-click="showinfo(1)"></a></li>
			  <li><a id="two" ng-click="showinfo(2)"></a></li>
			  <li><a id="three" ng-click="showinfo(3)"></a></li>
			  <li><a id="four" ng-click="showinfo(4)"></a></li>
			  <li><a id="five" ng-click="showinfo(5)"></a></li>
			  <li class="page-pre"><a ng-click="show(page.nextPage)">&gt;</a></li>
			  <li><a ng-click="show(page.totalPage)">&raquo;</a></li>
			  <span style="font-size:15px;float:left">当前第<span style="color:#c52d2f">{{page.pageNo}}</span>页</span>/
                <span style="font-size:15px;">共<span style="color:#c52d2f">{{page.totalPage}}</span>页</span>
		  </ul>
	  </div>

	  <section id="bottom" style="background: white;padding:0 0">

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



    <script src="../js/jQuery-2.1.4.min.js"></script>
  	<script src="../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
  	<script src="../js/angular.min.js"></script>
  	<script type="text/javascript" src="../js/sweet-alert.js"></script>
    <script type="text/javascript">
    $(function () { $("[data-toggle='tooltip']").tooltip(); });
     var myRecruitContrellor = angular.module('myRecruit', []);
     myRecruitContrellor.controller('myRecruitContrellor', ["$filter","$scope","$http",function($filter,$scope ,$http) {
      	  $scope.keyword="";
      	  $scope.show=function(pageNo){
      	  	$http(
					{
			        url : '<%=path%>/hr/recruitAction!myRecruitList',
					method : 'post',
					params:{
						'pageNo':pageNo,
						'keyword':$scope.keyword
					}
				}).success(function(data) {
					console.log(data.RecruitBeanList);
					$scope.RecruitBeanList=data.RecruitBeanList.list;
					$scope.page=data.RecruitBeanList;
					shownum($scope.page.pageNo,$scope.page.totalPage);
				}).error(function(data, status, headers, config) {
					alert("false");
				});
      	  };
      	  
      	  $scope.show(1);
      	  
      	  $scope.detail=function(recruitId){
	      	  $http(
					{
			        url : '<%=path%>/hr/recruitAction!recruitDetail',
					method : 'post',
					params:{
						'recruitId':recruitId
					}
				}).success(function(data) {
					console.log(data);
					$scope.recruit=data.recruit;
					var description=data.recruit.description;
					$('#description').html(description);
					var requirement=data.recruit.requirement;
					$('#requirement').html(requirement);
				}).error(function(data, status, headers, config) {
					alert("false");
				});
    	  };
    	  
    	 
    	  
    	$scope.recruitEnd=function(recruitId){
    		 swal({
					title: "确认完成？",
					showCancelButton: true,
					confirmButtonText:"确认",
					cancelButtonText:"取消",
					closeOnConfirm: false,
					showLoaderOnConfirm: true,
					html: true
				},function(s){
 					if(s==true){
 						$http({
					        url : '<%=path%>/hr/recruitAction!recruitEnd',
							method : 'post',
							params:{
								'recruitId':recruitId
							}
						}).success(function(data) {
							swal("成功", "招聘已完成!", "success");
							$scope.show($scope.page.pageNo);
						}).error(function(data, status, headers, config) {
							alert("false");
						});
	 				}
 				});
    	};
    	  
    	  //动态显示页码
		function shownum(pageNo,maxnum){
			var elem=document.getElementById("index");
			if(maxnum<=5){//4 1 
				for(var i=0;i<5;i++)
			 	{
					if(i<maxnum){
						elem.children[i+2].style.display="inline";
						elem.children[i+2].getElementsByTagName("a")[0].innerHTML=i+1;
					}else{
						elem.children[i+2].style.display="none";
					}
			 	}
			}else if(maxnum-pageNo<4){
				var j=0;
				for(var i=maxnum-4;i<maxnum;i++)
			 	{
			 		elem.children[2+j].getElementsByTagName("a")[0].innerHTML=i;
			 		j++;
			 	}
			 	elem.children[j+2].getElementsByTagName("a")[0].innerHTML=i;
			}else{
				for(var i=0;i<5;i++)
			 	{
			 		if(pageNo+i<=maxnum){
			 			 elem.children[i+2].style.display="inline";
			 			 elem.children[i+2].getElementsByTagName("a")[0].innerHTML=pageNo+i;
			 		}else{
			 			elem.children[i+2].style.display="none";
			 		}
			 	}
			}
		}
		
		//选择页码时显示相应页面内容
		$scope.showinfo=function(num){
			
			var elem=document.getElementById("index");
			var x=elem.children[1+num].getElementsByTagName("a")[0].innerHTML;
			$scope.show(x);
		};
    	   
     }]);
    </script>
    
  </body>
</html>
