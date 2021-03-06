<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
		<link rel="stylesheet" href="css/style.css">
		<title>个人档案</title>
	</head>
	<body>
		<div id="header" class="header">
			<div class="headtop">
				<div class="hosplogo">
					<img src="image/icon1.png">
				</div>
				<div class="caselogin" id="caselogin1" style="display: block;">
					<img src="image/caselogin.png">
				</div>
				<div class="caselogin logined" id="caselogin2" style="display: none;">
					<a class="logouta" hidefocus="hidefocus" style="color:#1695CA;">
						<span id="usernamespan">XXXX</span>
						，您好
					</a>
					<span class="sep"> | </span>
					<a class="logouta" hidefocus="hidefocus" href="javascript:logout()">安全退出</a>
				</div>
			</div>
		</div>
		<div class="headnavarea" id="headnavarea"></div>
		<div class="container">
			<div class="content-info">
				<div class="content" style="background: transparent;">
					<ul>
						<li class="info">
							<a href="src/info.jsp">
								<i></i>
							    <p>个人资料</p>
							</a>
						</li>
						<li class="menzhen">
							<a href="src/menzhen.jsp">
								<i></i>
								<p>预约记录</p>
							</a>
						</li>
						<li class="chufang">
							<a href="src/chufang.jsp">
								<i></i>
								<p>处方记录</p>
								<span>（建设中）</span>
							</a>
						</li>
						<li class="jiancha">
							<a href="src/jiancha.jsp">
								<i></i>
								<p>检查记录</p>
							</a>
						</li>
						<li class="huanyan">
							<a href="src/huanyan.jsp">
								<i></i>
								<p>检验记录</p>
							</a>
						</li>
						<li class="zhuyuan">
							<a href="src/zhuyuan.jsp">
								<i></i>
								<p>住院记录</p>
								<span>（建设中）</span>
							</a>
						</li>
					</ul>
				</div>
			</div>

			<div class="rightnav">
				<a href="">
					<div class="rnbut" style="margin-bottom: 15px;">
						<img src="image/gotowebsite.png">
					</div>
				</a>
			</div>
		</div>

		<div class="inthospopup" id="loginDiv" style="display: none">
			<div class="cover"></div>
			<div id="loginContentDiv" class="ihconpop">
				<div class="closeihconpop"></div>
				<div class="ihcphead">登陆/注册</div>
				<div class="ihcpbody hp-loginpop">
					<img class="hp-loginuser" src="image/loginuser.png">
					<img class="hp-loginkey" src="image/loginkey.png">
					<input type="text" class="loginuser" id="userName" placeholder="请输入手机号">
					<input type="password" class="loginuser loginuserkey" id="password" placeholder="请输入密码">
					<div class="loginusered">
						<a id="forgetPassWord" class="forgetkey">忘记密码</a>
						<div>
							<div id="login" class="loginbut">登录</div>
							<a href="../zc/index.jsp" style="text-decoration: none;">
								<div id="register" class="loginbut">注册</div>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>

	</body>
	<script src="lib/jquery-3.2.1.js"></script>
	<script src="js/index.js"></script>
	<script type="text/javascript" src="js/logdeal.js"></script>
	<script type="text/javascript">
	</script>
</html>