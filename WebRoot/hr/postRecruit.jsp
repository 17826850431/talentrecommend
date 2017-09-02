<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE>
<html>
  <head>
    <title>发布招聘信息</title>
	
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
			margin:0px;
			padding:0px;
			color:block;
		}
		.content{
			width:100%;			
			text-align: center;
			background-color: #fff;
			height:1000px;
			margin-top:10px;
			border-radius:8px;
			padding-top:10px;
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
		.top-bar{
		line-height:3px;
		}
	</style>
	
  </head>
  
  <body ng-app="recruit" ng-controller="recruitContrellor">
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
						  <li class="active"><a href="<%=path %>/hr/postRecruit.jsp">发布招聘</a></li>
						  <li ><a href="<%=path %>/hr/myRecruit.jsp">我的招聘</a></li>
						  <li ><a href="<%=path %>/hr/recruitList.jsp">招聘列表</a></li>
					  </ul>
                </div>
            </div><!--/.container-->
        </nav><!--/nav-->
		
    </header><!--/header-->
      
 	<div  class="container" style="margin-top:130px;background-color: white;width:1100px;margin:0 auto;">
    	<div class="information" style="margin-top:140px;background-color: white;">
	       	<div class="table_cont">
	       		<div style="width:100%;height:1150px;text-align: center;margin:0 auto;" >
				    <div style="color:black;font-size:26px;text-align: center;font-weight:bold;font-family:'楷体';">
				    	<span>发布招聘</span>
				    </div>
				    <form id="form1" style="margin-top:10px;">
				    	<div class="content">
				    		<div class="form-group">
					    		<label>职位名称：</label><input class="form-control" id="name" name="name" required type="text" style="display:inline;width:70%;"><br>
					    	</div>
					    	<div class="form-group">
					    		<div style="margin-left:-70%;">
					    			<label>岗位描述：</label>
					    		</div>
					    		<!-- <textarea class="form-control"  name="recruit.description" type="text" style="display:inline;width:70%;" required></textarea><br> -->
							    <div id="editor-container1" class="container" style="margin-left:18.5%;padding:0;width:72.5%;">
							        <div id="editor-trigger1" ></div>
							    </div>
							</div> 
					    	<div class="form-group">
					    		<div style="margin-left:-70%;">
					    			<label>需&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;求：</label>
					    		</div>
					    		<!-- <textarea class="form-control" name="recruit.requirement" type="text" style="display:inline;width:70%;" required></textarea><br> -->
					    		<div id="editor-container2" class="container" style="margin-left:18.5%;padding:0;width:72.5%;">
							        <div id="editor-trigger2"></div>
							    </div>
					    	</div>
					    	<div class="form-group">
					    		<label>特殊需求：</label>
					    		<textarea class="form-control" id="spe_demand" name="spe_demand" maxlength="250" type="text" style="display:inline;width:70%;"></textarea>
					    		<br>
					    		<div style="margin-right:10px;">
					    			<span style="margin-right:-580px;">字数不得超过250</span>
					    		</div>
					    	</div>
					    	<div class="form-group">
					    		<label>招聘人数：</label><input class="form-control" id="number"  name="number" type="number" required style="display:inline;width:70%;"><br>
					    	</div>
					    	<div class="form-group">
					    		<label>招聘部门：</label><select class="form-control"  id="depId"  name="depId" type="text" style="display:inline;width:70%;">
					    			<option value={{y.id}} ng-repeat="y in departments">{{y.name}}</option>
					    		</select><br>
					    	</div>
					    	<div class="form-group">
					    		<label>工作地点：</label><input class="form-control" id="place" name="place" required type="text" style="display:inline;width:70%;"><br>
					    	</div>
					    	<div class="form-group">
					    		<label>职能类别：</label><select class="form-control"  id="jobId" name="jobId" style="display:inline;width:70%;">
					    			<option value={{x.id}} ng-repeat="x in array">{{x.name}}</option>
					    		</select><br>
					    	</div>
					    	<div class="form-group">
					    		<label>FTE/PTE：</label>
					    		<select class="form-control"  id="isfte" name="isfte" type="text" style="display:inline;width:70%;" >
					    			<option value="1">FTE</option>
					    			<option value="0">PTE</option>
					    		</select>
					    		<br>
					    	</div>
					    	<div class="form-group">
					    		<label>工作年限：</label><input class="form-control" id="years" name="years" maxlength="10"  required type="text" style="display:inline;width:70%;" placeholder="请填写时间或者不限"><br>
					    	</div>
						    <div class="form-group">
					    		<label>是否紧急：</label>
					    		<select class="form-control"  id="emergent" name="emergent"  style="display:inline;width:70%;">
					    			<option value=0>否</option>
					    			<option value=1>是</option>
					    		</select><br>
					    	</div>
					    	<div class="form-group">
				                <label >截止时间：</label>
				                <%-- <div style="margin-left:-90px;"  id="sss" class="input-group date form_date col-md-4" data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
				                    <input class="form-control" size="16" type="text" name="deadline" id="deadline" required="required" readonly>
				                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
									<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
				                </div> --%>
								<!-- <input type="hidden" id="dtp_input2" value="" /><br/> -->
								<input  class="form-control" id="datepicker" type="text" name="deadline"  style="width:70%;display:inline" >
				            </div>
				            <br/>
					    	<div class="form-group" style="margin-bottom: 10px;">
					    		<button id="buttom" class="btn btn-primary"  type="submit" style="padding:8px 30px;">确认</button>
					    	</div>
				    	</div>
				    </form>
				</div>
	       	</div>
      	</div>
    </div>
   
    </div>
      <div class="site-footer">    
    <section id="bottom" style="background: white;padding: 34px 0;">
        
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
  
  
  
    
    <script src="../js/jQuery-2.1.4.min.js"></script>
  	<script src="../js/bootstrap.min.js"></script>
  	<script src="../js/angular.min.js"></script>
    <script src="../js/build/jquery.datetimepicker.full.min.js"></script>
    <script type="text/javascript" src="../dist/js/wangEditor.js"></script>
    <script type="text/javascript" src="../js/sweet-alert.js"></script>
    
    <script type="text/javascript">
      var recruitContrellor = angular.module('recruit', []);
      recruitContrellor.controller('recruitContrellor', ["$filter","$scope","$http",function($filter,$scope ,$http) {
    	
    	$scope.job=function(){
    		$http(
					{
			        url : '<%=path%>/hr/jobContrellor!jobList',
					method : 'post',
				}).success(function(data) {
					console.log(data);
					$scope.array=data.jobList;
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
					$scope.departments=data.depList;
				}).error(function(data, status, headers, config) {
					alert("false");
				});
    	};
    	$scope.job();
    	$scope.department();
    
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
<script type="text/javascript">
  
  		$("#spe_demand").keyup(function() {
			if ($.trim(this.value).length > 250) { 
				swal("信息有误", "输入字符大于250个,请重新输入!", "error");
			}
		}); 
  		var text1;
  		var text2;
  		
  	   $("#buttom").click(function(){
  			 //var formParam = $("#form1").serialize();//序列化表格内容为字符串  
  			 if($("#name").val()==""){
  			 	swal("信息有误", "职位名称不能为空", "error");
  			 	return false;
  			 }
  			 if(text1==null||text1=="<p><br></p>"){
  			 	swal("信息有误", "岗位描述不能为空", "error");
  			 	return false;
  			 }
  			 if(text2==null||text2=="<p><br></p>"){
  			 	swal("信息有误", "需求描述不能为空", "error");
  			 	return false;
  			 }
  			 if($("#number").val()<=0){
  			 	swal("信息有误", "招聘人数不能是负数", "error");
  			 	return false;
  			 }
  			 if($("#place").val()==""){
  			 	swal("信息有误", "工作地点不能为空", "error");
  			 	return false;
  			 }
  			 if($("#years").val()==""){
  			 	swal("信息有误", "工作年限不能为空", "error");
  			 	return false;
  			 }
  			 if($("#datepicker").val()==""){
  			 	swal("信息有误", "截止时间不能为空", "error");
  			 	return false;
  			 }
  		     if($("#emergent").val()==1){
	  	         swal({
	   					title: "你要发布的是紧急招聘信息，将邮件通知全部员工，确定发布吗？",
	   					showCancelButton: true,
	   					confirmButtonText:"确认",
	   					cancelButtonText:"取消",
	   					closeOnConfirm: false,
	   					showLoaderOnConfirm: true,
	   					html: true
	   				},function(s){
	     				if(s==true){
	     					$.ajax({
					             type: "post",
					             url: "hr/hrContrellor!addRecruit",
					             data: {
					             	name:$("#name").val(), 
					             	description:text1,
					             	requirement:text2,
					             	spe_demand:$("#spe_demand").val(), 
					             	number:$("#number").val(), 
					             	deadline:$("#datepicker").val(), 
					             	depId:$("#depId").val(),
					             	place:$("#place").val(),
					             	jobId:$("#jobId").val(),
					             	isfte:$("#isfte").val(),
					             	years:$("#years").val(),
					             	emergent:$("#emergent").val(),
					             },
					             dataType: "json",
					             success: function(data){
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
					             }
				         	});
	     				}
		     		});
  			  }
  			  if($("#emergent").val()==0){
  			  	$.ajax({
		             type: "post",
		             url: "hr/hrContrellor!addRecruit",
		             data: {
		             	name:$("#name").val(), 
		             	description:text1,
		             	requirement:text2,
		             	spe_demand:$("#spe_demand").val(), 
		             	number:$("#number").val(), 
		             	deadline:$("#datepicker").val(), 
		             	depId:$("#depId").val(),
		             	place:$("#place").val(),
		             	jobId:$("#jobId").val(),
		             	isfte:$("#isfte").val(),
		             	years:$("#years").val(),
		             	emergent:$("#emergent").val(),
		             },
		             dataType: "json",
		             success: function(data){
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
		             }
	         	});
  			  }
  			  
  		});
  		
  		  $(function () {
            
            var editor1 = new wangEditor('editor-trigger1');
            var editor2 = new wangEditor('editor-trigger2');

			// onchange 事件
	        editor1.onchange = function () {
	            console.log(this.$txt.html());
	            text1=this.$txt.html();
	        };
	        editor2.onchange = function () {
	            console.log(this.$txt.html());
	            text2=this.$txt.html();
	        };
            editor1.create();
            editor2.create();

            // 避免上面编辑器的 dropPanel 被下面的编辑器遮挡
            editor1.$editorContainer.css('z-index', 2);
            editor2.$editorContainer.css('z-index', 2);
        });
       
    </script>
  </body>
</html>
