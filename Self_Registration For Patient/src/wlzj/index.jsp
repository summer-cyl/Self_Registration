<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
		<link rel="stylesheet" href="css/style.css">
		<title>网络诊间</title>
	</head>
	<body>
		<div id="header" class="header">
			<div class="headtop">
				<div class="hosplogo">
					<img src="image/icon.png">
				</div>
				<div class="caselogin" id="caselogin1" style="display: block;">
					<img src="image/caselogin.png">
				</div>
				<div class="caselogin logined" id="caselogin2" style="display: none;">
					<a hidefocus="hidefocus" style="color:#1695CA;">
						<span id="usernamespan">XXXX</span>
						，您好
					</a>
					<span class="sep" id="usernamespan"> | </span>
					<span><a style="color:#1695CA;" hidefocus="hidefocus" href="javascript:logout()">安全退出</a></span>
				</div>
			</div>
		</div>

		<div class="headnavarea" id="headnavarea">
			<div class="headnav">
				<span id="wlzj" class="hnunit hnuclick" address="src/wlzj2/index.jsp" target="contentFrame">网络诊间</span>
				<span id="zk" class="hnunit" address="src/zkmz/index.jsp" target="contentFrame">专科门诊</span>
				<span id="my" class="hnunit" address="src/zjyy/index.jsp">专家预约</span>
				<span id="zxys" class="hnunit" address="src/zxys/index.jsp">在线医生</span>
				<span id="helpCenter" class="hnunit" address="src/bzzx/index.jsp">帮助中心</span>
				<span id="personalCenter" class="hnunit" address="src/grzx/index.jsp">个人中心</span>
			</div>
		</div>

		<iframe id="contentFrame" name="contentFrame" src="src/wlzj2/index.jsp" style="width: 100%;  height:1200px;margin-bottom: -4px; margin-top: -1px; background-color: rgb(245, 248, 250); background-position: initial initial; background-repeat: initial initial;" frameborder="0" scrolling="no""></iframe>
		<script type="text/javascript">
		    var b_iframe = window.parent.parent.document.getElementById("contentFrame");
		    var hash_url = window.location.hash;
		    if (hash_url.indexOf("#") >= 0) {
		        var hash_width = hash_url.split("#")[1].split("|")[0] + "px";
		        var hash_height = hash_url.split("#")[1].split("|")[1] + "px";
		        b_iframe.style.width = hash_width;
		        b_iframe.style.height = hash_height;
		    }
		</script>

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
</html>