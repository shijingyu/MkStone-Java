<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>注册</title>

<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/register.css">
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="images/favicon.ico"  type="image/x-icon">
<style type="text/css">
@charset "utf-8";
/* jQuery插件库 www.jq22.com */
* {
	margin:0;
	padding:0;
}
ul, li {
	list-style:none;
}
.inputElem {
	line-height:22px;
}

.parentCls ul{ padding-left: 5px; padding-right: 5px; }
.auto-tip {background:#fff;margin-left:15px;}
.auto-tip li { width: 100%; height: 30px; line-height: 30px; font-size: 14px;}
.auto-tip li.hoverBg {
	background:#ddd;
	cursor:pointer;
}

.hidden {
	display:none;
}
}
</style>



<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<div class="register">
		<form class="form-horizontal" id="registerform"
			action="UserRegisterServlet" method="post">
			<div class="form-group">
				<label for="inputText1" class="col-sm-2 control-label">用户名</label>
				<div class="col-sm-10">
					<input type="text" name="username" class="form-control"
						id="username" minlength="6" maxlength="20" placeholder="用户名"
						required>
				</div>
			</div>
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">邮箱</label>
				<div class="col-sm-10 parentCls">
					<input type="email" name="email" class="form-control inputElem" id="email"
						placeholder="邮箱" required>
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">密码</label>
				<div class="col-sm-10 ">
					<input type="password" name="password" class="form-control "
						id="password1" placeholder="密码" required>
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">确认密码</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="password2" onblur="validate()"
						placeholder="确认密码" maxlength="16" required >
				</div>
			</div>
			<div class="form-group">
				<label for="inputText2" class="col-sm-2 control-label">手机号</label>
				<div class="col-sm-10">
					<input type="text" name="phone" class="form-control" id="phone" 
						placeholder="手机号" maxlength="11" required>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" id="submit" class="btn btn-primary" value="注册" />
				</div>
			</div>
		</form>
	</div>




	<script src="js/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="js/messages_zh.js"></script>
	<script type="text/javascript" src="js/emailAutoComplete.js"></script>
	<script src="js/layer.js"></script>

	<script>
          function validate() {
              var pw1 = document.getElementById("password1").value;
              var pw2 = document.getElementById("password2").value;
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
