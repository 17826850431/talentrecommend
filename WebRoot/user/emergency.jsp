<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>紧急招聘</title>
    
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
    <script src="<%=path %>/js/angular.min.js"></script><link rel="stylesheet" type="text/css" href="css/sweet-alert.css" >
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
  <style>
  
  .table>thead>tr>th, .table>tbody>tr>th, .table>tfoot>tr>th, .table>thead>tr>td, .table>tbody>tr>td, .table>tfoot>tr>td {
    padding: 4px;
    line-height: 36px;
    vertical-align: top;
    border-top: 1px solid #ddd;
    }


  </style>
  </head>
  
  <body ng-app="emerecruit" ng-Controller="emerecruit" >
  <div class="page-wrap">
      <header id="header">
        <div class="top-bar">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-xs-4">
                    </div>
                    <div class="col-sm-6 col-xs-8">
                       <div class="social">
                           <ul class="social-share">
                           <%if(session.getAttribute("loginEmployee")!=null){ %>
						      <li class="dropdown active">
                                 <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="line-height:25px"><i class="fa fa-user"></i></a>
                                  <ul class="dropdown-menu" style="text-align: center;background-color: black;">
                                      <li ><a href="<%=path %>/user/personInfo.jsp" style="width: 180px;">个人设置</a></li>
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
                    <a class="navbar-brand" ><img src="<%=path%>/images/logo.png"  alt="logo" style="max-height:65px;min-width:116px;"></a>
                </div>
                
                <div class="collapse navbar-collapse navbar-right">
                    <ul class="nav navbar-nav">
                         <li><a href="index.jsp">首页</a></li>
                        <li class="active"><a href="<%=path %>/user/emergency.jsp">紧急招聘</a></li>
                        <li ><a href="<%=path %>/user/normal.jsp">普通招聘</a></li>
                        <li><a href="<%=path %>/user/resume.jsp">简历库</a></li>
                        <li><a href="<%=path %>/user/myrecommend.jsp">我的推荐</a></li> 
                                             
                    </ul>
                </div>
            </div><!--/.container-->
        </nav><!--/nav-->
        
    </header><!--/header-->

 <div  class="container" style="margin-top:150px;background-color: white;">
    <div class="information" style="background-color: white;">
           
        	<div class="table_cont">
            <table class="table table-hover" style="margin:5px 50px 0px -5px;align-content: center">
              	<thead>
					<tr>
						<th>职位名称</th>
						<th>发布人</th>
						<th>部门</th>
						<th>职能类别</th>
						<th>招聘人数</th>
						<th>工作地点</th>
						<th>操作</th>
					</tr>
				</thead>
                <tbody id="list" style="line-height:30px;">
	                 <tr ng-repeat="recruit in recruitlist " >
	                  
	                    <td ng-bind="recruit.name"></td>
	                    <td ng-bind="recruit.hr.realname"></td>
						<td ng-bind="recruit.department.name"></td>
						<td ng-bind="recruit.job.name"></td>
						<td ng-bind="recruit.number"></td>
						<td ng-bind="recruit.place"></td>
						<td>
							<button  class="btn" style="border: 1px solid #F1F1F1;background-color:white;color:#c52d2f"  data-toggle="modal" data-target="#myModal" ng-click="detail(recruit.id)" ng-mouseover="change($index)" ng-mouseout="back($index)">查看</button>
							 <button id={{recruit.id}} class="btn " ng-if="recruit.deadline.time>myDate" style="border: 1px solid #F1F1F1;background-color:white;color:#c52d2f"  data-toggle="modal" data-target="#myModal2" ng-mouseover="change($index)" ng-mouseout="back($index)" ng-click="show2(recruit.id)">推荐</button>
							<span data-toggle="tooltip" data-placement="right" title="已经过了截止时间" ><button ng-if="recruit.deadline.time<myDate" class="btn" disabled="disabled" >推荐</button></span>
							 <!-- <button type="button" class="btn btn-success" ng-click="update(recruit.recruit_id)">修改</button>  -->
						</td>
                </tr>
                </tbody>
            </table>
        	</div>
      	</div>
    </div>
    
    <div class="floor" style="margin-left:60%;">
            <ul id="index" class="pagination" style="line-height: 34px" >
          
                <li><a  ng-click="show(1)">&laquo;</a></li>
                <li><a ng-click="show(page.prePage)" class="page-pre" >&lt;</a></li>
                <li><a ng-click="showinfo(1)" id="one">1</a></li>
                <li><a ng-click="showinfo(2)" id="two" >2</a></li>
                <li><a ng-click="showinfo(3)" id="three" >3</a></li>
                <li ng-click="show(page.nextPage)" class="page-pre"><a >&gt;</a></li>
                <li ng-click="show(page.totalPage)"><a >&raquo;</a></li>
                   <span style="font-size:15px;float:left">当前第<span style="color:#c52d2f">{{page.pageNo}}</span>页</span>/
                <span style="font-size:15px;">共<span style="color:#c52d2f">{{page.totalPage}}</span>页</span>
            </ul>
          
            
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
								<!-- <!-- <input class="form-control" style="display:inline;padding:0;width:auto;height:28px;" value="{{recruit.name}}" ng-model="recruit.name" > --> 
								<span ng-bind="recruit.name"></span>
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
								<!-- <input class="form-control" style="display:inline;padding:0;width:auto;height:28px;" value="{{recruit.place}}" ng-model="recruit.place" > -->
								<span ng-bind="recruit.place"></span>
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
								<!-- <textarea class="form-control" rows="3"  value="{{recruit.description}}" ng-model="recruit.description"></textarea> -->
								<div  style="border:1px solid #ccc;width:90%;border-radius:4px;" id="description"></div>
							</div>
						</div>
						<div class="row" >
							<div class="col-md-12 col-sm-12">
								<label>需求：</label>
								<!-- <textarea class="form-control" rows="3"  value="{{recruit.requirement}}" ng-model="recruit.requirement"></textarea> -->
								<div  style="border:1px solid #ccc;width:90%;border-radius:4px;" id="requirement"></div>
							</div>
						</div>
						<div class="row" >
							<div class="col-md-12 col-sm-12">
								<label>特殊需求：</label>
								<!-- <textarea class="form-control" rows="3"  value="{{recruit.spe_demand}}" ng-model="recruit.spe_demand"></textarea> -->
								<span ng-bind="recruit.spe_demand"></span>
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
								<!-- <input class="form-control" style="display:inline;padding:0;width:auto;height:28px;" value="{{recruit.years}}" ng-model="recruit.years" > -->
								<span ng-bind="recruit.years"></span>
							</div>
							<div class="col-md-6 col-sm-6">
								<label>截止时间：</label><span ng-bind="recruit.deadline.year+1900+'年'+recruit.deadline.month+'月'+recruit.deadline.day+'日'" ></span>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-success" data-dismiss="modal">关闭
						</button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>
		<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">我的简历库</h4>
            </div>
            <div class="modal-body">
            	<div class="table_cont">
            	<table class="table table-hover" align-content: center">
            	<tbody>
	                <tr ng-repeat="resume in resumelist">
	                    <td ng-switch="resume.status" class="chess" >
	                    <input ng-switch-when="0" type="checkbox"  name="selectFlag" id={{resume.id}}>
	                    <input ng-switch-when="1" type="checkbox"  name="selectFlag" id={{resume.id}} disabled="disabled">
	                    </td>
	                    <td ng-bind="resume.name"></td>
	                	<td ng-bind="resume.sex"></td>
	                	<td ng-bind="resume.major"></td>
	                	<td ng-switch="resume.status">
	                    	<span ng-switch-when="1"  style="color:red; ">已推荐</span>
	                    	<button ng-switch-when="0" type="button" class="btn btn-default"  ng-click="recommend(resume.id)">推荐</button>
	                    </td>
	                </tr>
	            </tbody>
	            </table>
	            </div>
            </div>
            <div class="modal-footer">
            <button type="button" class="btn btn-default" ng-click="recommendAll()">推荐</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
    </div>
	<!--  <script src="http://apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script> -->
    <!-- <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/jquery.isotope.min.js"></script>
    <script src="js/main.js"></script>
    <script src="js/wow.min.js"></script> -->
    <script src="<%=path %>/js/jQuery-2.1.4.min.js"></script>
	<script src="<%=path %>/js/bootstrap.min.js"></script>
	<script src="<%=path %>/js/angular.min.js"></script>
	<script type="text/javascript">
    var emerecruit = angular.module('emerecruit', []);
    emerecruit.controller('emerecruit', ["$filter","$scope","$http",function($filter,$scope ,$http) {
    	$scope.checkedId=new Array();
    	$scope.myrecruit;
    	$scope.myresume;
    	$scope.recruitId="";
    	$scope.hrId="";
    	var myDate=new Date();
    	$scope.myDate=myDate.getTime();
    	var text="";
    	$scope.show=function(pageNo){
    		$http(
					{
			        url : '<%=path%>/user/recruitAction!getRecruitlist',
					method : 'post',
					params:{
					  emergent:1,
		        		'pageNo':pageNo,
		        		"text":text
		        	}
				}).success(function(data) {
					$scope.recruits=data.recruits.list;
					$scope.bind($scope.recruits);
					$scope.page=data.recruits;
					shownum($scope.page.pageNo,$scope.page.totalPage);
				}).error(function(data, status, headers, config) {
					alert("false");
				});
    	};
    	
    	$scope.show(1);
    	$scope.bind=function(recruitlist)
    	{
    	  $scope.recruitlist=recruitlist;
    	};
    	//动态显示页码
		function shownum(pageNo,maxnum){
			var elem=document.getElementById("index");
			if(maxnum<=3){//4 1 
				for(var i=0;i<3;i++)
			 	{
					if(i<maxnum){
						elem.children[i+2].style.display="inline";
						elem.children[i+2].getElementsByTagName("a")[0].innerHTML=i+1;
					}else{
						elem.children[i+2].style.display="none";
					}
			 	}
			}else if(maxnum-pageNo<2){
				var j=0;
				for(var i=maxnum-2;i<maxnum;i++)
			 	{
			 		elem.children[2+j].getElementsByTagName("a")[0].innerHTML=i;
			 		j++;
			 	}
			 	elem.children[j+2].getElementsByTagName("a")[0].innerHTML=i;
			}else{
				for(var i=0;i<3;i++)
			 	{
			 		if(pageNo+i<=maxnum)
			 		{
			 			 elem.children[i+2].style.display="inline";
			 			 elem.children[i+2].getElementsByTagName("a")[0].innerHTML=pageNo+i;
			 		}
			 		else
			 		{
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
		
		$scope.search=function() 
	    {
	       text=document.getElementById("search").value;
	         $scope.show(1);
	     };
    	
    	
		$scope.detail=function(recruitId){
    		$http(
					{
			        url : '<%=path%>/user/recruitAction!recruitDetail',
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
    	}
		
		$scope.show2 = function(recruit) {
			$scope.myrecruit=recruit;
    		$http(
				{
		        url : '<%=path%>/user/resumeAction!resumelist',
		        method : 'post',
		        params:{
		        }
			}).success(function(data) {
				$scope.resumelist=data.resumes;
				/* alert(JSON.stringify(data.userToDemandDTOlist.list)); */
			}).error(function(data, status, headers, config) {
				alert("false");
			});
		};
		$scope.recommendAll=function(){
			var j = 0;
			for (var i = 0; i < document.getElementsByName("selectFlag").length; i++) {
					if(document.getElementsByName("selectFlag")[i].checked == true){
						$scope.checkedId[j++] = document.getElementsByName("selectFlag")[i].id;
					}
			}
			$http(
					{
			        url : '<%=path%>/user/recommendAction!recommendAddAll',
					method : 'post',
					params:{
						'resumeids': $scope.checkedId,
						'recruitid':$scope.myrecruit
					}
				}).success(function(data) {
					if(data.code==2){
						swal({
								title: "推荐成功，已通知hr!",
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
						
						
					}else if(data.code==1){
						swal("通知hr失败", "推荐成功，邮件发送失败", "error");
						$scope.show2($scope.myrecruit);
					
					}else{
						swal("推荐失败", "您已向该招聘推荐过该简历，请勿重复推荐", "error");
						$scope.show2($scope.myrecruit);
					}
					/* alert(JSON.stringify(data.userToDemandDTOlist.list)); */
				}).error(function(data, status, headers, config) {
					swal("信息有误", "推荐失败！", "error");
				});
		};
		
		$scope.recommend= function(resume){
			$scope.myresume=resume;
			$http(
					{
			        url : '<%=path%>/user/recommendAction!recommendAdd',
			        method : 'post',
			        params:{
			        	'resumeid':$scope.myresume,
			        	'recruitid':$scope.myrecruit
			        }
				}).success(function(data) {
					console.log(data);
					if(data.code==2){
						swal({
								title: "推荐成功，已通知hr!",
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
						
						
					}else if(data.code==1){
						swal("通知hr失败", "推荐成功，邮件发送失败", "error");
						$scope.show2($scope.myrecruit);
					
					}else{
						swal("推荐失败", "您已向该招聘推荐过该简历，请勿重复推荐", "error");
						$scope.show2($scope.myrecruit);
					}
					/* alert(JSON.stringify(data.userToDemandDTOlist.list)); */
				}).error(function(data, status, headers, config) {
					swal("信息有误", "推荐失败！", "error");
				});
		}
	
	}]);
	</script>
  </body>
</html>
