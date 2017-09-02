<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>简历库</title>
    
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
    <script src="<%=path %>/js/build/jquery.datetimepicker.full.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/jquery.datetimepicker.css"/ >
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
    .page-wrap {
  min-height: 507px;
  /* equal to footer height */
}
.media-object{
  width: 148px;
    height: 139px;
}

  </style>

  </head>
  
  <body ng-app="myresumes" ng-Controller="myresumes">
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
                   <a class="navbar-brand" ><img src="<%=path%>/images/logo.png" alt="logo" style="max-height:65px;min-width:116px;"></a>
                </div>
                
                <div class="collapse navbar-collapse navbar-right">
                    <ul class="nav navbar-nav">
                    <li><a href="index.jsp">首页</a></li>
                        <li ><a href="<%=path %>/user/emergency.jsp">紧急招聘</a></li>
                        <li ><a href="<%=path %>/user/normal.jsp">普通招聘</a></li>
                        <li class="active"><a href="<%=path %>/user/resume.jsp">简历库</a></li>
                        <li><a href="<%=path %>/user/myrecommend.jsp">我的推荐</a></li> 
                                             
                    </ul>
                </div>
            </div><!--/.container-->
        </nav><!--/nav-->
        
    </header><!--/header-->
    <div class="container"   style="margin-top:130px;background-color: white;">
    	<div class="information" style="background-color: white;">
    	    <button type="button" class="btn " style="float:right;margin-right:10%;color:red" ng-click="resumeDeleteAll()">批量删除</button>
    		<button type="button" class="btn " style="float:right;margin-right:2%" data-toggle="modal" data-target="#add">添加</button>
    		
    		
            <input type="checkbox" style="float:left" name="ifAll" id="ifAll" onClick="checkAll()">全选
            
        	<div class="team" style="padding-top:5%" ng-repeat="resume in resumelist" ng-if="$index%4==0">
        	<div class="row clearfix">
					<div class="col-md-4 col-sm-6" ng-if="resume!=null">	
						<div class="single-profile-top wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="300ms">
							<div class="media">
								<div class="pull-left">
									<img class="media-object" src="<%=path %>/files/images/{{resume.picture}}" alt="{{resume.name}}">
								</div>
								<div class="media-body">
								<div style="width:15px;height:15px;float:right" ng-switch="resume.status">
	                    	    <span data-toggle="tooltip" title="该简历已被推荐，不能被删除">
	                    	        <input ng-switch-when="1" type="checkbox" id={{resume.id}} disabled="disabled" >
	                            </span>
	                            <input ng-switch-when="0" type="checkbox" id={{resume.id}}  name="selectFlag">
	                            </div>
	                    
									<h4 ng-bind="resume.name"></h4>
									<h5>{{resume.sex}}&nbsp;&nbsp;&nbsp;&nbsp;{{resume.degree}}</h5>
									<ul class="tag clearfix" ng-switch="resume.status">
										<li ><button class="btn" data-toggle="modal" data-target="#detail" ng-click="detail(resume.id)" style="color:blue">详情</button></li>
										<li ><span data-toggle="tooltip" title="该简历已被推荐，不能被修改"><button class="btn" ng-switch-when="1" disabled="disabled">修改</button></span>
	                    	<button type="button"  style="color:blue" class="btn" ng-switch-when="0" data-toggle="modal" data-target="#update" ng-click="detail(resume.id)">修改</button>
	                    	<button ng-switch-when="0" style="color:red" class="btn " ng-click="resumeDelete(resume.id)">删除</button>
	                    	<span data-toggle="tooltip" title="该简历已被推荐，不能被删除">
	                    	<button ng-switch-when="1" type="button" class="btn" disabled="disabled" >删除</button></li>
										
									</ul>
									
									<ul class="social_icons" ng-switch="resume.file_name">
									
										<li><a href="javascript:void(0)" data-toggle="modal" data-target="#upload" ng-click="upload(resume)">上传简历</a></li>
										<li><span style="color:red" ng-switch-when="null">未上传 </span>
						<span style="color:red" ng-switch-when="">未上传 </span></li>
										<li><a ng-switch-default href="files/resumes/{{resume.file_name}}">下载简历</a></li> 
										
									</ul>
								</div>
							</div><!--/.media -->
							<p>{{resume.skill}}</p>
						</div>
					</div><!--/.col-lg-4 -->
					
					
					<div class="col-md-4 col-sm-6 col-md-offset-2" ng-if="resumelist[$index+1]!=null">	
						<div class="single-profile-top wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="300ms">
							<div class="media">
								<div class="pull-left">
									<a href="#"><img class="media-object" src="files/images/{{resumelist[$index+1].picture}}" alt=""></a>
								</div>
								<div class="media-body">
								<div style="width:15px;height:15px;float:right" ng-switch="resumelist[$index+1].status">
	                    	    <span data-toggle="tooltip" title="该简历已被推荐，不能被删除">
	                    	        <input ng-switch-when="1" type="checkbox" id={{resumelist[$index+1].id}} disabled="disabled" >
	                            </span>
	                            <input ng-switch-when="0" type="checkbox" id={{resumelist[$index+1].id}}  name="selectFlag">
	                            </div>
									<h4 ng-bind="resumelist[$index+1].name"></h4>
									<h5>{{resumelist[$index+1].sex}}&nbsp;&nbsp;&nbsp;&nbsp;{{resumelist[$index+1].degree}}</h5>
									<ul class="tag clearfix" ng-switch="resumelist[$index+1].status">
										<li ><button class="btn" data-toggle="modal" data-target="#detail" ng-click="detail(resumelist[$index+1].id)" style="color:blue">详情</button></li>
										<li ><span data-toggle="tooltip" title="该简历已被推荐，不能被修改"><button class="btn" ng-switch-when="1" disabled="disabled">修改</button></span>
	                    	<button type="button"  style="color:blue" class="btn" ng-switch-when="0" data-toggle="modal" data-target="#update" ng-click="detail(resumelist[$index+1].id)">修改</button>
	                    	<button ng-switch-when="0" style="color:red" class="btn " ng-click="resumeDelete(resumelist[$index+1].id)">删除</button>
	                    	<span data-toggle="tooltip" title="该简历已被推荐，不能被删除">
	                    	<button ng-switch-when="1" type="button" class="btn" disabled="disabled" >删除</button></li>
										
									</ul>
									
									<ul class="social_icons" ng-switch="resumelist[$index+1].file_name">
									
										<li><a href="javascript:void(0)" data-toggle="modal" data-target="#upload">上传简历</a></li>
										<li><span style="color:red" ng-switch-when="null">未上传 </span>
						<span style="color:red" ng-switch-when="">未上传 </span></li>
										<li><a ng-switch-default href="files/resumes/{{resumelist[$index+1].file_name}}">下载简历</a></li> 
										
									</ul>
								</div>
							</div><!--/.media -->
							<p ng-bind="resumelist[$index+1].skill"></p>
						</div>
					</div><!--/.col-lg-4 -->					
				</div> <!--/.row -->
				
				<div class="row team-bar">
					<div class="first-one-arrow hidden-xs">
						<hr>
					</div>
					<div class="first-arrow hidden-xs">
						<hr> <i class="fa fa-angle-up"></i>
					</div>
					<div class="second-arrow hidden-xs">
						<hr> <i class="fa fa-angle-down"></i>
					</div>
					<div class="third-arrow hidden-xs">
						<hr> <i class="fa fa-angle-up"></i>
					</div>
					<div class="fourth-arrow hidden-xs">
						<hr> <i class="fa fa-angle-down"></i>
					</div>
				</div> <!--skill_border-->       

				<div class="row clearfix" >   
					<div class="col-md-4 col-sm-6 col-md-offset-2" ng-if="resumelist[$index+2]!=null">	
						<div class="single-profile-bottom wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="600ms">
							<div class="media">
								<div class="pull-left">
									<a href="#"><img class="media-object" src="files/images/{{resumelist[$index+2].picture}}" alt=""></a>
								</div>

								<div class="media-body">
								<div style="width:15px;height:15px;float:right" ng-switch="resumelist[$index+2].status">
	                    	    <span data-toggle="tooltip" title="该简历已被推荐，不能被删除">
	                    	        <input ng-switch-when="1" type="checkbox" id={{resumelist[$index+2].id}} disabled="disabled" >
	                            </span>
	                            <input ng-switch-when="0" type="checkbox" id={{resumelist[$index+2].id}}  name="selectFlag">
	                            </div>
									<h4 ng-bind="resumelist[$index+2].name"></h4>
									<h5>{{resumelist[$index+2].sex}}&nbsp;&nbsp;&nbsp;&nbsp;{{resumelist[$index+2].degree}}</h5>
									<ul class="tag clearfix" ng-switch="resumelist[$index+2].status">
										<li ><button class="btn" data-toggle="modal" data-target="#detail" ng-click="detail(resumelist[$index+2].id)" style="color:blue">详情</button></li>
										<li ><span data-toggle="tooltip" title="该简历已被推荐，不能被修改"><button class="btn" ng-switch-when="1" disabled="disabled">修改</button></span>
	                    	<button type="button"  style="color:blue" class="btn" ng-switch-when="0" data-toggle="modal" data-target="#update" ng-click="detail(resumelist[$index+2].id)">修改</button>
	                    	<button ng-switch-when="0" style="color:red" class="btn " ng-click="resumeDelete(resumelist[$index+2].id)">删除</button>
	                    	<span data-toggle="tooltip" title="该简历已被推荐，不能被删除">
	                    	<button ng-switch-when="1" type="button" class="btn" disabled="disabled" >删除</button></li>
										
									</ul>
									
									<ul class="social_icons" ng-switch="resumelist[$index+2].file_name">
									
										<li><a href="javascript:void(0)" data-toggle="modal" data-target="#upload">上传简历</a></li>
										<li><span style="color:red" ng-switch-when="null">未上传 </span>
						<span style="color:red" ng-switch-when="">未上传 </span></li>
										<li><a ng-switch-default href="files/resumes/{{resumelist[$index+2].file_name}}">下载简历</a></li> 
										
									</ul>
								</div>
							</div><!--/.media -->
							<p ng-bind="resumelist[$index+2].skill"></p>
						</div>
					</div>
					<div class="col-md-4 col-sm-6 col-md-offset-2" ng-if="resumelist[$index+3]!=null">
						<div class="single-profile-bottom wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="600ms">
							<div class="media">
								<div class="pull-left">
									<a href="#"><img class="media-object" src="files/images/{{resumelist[$index+3].picture}}" alt=""></a>
								</div>
								<div class="media-body">
								<div style="width:15px;height:15px;float:right" ng-switch="resumelist[$index+3].status">
	                    	    <span data-toggle="tooltip" title="该简历已被推荐，不能被删除">
	                    	        <input ng-switch-when="1" type="checkbox" id={{resumelist[$index+3].id}} disabled="disabled" >
	                            </span>
	                            <input ng-switch-when="0" type="checkbox" id={{resumelist[$index+3].id}}  name="selectFlag">
	                            </div>
									<h4 ng-bind="resumelist[$index+3].name"></h4>
									<h5>{{resumelist[$index+3].sex}}&nbsp;&nbsp;&nbsp;&nbsp;{{resumelist[$index+3].degree}}</h5>
									<ul class="tag clearfix" ng-switch="resumelist[$index+3].status">
										<li ><button class="btn" data-toggle="modal" data-target="#detail" ng-click="detail(resumelist[$index+3].id)" style="color:blue">详情</button></li>
										<li ><span data-toggle="tooltip" title="该简历已被推荐，不能被修改"><button class="btn" ng-switch-when="1" disabled="disabled">修改</button></span>
	                    	<button type="button"  style="color:blue" class="btn" ng-switch-when="0" data-toggle="modal" data-target="#update" ng-click="detail(resumelist[$index+3].id)">修改</button>
	                    	<button ng-switch-when="0" style="color:red" class="btn " ng-click="resumeDelete(resumelist[$index+3].id)">删除</button>
	                    	<span data-toggle="tooltip" title="该简历已被推荐，不能被删除">
	                    	<button ng-switch-when="1" type="button" class="btn" disabled="disabled" >删除</button></li>
										
									</ul>
									
									<ul class="social_icons" ng-switch="resumelist[$index+3].file_name">
									
										<li><a href="javascript:void(0)" data-toggle="modal" data-target="#upload">上传简历</a></li>
										<li><span style="color:red" ng-switch-when="null">未上传 </span>
						<span style="color:red" ng-switch-when="">未上传 </span></li>
										<li><a ng-switch-default href="files/resumes/{{resumelist[$index+3].file_name}}">下载简历</a></li> 
										
									</ul>
								</div>
							</div><!--/.media -->
							<p ng-bind="resumelist[$index+3].skill"></p>
						</div>
					</div>
				</div>	<!--/.row-->
				</div>
				
        	
        	
      	</div>
     
      	<div class="modal fade" id="detail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
								<label>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</label>
								<!-- <input class="form-control" style="display:inline;padding:0;width:auto;height:28px;" value="{{resume.name}}" ng-model="resume.name" > -->
								<span ng-bind="resume.name"></span>
							</div>
							<div class="col-md-6 col-sm-6">
								<label>职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位：</label>
								<!-- <input class="form-control" style="display:inline;padding:0;width:auto;height:28px;" value="{{resume.position}}" ng-model="resume.position" > -->
								<span ng-bind="resume.position"></span>
							</div>
						</div>
						<div class="row" >
							<div class="col-md-6 col-sm-6">
								<label>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label>
								<!-- <input class="form-control" style="display:inline;padding:0;width:auto;height:28px;" value="{{resume.sex}}" ng-model="resume.sex" > -->
								<span ng-bind="resume.sex"></span>
							</div>
							<div class="col-md-6 col-sm-6">
								<label>学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位：</label>
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
								<label>专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业：</label>
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
								<label>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：</label>
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
      	
      	<div class="modal fade" id="update" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							简历修改
						</h4>
					</div>
					<div class="modal-body">
						<form id="form1">
						<div class="row" >
							<div class="col-md-6 col-sm-6">
								<input id="resumeId" type="hidden"  value="{{resume.id}}"/>
								<label>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</label>
								<input id="newname" class="form-control" style="display:inline;padding:0;width:auto;height:28px;" value="{{resume.name}}" ng-model="resume.name" >
								<%-- <span ng-bind="resume.name"></span> --%>
							</div>
							<div  class="col-md-6 col-sm-6">
								<label>职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位：</label>
								<input id="newposition" class="form-control" style="display:inline;padding:0;width:auto;height:28px;" value="{{resume.position}}" ng-model="resume.position" >
								<%-- <span ng-bind="resume.position"></span> --%>
							</div>
						</div>
						<div class="row" >
							
							<div class="col-md-6 col-sm-6">
								<label>学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位：</label>
								<input id="newdegree" class="form-control" style="display:inline;padding:0;width:auto;height:28px;" value="{{resume.degree}}" ng-model="resume.degree" >
								<%-- <span ng-bind="resume.degree"></span> --%>
							</div>
							<div class="col-md-6 col-sm-6">
								<label>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label>
								<select id="newsex" class="form-control" ng-model="resume.sex" required style="display:inline;width:30%;" >
		    						<option>男</option>
		    						<option>女</option>
	    						</select>
							</div>
							
						</div>
						<div class="row" >
						
							<div class="col-md-6 col-sm-6">
								<label>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：</label>
								<input id="newemail" class="form-control" style="display:inline;padding:0;width:auto;height:28px;" value="{{resume.email}}" ng-model="resume.email" >
								<%-- <span ng-bind="resume.email"></span> --%>
							</div>
							
							
						</div>
						<div class="row" >
							<div class="col-md-8 col-sm-8">
								<label>毕业院校：</label>
								<input id="newschool" class="form-control" style="display:inline;padding:0;width:auto;height:28px;" value="{{resume.school}}" ng-model="resume.school" >
								<%-- <span ng-bind="resume.school"></span> --%>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12 col-sm-12">
								<label>是否在读：</label>
								<select id="newisstudy" class="form-control" style="display:inline;width:30%;" >
		    						<option value="1">是</option>
		    						<option value="0">否</option>
	    						</select>
	    						
							</div>
						</div>
						<div class="row">
							<div class="col-md-12 col-sm-12">
								<label>毕业时间：</label><%-- <span ng-bind="resume.gra_time.year+1900+'年'+resume.gra_time.month+'月'+resume.gra_time.day+'日'"></span> --%>
								
            					<input id="datepicker" type="text" >
							</div>
						</div>
						<div class="row" >
							<div class="col-md-6 col-sm-6">
								<label>专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业：</label>
								<input id="newmajor" class="form-control" style="display:inline;padding:0;width:auto;height:28px;" value="{{resume.major}}" ng-model="resume.major" >
								<%-- <span ng-bind="resume.major"></span> --%>
							</div>
							<div class="col-md-6 col-sm-6">
								<label>手机号码：</label>
								<input id="newphone" class="form-control" style="display:inline;padding:0;width:auto;height:28px;" value="{{resume.phone}}" ng-model="resume.phone" >
								<%-- <span ng-bind="resume.phone"></span> --%>
							</div>
							
						</div>
						<div class="row" >
							<div class="col-md-12 col-sm-12">
								<label>专业技能：</label>
								<textarea id="newskill" class="form-control" rows="3">{{resume.skill}}</textarea>
								<%-- <span ng-bind="resume.skill"></span> --%>
							</div>
							
						</div>
						</form>
					</div>
					<div class="modal-footer">
						<button id="change" type="button" class="btn btn-info">提交更改</button>
						<button type="button" class="btn btn-success" data-dismiss="modal">关闭
						</button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
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
    
    <div class="site-footer">
    <section id="bottom" style="background: white;padding: 34px 0;">
        
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
    
 <div class="modal fade" id="upload" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">简历上传</h4>
            </div>
            <div class="modal-body">
            	<div class="table_cont">
            	<table class="table table-hover" align-content: center">
            	<tbody>
	                <tr>
	                    <form action="user/resumeAction!upload" method="post" enctype="multipart/form-data" >   
        					 请选择需要上传的简历：<input type="file" id="file" name="file"/><br />  
         					<input type="submit" id="btnupload" name="btnupload" class="btn btn-info" value="开始上传"> 
         					
         					<input type="hidden" value={{resume.id}} name="resid" id="resid"/>
     					</form>  
	                    	
	                    
	                </tr>
	            </tbody>
	            </table>
	            </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
    </div>
    
    <div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">添加简历</h4>
			</div>
            <div class="modal-body">
				<form id="form2">
					<div class="row" >
						<div class="col-md-12 col-sm-12">
							<label>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</label>
							<input id="addname" class="form-control required" style="display:inline;padding:0;width:auto;height:28px;" >
								<%-- <span ng-bind="resume.name"></span> --%>
						</div>
					</div>
					<div class="row" >
						<div  class="col-md-12 col-sm-12">
							<label>职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位：</label>
							<input id="addposition" class="form-control required" style="display:inline;padding:0;width:auto;height:28px;" >
							<%-- <span ng-bind="resume.position"></span> --%>
						</div>
					</div>
					<div class="row" >
						<div class="col-md-12 col-sm-12">
							<label>学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位：</label>
							<input id="adddegree" class="form-control required" style="display:inline;padding:0;width:auto;height:28px;" >
							<%-- <span ng-bind="resume.degree"></span> --%>
						</div>
					</div>
					<div class="row" >
						<div class="col-md-12 col-sm-12">
							<label>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label>
							<select id="addsex" class="form-control" style="display:inline;width:25%;" >
		    					<option>男</option>
		    					<option>女</option>
	    					</select>
						</div>	
					</div>
					<div class="row" >
						<div class="col-md-12 col-sm-12">
							<label>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：</label>
							<input id="addemail" class="form-control required" style="display:inline;padding:0;width:auto;height:28px;">
							<%-- <span ng-bind="resume.email"></span> --%>
						</div>	
					</div>
					<div class="row" >
						<div class="col-md-12 col-sm-12">
							<label>毕业院校：</label>
							<input id="addschool" class="form-control required" style="display:inline;padding:0;width:auto;height:28px;" >
							<%-- <span ng-bind="resume.school"></span> --%>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 col-sm-12">
							<label>是否在读：</label>
							<select id="addisstudy" class="form-control" style="display:inline;width:25%;" >
		    					<option value="1">是</option>
		    					<option value="0">否</option>
	    					</select>
	    				</div>
					</div>
					<div class="row">
						<div class="col-md-12 col-sm-12">
							<label>毕业时间：</label><%-- <span ng-bind="resume.gra_time.year+1900+'年'+resume.gra_time.month+'月'+resume.gra_time.day+'日'"></span> --%>
							<input id="adddatepicker" type="text" class="form-control required" style="display:inline;padding:0;width:auto;height:28px;">
						</div>
					</div>
					<div class="row" >
						<div class="col-md-12 col-sm-12">
							<label>专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业：</label>
							<input id="addmajor" class="form-control required" style="display:inline;padding:0;width:auto;height:28px;" >
							<%-- <span ng-bind="resume.major"></span> --%>
						</div>	
					</div>
					<div class="row" >
						<div class="col-md-12 col-sm-12">
							<label>手机号码：</label>
							<input id="addphone" class="form-control required" style="display:inline;padding:0;width:auto;height:28px;"  >
							<%-- <span ng-bind="resume.phone"></span> --%>
						</div>
					</div>
					<div class="row" >
						<div class="col-md-12 col-sm-12">
							<label>专业技能：</label>
							<textarea id="addskill" class="form-control required" rows="3"></textarea>
							<%-- <span ng-bind="resume.skill"></span> --%>
						</div>
					</div>
					
					<div class="row" >
						<div class="col-md-12 col-sm-12">
							<label>上传照片：</label>
							<input id="addpicture" type="file" class="form-control required" style="display:inline;padding:0;width:auto;height:28px;"  >
							<%-- <span ng-bind="resume.phone"></span> --%>
						</div>
					</div>
					
					</form>
					</div>
       
            <div class="modal-footer">
             <button id="addbutton" type="button" class="btn btn-success" data-dismiss="modal" >确认添加</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
    </div>
    
    
    <script src="<%=path %>/js/build/jquery.datetimepicker.full.min.js"></script>
    <script type="text/javascript">
    var myresumes = angular.module('myresumes', []);
    myresumes.controller('myresumes', ["$filter","$scope","$http",function($filter,$scope ,$http) {
    	$scope.checkedId=new Array();
    	var text="";
    	$scope.show = function(pageNo) {
    		$http(
    				{
    		        url : '<%=path%>/user/resumeAction!getResumelist',
    		        method : 'post',
    		        params:{
    		        	'pageNo':pageNo,
		        		"text":text
    		        }
    			}).success(function(data) {
    				$scope.resumelist=data.resumes.list;
    				$scope.page=data.resumes;
    				shownum($scope.page.pageNo,$scope.page.totalPage);
    				/* alert(JSON.stringify(data.userToDemandDTOlist.list)); */
    			}).error(function(data, status, headers, config) {
    				swal("信息有误","操作失败，请重试","error");
    			});
    	};
    	$scope.show(1);
    	$scope.download = function(path) {
    		$http(
    				{
    		        url : '<%=path%>/user/downloadAction!download',
    		        method : 'post',
    		        params:{
    		        	'path':path
    		        }
    			}).success(function(data) {
    				swal({
						title: "下载!",
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

    			}).error(function(data, status, headers, config) {
    				swal("信息有误","操作失败，请重试","error");
    			});
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
    	
    	$scope.upload = function(resume) {
    		$scope.resume=resume;
    		document.getElementById("resid").value=resume.id;
    	};
    		
    	$scope.detail=function(resumeId){
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
					document.getElementById("newisstudy").value=$scope.resume.is_study;
					document.getElementById("datepicker").value=$scope.resume.gra_time.year+1900+'-'+($scope.resume.gra_time.month+1)+'-'+$scope.resume.gra_time.date;
				}).error(function(data, status, headers, config) {
					swal("false");
				});
    	};
    	
    	$scope.resumeDelete=function(resid){
    		swal({
    			  title: '确认删除该简历？',
    			  text: '您将删除所选简历',
    			  type: 'warning',
    			  showCancelButton: true,
    			  confirmButtonText: '确定',
    			  cancelButtonText: '取消',
    			},
    		function(isConfirm) {
    			  if (isConfirm) {
    				  $http(
    							{
    					        url : '<%=path%>/user/resumeAction!resumeDelete',
    							method : 'post',
    							params:{
    								'resid':resid
    							}
    						}).success(function(data) {
    							
    							$scope.show(1);
    							
    						}).error(function(data, status, headers, config) {
    							swal("信息有误","操作失败，请重试","error");
    						});

    			  }  else {
    			    // Esc, close button or outside click
    			    // isConfirm is undefined
    			  }
    			});                  
    		
    	};
    	$scope.resumeDeleteAll=function(){
    		swal({
  			  title: '确认删除简历？',
  			  text: '您将删除所选简历',
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
  				        url : '<%=path%>/user/resumeAction!resumeDeleteAll',
  						method : 'post',
  						params:{
  							'resids': $scope.checkedId
  						}
  					}).success(function(data) {
  						$scope.show();
  					}).error(function(data, status, headers, config) {
  						swal("false");
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
    jQuery('#datepicker').datetimepicker({
    	 timepicker:false,
    	 format:'Y-m-d',
    	  // '9999/19/39 29:59' - digit is the maximum possible for a cell
    	});
    
    jQuery('#adddatepicker').datetimepicker({
   	 timepicker:false,
   	 format:'Y-m-d',
   	  // '9999/19/39 29:59' - digit is the maximum possible for a cell
   	});
    </script>
    <script src="<%=path %>/js/jQuery-2.1.4.min.js"></script>
	<script src="<%=path %>/js/bootstrap.min.js"></script>
	<script src="<%=path %>/js/angular.min.js"></script>
    <script type="text/javascript">
  
  		
  	   $("#change").click(function(){
  	          
  			 var formParam = $("#form1").serialize();//序列化表格内容为字符串 
  			  $.ajax({
	             type: "post",
	             url: "user/resumeAction!updateResume",
	             data: {
	            	resumeId:$("#resumeId").val(), 
	             	name:$("#newname").val(), 
	             	position:$("#newposition").val(), 
	             	degree:$("#newdegree").val(), 
	             	sex:$("#newsex").val(), 
	             	email:$("#newemail").val(),
	             	school:$("#newschool").val(),
	             	is_study:$("#newisstudy").val(),
	             	gra_time:$("#datepicker").val(),
	             	major:$("#newmajor").val(),
	             	phone:$("#newphone").val(),
	             	skill:$("#newskill").val(),
	             },
	             dataType: "json",
	             success: function(data){
	             	if(data.code==1){
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
	             	else{
	             		swal("信息有误","操作失败，请重试","error");
	             	}
	             }
         		});
  		});
  		
  	 $("#addbutton").click(function(){
  	          var a=new Array();
    			 a=document.getElementById("addpicture").value.split("\\");
			 var formParam = $("#form2").serialize();//序列化表格内容为字符串 
			  $.ajax({
             type: "post",
             url: "user/resumeAction!addResume",
             data: {
             	name:$("#addname").val(), 
             	position:$("#addposition").val(), 
             	degree:$("#adddegree").val(), 
             	sex:$("#addsex").val(), 
             	email:$("#addemail").val(),
             	school:$("#addschool").val(),
             	is_study:$("#addisstudy").val(),
             	gra_time:$("#adddatepicker").val(),
             	major:$("#addmajor").val(),
             	phone:$("#addphone").val(),
             	skill:$("#addskill").val(),
             	picture:a[a.length-1]
             	
             },
             dataType: "json",
             success: function(data){
             	if(data.code==1){
             		swal({
						title: "添加成功!",
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
             	else{
             		swal("信息有误","操作失败，请重试","error");
             	}
             }
     		});
		});
    </script>
    
    <script type="text/javascript">
		//<![CDATA[
	$(function(){
		 
        /*
        *思路大概是先为每一个required添加必填的标记，用each()方法来实现。
        *在each()方法中先是创建一个元素。然后通过append()方法将创建的元素加入到父元素后面。
        *这里面的this用的很精髓，每一次的this都对应着相应的input元素，然后获取相应的父元素。
        *然后为input元素添加失去焦点事件。然后进行用户名、邮件的验证。
        *这里用了一个判断is()，如果是用户名，做相应的处理，如果是邮件做相应的验证。
        *在jQuery框架中，也可以适当的穿插一写原汁原味的javascript代码。比如验证用户名中就有this.value，和this.value.length。对内容进行判断。
        *然后进行的是邮件的验证，貌似用到了正则表达式。
        *然后为input元素添加keyup事件与focus事件。就是在keyup时也要做一下验证，调用blur事件就行了。用triggerHandler()触发器，触发相应的事件。
        *最后提交表单时做统一验证
        *做好整体与细节的处理
        */
        //如果是必填的，则加红星标识.
        $("form :input.required").each(function(){
            var $required = $("<span class='high' style='color:red'> *</span>"); //创建元素
            $(this).parent().append($required); //然后将它追加到文档中
        });
        
      //文本框失去焦点后
        $('form :input').blur(function(){
             var $parent = $(this).parent();
             $parent.find(".formtips").remove();
             //验证姓名
             if( $(this).is('#addname') ){
                    if( this.value==""){
                        var errorMsg = '请输入姓名';
                        $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
                    }
             }
             if( $(this).is('#addposition') ){
                 if( this.value==""){
                     var errorMsg = '请输入职位';
                     $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
                 }
          	 }
             if( $(this).is('#adddegree') ){
                 if( this.value==""){
                     var errorMsg = '请输入学位';
                     $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
                 }
          	 }
             if( $(this).is('#addschool') ){
                 if( this.value==""){
                     var errorMsg = '请输入毕业院校';
                     $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
                 }
          	 }
             if( $(this).is('#addatepicker') ){
                 if( this.value==""){
                     var errorMsg = '请输入毕业时间';
                     $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
                 }
          	 }
             if( $(this).is('#addmajor') ){
                 if( this.value==""){
                     var errorMsg = '请输入专业';
                     $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
                 }
          	 }
             if( $(this).is('#addphone') ){
                 if( this.value==""){
                     var errorMsg = '请输入手机号码';
                     $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
                 }
          	 }
             if( $(this).is('#addskill') ){
                 if( this.value==""){
                     var errorMsg = '请输入专业技能';
                     $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
                 }
          	 }
             //验证邮件
             if( $(this).is('#addemail') ){
                if( this.value=="" || ( this.value!="" && !/.+@.+\.[a-zA-Z]{2,4}$/.test(this.value) ) ){
                      var errorMsg = '请输入正确的E-Mail地址.';
                      $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
                }
             }
        }).keyup(function(){
           $(this).triggerHandler("blur");
        }).focus(function(){
             $(this).triggerHandler("blur");
        });//end blur
	})
	
	//]]>
	</script>
	
	<script type="text/javascript">
		function checkAll() {
  			for (var i = 0; i < document.getElementsByName("selectFlag").length; i++) {
   				document.getElementsByName("selectFlag")[i].checked = document.getElementById("ifAll").checked;
  			}
 		}
	</script>
	<script>
	$(function () { $("[data-toggle='tooltip']").tooltip(); });
</script>

  </body>
</html>
