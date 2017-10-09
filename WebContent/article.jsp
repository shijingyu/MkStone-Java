<%@page import="org.apache.jasper.tagplugins.jstl.core.Redirect"%>
<%@ page language="java" import="java.util.*,java.io.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="entity.Article"%>
<%@page import="dao.ArticleDao"%>
<%@ page import="impl.ArticleDaoImpl"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Article</title>

<!-- Bootstrap -->
<link rel="stylesheet" href="css/bootstrap.min.css" >
<link rel="stylesheet" href="css/waterfall.css">
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="images/favicon.ico"  type="image/x-icon">
<style>
#gotop {
    display:none;
    width:55px;
    height:55px;
    position:fixed;
    right:50px;
    bottom:150px;
    background:url(../images/backtop.png); 
    background-size: 55px,55px;   
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
						<li class="dropdown active">
				          <a href="#" class="dropdown-toggle active" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">文章<span class="caret"></span></a>
				          <ul class="dropdown-menu">
				          	<li><a href="ArticleServlet">所有文章</a></li>
				            <li><a href="UserClickType?articletype=科学上网">科学上网</a></li>
				            <li><a href="UserClickType?articletype=服务器">服务器</a></li>
				            <li><a href="UserClickType?articletype=手机">手机</a></li>
				            <li><a href="UserClickType?articletype=电脑">电脑</a></li>
				          </ul>
				        </li>
						<li class="dropdown">
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

	<!-- 主体内容开始 -->
	<div class="container ">

		
		<div class="main " id="masonry">
			<c:forEach items="${articleList }" var="a">
				<div class="box" type="button" data-toggle="modal"
					data-target="#${a.aId }">
					<img style="width: 202px;" src="http://om73yvjpj.bkt.clouddn.com/${a.aPicture } " alt="">
					<p>${a.aName }</p>
					<p>原创-破解教程</p>
					<p>${a.aDate }上传</p>
					<p>
						${a.aAuthor }
					</p>
					<!-- <p>
						<img src="images/artical_32.png" alt=""> 1437 <img
							src="images/artical_34.png" alt=""> 1437 <img
							src="images/artical_36.png" alt=""> 1437
					</p> -->
				</div>
			
				
			</c:forEach>
			
			<c:forEach items="${articleList }" var="a">
			<div class="modal fade" id="${a.aId }" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
								</button>
								<c:if test="${!empty loginUserName }">
								<c:choose> 
								<c:when test="${a.aCollection==0}">
								<img class="collection" alt="${a.aId }" style="width:30px;height:30px;vertical-align:middle;" src="images/fivestar2.png"><span style="font-size:20px;">点击收藏</span>
								</c:when>
								<c:when test="${a.aCollection==1}">
								<img class="collection" alt="${a.aId }" style="width:30px;height:30px;vertical-align:middle;" src="images/fivestar1.png"><span style="font-size:20px;">点击收藏</span>
								</c:when>
								</c:choose>
								</c:if>
								
								<div class="fenxiang">  
									<div id="bdshare">  
									<div class="bdsharebuttonbox">  
									<a href="javascript:void(0)" onclick="return false;" data-cmd="more" target="_blank;"></a><a href="javascript:void(0)" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a><a href="javascript:void(0)" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="javascript:void(0)" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a href="javascript:void(0)" class="bds_renren" data-cmd="renren" title="分享到人人网"></a><a href="javascript:void(0)" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>  
									</div><script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"2","bdSize":"24"},"share":{},"selectShare":{"bdContainerClass":null,"bdSelectMiniList":["qzone","tsina","tqq","renren","weixin"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>  
									</div>  
								</div>  
								
							</div>
							<div class="modal-body">
								<div class="md-header">
									<h1>${a.aName }</h1>


								</div>
								<div class="mb-content">
									<img style="width:550px;height:350;" src="http://om73yvjpj.bkt.clouddn.com/${a.aPicture }" alt="">
									<p style="font-size:16px;padding:5px;line-height:150%;word-spacing:2px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${a.aContent }</p>


								</div>
							</div>
							
						</div>
					</div>
				</div>
				</c:forEach>
		</div>
		<!-- 瀑布流结束 -->
		
		
		
		

	</div>
	<!-- 主体部分结束 -->


    <div id="gotop"></div>

	
	<!-- 底部开始 -->
	<footer>
		<div class="container">
			<p>Design by 夏念军  2017年 
			</p>
		</div>
	</footer>
	<!-- 底部结束 -->

	<script src="js/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/masonry-docs.min.js"></script>
	<!--  侧边栏js -->
	<script>
		$(document).ready(function() {
			$(".collection").click(function(){
				var c=$(this).attr("src");
				var c_flag;		//收藏标志位
				var aId=$(this).attr("alt");
				console.log(aId);
				console.log(c);
				if(c=="images/fivestar1.png"){
					c_flag=0;
					$.ajax({
						type : "post",
						url : "CancelCollection",
						dataType : "text",
						data : {
							"aId" : aId,"c_flag":c_flag,
						},
						success : function(data, textStatus) {
							alert("已取消收藏");
						}
					})
					$(this).attr("src","images/fivestar2.png");
					
				}else{
					c_flag=1;
					$.ajax({
						type : "post",
						url : "AddCollection",
						dataType : "text",
						data : {
							"aId" : aId,"c_flag":c_flag,
						},
						success : function(data, textStatus) {
							alert("收藏成功");
						}
					})
					$(this).attr("src","images/fivestar1.png");	
					
				}

			});
		})
	</script>

	<script>
		$(function() {
			var $container = $('#masonry');
			$container.imagesLoaded(function() {
				$container.masonry({
					itemSelector : '.box',
					gutter : 20,
					isAnimated : true,
				});
			});
		});
	</script>
	
	<script type="text/javascript">
    function goTop() {
        $(window).scroll(function(e) {
            //若滚动条离顶部大于100元素
            if ($(window).scrollTop() > 100)
                $("#gotop").fadeIn(500); //以1秒的间隔渐显id=gotop的元素
            else
                $("#gotop").fadeOut(500); //以1秒的间隔渐隐id=gotop的元素
        });
    };
    
    $(function() {
        //点击回到顶部的元素
        $("#gotop").click(function(e) {
            //以1秒的间隔返回顶部
            $('body,html').animate({
                scrollTop: 0
            }, 1000);
        });
        goTop(); //实现回到顶部元素的渐显与渐隐
    });
    </script>
	
	
	

</body>
</html>