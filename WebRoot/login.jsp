<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s"  uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
session.invalidate();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/datepicker3.css" rel="stylesheet">
	<link href="<%=path %>/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=path %>/css/font-awesome.min.css" rel="stylesheet">
    <link href="<%=path %>/css/prettyPhoto.css" rel="stylesheet">
    <link href="<%=path %>/css/animate.min.css" rel="stylesheet">
    <link href="<%=path %>/css/main.css" rel="stylesheet">
    <link href="<%=path %>/css/responsive.css" rel="stylesheet">
          
    <link rel="shortcut icon" href="<%=path %>/images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="<%=path %>/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="<%=path %>/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="<%=path %>/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="<%=path %>/images/ico/apple-touch-icon-57-precomposed.png">
</head>
  
  <body>
  <div class="page-wrap">
     <header id="header">
        <nav class="navbar navbar-inverse" role="banner">
            <div class="container" style="background: black;">
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
                    </ul>
                </div>
            </div><!--/.container-->
        </nav><!--/nav-->
        
    </header><!--/header-->
    <center>
			<div class="login-panel panel panel-default" style="width:425px;margin:140px;">
				<div class="panel-heading">Login</div>
				<div class="panel-body">
					<form action="loginAction!login" method="post">
						<fieldset>
							<div class="form-group">
								<input class="form-control" placeholder="Username" name="username">
							</div>
							<div class="form-group">
								<input class="form-control" placeholder="Password" name="password" type="password" >
							</div>
							<div class="form-group">
								<span style="color:red"><s:property value="#message"></s:property></span>
							</div>
							<div class="form-group" >
								<input type="radio" name="type" value="0" required/><label>管理员</label>&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="type" value="1" /><label>人事部</label>&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="type" value="2" /><label>教职工</label>
							</div>
							<!-- <div class="checkbox">
								<label>
									<input name="remember" type="checkbox" value="Remember Me">Remember Me
								</label>
							</div> -->
							<button type="submit" class="btn btn-primary" onclick="login()">Login</button>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
			</center>
			<div class="site-footer" style="position:fixed;bottom:0px;width:100%">
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
	<script type="text/javascript">
		
	</script>
  </body>
</html>
