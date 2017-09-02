<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>招聘列表</title>
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
		  width:114px;
		}
	  </style>

  </head>
  
  <body ng-app="recruitList" ng-controller="recruitListContrellor">
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
						  <li class="active"><a href="<%=path %>/hr/recruitList.jsp">招聘列表</a></li>
					  </ul>
				  </div>
			  </div><!--/.container-->
		  </nav><!--/nav-->

	  </header><!--/header-->


	  <div  class="container" style="background-color: white;margin-top:114px;">
		  <div class="information" style="background-color: white;">

			  <div class="table_cont" >
			  	  <div style="color:black;font-size:26px;text-align: center;font-weight:bold;font-family:'楷体';margin:30px 0 20px 0;">
				    	<span>招聘列表</span>
				  </div>
				  
				  <table class="table table-hover" style="margin:5px 50px 0px -5px;align-content: center">
					  <thead>
						  <tr>
							  <th>编号</th>
							  <th>发布者</th>
							  <th>职位名称</th>
							  <th>部门</th>
							  <th>职能类别</th>
							  <th>工作地点</th>
							  <th>工作年限</th>
							  <th>状态</th>
							  <th>详情</th>
							  <th >操作</th>
						  </tr>
					  </thead>
					  <tbody  id="list">
						  <tr ng-repeat="recruit in RecruitBeanList">
							  <td ng-bind="recruit.recruitId"></td>
							  <td ng-bind="recruit.realname"></td>
							  <td ng-bind="recruit.name"></td>
							  <td ng-bind="recruit.depName"></td>
							  <td ng-bind="recruit.jobName"></td>
							  <td ng-bind="recruit.place"></td>
							  <td ng-bind="recruit.years"></td>
							  <td ng-switch="recruit.status">
								  <span ng-switch-when="0" >进行中</span>
								  <span ng-switch-when="1" style="color:#c52d2f" >已完成</span>
							  </td>
							  <td>
								  <button class="btn btn-default" data-toggle="modal" data-target="#myModal" ng-click="detail(recruit.recruitId)" >详情</button>
							  </td>
							  <td>
								  <button ng-if="recruit.status==0 && recruit.deadline.time > time"  class="btn btn-default"  data-toggle="modal" data-target="#pushModal" ng-click="showRecList(recruit.recruitId,recruit.hrId,1)"  >转推荐</button>
								  <button ng-if="recruit.deadline.time < time && recruit.status==0 " class="btn btn-default"  data-toggle="modal" data-target="#pushModal" disabled="disabled" data-toggle="tooltip" data-placement="right" title="已经过了截止时间" >转推荐</button>
								  <button ng-if="recruit.status==1 && recruit.deadline.time > time" class="btn btn-default"  data-toggle="modal" data-target="#pushModal" disabled="disabled" data-toggle="tooltip" data-placement="right" title="招聘已完成，不可转推荐" >转推荐</button>
								  <button ng-if="recruit.status==1 && recruit.deadline.time < time" class="btn btn-default"  data-toggle="modal" data-target="#pushModal" disabled="disabled" data-toggle="tooltip" data-placement="right" title="招聘已完成，不可转推荐" >转推荐</button>
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

      	<!-- 模态框（Modal） -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							招聘详情
						</h4>
					</div>
					<div class="modal-body">
						<div class="row" >
							<div class="col-md-6 col-sm-6">
								<label>编号：</label><span ng-bind="recruit.id"></span>
							</div>
							<div class="col-md-6 col-sm-6">
								<label>发布者：</label><span ng-bind="recruit.hr.username"></span>
							</div>
						</div>
						<div class="row" >
							<div class="col-md-6 col-sm-6">
								<label>职位名称：</label><span ng-bind="recruit.name"></span>
							</div>
							<div class="col-md-6 col-sm-6">
								<label>职能类别：</label><span ng-bind="recruit.job.name"></span>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6 col-sm-6">
								<label>部门：</label><span ng-bind="recruit.department.name"></span>
							</div>
							<div class="col-md-6 col-sm-6">
								<label>工作地点：</label><span ng-bind="recruit.place"></span>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12 col-sm-12">
								<label>发布时间：</label><span ng-bind="recruit.createdate.year+1900+'年'+recruit.createdate.month+'月'+recruit.createdate.day+'日'"></span>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12 col-sm-12">
								<label>岗位描述：</label>
								<div style="border: 1px solid #ccc;border-radius:4px;">
									<div id="description" style="width:90%; "></div>
								</div>
								<!-- <span ng-bind="recruit.description"></span> -->
							</div>
						</div>
						<div class="row">
							<div class="col-md-12 col-sm-12">
								<label>需求：</label>
								<div style="border: 1px solid #ccc;border-radius:4px;">
									<div id="requirement" style="width:90%;"></div>
								</div>
								
								<!-- <span ng-bind="recruit.requirement" ></span> -->
							</div>
						</div>
						<div class="row">
							<div class="col-md-12 col-sm-12">
								<label>特殊需求：</label><span ng-bind="recruit.spe_demand"></span>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6 col-sm-6" ng-switch="recruit.is_fte">
								<label>FTE/PTE：</label>
								<span ng-switch-when="0" >兼职</span>
								<span ng-switch-when="1" >全职</span>
							</div>
							<div class="col-md-6 col-sm-6" ng-switch="recruit.emergent">
								<label>是否紧急：</label>
								<span ng-switch-when="1">是 </span>
								<span ng-switch-when="0">否 </span>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6 col-sm-6">
								<label>工作年限：</label><span ng-bind="recruit.years"></span>
							</div>
							<div class="col-md-6 col-sm-6">
								<label>截止时间：</label><span ng-bind="recruit.deadline.year+1900+'年'+recruit.deadline.month+'月'+recruit.deadline.day+'日'" ></span>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-success" data-dismiss="modal">关闭
						</button>
						<!-- <button type="button" class="btn btn-primary">
							提交更改
						</button> -->
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>
    
    	<div  class="modal fade" id="pushModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" >
				<div class="modal-content">
					<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
								&times;
							</button>
							<h4 class="modal-title" id="myModalLabel">
								推荐人员
							</h4>
					</div>
					<table class="table table-hover" >
					<!-- <caption>悬停表格布局</caption> -->
						<thead>
							<tr>
								<th>
								<input type="checkbox" ng-model="jug" ng-click="select()">
								</th>
								<th>姓名</th>
								<th>技能</th>
								<th>学历</th>
								<th>专业</th>
								<th>联系方式</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody ng-repeat="recommend in recommendList">
							<tr>
								<th>
								<input type="checkbox" name="recommendId" value="{{recommend.id}}">
								</th>
								<td ng-bind="recommend.resume.name"></td>
								<td ng-bind="recommend.resume.skill"></td>
								<td ng-bind="recommend.resume.degree"></td>
								<td ng-bind="recommend.resume.major"></td>
								<td ng-bind="recommend.resume.phone"></td>
								<td>
									<button class="btn btn-info" ng-click="pushResume(recommend.id)">推荐</button>
								</td>
							</tr>
						</tbody>
					</table>
					
					<div  style="margin-right:10px;height:40px;">
                         <div class="mailbox-controls">
                             <div class="pull-right">
                                <span ng-bind="recPage.pageNo"></span> / <span ng-bind="recPage.totalPage"></span>
                                 <div class="btn-group">
                                     <a class="btn btn-default btn-sm" ng-click="showRecList(recruitId,hrId,recPage.prePage)"><</a>
                                     <a class="btn btn-default btn-sm" ng-click="showRecList(recruitId,hrId,recPage.nextPage)">></a>
                                 </div><!-- /.btn-group -->
                             </div><!-- /.pull-right -->
                         </div>
                    </div>
                    
					<div class="modal-footer">
						<button type="button" class="btn btn-warning" ng-click="pushResume(0)">
							批量推荐
						</button>
						<button type="button" class="btn btn-success" data-dismiss="modal">
							关闭
						</button>
					</div>
				</div>
			</div>
		</div>
    
    </div>
    <script src="../js/jQuery-2.1.4.min.js"></script>
  	<script src="../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
  	<script src="../js/angular.min.js"></script>
  	<script type="text/javascript" src="../js/sweet-alert.js"></script>
    <script type="text/javascript">
	$(function () { $("[data-toggle='tooltip']").tooltip(); });
    var recruitListContrellor = angular.module('recruitList', []);
      recruitListContrellor.controller('recruitListContrellor', ["$filter","$scope","$http",function($filter,$scope ,$http) {
    	$scope.recruitId="";
    	$scope.hrId="";
    	$scope.keyword="";
    	$scope.show=function(pageNo){
    		$http(
					{
			        url : '<%=path%>/hr/recruitAction!recruitList',
					method : 'post',
					params:{
		        		'pageNo':pageNo,
		        		'keyword':$scope.keyword,
		        	}
				}).success(function(data) {
					console.log(data.RecruitBeanList);
					$scope.RecruitBeanList=data.RecruitBeanList.list;
					var myDate = new Date();
					$scope.time=myDate.getTime();
					console.log($scope.time);
					$scope.page=data.RecruitBeanList;
					shownum($scope.page.pageNo,$scope.page.totalPage);
				}).error(function(data, status, headers, config) {
					alert("false");
				});
    	};
    	
    	$scope.show(1);
    	
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
		
		//显示详情
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
    	
    	//显示可以推荐的人
    	$scope.showRecList=function(recruitId,hrId,pageNo){
    		$scope.recruitId=recruitId;
    		$scope.hrId=hrId;
    		$http(
					{
			        url : '<%=path%>/hr/recommendAction!recommendList',
					method : 'post',
					params:{
						'pageNo':pageNo,
						'status':2
					}
				}).success(function(data) {
					console.log(data.recommendList);
					$scope.recommendList=data.recommendList.list;
					$scope.recPage=data.recommendList;
				}).error(function(data, status, headers, config) {
					alert("false");
				});
    	};
    	
    	//显示部门
    	$scope.department=function(){
    		$http(
					{
			        url : '<%=path%>/hr/departmentContrellor!depList',
					method : 'post',
				}).success(function(data) {
					console.log(data);
					$scope.departments=data.depList;
				}).error(function(data, status, headers, config) {
					alert("false");
				});
    	};
    	$scope.department();
    	
    	//推荐+批量推荐
    	$scope.pushResume=function(obj){
    	//0代表是批量操作，此时会执行selectWithdraw，selectnum就是所有的ID，每个ID以,分隔
    		if(obj==0){
    			selectWithdraw();
    			obj=selectnum;
    		}
    		$http(
    				{
    		          url : '<%=path%>/hr/recommendAction!pushResume',
					  method : 'post',
					  params:{
						'recommendIds': obj,
						'hrId':$scope.hrId,
						'recruitid':$scope.recruitId
					  }
    			}).success(function(data) {
    				$scope.showRecList($scope.recruitId,$scope.hrId,$scope.recPage.pageNo);
    				$(":checkbox").prop("checked",false);//取消全选
    			}).error(function(data, status, headers, config) {
    				alert("false");
    			});
    	};
    	
    	//部门筛选
    	$scope.selectDep=function(){
    		alert($scope.dep);
    	};
    	
    	//全选操作
		$scope.select=function(){
    	  if($scope.jug){
    		  $(":checkbox").prop("checked",true);//全选
    	  }else{
    		  $(":checkbox").prop("checked",false);//取消全选
    		  selectWithdraw();
    	  }
		};
		
		//得到全选时候的所有id，组成字符串
		var selectnum="";
		function selectWithdraw(){
			selectnum="";
			$("input[name=recommendId]:checked").each(
				function(){
					selectnum+=this.value+",";
				}
			);
		};
    
    }]);
    
    </script>
  </body>
</html>
