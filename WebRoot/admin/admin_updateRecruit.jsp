<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE>
<html>
  <head>
    <title>修改招聘</title>
	
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
	
        .form-horizontal .form-group-sm .form-control{
        	height:30px;
        	font-size:12px;
        	line-height:1.5;
        	border-radius:3px;
        	margin-top:10px;
        	}
        	
         .row{
			margin-top:10px;
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
  
  <body ng-app="recruitDetail" ng-controller="recruitDetailContrellor">
  	 <div class="page-wrap">
      <header id="header">
        <div class="top-bar">
            <div class="container">
                <div class="row2">
                    <div class="col-sm-6 col-xs-4">
                    </div>
                    <div class="col-sm-6 col-xs-8" >
                       <div class="social">
                           <ul class="social-share">
                           <%if(session.getAttribute("admin")!=null){ %>
						      <li class="dropdown active">
                                 <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="line-height:25px"><i class="fa fa-user"></i></a>
                                  <ul class="dropdown-menu" style="text-align: center;background-color: black;">
                                       <li ><a href="personalInfo.jsp" style="width: 180px;">个人设置</a></li>
		                              <li ><a href="login.jsp" style="width: 180px;">注销</a></li>
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
                         <li><a href="<%=path %>/index.jsp">首页</a></li>
                        <li ><a href="<%=path %>/admin/admin_emergency.jsp">紧急招聘</a></li>
                        <li><a href="<%=path %>/admin/admin_normal.jsp">普通招聘</a></li>
                        <li><a href="<%=path %>/admin/admin_resume.jsp">简历库</a></li>
                        <li><a href="<%=path %>/admin/admin_employee.jsp">教职工</a></li> 
                        <li><a href="<%=path %>/admin/admin_hr.jsp">人事部</a></li>                        
                    </ul>
                </div>
            </div><!--/.container-->
        </nav><!--/nav-->
        
    </header><!--/header-->


 	<div  class="container" style="background-color: white;width:1100px;margin:0 auto;margin-top:120px;">
	    <div class="information" style="background-color: white;">
        	<div class="table_cont">
        		<div style="margin-top:10px;width:1100px;margin:0 auto;" >
				    <form id="form1" style="">
				    	<div class="content">
				    		<div class="form-group" style="margin:0 auto;text-align: center;margin-top:10px;">
					    		<span style="color:black;font-size:26px;font-weight:bold;font-family:'楷体';">修改招聘</span>
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
									<span ng-bind="recruit.name"></span>
								</div>
								<div class="col-md-6 col-sm-6">
									<label>岗位名称：</label>
									<span ng-bind="recruit.job.name"></span>
								</div>
							</div>
				    		<div class="row" >
								<div class="col-md-6 col-sm-6">
									<label>部&nbsp;&nbsp;&nbsp;&nbsp;门：</label>
									<span ng-bind="recruit.department.name"></span>
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
					    			<span id="description"></span>
					    		</div>
					    		
							</div> 
					    	<div class="form-group">
					    		<div style="">
					    			<label>需&nbsp;&nbsp;&nbsp;&nbsp;求：</label>
					    			<span id="requirement"></span>
					    		</div>
					    		
					    	</div>
							<div class="row" >
								<div class="col-md-12 col-sm-12">
									<label>特殊需求：</label>
									<span ng-bind="recruit.spe_demand"></span>
								</div>
							</div>
							<div class="row" >
								<div class="col-md-6 col-sm-6" >
									<label>FTE/PTE：</label>
									<select class="form-control"  id="isfte"   required style="display:inline;width:30%;height:30px;" >
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
									<input class="form-control" style="display:inline;width:auto;height:28px;" id="years" value="{{recruit.years}}" ng-model="recruit.years" >
								</div>
								<div class="col-md-6 col-sm-6">
									<label>招聘人数：</label><input class="form-control" style="width:30%;display:inline " type="number" value="{{recruit.number}}"  id="number" >
								</div>
							</div>
							<div class="row">
				                <label style="padding-left:15px;">截止时间:</label>
								<input  class="form-control" id="datepicker" type="text" name="deadline"  value="{{recruit.deadline}}" style="width:30%;display:inline" >
				            </div>	
							<br>
							<div class="row">
								<div class="col-md-6 col-sm-6">
								</div>
								<div class="col-md-6 col-sm-6" style="margin-left:-100px;">
									<div class="form-group" style="margin-bottom: 10px;">
							    		<button id="buttom" class="btn btn-primary"  ng-click="updateRecruit()"  style="padding:8px 30px;">确认</button>
							    	</div>
								</div>
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
  
  
  
    
    
 	<script src="../js/jQuery-2.1.4.min.js"></script>
  	<script src="../js/bootstrap.min.js"></script>
  	<script src="../js/angular.min.js"></script>
    <script src="../js/build/jquery.datetimepicker.full.min.js"></script>
    <script type="text/javascript" src="../dist/js/wangEditor.js"></script>
    <script type="text/javascript" src="../js/sweet-alert.js"></script>
    
    <script type="text/javascript">
      var recruitContrellor = angular.module('recruitDetail', []);
      recruitContrellor.controller('recruitDetailContrellor', ["$filter","$scope","$http",function($filter,$scope ,$http) {
		$scope.text1="";
  		$scope.text2="";
  		$scope.recruit="";
		
    	
           function getQueryString(name) {  
   		    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");  
   		    var r = location.search.substr(1).match(reg);  
   		    if (r != null) return unescape(decodeURI(r[2])); return null;  
             };
           var id=getQueryString("id");
       	$scope.showRecruit=function()
       	{
       	
       	   $http(
   				{
   		        url : '<%=path%>/admin/adminSelectAction!showRecruit',
   		        method : 'post',
   		        params:{
   		        	"id":parseInt(id)
   		        }
   			}).success(function(data) {
   		     
   				$scope.recruit=data.recruit;
   				/* if(data.recruit.is_fte==0)
   				{
   				  $scope.recruit.isfte="兼职";
   				}
   				else
   				{
   				  $scope.recruit.isfte="全职";
   				}
   				
   				if(data.recruit.emergent==0)
   				{
   				  $scope.recruit.emergent="是";
   				}
   				else
   				{
   				  $scope.recruit.emergent="否";
   				  
   				} */
   				
   				var a=new Date(data.recruit.deadline.time);
   				
   				$scope.recruit.deadline=a.getFullYear() + "-" + (a.getMonth() + 1) + "-" + a.getDate();
   			var description=data.recruit.description;
   					$('#description').html(description);
   					var requirement=data.recruit.requirement;
   					$('#requirement').html(requirement);
   			
   			}).error(function(data, status, headers, config) {
   				alert("false");
   			});
       	};
       $scope.showRecruit();
    	
  	   
  			 $scope.updateRecruit=function()
  		    {
  		     swal({
  		    			  title: '修改信息成功将会发邮件给HR，确定继续吗？',
  		    			  type: 'warning',			
  		    			  confirmButtonText: '确定',
  		    			  cancelButtonText: '取消',
  		    			  showCancelButton: true,
  		    			},
  		    		function(isConfirm) {
  		    			  if (isConfirm) {
  		      var number=document.getElementById("number").value;
  		      var place=document.getElementById("place").value;
  		      var isfte=document.getElementById("isfte").value;
  		      var years=document.getElementById("years").value;
  			  var emergent=document.getElementById("emergent").value;
  			  var deadline=document.getElementById("datepicker").value;
  			  
  			  $http(
  						{
  				        url : '<%=path%>/admin/adminAddAction!updateRecruit',
  				        method : 'post',
  				        params:{
  				        "id":$scope.recruit.id,
  				        "number":number,
  				        "place":place,
  				        "isfte":isfte,
  				        "years":years,
  				        "emergent":emergent,
  				        "deadline":new Date(deadline)
  				        }
  					}).success(function(data) {
  					if(data.code==2)
  					{
  					 swal({
  		        			  title: "修改成功，已发送邮件给HR",
  		        			  type: 'success',			
  		        			  confirmButtonText: '确定',
  		        			},
  		            		function(isConfirm) {
  		 	           			  if (isConfirm) {           				  	           			  
  		     				          	window.opener.location.reload();
  		                          window.close();	
  		 	           			  }
  		     				}); 
  					}
  					else if(data.code==1)
  					{
  					 swal({
  		        			  title: "修改成功，但发送邮件失败",
  		        			  type: 'error',			
  		        			  confirmButtonText: '确定',
  		        			},
  		            		function(isConfirm) {
  		 	           			  if (isConfirm) {           				  	           			  
  		     				          	window.opener.location.reload();
  		                           window.close();	
  		 	           			  }
  		     				}); 
  					}
  					else
  					{
  				 swal({
  		       			  title: "更新失败",
  		       			  type: 'error',			
  		       			  confirmButtonText: '确定',
  		       			},
  		           		function(isConfirm) {
  			           			  if (isConfirm) {           				  	           			  
  			           			  }
  		    				}); 
  					}
  				}).error(function(data)
  				{
  				alert("false");
  				});
  				}
  				else {
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
