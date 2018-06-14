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

		<div class="content">
			<div class="rightnav">
				<a href="">
					<div class="rnbut" style="margin-bottom: 15px;">
						<img src="image/gotowebsite.png">
					</div>
				</a>
			</div>

			<div class="inthoscontent">
				<div class="bigphofig">
					<img src="image/helpcenterbg.png">
				</div>
				
				<div class="personalpage">
					<div class="ppleftnav">

						<div class="pplnlist" >
							<div class="pplnul pplnulclick" href="src/syzn.jsp" target="rightFrame">
								<u class="pplnu8"></u>
								<span class="pplnli pplnli8">使用指南</span>
							</div>

							<div class="pplnul" href="src/yyghwt.jsp" target="rightFrame">
								<u class="pplnu12"></u>
								<span class="pplnli pplnli12">预约挂号问题</span>
							</div>

							<div class="pplnul" href="src/jzxgwt.jsp" target="rightFrame">
								<u class="pplnu9"></u>
								<span class="pplnli pplnli9">就诊相关问题</span>
							</div>

							<div class="pplnul" href="src/zhxgwt.jsp" target="rightFrame">
								<u class="pplnu10"></u>
								<span class="pplnli pplnli10">账号相关问题</span>
							</div>

							<div class="pplnul" href="src/qtwt.jsp" target="rightFrame">
								<u class="pplnu11"></u>
								<span class="pplnli pplnli11">其他问题</span>
							</div>

							<div class="pplnul" href="src/fwtk.jsp" target="rightFrame">
								<u class="pplnu13"></u>
								<span class="pplnli pplnli13">服务条款</span>
							</div>

						</div>

					</div>

					<div class="clinicdetail">
						<iframe id="rightFrame" name="rightFrame" src="src/syzn.jsp" style="width: 100%; height: 450px;" frameborder="0" scrolling="no"></iframe>
					</div>
				</div>

			</div>
		</div>
		
	</body>
	<script src="lib/jquery-3.2.1.js"></script>
	<script src="js/index.js"></script>
</html>