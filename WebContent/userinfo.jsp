<%@ page language="java" import="java.util.*,java.io.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>用户个人资料</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/userinfo.css" rel="stylesheet">
<link href="css/sweetalert.css" rel="stylesheet">
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="images/favicon.ico"  type="image/x-icon">


<style type="text/css">
.fileWrap {
  float: left;
  position: relative;
  width: 100px;
  height: 30px;
  overflow: hidden;
  margin-bottom:10px;
}
.fileWrap input[type=file] {
  position: absolute;
  top: 0;
  left: 0;
  width: 100px;
  height: 30px;
  opacity: 0;
  filter: alpha(opacity=0);
  cursor: pointer;
}
.fileWrap button {
  width: 100%;
  height: 100%;
  background-color: #fff;
  border: 1px solid green;
}
.fileName {
  float: left;
  margin-left: 15px;
  line-height: 30px;
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

	<!-- 页面主体部分开始 -->
	<div class="container">
		<div class="main">
			<h1>个人资料</h1>

			<!-- 栅格布局开始 -->
			<div class="row">
				<!-- 栅格左边部分 -->
				<div class="content-l col-md-3">
					<div class="user_image">
					<c:if test="${!empty loginUserName }">
					   <img id="userinfo_image"  style="width: 250px; height: 250px" data-toggle="modal" data-target="#xgtx"
                            src="images/userinfo/${userinfo[0].uimage }" >
					</c:if>
					<c:if test="${empty loginUserName }">
					   <img src="images/未登录.png" style="width:250px;height:250px;">
					</c:if>
						
					</div>
					${result }

					<!-- <div id="changeimage_form" style="display: none">
						<form action="ChangeUimageServlet" id="change_image_form"
							method="post" enctype="multipart/form-data">
							<div class="choose-image ">
							<div class="form-control">
								<div class="fileWrap">
								 	<input type="file" name="chooseimage"
										id="chooseimage">
									<button type="button">浏览</button>
								 </div>
								<span class="fileName">请上传文件</span>	
							</div>
							</div>
							<div class="change-image">
								<input type="submit" id="changeimage" class="btn btn-primary"
									value="提交" />
							</div>
						</form>
					</div> -->

				</div>
				<!-- 栅格中间部分 -->
				<div class="content-c col-md-5">
					<div class="user_btn">
						<button type="button" id="changePwd" class="btn btn-primary" data-toggle="modal" data-target="#czmm">重置密码</button>
						<button type="button" id="editInfo" class="btn btn-primary" data-toggle="modal" data-target="#bjzl">编辑资料</button>
					</div>
					<div class="user_show">
						<p>用户名：${loginUserName }</p>
						<p>邮&nbsp;&nbsp;&nbsp;箱：${userinfo[0].email }</p>
						<p>手机号：${userinfo[0].phone }</p>
					</div>
					
					
				</div>
				<!-- 栅格右边部分 -->
				<div class="content-r col-md-4">
					
					
				</div>

			</div>
			<!-- 栅格布局结束 -->
					<div class="user_collection" style="margin-top:80px;">
						<h1>我的收藏</h1>
						<c:if test="${empty loginUserName }">
                            <p style="font-size:20px;">请先登录</p>
                        </c:if>
                        <c:if test="${!empty loginUserName }">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>文章Id</th>
									<th>文章名</th>
									<th>收藏时间</th>
									<th>操作</th>
								</tr>
							</thead>
								<tbody>
                                    <c:forEach items="${collectionList }" var="c">
                                    <tr>
                                        <td>${c.aId }</td>
                                        <td style="width:200px;white-space:nowrap;overflow:hidden;text-overflow: ellipsis;">${c.aName }</td>
                                        <td>${c.DATE }</td>
                                        <td>
                                            <button class="btn"><a href="UserCancelCollection?aId=${c.aId }" style="text-decoration:none;">取消收藏</a></button>
                                        </td>
                                    </tr>
                                    </c:forEach>
								</tbody>
						</table>
						</c:if>
					</div>
		</div>
	</div>
	<!-- 页面主体部分结束 -->

	<!-- 页面底部开始 -->
	<div class="footer"></div>
	<!-- 页面底部结束 -->

	
	<div class="modal fade" id="xgtx" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog modal-sm" role="document">
	    <div class="modal-content">
	      <div class="modal-body" style="background:#eee;padding:20px;">
	        <p style="text-align:center;font-size:24px;">修改头像</p>
	        <form action="ChangeUimageServlet" id="change_image_form" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <img src="images/userinfo/${userinfo[0].uimage }" style="width:260px;height:260px" />
		        <div class="form-comtrol" style="margin-top:10px;">
			        <div class="fileWrap ">
					  <input type="file" name="chooseimage" id="chooseimage">
					  <button type="button">浏览</button>
					</div>
					<span class="fileName">请上传文件</span>
		        </div>
           </div>
           
           <button type="submit" class="btn btn-primary btn-block">提交</button>
        </form>
	      </div>
	     
	    </div>
	  </div>
	</div>
	
	
	


	
    <!-- 编辑资料模态框 -->
	<div class="modal fade" id="bjzl" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog modal-sm" role="document">
	    <div class="modal-content">
	      <div class="modal-body" style="background:#eee;padding:20px;">
	        <p style="text-align:center;font-size:24px;">编辑资料</p>
	        <form id="edit_info" action="EditInfoServlet" method="post">
            <div class="form-group">
               <label for="exampleInputAccount8">手机号:</label>
               <input type="text" name="phone" class="form-control" id="exampleInputAccount8" placeholder="手机号">
           </div>
           <div class="form-group">
               <label for="exampleInputPassword8" class="required">邮&nbsp;&nbsp;&nbsp;箱:</label>
               <input type="text" name="email" class="form-control" id="exampleInputPassword8" placeholder="邮箱">
           </div>
           <button type="submit" class="btn btn-primary btn-block">提交</button>
        </form>
	      </div>
	     
	    </div>
	  </div>
	</div>
	
	
	<!-- 修改密码模态框 -->
    <div class="modal fade" id="czmm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
          <div class="modal-body" style="background:#eee;padding:20px;">
            <p style="text-align:center;font-size:24px;">修改密码</p>
             <form id="change_pwd" action="ChangePwdServlet" method="post">
               <div class="form-group">
                   <label for="exampleInputAccount6" class="required">手机号</label>
                   <input type="text" name="phone" class="form-control" id="phone"
                   placeholder="手机号">
               </div>
               <div class="form-group">
                   <label for="exampleInputPassword6" class="required">新密码</label>
                   <input type="password" name="newPassword" class="form-control"
                   id="newPwd" placeholder="新密码">
               </div>
               <div class="form-group">
                   <label for="exampleInputPassword6" class="required">确认密码</label>
                   <input type="password" name="reNewPassword" class="form-control" onblur="validate()"
                   id="ReNewPwd" placeholder="确认密码">
               </div>
               <div class="form-group">
                   <label for="exampleInputAccount6" class="required">短信验证码</label>
                   <input type="text" name="messageCode" class="form-control"
                   id="messageCode" placeholder="短信验证码">
               </div>
               <input type="button" id="sendMessage" style="margin-bottom: 10px;margin-top: 10px" class="btn btn-primary btn-block" value="发送验证码">
               <button type="submit" id="submit" class="btn btn-primary btn-block">提交</button>
           </form>
           <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">关闭</span></button>
        
          </div>
         
        </div>
      </div>
    </div>



	<script src="js/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/layer.js"></script>
	<script src="js/sweetalert.min.js"></script>
	<!-- <script>
		$('#changePwd').on('click', function() {
			layer.open({
				type : 1,
				title : [ '重置密码', 'text-align:center;font-size:18px;' ],
				area : [ '350px', '300px' ],
				shadeClose : true, //点击遮罩关闭
				content : $('#form_cp'),
			});

		});
	</script> -->

	



	<!-- <script>
		$('#userinfo_image').on('click', function() {
			layer.open({
				type : 1,
				title : [ '修改图像', 'text-align:center;font-size:18px;' ],
				area : [ '350px', '300px' ],
				shadeClose : true, //点击遮罩关闭
				content : $('#changeimage_form'),
			});

		});
	</script> -->


	<script type="text/javascript">
		window.onload = function() {
			var send = document.getElementById('sendMessage'), times = 60, timer = null;
			send.onclick = function() {
				// 计时开始
				var that = this;
				this.disabled = true;
				timer = setInterval(function() {
					times--;
					that.value = times + "秒后重试";
					if (times <= 0) {
						that.disabled = false;
						that.value = "发送验证码";
						clearInterval(timer);
						times = 60;
					}
					console.log(times);
				}, 1000);
			}

		}
	</script>

	<script type="text/javascript">
		$("#sendMessage").on('click', function() {
			var phone = $("#phone").val();
			$.ajax({
				type : "post",
				url : "SendMessageServlet",
				dataType : "text",
				data : {
					"phone" : phone,
				},
				success : function(data, textStatus) {
					layer.msg('短信验证码已发送到你的手机');
				}

			})
		})
	</script>
	
	
	<script type="text/javascript">
	/* center modal */
	function centerModals(){
	    $('.modal').each(function(i){
	        var $clone = $(this).clone().css('display', 'block').appendTo('body');    var top = Math.round(($clone.height() - $clone.find('.modal-content').height()) / 2);
	        top = top > 0 ? top : 0;
	        $clone.remove();
	        $(this).find('.modal-content').css("margin-top", top);
	    });
	}
	$('.modal').on('show.bs.modal', centerModals);
	$(window).on('resize', centerModals);
	
	var $fileName = $('.fileName');
    $('input[type=file]').change(function() {
      var path = $(this).val();
      var fileName = path ? path.substr(path.lastIndexOf('\\') + 1) : '请上传文件';
      $fileName.text(fileName);
    });
	</script>
	

	<script>
          function validate() {
              var pw1 = document.getElementById("newPwd").value;
              var pw2 = document.getElementById("ReNewPwd").value;
              if(pw1 == pw2) {
                document.getElementById("submit").disabled = false;
              }
              else {
                layer.msg("两次密码不相同")
                document.getElementById("submit").disabled = true;
              };
              
          }
          
          
          
       	 
       
      </script>

</body>
</html>