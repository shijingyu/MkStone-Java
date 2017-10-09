<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=3">
<title>Download</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/single.css">
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="images/favicon.ico"  type="image/x-icon">

<style>
	#message {
		font-size:18px;
		padding:5px;
		padding-bottom:0;
		border-bottom:1px solid #888;
		color:#8e8484;
	
	}
	#comment_date {
		font-size:12px;
		color:#777;
		text-align:right;
	}
	#x2 {
		-webkit-transition: all 0.5s ease-out;
	    -moz-transition: all 0.5s ease;
	    -o-transition: all 0.5s ease;
	}
	#x2:hover {
	    -webkit-transform: rotate(360deg);
	    -moz-transform: rotate(360deg);
	    -o-transform: rotate(360deg);
	}

</style>    
</head>
<body>
	<!-- 头部开始 -->
	<header>
		<nav class="navbar navbar-fixed-top navbar-default" role="navigation">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">mkStone</span> <span class="icon-bar"></span>
						<span class="icon-bar"></span> <span class="icon-bar"></span>
					</button>
					<a href="index.jsp"><img src="http://om73yvjpj.bkt.clouddn.com/artical_03.png" alt=""></a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="index.jsp">首页</a></li>
						<li class="dropdown">
				          <a href="#" class="dropdown-toggle active" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">文章<span class="caret"></span></a>
				          <ul class="dropdown-menu">
				          	<li><a href="ArticleServlet">所有文章</a></li>
				            <li><a href="UserClickType?articletype=科学上网">科学上网</a></li>
				            <li><a href="UserClickType?articletype=服务器">服务器</a></li>
				            <li><a href="UserClickType?articletype=手机">手机</a></li>
				            <li><a href="UserClickType?articletype=电脑">电脑</a></li>
				          </ul>
				        </li>
						<li class="dropdown active">
				          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">资源<span class="caret"></span></a>
				          <ul class="dropdown-menu">
				          	<li><a href="SourceServlet">所有资源</a></li>
				            <li><a href="SourceClickType?sourceType=破解">破解</a></li>
				            <li><a href="SourceClickType?sourceType=工具">工具</a></li>
				            <li><a href="SourceClickType?sourceType=电脑">电脑</a></li>
				          </ul>
				        </li>
					</ul>


					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"> <c:if test="${empty loginUserName }">登录注册</c:if>
								<c:if test="${!empty loginUserName }">${loginUserName }</c:if> <span
								class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<c:if test="${empty loginUserName }">
									<li><a href="login.jsp">登录</a></li>
								</c:if>
								<c:if test="${!empty loginUserName }"></c:if>
								<c:if test="${!empty loginUserName }">
									<li><a href="GetUserInfoServlet">个人资料</a></li>
								</c:if>
								<c:if test="${empty loginUserName }"></c:if>
								<c:if test="${empty loginUserName }">
									<li><a href="register.jsp">注册</a></li>
								</c:if>
								<c:if test="${!empty loginUserName }"></c:if>
								<li><a href="LoginoutServlet">退出</a></li>
							</ul></li>
					</ul>

				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>
	</header>
	<!-- 头部结束 -->


	<!-- 正文开始 -->
	<div class="content">
		<!-- 居中容器 -->
		<div class="container">
			<!-- 栅格 -->

			<!-- 路径导航 -->
			<ol class="breadcrumb">
				<li><a href="#">主页</a></li>
				<li><a href="#">资源</a></li>
				<li class="active">type</li>
			</ol>
			<div class="row">
				<!-- single页的左边 -->
				<!-- 循环开始 -->


				<div class="single_l   col-md-10">


					<h1>${sourcedetail[0].sName}</h1>
					<!-- 软件图片 -->
					<div class="row">
						<div class="single-img col-md-4">
							<img style="height: 200px; width: 200px;"
								src="http://om73yvjpj.bkt.clouddn.com/${sourcedetail[0].sPicture }" alt="">
						</div>
						<!-- 软件简短描述 -->
						<div class="single-ms col-md-8">
							<p>
								<span>大小</span>：${sourcedetail[0].sSize } <span>更新日期</span>：${sourcedetail[0].sDate }<br>
								<span>支持系统</span>：${sourcedetail[0].sSupport }
							</p>
							<a href="DownloadServlet?filename=${sourcedetail[0].sName}.zip"><button type="bu.contentton"
									class="btn btn-primary">高速下载</button></a>
						</div>

					</div>


					<div class="jianjie">
						<p class="ptitle">功能简介</p>
						<p style="font-size:16px;line-height:150%;word-spacing:2px;">&nbsp;&nbsp;&nbsp;${sourcedetail[0].sDescription }</p>
					</div>
					<hr>
					
					<div class="comment">
						<form action="ReleaseComment" method="Post">
							<input type="hidden" name="username" value="${loginUserName }">							
							<input type="hidden" name="sId"  value="${sId }">
							<c:if test="${!empty loginUserName }">
							<textarea wrap="virtual" style="width:800px;height:200px;" autofocus="autofocus" name="message" onfocus="javascript:this.value=''">
							</textarea>
							</c:if>
							<c:if test="${empty loginUserName }">
							<textarea wrap="virtual" disabled="disabled"  style="width:800px;height:200px;font-size:30px;"  name="message">
								登录后才能评论 
							</textarea>
							</c:if>
							<c:if test="${!empty loginUserName }">
							<input type="submit" style="display:block;margin:5px;width:60px;height:30px;background:#5eb9f9;"  value="提&nbsp;交">
							</c:if>
							<c:if test="${empty loginUserName }">
							<input type="submit" disabled="disabled" style="display:block;margin:5px;width:60px;height:30px;background:#5eb9f9;"  value="提&nbsp;交">
							</c:if>
							
							<hr>
						</form>
						
						
						<c:forEach items="${comment}" var="c">
							<div id="message">
								<img id="x2" class="img-circle" src="images/userinfo/${c.uimage }" style="width:40px;height:40px;">&nbsp;&nbsp;<span style="font-size:18px;">${c.username }: &nbsp;&nbsp;<span>
								${c.message}
								<p id="comment_date">评论日期：${c.date}</p>
							</div>
						</c:forEach>
						
					</div>
					

				</div>
				<!-- single页左边-end -->


				<div class="single_r col-md-2">
					<p class="p1">
						本站收集了各种实用的PC和移动端应用，团队不定时进行软件的发布及补档，如果您发现资源过期了请及时留言联系我们。<br>
						summer19940609@gmail.com
					</p>
					<p class="p2">
					<p>如果喜欢我们的网站，请支持我们！</p>
					<img style="width: 180px" src="images/erweima.jpg" alt="">
					</p>
				</div>
				<!-- single右边-end -->

			</div>
			<!-- 栅格-end -->

		</div>
		<!-- 居中容器-end -->

	</div>
	<!-- 正文-end -->
	<!-- 底部开始 -->
	<footer>
		<div class="container">
			<p>
				Design by 夏念军  2017年 
			</p>
		</div>
	</footer>
	<!-- 底部结束 -->
	
	

	<!-- 侧边栏开始 -->
	<ul class="sidebar">
		<li class="li2"><a href="">收藏</a></li>
		<li class="li3"><a href="">热门</a></li>
		<li class="li4"><a href="">热词</a></li>
		<li class="li5"><a href="">搜索</a></li>
		<li class="li6"><a href="">咨询</a></li>
		<li class="li7" id="gotop"></li>
	</ul>
	<!-- 侧边栏-end -->






	<script src="js/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	
	<!--  侧边栏js -->
	<script>
		$(document).ready(function() {
			$("#gotop").click(function() {
				$("html,body").animate({
					scrollTop : 0
				}, 300);
			});
			
		})
		
	
	</script>
	
	
	   
	
	
	
	
	
</body>
	
</html>