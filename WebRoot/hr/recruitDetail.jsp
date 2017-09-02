<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE>
<html>
  <head>
    <title>招聘详情</title>
	
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
		body{
			color:block;
		}
		.content{
			background-color: #fff;
			border-radius:10px;
			padding:10px 20px 10px 20px;
			font-family: "楷体";
		}
		 #editor-trigger1 {
            height: 200px;
            /*max-height: 500px;*/
        }
        #editor-trigger2 {
            height: 200px;
            /*max-height: 500px;*/
        }
        .form-horizontal .form-group-sm .form-control{
        	height:30px;
        	padding:5px 10px;
        	font-size:12px;
        	line-height:1.5;
        	border-radius:3px;
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
						  <li><a href="<%=path %>/hr/myRecruit.jsp">我的招聘</a></li>
						  <li ><a href="<%=path %>/hr/recruitList.jsp">招聘列表</a></li>
					  </ul>
				 </div>
            </div><!--/.container-->
        </nav><!--/nav-->
        
    </header><!--/header-->


 	<div  class="container" style="background-color: white;width:1100px;margin-top:130px;">
	    <div class="information" style="background-color: white;">
        	<div class="table_cont">
        		<div style="margin-top:10px;width:1100px;margin:0 auto;" ng-app="recruitDetail" ng-controller="recruitDetailContrellor">
				    <form id="form1" style="">
				    	<div class="content">
				    		<div class="form-group" style="margin:0 auto;text-align: center;margin-top:10px;">
					    		<span style="color:black;font-size:26px;font-weight:bold;font-family:'楷体';">招聘详情</span>
					    	</div>
					    	<br>
				    		<div class="row" >
								<div class="col-md-6 col-sm-6">
									<label>编&nbsp;&nbsp;&nbsp;&nbsp;号：</label>
									<span ng-bind="recruit.id"></span>
								</div>
								<div class="col-md-6 col-sm-6">
									<label>发&nbsp;布&nbsp;者：</label><span ng-bind="recruit.hr.username"></span>
								</div>
							</div>
							<div class="row" >
								<div class="col-md-6 col-sm-6">
									<label>职位名称：</label>
									<input class="form-control" style="display:inline;padding:0;width:auto;height:28px;" value="{{recruit.name}}" id="name" ng-model="recruit.name" >
								</div>
								<div class="col-md-6 col-sm-6">
									<label>岗位名称：</label>
									<select class="form-control" style="width:30%;height:30px;display:inline;" id="jobName" ng-model="recruit.job.name">
										<option  ng-repeat="job in jobList" value="{{job.name}}" >{{job.name}}</option>
									</select>
								</div>
							</div>
				    		<div class="row" >
								<div class="col-md-6 col-sm-6">
									<label>部&nbsp;&nbsp;&nbsp;&nbsp;门：</label>
									<select class="form-control" style="width:30%;height:33px;display:inline;" id="depName" ng-model="recruit.department.name">
										<option  ng-repeat="dep in depList" value="{{dep.name}}" >{{dep.name}}</option>
									</select>
								</div>
								<div class="col-md-6 col-sm-6">
									<label>工作地点：</label>
									<input class="form-control" style="display:inline;padding:0;width:auto;height:28px;" id="place" value="{{recruit.place}}" ng-model="recruit.place" >
								</div>
							</div>
							<div class="row">
								<div class="col-md-12 col-sm-12">
									<label>发布时间：</label><span ng-bind="recruit.createdate.year+1900+'年'+(recruit.createdate.month+1)+'月'+recruit.createdate.date+'日'"></span>
								</div>
							</div>		
							<div class="form-group" style="margin-top:10px;">
					    		<div style="">
					    			<label>岗位描述：</label>
					    		</div>
					    		<!-- <textarea class="form-control"  name="recruit.description" type="text" style="display:inline;width:70%;" required></textarea><br> -->
							    <div id="editor-container1" class="container" style="margin:5px 0 0 0px;padding:0;width:95%;">
							        <div id="editor-trigger1" ></div>
							    </div>
							</div> 
					    	<div class="form-group">
					    		<div style="">
					    			<label>需&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;求：</label>
					    		</div>
					    		<!-- <textarea class="form-control" name="recruit.requirement" type="text" style="display:inline;width:70%;" required></textarea><br> -->
					    		<div id="editor-container2" class="container" style="margin:5px 0 0 0px;padding:0;width:95%;">
							        <div id="editor-trigger2"></div>
							    </div>
					    	</div>
							<div class="row" >
								<div class="col-md-12 col-sm-12">
									<label>特殊需求：</label>
									<textarea class="form-control" rows="3"  value="{{recruit.spe_demand}}" id="spe_demand" ng-model="recruit.spe_demand" style="width:970px;"></textarea>
						    		<div style="margin-left:80%;">
						    			<span style="margin-right:-580px;">字数不得超过250</span>
						    		</div>
								</div>
							</div>
							<div class="row" >
								<div class="col-md-6 col-sm-6" >
									<label>FTE/PTE：</label>
									<select class="form-control"  id="isfte"     required style="display:inline;width:30%;height:30px;" >
							    		<option value=1 >FTE</option>
							    		<option value=0 >PTE</option>
					    			</select><br>
								</div>
								<div class="col-md-6 col-sm-6" >
									<label>是否紧急:</label>
									<select class="form-control"  id="emergent" required style="display:inline;width:30%;height:30px;" >
							    		<option value=0 >不紧急</option>
							    		<option value=1 >紧急</option>
					    			</select><br>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6 col-sm-6">
									<label>工作年限:</label>
									<input class="form-control" style="display:inline;padding:0;width:auto;height:28px;" id="years" value="{{recruit.years}}" ng-model="recruit.years" >
									<!-- <span ng-bind="recruit.years"></span> -->
								</div>
								<div class="col-md-6 col-sm-6">
									<label>招聘人数：</label><input class="form-control" style="width:30%;display:inline " type="number" value="{{recruit.number}}" ng-model="recruit.number" id="number" >
								</div>
							</div>
							<div class="row">
				                <label style="padding-left:15px;">截止时间:</label>
				                <%-- <div style="margin-left:-103px;"   class="input-group date form_date col-md-4" data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
				                    <input class="form-control" size="16" type="text" name="deadline" id="deadline" value="{{time}}" readonly>
				                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
									<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
				                </div>
								<input type="hidden" id="dtp_input2" value="" /><br/> --%>
								<input  class="form-control" id="datepicker" type="text" name="deadline"  value="{{time}}" style="width:30%;display:inline" >
				            </div>	
							<br>
							<div class="row">
								<div class="col-md-6 col-sm-6">
								</div>
								<div class="col-md-6 col-sm-6" style="margin-left:-100px;">
									<div class="form-group" style="margin-bottom: 10px;">
							    		<button id="buttom" class="btn btn-primary"  ng-click="update()"  style="padding:8px 30px;">确认</button>
							    	</div>
								</div>
							</div>	
				    	</div>
				    </form>
				 </div>
        	</div>
      	</div>
    </div>
        
    <section id="bottom" style="background: white;padding: 10px 0;">
        
    </section>
    	
 	<footer id="footer" class="midnight-blue" style="">
        <div class="container">
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
    <script src="../js/build/jquery.datetimepicker.full.min.js"></script>
    <script type="text/javascript" src="../dist/js/wangEditor.js"></script>
    <script type="text/javascript" src="../js/sweet-alert.js"></script>
    
    <script type="text/javascript">
      var recruitContrellor = angular.module('recruitDetail', []);
      recruitContrellor.controller('recruitDetailContrellor', ["$filter","$scope","$http",function($filter,$scope ,$http) {
   	 	var editor1 = new wangEditor('editor-trigger1');
        var editor2 = new wangEditor('editor-trigger2');
		$scope.text1="";
  		$scope.text2="";
  		$scope.recruit="";
		// onchange 事件
        editor1.onchange = function () {
            console.log(this.$txt.html());
            $scope.text1=this.$txt.html();
        };
        editor2.onchange = function () {
            console.log(this.$txt.html());
            $scope.text2=this.$txt.html();
        };
           editor1.create();
           editor2.create();

           // 避免上面编辑器的 dropPanel 被下面的编辑器遮挡
           editor1.$editorContainer.css('z-index', 2);
           editor2.$editorContainer.css('z-index', 2);
    	
    	$scope.job=function(){
    		$http(
					{
			        url : '<%=path%>/hr/jobContrellor!jobList',
					method : 'post',
				}).success(function(data) {
					console.log(data.jobList);
					$scope.jobList=data.jobList;
				}).error(function(data, status, headers, config) {
					alert("false");
				});
    	};
    	$scope.department=function(){
    		$http(
					{
			        url : '<%=path%>/hr/departmentContrellor!depList',
					method : 'post',
				}).success(function(data) {
					console.log(data);
					$scope.depList=data.depList;
				}).error(function(data, status, headers, config) {
					alert("false");
				});
    	};
    	
    	//得到招聘信息详情
    	$scope.show=function(){
    		$scope.job();
    		$scope.department();
    		var url=window.location.search;
    		var id=url.split("=")[1];
    		$http(
					{
			        url : '<%=path%>/hr/recruitAction!recruitDetail',
					method : 'post',
					params:{
						'recruitId':id
					}
				}).success(function(data) {
					console.log(data.recruit);
					$scope.recruit=data.recruit;
					var description=data.recruit.description;
					var requirement=data.recruit.requirement;
					$scope.text1=description;
					$scope.text2=requirement;
					$('#editor-trigger1').html(description);
					$('#editor-trigger2').html(requirement);
					/* $('isfte').find("option[value='data.recruit.is_fte']").attr("selected",true);
					$('emergent').find("option[value='data.recruit.emergent']").attr("selected",true); */
					$scope.time=data.recruit.deadline.year+1900+'-'+(data.recruit.deadline.month+1)+'-'+data.recruit.deadline.date;
				}).error(function(data, status, headers, config) {
					alert("false");
				});
    		
    	};
    	
    	$scope.show();
    	
    	 $("#spe_demand").keyup(function() {
			if ($.trim(this.value).length > 250) { alert("输入字符大于250个,请重新输入!"); }
		}); 
  		
  	   $scope.update=function(){
  	   		 if($("#name").val()==''){
  	   		 	swal("信息有误", "职位名称不能为空", "error");
  			 	return false;
  	   		 }
  			 if($scope.recruit.place==''){
  			 	swal("信息有误", "工作地点不能为空", "error");
  			 	return false;
  			 }
  			 if($scope.text1=="<p><br></p>"){
  			 	swal("信息有误", "岗位描述不能为空", "error");
  			 	return false;
  			 }
  			 if($scope.text2=="<p><br></p>"){
  			 	swal("信息有误", "需求描述不能为空", "error");
  			 	return false;
  			 }
  			 if($scope.recruit.years==''){
  			 	swal("信息有误", "工作年限不能为空", "error");
  			 	return false;
  			 }
  			 if($scope.recruit.number<=0){
  			 	swal("信息有误", "招聘人数不能是负数", "error");
  			 	return false;
  			 }
  			 if($("#datepicker").val()==''){
  			 	swal("信息有误", "截止时间不能为空", "error");
  			 	return false;
  			 }
  			 if(new Date().getTime()>=$scope.recruit.deadline.time){
  			 	swal("信息有误", "经过了截止时间，不能再修改", "error");
    	  		return false;
    	  	}
    	  	$http(
					{
			        url : '<%=path%>/hr/hrContrellor!updateRecruit',
					method : 'post',
					params:{
						recruitId:$scope.recruit.id,
						name:$("#name").val(), 
						jobName:$scope.recruit.job.name,
						depName:$scope.recruit.department.name,
						place:$scope.recruit.place,
		             	description:$scope.text1,
		             	requirement:$scope.text2,
		             	spe_demand:$scope.recruit.spe_demand, 
		             	isfte:$("#isfte").val(),
		             	emergent:$("#emergent").val(),
		             	years:$scope.recruit.years,
		             	number:$scope.recruit.number, 
		             	deadline:$("#datepicker").val(), 
					}
				}).success(function(data) {
					console.log(data);
					if(data.code==1){
	             		swal({
							title: "招聘信息发布成功!",
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
	             	else if(data.code==0){
	             		swal("信息有误", "招聘信息发布失败!", "error");
	             	}
				}).error(function(data, status, headers, config) {
					alert("false");
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
    
    </script>
  
  <script type="text/javascript">
    $('.form_datetime').datetimepicker({
        //language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0,
        showMeridian: 1
    });
	$('.form_date').datetimepicker({
    //    language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
    });
	$('.form_time').datetimepicker({
        language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 1,
		minView: 0,
		maxView: 1,
		forceParse: 0
    });
</script>
 	</body>
</html>
