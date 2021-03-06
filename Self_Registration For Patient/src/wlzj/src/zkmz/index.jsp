<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
		<link rel="stylesheet" href="css/style.css">
		<title>网络诊间-专科门诊</title>
	</head>
	<body>
		<iframe id="c_iframe" height="0" width="0" src="../../index.jsp" style="display:none"></iframe>
		<script type="text/javascript"> (function autoHeight() {
		    var b_width = Math.max(document.body.scrollWidth, document.body.clientWidth);
		    var b_height = Math.max(document.body.scrollHeight, document.body.clientHeight);
		    var c_iframe = document.getElementById("c_iframe");
		    c_iframe.src = c_iframe.src + "#" + b_width + "|" + b_height
			})(); 
		</script>


		<div class="content">
			<div class="inthoscontent">
				<div class="bigphofig">
					<img src="image/speclinic.png">
				</div>

				<div class="clinicdetail">
					<div class="clinicflowc">
						<img src="image/clinicflowc1.png">
					</div>

					<div class="ordertop" style="border-bottom: none;">
						专科门诊&nbsp;&nbsp;&nbsp;
						<span style="font-size: 12px;color:#999;">
							上午 08:00-12:00，下午 14:00-17:30
						</span>
					</div>

					<div style="padding: 25px;padding-top: 10px;">
						<table class="deptlist">
							<tbody>
								<tr>
									<td>
										<img src="image/index-depart-icon_01.png">
										<span class="zkyy">心内科</span>
									</td>
									<td>
										<img src="image/index-depart-icon_02.png">
										<span class="zkyy">呼吸内科</span>
									</td>
									<td>
										<img src="image/index-depart-icon_03.png">
										<span class="zkyy">中医科</span>
									</td>
									<td>
										<img src="image/index-depart-icon_04.jpg">
										<span class="zkyy">精神卫生科</span>
									</td>
								</tr>
								<tr>
									<td>
										<img src="image/index-depart-icon_05.png">
										<span class="zkyy">神经内科</span>
									</td>
									<td>
										<img src="image/index-depart-icon_06.png">
										<span class="zkyy">内分泌代谢病科</span>
									</td>
									<td>
										<img src="image/index-depart-icon_07.png">
										<span class="zkyy">肝胆胰外科</span>
									</td>
									<td>
										<img src="image/index-depart-icon_08.png">
										<span class="zkyy">血管外科</span>
									</td>
								</tr>
								<tr>
									<td>
										<img src="image/index-depart-icon_09.png">
										<span class="zkyy">心胸外科</span>
									</td>
									<td>
										<img src="image/index-depart-icon_10.png">
										<span class="zkyy">普胸外科</span>
									</td>
									<td>
										<img src="image/index-depart-icon_11.png">
										<span class="zkyy">肿瘤外科</span>
									</td>
									<td>
										<img src="image/index-depart-icon_12.png">
										<span class="zkyy">耳鼻咽喉科</span>
									</td>
								</tr>
								<tr>
									<td>
										<img src="image/index-depart-icon_13.png">
										<span class="zkyy">眼科</span>
									</td>
									<td>
										<img src="image/index-depart-icon_14.png">
										<span class="zkyy">口腔科</span>
									</td>
									<td>
										<img src="image/index-depart-icon_10.png">
										<span class="zkyy">皮肤性病科</span>
									</td>
								</tr>
					</div>
				</div>

			</div>
		</div>
	</body>
	<script src="lib/jquery-3.2.1.js"></script>
	<script src="js/index.js"></script>
</html>