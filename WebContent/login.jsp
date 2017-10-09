<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=3">
<title>登陆</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/login.css" rel="stylesheet">
<link href="css/sweetalert.css" rel="stylesheet">
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="images/favicon.ico"  type="image/x-icon">
</head>
<body>
	<div class="login">
		<h1>登录</h1>
		<form class="form-horizontal" role="form" action="UserLoginServlet"
			method="post">
			<div class="form-group form-group-lg">
				<label for="inputText3" class="col-sm-2 control-label">用户名</label>
				<div class="col-sm-10">
					<input type="text" name="username" class="form-control required"
						id="inputText3" placeholder="用户名" autofocus="autofocus" required>
				</div>
			</div>
			<div class="form-group form-group-lg">
				<label for="inputPassword3" class="col-sm-2 control-label">密&nbsp;&nbsp;&nbsp;码</label>
				<div class="col-sm-10">
					<input type="password" name="password"
						class="form-control required" id="inputPassword3" placeholder="密码"
						required>
				</div>
			</div>

			<div class="form-group form-group-lg">
				<label for="inputText3" class="col-sm-2 control-label">验证码</label>
				<div class="col-sm-3 pull-left">
					<input type="text" name="code" class="form-control required"
						id="inputPassword3" placeholder="验证码" required>
				</div>
				<div class="col-sm-7 pull-left">
					<img style="height: 46px" id="image" src="image.jsp">&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="javascript:reloadImage('image.jsp')">看不清</a>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button style="margin-right: 30px;width:100px;" type="submit" id="login" class="btn btn-primary btn-lg">登陆</button>
					<a href="admin-login.jsp">管理员登录</a>
				</div>
			</div>
		</form>
	</div>
	

</body>
</body>
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/sweetalert.min.js"></script>
<script src="js/messages_zh.js"></script>
<script src="js/layer.js"></script>
<script>
	$.validator.setDefaults({
		submitHandler : function() {
			alert("提交事件!");
		}
	});
	$().ready(function() {
		$("#commentForm").validate();
	});
</script>
<script type="text/javascript">
	function reloadImage(imgurl) {
		var getimagecode = document.getElementById("image");
		getimagecode.src = imgurl + "?id=" + Math.random();
	}
</script>

<!-- 登录的loading效果 -->
<script>
	$('#login').on('click', function(){
		  var ii = layer.load(0);
		  //此处用setTimeout演示ajax的回调
		  setTimeout(function(){
		  layer.close(ii);
		  }, 1000);
	});
</script>
</html>
