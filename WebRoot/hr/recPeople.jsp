<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>应聘人员</title>
	<link rel="stylesheet" type="text/css" href="../dist/css/wangEditor.css">
	<link rel="stylesheet" type="text/css" href="../css/jquery.datetimepicker.css" >
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
	.btn:hover{
		background-color:#c52d2f;
		border-color: #c52d2f;
		}
	}
	a:hover{
			cursor: pointer;
		}
	body{
		background-color: #f4f4f4;
	}
	
	ul li{
		text-decoration: none;
		cursor: pointer;
	}
	ul{
		margin-left: 30px;
		margin-top:20px;
	}
	li{
		margin-top:5px;
	}
	th,td{
	width:140px;}
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
  	
  	<div  class="container" style="background-color: white;width:100%;margin-top:125px;height:475px;">
	    <div class="information" style="background-color: white;">
        	<div class="table_cont">
        		<div class="container" ng-app="recPeople" ng-controller="recPeopleContrellor" style="margin-top: 10px;background-color: #fff;border-radius:10px;">
				  	<div style="color:black;font-size:26px;text-align: center;font-weight:bold;font-family:'楷体';margin:10px 0;">
				    	<span>应聘人员</span>
				    </div>
				  	
				  	<div class="content">
			  			<div class="form-group">
						    <select class="form-control" style="width:200px;display:inline;" ng-model="status">
						    	<option value="-2">全部</option>
						    	<option value="-1">未审核</option>
						    	<option value="0">未通过筛选</option>
						    	<option value="1">通过筛选</option>
						    	<option value="2">安排其他需求</option>
						    	<option value="3">初试中</option>
						    	<option value="4">已淘汰</option>
						    	<option value="5">终面中</option>
						    	<option value="6">未通过初试</option>
						    	<option value="7">通过终面</option>
						    	<option value="8">未通过终面</option>
						    	<option value="9">已入职</option>
						    	<option value="10">未入职</option>
						    </select>
						    <button class="btn " ng-click="show(1)" >筛选</button>
				  		</div>
				  		<table class="table table-hover">
							<thead>
								<tr>
									<th>姓名</th>
									<th>申请岗位</th>
									<th>状态</th>
									<th>学历</th>
									<th>联系电话</th>
									<th>电子邮箱</th>
									<th style="width:180px;">详情</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody ng-repeat="recommend in recommendList" >
								<tr>
									<td ng-bind="recommend.resume.name"></td>
									<td ng-bind="recommend.resume.position"></td>
									<td>
										<span ng-if="recommend.status==-1">未审核</span>
										<span ng-if="recommend.status==0">未通过筛选</span>
										<span ng-if="recommend.status==1">通过筛选</span>
										<span ng-if="recommend.status==2">安排其他需求</span>
										<span ng-if="recommend.status==3">初试中</span>
										<span ng-if="recommend.status==4">已淘汰</span>
										<span ng-if="recommend.status==5">终面中</span>
										<span ng-if="recommend.status==6">未通过初试</span>
										<span ng-if="recommend.status==7">通过终面</span>
										<span ng-if="recommend.status==8">未通过终面</span>
										<span ng-if="recommend.status==9">已入职</span>
										<span ng-if="recommend.status==10">未入职</span>
									</td>
									<td ng-bind="recommend.resume.degree"></td>
									<td ng-bind="recommend.resume.phone"></td>
									<td ng-bind="recommend.resume.email"></td>
									<td style="width:180px;">
										<button class="btn" data-toggle="modal" data-target="#myModal" ng-click="showDetail(recommend.id)" >详情</button>
										<a class="btn" style="" href="<%=path %>/files/resumes/{{recommend.resume.file_name}}" >下载简历</a>
									</td>
									<td>
										<div class="row">
											<div class="dropdown" style="margin-left:0px;position: right;display: inline">
												<button type="button" class="btn  dropdown-toggle" id="dropdownMenu1" 
														data-toggle="dropdown">
													操作
													<span class="caret"></span>
												</button>
												<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
													<li role="presentation" ng-if="recommend.status==-1">
														<a role="menuitem" tabindex="-1" ng-click="changeStatus(recommend.id,1,1)" >通过筛选</a>
													</li>
													<li role="presentation" ng-if="recommend.status==-1">
														<a role="menuitem" tabindex="-1" ng-click="changeStatus(recommend.id,0,0)" >未通过筛选</a>
													</li>
													<li role="presentation" ng-if="recommend.status==1">
														<a role="menuitem" tabindex="-1" ng-click="changeStatus(recommend.id,3,0)" >初试</a>
													</li>
													<li role="presentation" ng-if="recommend.status==1">
														<a role="menuitem" tabindex="-1" ng-click="changeStatus(recommend.id,4,0)" >淘汰</a>
													</li>
													<li role="presentation" ng-if="recommend.status==1">
														<a role="menuitem" tabindex="-1" ng-click="changeStatus(recommend.id,2,0)" >安排其他岗位</a>
													</li>
													<li role="presentation"  ng-if="recommend.status==3">
														<a role="menuitem" tabindex="-1" ng-click="changeStatus(recommend.id,5,2)">初试通过</a>
													</li>
													<li role="presentation"  ng-if="recommend.status==3">
														<a role="menuitem" tabindex="-1" ng-click="changeStatus(recommend.id,6,0)">初试不过</a>
													</li>
													<li role="presentation"  ng-if="recommend.status==5">
														<a role="menuitem" tabindex="-1" ng-click="changeStatus(recommend.id,7,2)">终面通过</a>
													</li>
													<li role="presentation"  ng-if="recommend.status==5">
														<a role="menuitem" tabindex="-1" ng-click="changeStatus(recommend.id,8,0)" >终面不过</a>
													</li>
													<li role="presentation"  ng-if="recommend.status==7">
														<a role="menuitem" tabindex="-1" ng-click="changeStatus(recommend.id,9,2)">入职</a>
													</li>
													<li role="presentation"  ng-if="recommend.status==7">
														<a role="menuitem" tabindex="-1" ng-click="changeStatus(recommend.id,10,0)" >未入职</a>
													</li>
												</ul>
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
				  		
				  		<div class="floor" style="margin-left:69%;">
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
				        
				  		<!-- 模态框（Modal） -->
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
											&times;
										</button>
										<h4 class="modal-title" id="myModalLabel">
											简历详情
										</h4>
									</div>
									<div class="modal-body">
										<div class="right_content" style="margin-top:20px;">
							  				<div class="row" style="margin-top:20px;">
												<div class="col-md-6 col-sm-6">
													<label>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</label>
													<span ng-bind="recommendDetail.resume.name"></span>
												</div>
												<div class="col-md-6 col-sm-6">
													<label>申请岗位：</label>
													<span ng-bind="recommendDetail.resume.position"></span>
												</div>
											</div>
											<div class="row" >
												<div class="col-md-6 col-sm-6">
													<label>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label>
													<span ng-bind="recommendDetail.resume.sex"></span>
												</div>
												<div class="col-md-6 col-sm-6">
													<label>学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;历：</label>
													<span ng-bind="recommendDetail.resume.degree"></span>
												</div>
											</div>
											<div class="row" >
												<div class="col-md-6 col-sm-6">
													<label>毕业学校：</label>
													<span ng-bind="recommendDetail.resume.school"></span>
												</div>
												<div class="col-md-6 col-sm-6">
													<label>是否在读：</label>
													<span ng-if="recommendDetail.resume.is_study==0" >已毕业</span>
													<span ng-if="recommendDetail.resume.is_study==1" >在读</span>
												</div>
											</div>
											<div class="row" >
												<div class="col-md-6 col-sm-6">
													<label>毕业时间：</label>
													<span ng-bind="recommendDetail.resume.gra_time.year+1900+'年'+(recommendDetail.resume.gra_time.month+1)+'月'+recommendDetail.resume.gra_time.date+'日'"></span>
												</div>
												<div class="col-md-6 col-sm-6">
													<label>专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业：</label>
													<span ng-bind="recommendDetail.resume.major"></span>
												</div>
											</div>
											<div class="row" >
												<div class="col-md-6 col-sm-6">
													<label>联系电话：</label>
													<span ng-bind="recommendDetail.resume.phone"></span>
												</div>
												<div class="col-md-6 col-sm-6">
													<label>电子邮箱：</label>
													<span ng-bind="recommendDetail.resume.email"></span>
												</div>
											</div>
											<div class="row" >
												<div class="col-md-6 col-sm-6">
													<label>推&nbsp;&nbsp;荐&nbsp;&nbsp;者：</label>
													<span ng-bind="recommendDetail.resume.employee.realname"></span>
												</div>
												<div class="col-md-6 col-sm-6">
													<label>状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态：</label>
													<span ng-if="recommendDetail.status==-1">未审核</span>
													<span ng-if="recommendDetail.status==0">未通过筛选</span>
													<span ng-if="recommendDetail.status==1">通过筛选</span>
													<span ng-if="recommendDetail.status==2">安排其他需求</span>
													<span ng-if="recommendDetail.status==3">初试中</span>
													<span ng-if="recommendDetail.status==4">已淘汰</span>
													<span ng-if="recommendDetail.status==5">终面中</span>
													<span ng-if="recommendDetail.status==6">未通过初试</span>
													<span ng-if="recommendDetail.status==7">通过终面</span>
													<span ng-if="recommendDetail.status==8">未通过终面</span>
													<span ng-if="recommendDetail.status==9">已入职</span>
													<span ng-if="recommendDetail.status==10">未入职</span>
												</div>
											</div>
											<div class="row" >
												<div class="col-md-6 col-sm-6">
													<label>备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</label>
													<span ng-bind="recommendDetail.note"></span>
												</div>
											</div>
											<div class="row" >
												<div class="col-md-6 col-sm-6">
													<label>特&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;长：</label>
													<span ng-bind="recommendDetail.resume.skill"></span>
												</div>
											</div>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-success" data-dismiss="modal">
											关闭
										</button>
									</div>
								</div><!-- /.modal-content -->
							</div><!-- /.modal -->
				  		</div>
				  		
				  	</div>
				  </div>
        	</div>
      	</div>
    </div>
  
    <section id="bottom" style="background: white;padding: 0px 0;">
        
    </section>
    	
 	<footer id="footer" class="midnight-blue" style="">
        <div class="container" >
            <div class="row">
                <div class="col-sm-6">
                       Copyright &copy; 2017 码客工作室 版权所有.
                </div>
            </div>
        </div>
    </footer>
  
  
  
  
  
  
  
  <script src="../js/jQuery-2.1.4.min.js"></script>
  <script src="../js/bootstrap.min.js"></script>
  <script src="../js/angular.min.js"></script>
  <script type="text/javascript" src="../js/sweet-alert.js"></script>
  <script type="text/javascript">
  	var recruitContrellor = angular.module('recPeople', []);
     	recruitContrellor.controller('recPeopleContrellor', ["$filter","$scope","$http",function($filter,$scope ,$http) {
   	 	$scope.status=-2;
   	 	var url=window.location.search;
    	var id=url.split("=")[1];
   	 	//得到建立详情
   	 	$scope.show=function(pageNo){
    		$http(
					{
			        url : '<%=path%>/hr/recommendAction!recmmendPeople',
					method : 'post',
					params:{
						'recruitid':id,
						'pageNo':pageNo,
						'status':$scope.status
					}
				}).success(function(data) {
					console.log(data.recommendList);
					$scope.recommendList=data.recommendList.list;
					$scope.page=data.recommendList;
					shownum($scope.page.pageNo,$scope.page.totalPage);
				}).error(function(data, status, headers, config) {
					alert("false");
				});
    	};
    	
    	$scope.show(1);
    	
    	$scope.showDetail=function(recommendId){
    		$http(
					{
			        url : '<%=path%>/hr/recommendAction!recommendDetail',
					method : 'post',
					params:{
						'recommendId':recommendId,
					}
				}).success(function(data) {
					console.log(data.recommend);
					$scope.recommendDetail=data.recommend;
				}).error(function(data, status, headers, config) {
					alert("false");
				});
    	};
    	
    	//改变状态
    	$scope.changeStatus=function(recommendId,status,score){
    		$http(
					{
			        url : '<%=path%>/hr/recommendAction!changeStatus',
					method : 'post',
					params:{
						'recommendId':recommendId,
						'status':status,
						'score':score
					}
				}).success(function(data) {
					console.log(data);
					if(data.code==0){
						swal("操作失败", "操作失败!", "error");
					}else if(data.code==1){
						swal("操作成功", "操作成功!", "success");
						$scope.show($scope.page.pageNo);
					}
				}).error(function(data, status, headers, config) {
					alert("false");
				});
    	};
    	
    	$scope.download=function(id){
    		$http(
					{
			        url : '<%=path%>/hr/recommendAction!exportResume',
					method : 'post',
					params:{
						'id':id
					}
				}).success(function(data) {
				}).error(function(data, status, headers, config) {
					alert("false");
				});
    	};
    	
    	$scope.exportResume=function(id){
    		$http(
					{
			        url : '<%=path %>/recruitAction!exportResume',
					method : 'post',
					params:{
						'id':id,
					}
				}).success(function(data) {
					alert("success");
				}).error(function(data, status, headers, config) {
					alert("false");
				});
    	}
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
   	 	
   	 	function changecolor(elem){
   	 		elem.style.color="#530b92";
   	 	}
  </script>
  </body>
</html>
