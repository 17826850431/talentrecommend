<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>我的招聘</title>
    	<link href="<%=path %>/css/emergency.css" >  
	<link href="<%=path %>/css/style.css" >  
   <link href="<%=path %>/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
	   <link href="<%=path %>/css/datepicker3.css" rel="stylesheet">
	   <!-- SET: FAVICON -->
	   <link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" />
	   <!-- END: FAVICON -->
	   <!-- SET: STYLESHEET -->
	   <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
	<style type="text/css">
		.container{
			margin-top: 10px;
			background-color: #fff;
			border-radius:10px;
		}
		.row{
			margin-top:6px;
		}
	</style>

  </head>
  
  <body>
    <div class="container" ng-app="myRecruit" ng-controller="myRecruitContrellor">
    	<div class="content">
    		<table class="table table-hover">
				<!-- <caption>悬停表格布局</caption> -->
				<thead>
					<tr>
						<th>职位名称</th>
						<th>部门</th>
						<th>职能类别</th>
						<th>招聘人数</th>
						<th>工作地点</th>
						<th>详情</th>
					</tr>
				</thead>
				<tbody ng-repeat="recruit in recruitList">
					<tr>
						<td ng-bind="recruit.name"></td>
						<td ng-bind="recruit.department.name"></td>
						<td ng-bind="recruit.job.name"></td>
						<td ng-bind="recruit.number"></td>
						<td ng-bind="recruit.place"></td>
						<td>
							<button class="btn btn-info" data-toggle="modal" data-target="#myModal" ng-click="detail(recruit.id)">详情</button>
							<!-- <a class="btn btn-success">应聘人员</a> -->
						</td>
					</tr>
				</tbody>
			</table>
    	</div>
    	
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
								<label>编号：</label>
								<span ng-bind="recruit.id"></span>
							</div>
							<div class="col-md-6 col-sm-6">
								<label>发布者：</label><span ng-bind="recruit.hr.username"></span>
							</div>
						</div>
						<div class="row" >
							<div class="col-md-6 col-sm-6">
								<label>职位名称：</label>
								<input class="form-control" style="display:inline;padding:0;width:auto;height:28px;" value="{{recruit.name}}" ng-model="recruit.name" >
								<!-- <span ng-bind="recruit.name"></span> -->
							</div>
							<div class="col-md-6 col-sm-6">
								<label>职能类别：</label>
								<span ng-bind="recruit.job.name"></span>
							</div>
						</div>
						<div class="row" >
							<div class="col-md-6 col-sm-6">
								<label>部门：</label><span ng-bind="recruit.department.name"></span>
							</div>
							<div class="col-md-6 col-sm-6">
								<label>工作地点：</label>
								<input class="form-control" style="display:inline;padding:0;width:auto;height:28px;" value="{{recruit.place}}" ng-model="recruit.place" >
								<!-- <span ng-bind="recruit.place"></span> -->
							</div>
						</div>
						<div class="row">
							<div class="col-md-12 col-sm-12">
								<label>发布时间：</label><span ng-bind="recruit.createdate.year+1900+'年'+(recruit.createdate.month+1)+'月'+recruit.createdate.date+'日'"></span>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12 col-sm-12">
								<label>岗位描述：</label>
								<textarea class="form-control" rows="3" id="description"   ng-model="recruit.description"></textarea>
								<!-- <span ng-bind="recruit.description"></span> -->
							</div>
						</div>
						<div class="row" >
							<div class="col-md-12 col-sm-12">
								<label>需求：</label>
								<textarea class="form-control" rows="3"  id="requirement"  ng-model="recruit.requirement"></textarea>
								<!-- <label>需求：</label><span ng-bind="recruit.requirement" ></span> -->
							</div>
						</div>
						<div class="row" >
							<div class="col-md-12 col-sm-12">
								<label>特殊需求：</label>
								<textarea class="form-control" rows="3"  value="{{recruit.spe_demand}}" ng-model="recruit.spe_demand"></textarea>
								<!-- <label>特殊需求：</label><span ng-bind="recruit.spe_demand"></span> -->
							</div>
						</div>
						<div class="row" >
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
								<label>工作年限：</label>
								<input class="form-control" style="display:inline;padding:0;width:auto;height:28px;" value="{{recruit.years}}" ng-model="recruit.years" >
								<!-- <span ng-bind="recruit.years"></span> -->
							</div>
							<div class="col-md-6 col-sm-6">
								<label>截止时间：</label><span ng-bind="recruit.deadline.year+1900+'年'+(recruit.deadline.month+1)+'月'+recruit.deadline.date+'日'" ></span>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-success" data-dismiss="modal">关闭
						</button>
						<button type="button" class="btn btn-primary" ng-click="change(recruit)">
							提交更改
						</button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>
    </div>
    <script src="<%=path %>/js/jQuery-2.1.4.min.js"></script>
  	<script src="<%=path %>/js/bootstrap.min.js"></script>
  	<script src="<%=path %>/js/angular.min.js"></script>
    <script type="text/javascript">
     var myRecruitContrellor = angular.module('myRecruit', []);
     myRecruitContrellor.controller('myRecruitContrellor', ["$filter","$scope","$http",function($filter,$scope ,$http) {
      	  $scope.show=function(){
      	  	$http(
					{
			        url : '<%=path%>/hr/recruitAction!myRecruitList',
					method : 'post',
				}).success(function(data) {
					/* console.log(data.recruitList); */
					$scope.recruitList=data.recruitList;
				}).error(function(data, status, headers, config) {
					alert("false");
				});
      	  };
      	  
      	  $scope.show();
      	  
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
    	  
    	  $scope.change=function(recruit){
    	  	console.log(recruit);
    	  	if(new Date().getTime()>=recruit.deadline.time){
    	  		alert("已经过了截止时间，不能再修改！");
    	  		return false;
    	  	}
			recruit.createdate=recruit.createdate.time;
			recruit.deadline=recruit.deadline.time;
    	  	$http(
					{
			        url : '<%=path%>/hr/recruitAction!updateRecruit',
					method : 'post',
					params:{
						'recruitString' : JSON.stringify(recruit),
					}
				}).success(function(data) {
					alert("修改成功");
				}).error(function(data, status, headers, config) {
					alert("false");
				});
    	  };
    	   
     }]);
    </script>
    
  </body>
</html>
