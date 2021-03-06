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
		<div id="helpContentDiv" class="clinicdetail" style="min-height: 650px">
			<div id="helpContent" style="padding: 20px 50px">
				<div class="hcquname">
					在网络诊间，专科门诊与名医预约有什么区别？
				</div>
				<div class="hcquanswer">
					<p class="MsoNormal">
						<span>专科门诊为当天门诊挂号，于当日早上8:00开始；名医预约则为预约挂号，可提前一周预约。</span>
					</p>
				</div>
				<div class="hcquname">
					挂号费可以使用医保支付吗？
				</div>
				<div class="hcquanswer">
					<p class="MsoNormal">
						<span>暂不支持</span>
					</p>
				</div>

				<div class="hcquname">
					挂号或预约如何取消？
				</div>
				<div class="hcquanswer">
					<p class="MsoNormal">
						<span>未支付前，可取消预约挂号；支付后，如果需要取消，请联系客服。</span>
					</p>
				</div>

				<div class="hcquname">
					怎么查看预约挂号记录？
				</div>
				<div class="hcquanswer">
					<p class="MsoNormal">
						<span>登录后，打开“个人中心－专科申请记录/名医预约列表”。</span>
					</p>
				</div>

				<div class="hcquname">
					如何添加就诊人？
				</div>
				<div class="hcquanswer">
					<p class="MsoNormal">
						<span>登录后，打开“个人中心－常用联系人”，即可添加常用就诊人。</span>
					</p>
				</div>

			</div>
		</div>
	</body>
</html>

<style type="text/css">
	body {
		height: 650px;
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