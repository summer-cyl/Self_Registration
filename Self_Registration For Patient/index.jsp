<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="css/index.css">
	<link rel="stylesheet" type="text/css" href="css/public.css">
	
</head>
<body>
	<title>自助挂号系统</title>
	<div class="hp-bg">
		<!-- <img class="icon"  src="image/icon.png"> -->
		<img class="title"  src="image/font.png">
		<div class="hp-content" id="focus_Box">
			<p class="textshadow" style="display: block;"></p>
			<!--轮播-->
			<div class="lb_gl">
				<div class="pictureSlider">
					<ul id="zturn" class="poster-list">
						<li class="poster-item  zturn-item" href="src/grda/index.jsp">
							<img class="hp-carimg" src="image/grda.png" >
							<p style="display: block;">
								个人档案
							</p>
						</li>
						<li class="poster-item  zturn-item" href="src/wlzj/index.jsp" >
							<img class="hp-carimg" src="image/wlzj.png" >
							<p style="display: block;">
								网络诊间
							</p>
						</li>
						<li class="poster-item  zturn-item" href="">
							<img class="hp-carimg" src="image/gjyx.png" >
							<p style="display: block;">
								国际影像会诊中心
							</p>
						</li>
						<li class="poster-item  zturn-item" href="">
							<img class="hp-carimg" src="image/cfsh.png" >
							<p style="display: block;">
								处方审核和药物治疗管理中心
							</p>
						</li>
						<li class="poster-item  zturn-item" href="">
							<img class="hp-carimg" src="image/lnjk.png" >
							<p style="display: block;">
								老年健康管理中心
							</p>
						</li>
						<li class="poster-item  zturn-item"  href="" >
							<img class="hp-carimg" src="image/mbgl.png" >
							<p style="display: block;">
								慢病管理中心
							</p>
						</li>
						<li class="poster-item  zturn-item" href="" >
							<img class="hp-carimg" src="image/hlxy.png" >
							<p style="display: block;">
								护理学院
							</p>
						</li>
					</ul>
				</div>
			</div>
		</div>
		
	</div>
</body>
<script type="text/javascript" src="lib/jquery-3.2.1.js"></script>
<script type="text/javascript" src="js/zturn.js"></script>
<script type="text/javascript" src="js/index.js"></script>
</html>