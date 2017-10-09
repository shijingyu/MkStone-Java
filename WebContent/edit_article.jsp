<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html class="no-js fixed-layout">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>mkstone后台管理</title>
  <meta name="description" content="这是一个 index 页面">
  <meta name="keywords" content="index">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
  <link rel="stylesheet" href="assets/css/admin.css">
  <link rel="icon" href="images/favicon.ico" type="image/x-icon">
  <link rel="shortcut icon" href="images/favicon.ico"  type="image/x-icon">
</head>
<body>
<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，Amaze UI 暂不支持。 请 <a href="http://browsehappy.com/" target="_blank">升级浏览器</a>
  以获得更好的体验！</p>
<![endif]-->

<header class="am-topbar am-topbar-inverse admin-header">
  <div class="am-topbar-brand">
    <strong>mkStone</strong> <small>后台管理</small>
  </div>
  <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>
  <div class="am-collapse am-topbar-collapse" id="topbar-collapse">
    <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
      <li class="am-dropdown" data-am-dropdown>
        <a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
          <span class="am-icon-users"></span> 管理员 <span class="am-icon-caret-down"></span>
        </a>
      </li>
      <li class="am-hide-sm-only"><a href="javascript:;" id="admin-fullscreen"><span class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>
    </ul>
  </div>
</header>


  <div class="am-cf admin-main">
<!-- 侧边栏开始 -->
  <div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
    <div class="am-offcanvas-bar admin-offcanvas-bar">
      <ul class="am-list admin-sidebar-list">
        <li><a href="Admin_User"><span class="am-icon-home"></span> 首页</a></li>
        <li><a href="Admin_Source"><span class="am-icon-table"></span> 资源管理</a></li>
        <li><a href="Admin_Article"><span class="am-icon-pencil-square-o"></span>文章管理</a></li>
        <li><a href="Admin_Loginout"><span class="am-icon-sign-out"></span> 注销</a></li>
      </ul>
    </div>
  </div>
  <!-- 侧边栏结束 -->

  <!-- content start -->
  <div class="admin-content">
    <div class="admin-content-body">
      <div class="am-cf am-padding">
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">首页</strong></div>
      </div>

      <div class="am-g">
        <div class="am-u-sm-12">
          <%
          String aName = request.getParameter("aName"); 
          %>
		<p style="color:black;font-size:16px;">文章名：&nbsp;&nbsp;<span style="color:blue;"><%=aName %></span></p>
          <!-- 编辑资料表单 -->
		 <div style="background:#e3edfd;padding:20px;">
			<form id="edit_article" action="EditArticleByName" method="post">
				<div class="form-group">
					<label for="inputText1" class="control-label">新文章名</label>
					<input type="hidden" name="aName" value="<%=aName %>">
					<input type="text" name="aname" class="form-control" id="aname"
							placeholder="新文章名" required>
				</div>
		
				<div class="form-group">
					<label for="inputText2" class="control-label">内容</label>
					<input type="text" name="acontent" class="form-control" id="acontent"
							placeholder="内容" required>
				</div>
				
				
				<div class="form-group">
					<label for="inputText2" class="control-label">作者</label>
					<input type="text" name="aauthor" class="form-control" id="aauthor"
							placeholder="作者" required>
				</div>
				<div class="form-group">
					<label for="inputText2" class="control-label">类型</label>
						<input type="text" name="atype" class="form-control" id="atype"
							placeholder="类型" required>
				</div>
				
				<div class="form-group">
						<input type="submit" class="btn btn-primary btn-block" value="提交" />
				</div>
			</form>
           </div>                  
                             
        </div>
      </div>
    </div>

    <footer class="admin-content-footer">
      <hr>
      <p class="am-padding-left">Design by 夏念军  2017年 </p>
    </footer>
  </div>
  <!-- content end -->
</div>

<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>



<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<script src="assets/js/amazeui.min.js"></script>
<script src="assets/js/app.js"></script>
</body>
</html>
