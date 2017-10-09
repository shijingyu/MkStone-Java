<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员登录</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/admin-login.css" rel="stylesheet">
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="images/favicon.ico"  type="image/x-icon">
</head>
<body>
	<div class="admin-login">
		<h1>管理员登录</h1>
		<form class="form-horizontal" role="form" action="AdminLoginServlet"
			method="post">
			<div class="form-group form-group-lg">
				<label for="inputText3" class="col-sm-2 control-label">管理员</label>
				<div class="col-sm-10">
					<input type="text" name="adminname" class="form-control required"
						id="inputText3" placeholder="管理员" autofocus="autofocus" required>
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

			
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-primary btn-lg">登陆</button>
				</div>
			</div>
		</form>
	</div>
	
	<div id="particles-js" style="left: 0; right: 0; position: fixed;z-index: -1"></div>
</body>
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="//cdn.bootcss.com/particles.js/1.0.2/particles.min.js"></script>
<script type="text/javascript">
particlesJS('particles-js', {
    particles: {
        color: '#84d2f5',
        shape: 'circle', // "circle", "edge" or "triangle"
        opacity: 3,
        size: 5,
        size_random: true,
        nb: 150,
        line_linked: {
            enable_auto: true,
            distance: 200,
            color: '#ddd',
            opacity: 1,
            width: 1,
            condensed_mode: {
                enable: false,
                rotateX: 600,
                rotateY: 600
            }
        },
        anim: {
            enable: true,
            speed: 10
        }
    },
    interactivity: {
        enable: false,
        mouse: {
            distance: 250
        },
        detect_on: 'canvas', // "canvas" or "window"
        mode: 'grab',
        line_linked: {
            opacity: .5
        }
    },
    /* Retina Display Support */
    retina_detect: true
});
</script>
</html>