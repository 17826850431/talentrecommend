<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>教职工</title>
    
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
    <link href="<%=path %>/css/sweet-alert.css" rel="stylesheet" type="text/css" media="all"/>
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="<%=path %>/images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="<%=path %>/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="<%=path %>/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="<%=path %>/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="<%=path %>/images/ico/apple-touch-icon-57-precomposed.png">
    <style type="text/css">
    .form-group{margin-bottom:1px;}
    .page-wrap {
  min-height: 506px;
  /* equal to footer height */
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
                           <%if(session.getAttribute("admin")!=null){ %>
						      <li class="dropdown active">
                                 <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="line-height:25px"><i class="fa fa-user"></i></a>
                                  <ul class="dropdown-menu" style="text-align: center;background-color: black;">
                                      <li ><a href="<%=path %>/admin/personInfo.jsp" style="width: 180px;">个人设置</a></li>
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
                        <li ><a href="<%=path %>/admin/admin_emergency.jsp">紧急招聘</a></li>
                        <li><a href="<%=path %>/admin/admin_normal.jsp">普通招聘</a></li>
                        <li><a href="<%=path %>/admin/admin_resume.jsp">简历库</a></li>
                        <li class="active"><a href="<%=path %>/admin/admin_employee.jsp">教职工</a></li> 
                        <li><a href="<%=path %>/admin/admin_hr.jsp">人事部</a></li>                        
                    </ul>
                </div>
            </div><!--/.container-->
        </nav><!--/nav-->
        
    </header><!--/header-->
          <div  class="container" style="margin-top:130px;background-color: white;">
                 <button type="button" class="btn btn-default" style="float:right;margin-right:10%;color:#c52d2f" ng-click="deleteMany()">批量删除</button>
    		   <button type="button" class="btn btn-default" style="float:right;margin-right:2%;" data-toggle="modal" data-target="#myModal">添加</button>
    		
    		
            <input type="checkbox" style="float:left;margin-left:7%" name="ifAll" id="ifAll" onClick="checkAll()">全选
                <div class="row" style="padding-top:5%">
                <div class="col-md-4 wow fadeInDown" ng-repeat="employee in employees">
               
                    <div class="clients-comments text-center">
                    <input type="checkbox" style="position:absolute;" name="checkList" ng-disabled="employee.status==1" value={{employee.id}}>
                        <img src="<%=path %>/files/images/{{employee.picture}}" class="img-circle" alt="">
                        <div style="min-height:72px;"><h3>{{employee.declaration}}</h3></div>
                        <h4><span>{{employee.realname}} / </span>{{employee.email}}</h4>
                        <h4><span>积分：{{employee.score}} / </span>{{employee.department}}</h4>
                        <button type="button" class="btn btn-default" style="border:1px solid #e5e5e5" data-toggle="modal" data-target="#myModal2" ng-click="showEmployee(employee)" >修改</button>&nbsp;&nbsp;&nbsp;&nbsp;
	                    <span title="该教职工账户正在使用，不能删除" style="cursor:pointer"> <button type="button" class="btn btn-danger"  style="background-color:#c52d2f" ng-click="confirmDelete(employee.id)" ng-disabled="employee.status==1" ng-hide="employee.status==0" >删除</button> </span>
	                    	 <button type="button" class="btn btn-danger"  style="background-color:#c52d2f" ng-click="confirmDelete(employee.id)" ng-disabled="employee.status==1" ng-hide="employee.status==1">删除</button>
                    </div>
                    
                </div>
                
                  </div>
                  
           </div>            
           
           <div class="floor" style="margin-left:65%;margin-top:-56px">
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
            <div class="form-group">
                <span style="text-align:center;font-size:25px;font-weight:800;border:0px;" class="form-control"  >添加教职工</span>
                </div>
            </div>
            <div class="modal-body">
            	<div class="form-group" >
	    		<label style="width:100px;">用&nbsp;户&nbsp;名&nbsp;：</label><input class="form-control"  type="text" placeholder="必须是10位的纯数字工号" required style="display:inline;width:35%;"  id="username" ng-blur="checkUsername()">
	    	    <label style="width:40%; color:red" id="flag" ng-show="flag==0">用户名已经存在</label>
	    	     <label style="width:40%; color:red" id="flag" ng-show="flag==2">用户名不合法</label>
	    	    <br>
	    	      <br>
	    	    </div>
	    	    	<div class="form-group" >
	    		<label style="width:100px;" >初始密码：</label><input class="form-control" type="text" value="123456" readonly="readonly" id="password" required style="display:inline;width:35%;"><br>  <br>
	    	    </div>    	
	    	     
	    	     <div class="form-group" >
	    		<label style="width:100px;" >真实姓名：</label><input class="form-control" type="text"  id="realname" required style="display:inline;width:35%;"><br>  <br>
	    	    </div>
	    	     
	    	   	<div class="form-group" >
	    		<label style="width:100px;">邮&nbsp;&nbsp;&nbsp;&nbsp;箱：</label><input class="form-control"  id="email" type="text" required style="display:inline;width:35%;"><br>  <br>
	    	    </div>
	    	    
	    	    <div class="form-group" >
	    		<label style="width:100px;" >性&nbsp;&nbsp;&nbsp;&nbsp;别：</label><select class="form-control" id="sex" required style="display:inline;width:35%;">  
	    		<option>男</option>
	    		<option>女</option>
	    		</select><br>  <br>
	    	    </div>
	    	    
	    	     <div class="form-group" >
	    		<label style="width:100px;" >部&nbsp;&nbsp;&nbsp;&nbsp;门：</label>
	    		<select class="form-control"  required style="display:inline;width:35%;" id="department">
	    		<option  ng-repeat="department in departmentlist">{{department.name}}</option>
	    		</select><br>  <br>
	    	    </div>
	    	    
	    	     <div class="form-group" >
	    		<label style="width:100px;">教师宣言：</label><textarea class="form-control" id="declaration" required style="display:inline;width:50%;height:93px;"></textarea><br>  <br>
	    	    </div>
	    	    
	    	     <div class="form-group" >
	    		<label style="width:100px;">上传照片：</label><input class="form-control" id="picture" type="file" style="display:inline;width:35%;"  /><br>  <br>
	    	    </div>
	        </div>
       
            <div class="modal-footer">
            
             <button type="button" class="btn btn-success"  ng-click="addEmployee()" ng-disabled="flag==0||flag==2">确认添加</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
    </div>
      	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            <div class="form-group">
                <span style="text-align:center;font-size:25px;font-weight:800;border:0px;" class="form-control" >修改教职工</span>
                </div>
            </div>
            <div class="modal-body">
            	<div class="form-group" >
	    		<label style="width:100px;">用&nbsp;户&nbsp;名&nbsp;：</label><input class="form-control" type="text" placeholder="用户名必须是10位的纯数字工号" required style="margin-top:20px;display:inline;width:35%;"  id="username2"  readonly="readonly" ng-blur="checkUsername()"><br>
	    	    </div>
	    	        	
	    	     
	    	     <div class="form-group" >
	    		<label style="width:100px;" >真实姓名：</label><input class="form-control" type="text"  id="realname2"  required style="margin-top:20px;display:inline;width:35%;"><br>
	    	    </div>
	    	     
	    	   	<div class="form-group" >
	    		<label style="width:100px;">邮&nbsp;&nbsp;&nbsp;&nbsp;箱：</label><input class="form-control"  id="email2" type="text" required style="margin-top:20px;display:inline;width:35%;"><br>
	    	    </div>
	    	    
	    	    <div class="form-group" >
	    		<label style="width:100px;" >性&nbsp;&nbsp;&nbsp;&nbsp;别：</label><select class="form-control"  id="sex2" required style="margin-top:20px;display:inline;width:35%;">
	    		<option>男</option>
	    		<option>女</option>
	    		</select><br>
	    	    </div>
	    	    
	    	     <div class="form-group" >
	    		<label style="width:100px;" >部&nbsp;&nbsp;&nbsp;&nbsp;门：</label>
	    		<select class="form-control"  required style="margin-top:20px;display:inline;width:35%;" id="department2" >
	    		<option  ng-repeat="department in departmentlist">{{department.name}}</option>
	    		</select>
	    	    </div>
	    	    
	    	     <div class="form-group" >
	    		<label style="width:100px;">教师宣言：</label><textarea class="form-control" id="declaration2" required style="display:inline;width:50%;height:93px;"></textarea><br>  <br>
	    	    </div>
	        </div>
       
            <div class="modal-footer">
              <button class="btn btn-primary" ng-click="resetPassword(employee2.id)" style="float:left">重置密码</button>
             <button type="button" class="btn btn-success"  ng-click="updateEmployee(employee2)">确认修改</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
    </div>

    <script src="<%=path %>/js/jQuery-2.1.4.min.js"></script>
	<script src="<%=path %>/js/bootstrap.min.js"></script>
	<script src="<%=path %>/js/angular.min.js"></script>
    <script src="<%=path %>/js/sweet-alert.js"></script>
	
	 <script>
  var emerecruit = angular.module('emerecruit', []);
   var reg=/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/; 
    emerecruit.controller('emerecruit', ["$filter","$scope","$http",function($filter,$scope ,$http) {
	$scope.employee={};
    	$scope.flag=1;
    	var text="";
 		$scope.show=function(pageNo){
        		$http(
    					{
    			        url : '<%=path%>/admin/adminSelectAction!getEmployeelist',
    					method : 'post',
    					params:{
    		        		'pageNo':pageNo,
    		        		text:text
    		        	}
    				}).success(function(data) {
    					//cnsole.log(data.employees);
    					$scope.employees=data.employees.list;
    					$scope.page=data.employees;
    					shownum($scope.page.pageNo,$scope.page.totalPage);
    					//$scope.haha=true;
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
    	
    		
    		$scope.addEmployee=function()
    		{
    		    var a=new Array();
    			 a=document.getElementById("picture").value.split("\\");
    			$scope.employee.username=document.getElementById("username").value;
    			$scope.employee.password=document.getElementById("password").value;
    			$scope.employee.email=document.getElementById("email").value;
    			$scope.employee.realname=document.getElementById("realname").value;
    			$scope.employee.sex=document.getElementById("sex").value;
    			$scope.employee.department=document.getElementById("department").value;
    			$scope.employee.declaration=document.getElementById("declaration").value;
    			$scope.employee.picture=a[a.length-1];
    			if($scope.employee.username!=""&&$scope.employee.password!=""&&$scope.employee.email!=""&&$scope.employee.realname!=""&&$scope.employee.sex!=""&&$scope.employee.declaration!=""&&$scope.employee.picture!="")
				{
    				  if($scope.employee.email.indexOf("@")!=-1)
  	            	 
    					  {
    			$http(
        				{
        		        url : '<%=path%>/admin/adminAddAction!addEmployee',
        		        method : 'post',
        		        params:{
        		        	"employeeString":JSON.stringify($scope.employee)
        		        }
        			}).success(function(data) {
        				swal({
  	         			  title: '添加员工成功',
  	         			  type: 'success',			
  	         			  confirmButtonText: '确定',
  	         			},
	             		function(isConfirm) {
    	           			  if (isConfirm) {           				  	           			  
        				          window.location.reload();
    	           			  }
        				});  
        				
        			}).error(function(data, status, headers, config) {
        				alert("false");
        			});
				}
    				  else
    				  {
    					  swal({
      	         			  title: '邮箱格式不正确',
      	         			  type: 'info',			
      	         			  confirmButtonText: '确定',
      	         			});  
      	            	
      	            	  }
        				 
				}
    			else
    				{
    				swal({
	         			  title: '请把信息填写完整',
	         			  type: 'info',			
	         			  confirmButtonText: '确定',
	         			});  
    				
    				}
    		};
    		
    		$scope.showEmployee=function(employee)
        	{
    			//$scope.getDepartmentlist();
        		$scope.employee2=employee;
        		document.getElementById("email2").value=employee.email;
        		document.getElementById("realname2").value=employee.realname;
        		document.getElementById("username2").value=employee.username;
        		document.getElementById("sex2").value=employee.sex;
        		document.getElementById("department2").value=employee.department;
        		document.getElementById("declaration2").value=employee.declaration;
        	};
        	
        	$scope.updateEmployee= function(employee2) {
        		
    			var email=document.getElementById("email2").value;
    			var realname=document.getElementById("realname2").value;
    		    var username=document.getElementById("username2").value;
    			var sex=document.getElementById("sex2").value;
    			var department=document.getElementById("department2").value;
    			var declaration=document.getElementById("declaration2").value;
    			if(email!=""&&realname!=""&&sex!="")
				{
    				  if(email.indexOf("@")!=-1)
  	            	 
    					  {
    			
    			$http(
        				{
        		        url : '<%=path%>/admin/adminAddAction!updateEmployee',
        		        method : 'post',
        		        params:{
        		        	"username":username,
        		        	"email":email,
        		        	"realname":realname,
        		        	"sex":sex,
        		        	"department":department,
        		        	"declaration":declaration,
        		        	"score":employee2.score,
        		        	"password":employee2.password,
        		        	"picture":employee2.picture,
        		        	"id":employee2.id
        		        }
        			}).success(function(data) {
        				swal({
    	         			  title: '修改员工信息成功',
    	         			  type: 'success',			
    	         			  confirmButtonText: '确定',
    	         			},
    	             		function(isConfirm) {
    	  	           			  if (isConfirm) {           				  	           			  
    	      				          window.location.reload();
    	  	           			  }
    	      				});  
        				
        			}).error(function(data, status, headers, config) {
        				alert("false");
        			});
				}
    				  else
    				  {
      	            	swal({
  	         			  title: '邮箱格式不正确',
  	         			  type: 'info',			
  	         			  confirmButtonText: '确定',
  	         			});
      				}
      	            	  
        				 
				}
    			else
    				{
    				swal({
	         			  title: '请把信息填写完整',
	         			  type: 'info',			
	         			  confirmButtonText: '确定',
	         			});
    				}
    				
        	};
        	
        	$scope.getDepartmentlist=function()
        	{
        		
        		$http(
        				{
        		        url : '<%=path%>/admin/adminSelectAction!getDepartmentlist',
        		        method : 'post',
        		        params:{
        		        }
        			}).success(function(data) {
        				
        				if(data.departments!=null)
        					{
        					$scope.departmentlist=data.departments;
        					}
        				else
        					{
        					  swal({
        	         			  title: '没有可选的部门',
        	         			  type: 'info',			
        	         			  confirmButtonText: '确定',
        	         			});      					  
        					}
        			}).error(function(data, status, headers, config) {
        				alert("false");
        			});
        	};
        	
        	$scope.getDepartmentlist();
        	
        	
        	$scope.confirmDelete=function(id)
        	{ 
        	  swal({
    			  title: '确定删除该员工的信息吗？',
    			  type: 'warning',			
    			  confirmButtonText: '确定',
    			  cancelButtonText: '取消',
    			  showCancelButton: true,
    			},
    		function(isConfirm) {
    			  if (isConfirm) {
    				  $scope.deleteEmployee(id);
        			  }  else {
    			    // Esc, close button or outside click
    			    // isConfirm is undefined
    			  }
    			});                  
    		
        	};
        	
        	
        	$scope.deleteMany=function()
        	{
        	
        	   var che_val=[];
        	   for(var i=0;i<document.getElementsByName("checkList").length;i++)
        		   {
        		      if(document.getElementsByName("checkList")[i].checked)
        		    	  {
        		    	     che_val.push(parseInt(document.getElementsByName("checkList")[i].value));  
        		    	  };
        		   }
        	
        	   if(che_val.length<=0)
        		   {
        		   swal({
         			  title: '请选择要删除的项',
         			  type: 'error',			
         			  confirmButtonText: '确定',
         			});
        		
        		   }
        	   else
        		   {
        		   swal({
         			  title: '确定删除这些员工的信息吗？',
         			  type: 'warning',			
         			  confirmButtonText: '确定',
         			  cancelButtonText: '取消',
         			  showCancelButton: true,
         			},
         		function(isConfirm) {
         			  if (isConfirm) {
         				 $scope.deleteSingle(che_val);
             			  }  else {
         			    // Esc, close button or outside click
         			    // isConfirm is undefined
         			  }
         			});  
        		   }
        	};
        	var j=0;
        	var flag=1;
        	$scope.deleteSingle=function(ids)
        	{
        		if(j==ids.length&&flag==1)
        			{
        			swal({
           			  title: '全部员工信息都已经成功删除！',
           			  type: 'success',			
           			  confirmButtonText: '确定',
           			},
             		function(isConfirm) {
	           			  if (isConfirm) {           				  	           			  
    				          window.location.reload();
	           			  }
    				});  
        			  return;
        			}
        	
        		$http(
        				{
        		        url : '<%=path%>/admin/adminDeleteAction!deleteEmployee',
        		        method : 'post',
        		        params:{
        		        	"id":ids[j]
        		        }
        			})
        			.success(function(data) {
        				
        				if(data.code==1)
        					{			
        					 j++;
        					$scope.deleteSingle(ids);
        					}
        				else
        					{
        					  flag=0;
        					  if(j==ids.length&&flag==1)
        	        			{
        	        			swal({
        	           			  title: '第'+j+1+'位员工的信息删除失败',
        	           			  type: 'error',			
        	           			  confirmButtonText: '确定',
        	           			});
        	        			}
        					}
        					
        			}).error(function(data, status, headers, config) {
        				alert("false");
        			});
        	};
        	
        	$scope.checkUsername=function()
        	{
        		var username=document.getElementById("username").value;
        		var reg=/^\d{10}$/;
        		if(!reg.exec(username))
        			{
        			  $scope.flag=2;
        			  return;
        			}
        		$http(
        				{
        		        url : '<%=path%>/admin/adminAddAction!checkEmpUsername',
        		        method : 'post',
        		        params:{
        		        	"username":username
        		        }
        			}).success(function(data) {
        				if(data.code==1)
    					{
    					 $scope.flag=1;
    					}
        				else
        				{
        					$scope.flag=0;
        				}
        			}).error(function(data, status, headers, config) {
        				alert("false");
        			});
        	};
        	
        	$scope.deleteEmployee=function(id)
        	{
        		
        		$http(
        				{
        		        url : '<%=path%>/admin/adminDeleteAction!deleteEmployee',
        		        method : 'post',
        		        params:{
        		        	"id":id
        		        }
        			}).success(function(data) {
        				
        				if(data.code==1)
    					{
        					swal({
        	           			  title: '删除成功',
        	           			  type: 'success',			
        	           			  confirmButtonText: '确定',
        	           			},
        	             		function(isConfirm) {
        	  	           			  if (isConfirm) {           				  	           			  
        	      				          window.location.reload();
        	  	           			  }
        	      				});  
    					}
    				else
    					{
    					swal({
  	           			  title: '该员工的信息正在被使用，无法删除',
  	           			  type: 'error',			
  	           			  confirmButtonText: '确定',
  	           			});
    					}        					  
        					
        			}).error(function(data, status, headers, config) {
        				alert("false");
        			});
        	};
        	 $scope.search=function() 
     	    {
        	
     	       text=document.getElementById("search").value;
     	  
     	         $scope.show(1);
     	     };
     	     
     	    $scope.resetPassword=function(id)
     	    {
     	    	$http(
     					{
     			        url : '<%=path%>/admin/adminAddAction!resetHrPassword',
     			        method : 'post',
     			        params:{
     			        	"id":id
     			        }
     				})
     				.success(function(data) {
     					
     					if(data.code==1)
     						{
     						 swal({
     		         			  title: "重置成功",
     		         			  type: 'success',			
     		         			  confirmButtonText: '确定',
     		         			},
     		             		function(isConfirm) {
     		  	           			  if (isConfirm) {           				  	           			  
     		      				          window.location.reload();
     		  	           			  }
     		      				});
     						}
     					else
     						{
     						 swal({
     		         			  title: "重置失败",
     		         			  type: 'error',			
     		         			  confirmButtonText: '确定',
     		         			},
     		             		function(isConfirm) {
     		  	           			  if (isConfirm) {           				  	           			  
     		  	           			  }
     		      				});
     						}
     						
     				}).error(function(data, status, headers, config) {
     					alert("false");
     				});
     	    };
     	    
     	   $scope.resetPassword=function(id)
    	    {
    	    	$http(
    					{
    			        url : '<%=path%>/admin/adminAddAction!resetEmpPassword',
    			        method : 'post',
    			        params:{
    			        	"id":id
    			        }
    				})
    				.success(function(data) {
    					
    					if(data.code==1)
    						{
    						 swal({
    		         			  title: "重置成功",
    		         			  type: 'success',			
    		         			  confirmButtonText: '确定',
    		         			},
    		             		function(isConfirm) {
    		  	           			  if (isConfirm) {           				  	           			  
    		      				          window.location.reload();
    		  	           			  }
    		      				});
    						}
    					else
    						{
    						 swal({
    		         			  title: "重置失败",
    		         			  type: 'error',			
    		         			  confirmButtonText: '确定',
    		         			},
    		             		function(isConfirm) {
    		  	           			  if (isConfirm) {           				  	           			  
    		  	           			  }
    		      				});
    						}
    						
    				}).error(function(data, status, headers, config) {
    					alert("false");
    				});
    	    };
  }]);
	
	function checkAll() {
  			for (var i = 0; i < document.getElementsByName("checkList").length; i++) {
  			if(document.getElementById("ifAll").checked==true && document.getElementsByName("checkList")[i].disabled==false)
  			{
   				 document.getElementsByName("checkList")[i].checked=true;
   			}
   			else
   			{
   			   document.getElementsByName("checkList")[i].checked=false;
   			}
  			}
 		}

  </script>
     </body> 	
</html>
