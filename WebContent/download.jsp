<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="entity.Source"%>
<%@ page import="dao.SourceDao"%>
<%@ page import="impl.SourceDaoImpl"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Download</title>

<!-- Bootstrap -->
<link rel="stylesheet" href="css/bootstrap.min.css" >
<link rel="stylesheet" href="css/download.css">
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="images/favicon.ico"  type="image/x-icon">
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
				          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">文章<span class="caret"></span></a>
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

	<!-- 正文 -->
	<div class="content">
		<div class="container">
			<h1>资源下载</h1>
			<ol class="breadcrumb">
				<li><a href="index.jsp">主页</a></li>
				<li class="active"><a href="SourceServlet">资源</a></li>
				
			</ol>
			<!-- 栅格布局 -->
			<div class="row">
				<!-- 文章左边 -->
				<div class="content-l col-md-10">
					<!-- 循环开始 -->
					<%-- <%
						request.setCharacterEncoding("utf-8");
						//设置页面的响应编码格式
						response.setContentType("text/html; charset=utf-8");
						SourceDao dao = new SourceDaoImpl();
						List<Source> sourceList = dao.getAllSource();
						request.getSession().setAttribute("sourceList", sourceList);
					%> --%>
					<%
						int i=1;
					%>
					<c:forEach items="${sourceList }" var="s">
						<div class=" box row">
							<!-- 下载链接左边图片 -->
							<div class="download-img col-md-2">
								<a href="single.jsp"><img
									style="width: 100px; height: 100px" src="http://om73yvjpj.bkt.clouddn.com/${s.sPicture }"
									alt=""></a>
							</div>
							<!-- 下载链接右边描述 -->
							<div class="download-dec col-md-10">
								<!-- 描述标题 -->
								<h1>${s.sName }</h1>
								
								<p  id="<%=i++%>" class="dec1">${s.sDescription }</p>
								<p class="dec2">
									<span>大小</span>：${s.sSize } &nbsp; <span>上传时间</span>：${s.sDate }
									&nbsp;<span>软件类型</span>：${s.sType } <br> <span>语言</span>：中文&nbsp;
									&nbsp;&nbsp; &nbsp;<span>支持系统</span>：${s.sSupport }
								</p>
								<a href="SourceDetailServlet?id=${s.sId}">
									<button type="button" class="btn btn-primary">立即下载</button>
								</a>
							</div>
						</div>
					</c:forEach>


				</div>
				<!-- 文章右边 -->
				<div class="content-r col-md-2">
					<p class="p1">
						本站收集了各种实用的PC和移动端应用，团队不定时进行软件的发布及补档，如果您发现资源过期了请及时留言联系我们。<br>
						summer19940609@gmail.com
					</p>
					<p class="p2">
					<p>如果喜欢我们的网站，请支持我们！</p>
					<img style="width: 180px" src="images/erweima.jpg" alt="">
					</p>
				</div>
				<!-- 文章右边-end -->
			</div>
			<!-- 栅格布局-end -->
		</div>
		<!-- 居中容器-end -->
	</div>
	<!-- 正文结束 -->

	
	<!-- <nav>
		<div class="container">
			<ul class="pagination pagination-lg">
				<li><a href="#">&laquo;</a></li>
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">&raquo;</a></li>
			</ul>
		</div>
	</nav> -->

	<!-- 分页-end -->

	

	<!-- 底部开始 -->
	<footer>
		<div class="container">
			<p>Design by 夏念军  2017年 </p>
		</div>
	</footer>
	<!-- 底部结束 -->
	<input type="hidden" id="size" value="${size }"/>
	
	
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
	
	<script type="text/javascript">
		$(function() {
			$('img').hover(function() {
				$(this).fadeTo("fast", 0.3);
			}, function() {
				$(this).fadeTo("fast", 1);
			});
		});
	</script>
	<script>
		$(function(){
			var size = $('#size').val();
			console.log(size);
			var str = '';
			var s = '';
			for(var i=1;i<=size;i++){
				var dec = $('#'+i);
				str = dec.text();
				s = str.substring(0,200);
				s = s + '...';
				dec.html(s);
			}
		});
	</script>
	
	
</body>
</html>