<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="css/index.css">
</head>
<body>
	<title>医护版</title>
	<div class="bannerDiv part_1" >
		<div class="w indexWrap">
			<!-- 登录窗口 -->
			<form method="post" action="LoginAction">
			<div class="loginDiv" id="loginDiv">
				<p class="loginTitle">登录</p>
				<div class="loginForm">
					<div class="loginFormSlideA">
						<input class="username" id="indexName" name="account" type="text" value="" placeholder="账号"> 
						<input class="password" id="indexPwd" name="password" type="password" value="" placeholder="密码">
						
						<button type="submit" id="indexLogin" class="loginBtn">登录</button>
					</div>
				</div>
			</div>
			</form>
		</div>
	</div>
</body>
<script src="lib/jquery-3.2.1.js"></script>
<script src="js/index.js"></script>
</html>