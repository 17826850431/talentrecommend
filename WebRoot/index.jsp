<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>首页</title>
	
	<!-- core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->

<body class="homepage">

    <header id="header">
        <div class="top-bar">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-xs-4">
                    </div>
                    <div class="col-sm-6 col-xs-8">
                       <div class="social">
                            <ul class="social-share">
                                <%if(session.getAttribute("loginEmployee")!=null||session.getAttribute("admin")!=null||session.getAttribute("hr")!=null){ %>
						      <li class="dropdown active">
                                 <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="line-height:25px"><i class="fa fa-user"></i></a>
                                  <ul class="dropdown-menu" style="text-align: center;background-color: black;">
                                      <li ><a href="<%=path %>/user/personInfo.jsp" style="width: 180px;">个人设置</a></li>
		                              <li ><a href="<%=path %>/login.jsp" style="width: 180px;">注销</a></li>
                                 </ul>
                                </li>
						      	<%}else{ %>
						      	<li >
						      	<a href="login.jsp" style="width:40px">登录 </a>
						      	</li>
						      	<%} %>
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
                      <%if(session.getAttribute("admin")!=null){ %>
                        <li class="active"><a href="index.jsp">首页</a></li>
                        <li ><a href="<%=path %>/admin/admin_emergency.jsp">紧急招聘</a></li>
                        <li><a href="<%=path %>/admin/admin_normal.jsp">普通招聘</a></li>
                        <li><a href="<%=path %>/admin/admin_resume.jsp">简历库</a></li>
                        <li ><a href="<%=path %>/admin/admin_employee.jsp">教职工</a></li> 
                        <li><a href="<%=path %>/admin/admin_hr.jsp">人事部</a></li>   
                         <%}%> 
                           <%if(session.getAttribute("loginEmployee")!=null){ %>
                              <li class="active"><a href="index.jsp">首页</a></li>
                         <li ><a href="<%=path %>/user/emergency.jsp">紧急招聘</a></li>
                        <li ><a href="<%=path %>/user/normal.jsp">普通招聘</a></li>
                        <li ><a href="<%=path %>/user/resume.jsp">简历库</a></li>
                        <li><a href="<%=path %>/user/myrecommend.jsp">我的推荐</a></li>
                         <%}if(session.getAttribute("hr")!=null) {%>
                            <li class="active"><a href="index.jsp">首页</a></li>
						  <li ><a href="<%=path %>/hr/postRecruit.jsp">发布招聘</a></li>
						  <li ><a href="<%=path %>/hr/myRecruit.jsp">我的招聘</a></li>
						  <li ><a href="<%=path %>/hr/recruitList.jsp">招聘列表</a></li>
					  </ul>
                         <%}%> 
                    </ul>
                </div>
            </div><!--/.container-->
        </nav><!--/nav-->
		
    </header><!--/header-->

    <section id="main-slider" class="no-margin">
        <div class="carousel slide">
            <ol class="carousel-indicators">
                <li data-target="#main-slider" data-slide-to="0" class="active"></li>
                <li data-target="#main-slider" data-slide-to="1"></li>
                <li data-target="#main-slider" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">

                <div class="item active" style="background-image: url(images/slider/bg1.jpg)">
                    <div class="container">
                        <div class="row slide-margin">
                            <div class="col-sm-6">
                                <div class="carousel-content">
                                    <h1 class="animation animated-item-1">本校诚聘各类优秀教师加入我校！只要你是一名心中有学生的教师，都可以来尝试！</h1>
                                    <h2 class="animation animated-item-2">青青子衿，悠悠我心。纵我不往，子宁不嗣音？</h2>
                                </div>
                            </div>

                          

                        </div>
                    </div>
                </div><!--/.item-->

                <div class="item" style="background-image: url(images/slider/bg2.jpg)">
                    <div class="container">
                        <div class="row slide-margin">
                            <div class="col-sm-6">
                                <div class="carousel-content">
                                    <h1 class="animation animated-item-1">本校诚聘各类优秀教师加入我校！只要你是一名心中有学生的教师，都可以来尝试！</h1>
                                    <h2 class="animation animated-item-2">青青子佩，悠悠我思。纵我不往，子宁不来？</h2>
                                </div>
                            </div>

                            

                        </div>
                    </div>
                </div><!--/.item-->

                <div class="item" style="background-image: url(images/slider/bg3.jpg)">
                    <div class="container">
                        <div class="row slide-margin">
                            <div class="col-sm-6">
                                <div class="carousel-content">
                                <h1 class="animation animated-item-1">本校诚聘各类优秀教师加入我校！只要你是一名心中有学生的教师，都可以来尝试！</h1>
                                    <h2 class="animation animated-item-2">挑兮达兮，在城阙兮。一日不见，如三月兮。</h2>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </div><!--/.item-->
            </div><!--/.carousel-inner-->
        </div><!--/.carousel-->
        <a class="prev hidden-xs" href="#main-slider" data-slide="prev">
            <i class="fa fa-chevron-left"></i>
        </a>
        <a class="next hidden-xs" href="#main-slider" data-slide="next">
            <i class="fa fa-chevron-right"></i>
        </a>
    </section><!--/#main-slider-->
	<div class="site-footer" style="position:fixed;bottom:0px;width:100%">
    <section id="bottom" style="padding:0px">
     
         
    </section><!--/#bottom-->

    <footer id="footer" class="midnight-blue">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                   Copyright &copy; 2017 码客工作室 版权所有.
                </div>
                <div class="col-sm-6">
                </div>
            </div>
        </div>
    </footer><!--/#footer-->
</div>
    <script src="http://apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/jquery.isotope.min.js"></script>
    <script src="js/main.js"></script>
    <script src="js/wow.min.js"></script>
</body>
<script type="text/javascript">
/* window.onload=function(){
	 var wrap=document.getElementById('wrap'),
	 list=document.getElementsByClassName('item'),
	 index=0,
	 timer=null;
	 
	 // 定义并调用自动播放函数
	 timer = setInterval(autoPlay, 2000);
	 
	 // 鼠标划过整个容器时停止自动播放
	 wrap.onmouseover = function () {
	 clearInterval(timer);
	 }
	 
	 // 鼠标离开整个容器时继续播放至下一张
	 wrap.onmouseout = function () {
	 timer = setInterval(autoPlay, 2000);
	 }
	 // 遍历所有数字导航实现划过切换至对应的图片
	 for (var i = 0; i < list.length; i++) {
	 list[i].onmouseover = function () {
	 clearInterval(timer);
	 index = this.innerText - 1;
	 changePic(index);
	 };
	 };
	 
	 function autoPlay () {
	 if (++index >= list.length) index = 0;
	 changePic(index);
	 }
	 
	 // 定义图片切换函数
	 function changePic (curIndex) {
	 for (var i = 0; i < list.length; ++i) {
		 list[i].style.display = "none";
	 }
	 list[curIndex].style.display = "block";
	 }
	 
	 }; */
</script>
</html>
