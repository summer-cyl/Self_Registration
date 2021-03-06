<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
		<link rel="stylesheet" href="index.css">
		<title>检验记录</title>
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
					<a class="logouta" style="color:#1695CA;" hidefocus="hidefocus" href="javascript:logout()">安全退出</a>
				</div>
			</div>
		</div>
		<div class="headnavarea" id="headnavarea">
			<div class="headnav">
				<a href="info.jsp"><span id="wlzj" class="hnunit">个人资料</span></a>
				<a href="menzhen.jsp"><span id="zk" class="hnunit">门诊记录</span></a>
				<a onclick="building();return false;"><span id="my" class="hnunit">处方记录</span></a>
				<a href="jiancha.jsp"><span id="zxys" class="hnunit">检查记录</span></a>
				<a href="huanyuan.jsp"><span id="helpCenter" class="hnunit hnuclick">检验记录</span></a>
				<a onclick="building();return false;"><span id="personalCenter" class="hnunit">住院记录</span></a>
			</div>
		</div>
		
		<div id="content" class="personal-data" style="height: 50px;">
			<p>检验记录</p>
			<span>您通过掌上浙一查询检查单并保存后，将显示在此处。</span>

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
</html>