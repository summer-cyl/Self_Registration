<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
					<img src="image/percenter.png">
				</div>
				
				<div class="personalpage">
					<div class="ppleftnav">

						<div class="pplnlist" >
							<div class="pplnul  pplnulclick" href="src/grxx.jsp" target="rightFrame">
								<u class="pplnu1"></u>
								<span class="pplnli pplnli1">个人信息</span>
							</div>

							<div class="pplnul" href="src/cylxr.jsp" target="rightFrame">
								<u class="pplnu2"></u>
								<span class="pplnli pplnli2">常用联系人</span>
							</div>

							<div class="pplnul" href="src/xgmm.jsp" target="rightFrame">
								<u class="pplnu3"></u>
								<span class="pplnli pplnli3">修改密码</span>
							</div>

						</div>

						<div class="pplnlist">
							<div class="pplnul" href="src/zksqjl.jsp" target="rightFrame">
								<u class="pplnu4"></u>
								<span class="pplnli pplnli4">专科申请记录</span>
							</div>

							<div class="pplnul" href="src/zjyyjl.jsp" target="rightFrame">
								<u class="pplnu5"></u>
								<span class="pplnli pplnli5">专家预约记录</span>
							</div>

							<div class="pplnul" href="src/zxysjl.jsp" target="rightFrame">
								<u class="pplnu6"></u>
								<span class="pplnli pplnli6">在线医生记录</span>
							</div>

							<div class="pplnul" href="src/cfddjl.jsp" target="rightFrame">
								<u class="pplnu7"></u>
								<span class="pplnli pplnli7">处方订单记录</span>
							</div>

						</div>
					</div>

					<div class="clinicdetail">
						<iframe id="rightFrame" name="rightFrame" src="src/grxx.jsp" style="width: 100%; height: 650px;" frameborder="0" scrolling="no"></iframe>
					</div>
				</div>

			</div>
		</div>
		
	</body>
	<script src="lib/jquery-3.2.1.js"></script>
	<script src="js/index.js"></script>
</html>