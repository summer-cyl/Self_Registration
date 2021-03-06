<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
		<title>网络诊间</title>
	</head>
	<body>
		<div id="helpContentDiv" class="clinicdetail" style="min-height: 450px">
			<div id="helpContent" style="padding: 20px 50px">
				<div class="hcquname">
					网络诊间如何使用？
				</div>
				<div class="hcquanswer">
					<p class="MsoNormal">
						<span style="font-weight: bold;">专科门诊</span><br>
						<span>1、选择科室<br>2、选择就诊时间、填写就诊人以及相关的病情资料<br>3、支付挂号费用<br>4、等待医生叫号（请安装问诊助手，医生发起视频时会发送短信提醒您）<br>5、与医生视频问诊结束，等待医生书写诊断信息<br>6、在个人中心-专科申请记录中查看此次就诊的信息</span>
						<br><br>

						<span style="font-weight: bold;">名医预约</span><br>
						<span>1、选择科室、名医及预约的时间<br>2、填写就诊人信息以及病情资料<br>
							3、预约成功，预约当天在“个人中心-名医预约列表”中进行挂号费的支付<br>4、预约当天等待医生叫号<br>5、与医生视频问诊结束，等待医生书写诊断信息<br>6、在个人中心-名医预约记录中查看此次就诊的信息</span>
					</p>
				</div>

			</div>
		</div>
	</body>
</html>

<style type="text/css">
	body {
		height: 450px;
	}

	.clinicdetail {
	    /*border: 1px solid #eaeaea;*/
	    border-radius: 5px;
	    overflow: hidden;
	    margin-top: 20px;
	    margin-bottom: 60px;
	    background: #fff;
	    -moz-box-shadow: 0px 2px 3px #eee;
	    box-shadow: 0px 2px 3px #eee;
	}

	.hcquname {
	    line-height: 30px;
	    font-size: 16px;
	    color: #333;
	    font-weight: bold;
	    margin-bottom: 5px;
	    margin-left: -26px;
	    padding-left: 26px;
	    background: url(../image/hcqnbg.png) no-repeat 0 7px;
	}

	.hcquanswer {
	    line-height: 18px;
	    font-size: 14px;
	    color: #666;
	    margin-bottom: 50px;
	}

	.hcquanswer a {
		text-decoration: none;
		color: #000;
	}


</style>

<script type="text/javascript" src="../lib/jquery-3.2.1.js"></script>
<script type="text/javascript" src="../js/index.js"></script>