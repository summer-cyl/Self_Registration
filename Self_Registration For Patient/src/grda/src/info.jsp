<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
		<link rel="stylesheet" href="index.css">
		<title>个人资料</title>
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
					<a hidefocus="hidefocus" style="color:#1695CA;">
						<span id="usernamespan">XXXX</span>
						，您好
					</a>
					<span class="sep" id="usernamespan"> | </span>
					<span><a style="color:#1695CA;" hidefocus="hidefocus" href="javascript:logout()">安全退出</a></span>
				</div>
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
							<a href="../../zc/index.jsp" style="text-decoration: none;">
								<div id="register" class="loginbut">注册</div>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="headnavarea" id="headnavarea">
			<div class="headnav">
				<a href="info.jsp"><span class="hnunit hnuclick">个人资料</span></a>
				<a href="menzhen.jsp"><span class="hnunit">门诊记录</span></a>
				<a onclick="building();return false;"><span class="hnunit">处方记录</span></a>
				<a href="jiancha.jsp"><span class="hnunit">检查记录</span></a>
				<a href="huanyuan.jsp"><span class="hnunit">检验记录</span></a>
				<a onclick="building();return false;"><span class="hnunit">住院记录</span></a>
			</div>
		</div>
        
		<div id="content" class="personal-data" style="height: 450px;">
			<p>个人资料</p>
			<table class="data-info" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td style="width: 50%"><span class="data-th">姓名：</span><span id="name"></span></td>
					<td style="width: 50%"><span class="data-th">性别：</span><span id="sex"></span></td>
				</tr>
				<tr>
					<td><span class="data-th">出生日期：</span><span id="birth"></span></td>
					<td><span class="data-th">年龄：</span><span id="age"></span></td>
				</tr>
				<tr>
					<td><span class="data-th">身份证号：</span><span id="idCardNum"></span></td>
					<td><span class="data-th">家庭住址：</span><span id="homePlace"></span></td>
				</tr>
				<tr>
					<td><span class="data-th">手机号码：</span><span id="tel"></span></td>
					<td></td>
				</tr>
			</table>

			<div class="rightnav">
				<a href="">
					<div class="rnbut" style="margin-bottom: 15px;">
						<img src="image/gotowebsite.png">
					</div>
				</a>
			</div>
		</div>
	</body>
	<script src="lib/jquery-3.2.1.js"></script>
	<script src="index.js"></script>
    <script type="text/javascript" src="../js/logdeal.js"></script>
	<script>
	$.ajax({
        type: "POST",
        url: "/hospital/GRXXLoad",
        success: function (data) {
        	console.log(data);
        	data = eval("("+data+")");
        	if(data.id.substr(16,1)%2==0)
        	$("#sex").text("女");
        	else
        	$("#sex").text("男");
        	var birth = data.id.substr(6,4)+"年"+data.id.substr(10,2)+"月"+data.id.substr(12,2)+"日";
        	var age = 2018-data.id.substr(6,4);
        	$("#name").text(data.name);
        	$("#loginName").text(data.account);
        	$("#idCardNum").text(data.id);
        	$("#work").text(data.job);
        	$("#birth").text(birth);
        	$("#nation").text(data.people);
        	$("#homePlace").text(data.livePlace);
        	$("#tel").text(data.company);
        	$("#age").text(age);
        	
        }

    });
	</script>
</html>