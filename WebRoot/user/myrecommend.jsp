<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>我的推荐</title>
    
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
  <style>
  
  .table>thead>tr>th, .table>tbody>tr>th, .table>tfoot>tr>th, .table>thead>tr>td, .table>tbody>tr>td, .table>tfoot>tr>td {
    padding: 4px;
    line-height: 36px;
    vertical-align: top;
    border-top: 1px solid #ddd;
    }
  </style>
  </head>
  
  <body  >
    <div ng-app="userrecommend" ng-Controller="userrecommend">
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
            <div class="container" >
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
                        <li ><a href="<%=path %>/user/emergency.jsp">紧急招聘</a></li>
                        <li ><a href="<%=path %>/user/normal.jsp">普通招聘</a></li>
                        <li><a href="<%=path %>/user/resume.jsp">简历库</a></li>
                        <li class="active"><a href="<%=path %>/user/myrecommend.jsp">我的推荐</a></li> 
                                             
                    </ul>
                </div>
            </div><!--/.container-->
        </nav><!--/nav-->
        
    </header><!--/header-->
    
    <div  class="container" style="margin-top:150px;background-color: white;">
    	<div class="information" style="background-color: white;">
    		<button type="button" class="btn btn-danger" style="float:right;margin-right:20%" ng-click="recDeleteAll()">批量删除</button>
        	
        	<div class="table_cont">
            <table class="table table-hover" style="margin:5px 50px 0px -5px;align-content: center">
            	<thead>
	                <tr >
	                <td class="chess" style="padding-top:1%"><input type="checkbox" name="ifAll" id="ifAll" onClick="checkAll()"></td>
	                    <th >姓名</th>
	                    <th >推荐职位</th>
	                    <th >进度</th>
	                    <th >hr</th>
	                    <th >操作</th>
	                </tr>
                </thead>
                <tbody style="height:281px;">
	                <tr ng-repeat="rec in recommendlist">
	                	<td class="chess" style="padding-top:1%" ng-switch="rec.status">
	                
	                    	<input ng-switch-when="-1" type="checkbox" id={{rec.id}} disabled="disabled" >
	                    	<input ng-switch-when="1" type="checkbox" id={{rec.id}} disabled="disabled">
	                    	<input ng-switch-when="2" type="checkbox" id={{rec.id}} disabled="disabled">
	                    	<input ng-switch-when="3" type="checkbox" id={{rec.id}} disabled="disabled">
	                    	<input ng-switch-when="5" type="checkbox" id={{rec.id}} disabled="disabled" >
	                    	<input ng-switch-when="7" type="checkbox" id={{rec.id}} disabled="disabled" >
	                    	<input ng-switch-when="9" type="checkbox" id={{rec.id}} disabled="disabled" >			
	                    	<input ng-switch-default type="checkbox" name="selectFlag" id={{rec.id}}>
	                    </td>
	                
	                    <td >
	                    <button type="button" class="btn-link" ng-bind="rec.resume.name" data-toggle="modal" data-target="#resumedetail" ng-click="resumedetail(rec.resume.id)"></button>
	                    </td>
	                    <td>
	                    <button type="button" class="btn-link" ng-bind="rec.recruit.name" data-toggle="modal" data-target="#recruitdetail" ng-click="recruitdetail(rec.recruit.id)"></button>
	                    </td>
	                    <td ng-switch="rec.status">
	                    	<span style="color:red" ng-switch-when="-1">待处理</span>
	                    	<span style="color:red" ng-switch-when="0">未通过筛选</span>
	                    	<span ng-switch-when="1">通过筛选</span>
	                    	<span ng-switch-when="2">安排其他需求</span>
	                    	<span ng-switch-when="3">等待初试</span>
	                    	<span style="color:red" ng-switch-when="4">淘汰</span>
	                    	<span ng-switch-when="5">等待终面</span>
	                    	<span style="color:red" ng-switch-when="6">未通过初试</span>
	                    	<span ng-switch-when="7">通过终面，发放offer</span>
	                    	<span style="color:red" ng-switch-when="8">未通过终面</span>
	                    	<span ng-switch-when="9">已入职</span>
	                    	<span style="color:red" ng-switch-when="10">未入职</span>
	                    </td>
	                    <td ng-bind="rec.recruit.hr.username"></td>
	                    
	                    <td   ng-switch="rec.status">
	                    <div data-toggle="tooltip" title="该简历正在被hr处理中，不能被删除">
	                    	<button ng-switch-when="-1" type="button" class="btn btn-danger" disabled="disabled">删除</button>	
	                    	<button ng-switch-when="1" type="button" class="btn btn-danger" disabled="disabled" >删除</button>
	                    	<button ng-switch-when="2" type="button" class="btn btn-danger" disabled="disabled" >删除</button>
	                    	<button ng-switch-when="3" type="button" class="btn btn-danger" disabled="disabled">删除</button>
	                    	<button ng-switch-when="5" type="button" class="btn btn-danger" disabled="disabled">删除</button>
	                    	<button ng-switch-when="7" type="button" class="btn btn-danger" disabled="disabled">删除</button>
	                    	<button ng-switch-when="9" type="button" class="btn btn-danger" disabled="disabled">删除</button>	
        					</div>		
	                    	<button ng-switch-default type="button" class="btn btn-danger" ng-click="recDelete(rec.id)" >删除</button>
	                    </td>
	                    
	                </tr>
                </tbody>
            </table>
        	</div>
        	<div class="floor" style="margin-left:69%;">
            <ul id="index" class="pagination">
                <li><a ng-click="show(1)">&laquo;</a></li>
                <li><a class="page-pre" ng-click="show(page.prePage)">&lt;</a></li>
                <li><a id="one" ng-click="showinfo(1)"></a></li>
                <li><a id="two" ng-click="showinfo(2)"></a></li>
                <li><a id="three" ng-click="showinfo(3)"></a></li>
                <li class="page-pre"><a ng-click="show(page.nextPage)">&gt;</a></li>
                <li><a ng-click="show(page.totalPage)">&raquo;</a></li>
                <span style="font-size:15px;float:left">当前第<span style="color:#c52d2f">{{page.pageNo}}</span>页</span>/
                <span style="font-size:15px;">共<span style="color:#c52d2f">{{page.totalPage}}</span>页</span>
            </ul>
          
        </div>
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
     
      	<div class="modal fade" id="resumedetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
						<div class="row" >
							<div class="col-md-6 col-sm-6">
								<label>姓名：</label>
								<!-- <input class="form-control" style="display:inline;padding:0;width:auto;height:28px;" value="{{resume.name}}" ng-model="resume.name" > -->
								<span ng-bind="resume.name"></span>
							</div>
							<div class="col-md-6 col-sm-6">
								<label>职位：</label>
								<!-- <input class="form-control" style="display:inline;padding:0;width:auto;height:28px;" value="{{resume.position}}" ng-model="resume.position" > -->
								<span ng-bind="resume.position"></span>
							</div>
						</div>
						<div class="row" >
							<div class="col-md-6 col-sm-6">
								<label>性别：</label>
								<!-- <input class="form-control" style="display:inline;padding:0;width:auto;height:28px;" value="{{resume.sex}}" ng-model="resume.sex" > -->
								<span ng-bind="resume.sex"></span>
							</div>
							<div class="col-md-6 col-sm-6">
								<label>学位：</label>
								<!-- <input class="form-control" style="display:inline;padding:0;width:auto;height:28px;" value="{{resume.degree}}" ng-model="resume.degree" > -->
								<span ng-bind="resume.degree"></span>
							</div>
						</div>
						<div class="row" >
							<div class="col-md-6 col-sm-6">
								<label>毕业院校：</label>
								<!-- <input class="form-control" style="display:inline;padding:0;width:auto;height:28px;" value="{{resume.school}}" ng-model="resume.school" > -->
								<span ng-bind="resume.school"></span>
							</div>
							<div class="col-md-6 col-sm-6" ng-switch="resume.is_study">
								<label>是否在读：</label>
								<span ng-switch-when="0" >否</span>
								<span ng-switch-when="1" >是</span>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6 col-sm-6">
								<label>毕业时间：</label><span ng-bind="resume.gra_time.year+1900+'-'+((resume.gra_time.month)+1)+'-'+resume.gra_time.date"></span>
							</div>
							<div class="col-md-6 col-sm-6">
								<label>专业：</label>
								<!-- <input class="form-control" style="display:inline;padding:0;width:auto;height:28px;" value="{{resume.major}}" ng-model="resume.major" > -->
								<span ng-bind="resume.major"></span>
							</div>
						</div>
						<div class="row" >
							<div class="col-md-6 col-sm-6">
								<label>手机号码：</label>
								<!-- <input class="form-control" style="display:inline;padding:0;width:auto;height:28px;" value="{{resume.phone}}" ng-model="resume.phone" > -->
								<span ng-bind="resume.phone"></span>
							</div>
							<div class="col-md-6 col-sm-6">
								<label>邮箱：</label>
								<!-- <input class="form-control" style="display:inline;padding:0;width:auto;height:28px;" value="{{resume.email}}" ng-model="resume.email" > -->
								<span ng-bind="resume.email"></span>
							</div>
						</div>
						<div class="row" >
							<div class="col-md-12 col-sm-12">
								<label>专业技能：</label>
								<!-- <input class="form-control" style="display:inline;padding:0;width:auto;height:28px;" value="{{resume.skill}}" ng-model="resume.skill" > -->
								<span ng-bind="resume.skill"></span>
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
      	
      	<div class="modal fade" id="recruitdetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
								<label>发布时间：</label><span ng-bind="recruit.createdate.year+1900+'-'+((recruit.createdate.month)+1)+'-'+recruit.createdate.date"></span>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12 col-sm-12">
								<label>岗位描述：</label>
								<!-- <textarea class="form-control" rows="3"  value="{{recruit.description}}" ng-model="recruit.description"></textarea> -->
								<span id="description"></span>
							</div>
						</div>
						<div class="row" >
							<div class="col-md-12 col-sm-12">
								<label>需求：</label>
								<!-- <textarea class="form-control" rows="3"  value="{{recruit.requirement}}" ng-model="recruit.requirement"></textarea> -->
								<span id="requirement" ></span>
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
								<label>截止时间：</label><span ng-bind="recruit.deadline.year+1900+'年'+((recruit.deadline.month)+1)+'月'+recruit.deadline.day+'日'" ></span>
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
      	
    

      	<script src="<%=path %>/js/jQuery-2.1.4.min.js"></script>
	<script src="<%=path %>/js/bootstrap.min.js"></script>
	<script src="<%=path %>/js/angular.min.js"></script>
      	<script type="text/javascript">
    var userrecommend = angular.module('userrecommend', []);
    userrecommend.controller('userrecommend', ["$filter","$scope","$http",function($filter,$scope ,$http) {
    	$scope.checkedId=new Array();
    	var text="";
    	$scope.show = function(pageNo) {

    		$http(
    				{
    		        url : '<%=path%>/user/recommendAction!recommendlist',
    		        method : 'post',
    		        params:{
    		        	pageNo:pageNo,
    		        	text:text
    		        }
    			}).success(function(data) {
    				$scope.recommendlist=data.recommendlist.list;
    				//alert(data.recommendlist.totalPage);
    				$scope.page=data.recommendlist;
    				shownum($scope.page.pageNo,$scope.page.totalPage);
    				/* alert(JSON.stringify(data.userToDemandDTOlist.list)); */
    			}).error(function(data, status, headers, config) {
    				alert("false");
    			});
    	};
    	$scope.show(1);
    	
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
  	
    	
    	$scope.resumedetail=function(resumeId){
    		$http(
					{
			        url : '<%=path%>/user/resumeAction!resumeDetail',
					method : 'post',
					params:{
						'resid':resumeId
					}
				}).success(function(data) {
					console.log(data);
					$scope.resume=data.resume;
					
				}).error(function(data, status, headers, config) {
					alert("false");
				});
    	};
    	
    	$scope.resumedetail=function(resumeId){
    		$http(
					{
			        url : '<%=path%>/user/resumeAction!resumeDetail',
					method : 'post',
					params:{
						'resid':resumeId
					}
				}).success(function(data) {
					console.log(data);
					$scope.resume=data.resume;
					
				}).error(function(data, status, headers, config) {
					alert("false");
				});
    	};
    	
    	$scope.recruitdetail=function(recruitId){
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
    	}
    	
    	$scope.recDelete=function(recid){
    		swal({
  			  title: '确认删除该推荐？',
  			  text: '您将删除所选推荐',
  			  type: 'warning',
  			  showCancelButton: true,
  			  confirmButtonText: '确定',
  			  cancelButtonText: '取消',
  			},
  		function(isConfirm) {
  			  if (isConfirm) {
  				$http(
  						{
  				        url : '<%=path%>/user/recommendAction!recommendDelete',
  						method : 'post',
  						params:{
  							'recid':recid
  						}
  					}).success(function(data) {
  						
  							$scope.show();
  						
  					}).error(function(data, status, headers, config) {
  						alert("false");
  					});
      			  }  else {
  			    // Esc, close button or outside click
  			    // isConfirm is undefined
  			  }
  			});                  

    		
    	};
    	$scope.recDeleteAll=function(){
    		swal({
  			  title: '确认删除推荐？',
  			  text: '您将删除所选简推荐',
  			  type: 'warning',
  			  showCancelButton: true,
  			  confirmButtonText: '确定',
  			  cancelButtonText: '取消',
  			},
  		function(isConfirm) {
  			  if (isConfirm) {
  				var j = 0;
    			for (var i = 0; i < document.getElementsByName("selectFlag").length; i++) {
    					if(document.getElementsByName("selectFlag")[i].checked == true){
    						$scope.checkedId[j++] = document.getElementsByName("selectFlag")[i].id;
    					}
    			}
    		$http(
					{
			        url : '<%=path%>/user/recommendAction!recommendDeleteAll',
					method : 'post',
					params:{
						'recommendids':$scope.checkedId
					}
				}).success(function(data) {
					
						$scope.show();
					
				}).error(function(data, status, headers, config) {
					alert("false");
				});
      			  }  else {
  			    // Esc, close button or outside click
  			    // isConfirm is undefined
  			  }
  			});                  
  		

    			
    	};
    	
    }]);
    </script>
    <script type="text/javascript">
		function checkAll() {
  			for (var i = 0; i < document.getElementsByName("selectFlag").length; i++) {
   				document.getElementsByName("selectFlag")[i].checked = document.getElementById("ifAll").checked;
  			}
 		}
	</script>
    <script type="text/javascript">
    $(function () { $("[data-toggle='tooltip']").tooltip(); });
	</script>
    
  </body>
</html>
