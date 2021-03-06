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
		<div id="helpContentDiv" class="clinicdetail" style="min-height: 600px">
			<div id="helpContent" style="padding: 20px 50px">
				<div class="hcquname">
					申请成功后，医生什么时候开始和我视频问诊？
				</div>
				<div class="hcquanswer">
					<p class="MsoNormal">
						<span>1、专科申请成功后，请查看您的就诊序号，医生会按照顺序发起视频。视频前您将收到短信通知，请提前做好视频准备；</span><br>
						<span>2、名医申请成功后，您会收到短信，短信内会告知您大概的候诊时间，请您在预约当天提前做好准备，医生会按照序号发起视频。</span>
					</p>
				</div>
				<div class="hcquname">
					视频接通了看不到画面？
				</div>
				<div class="hcquanswer">
					<p class="MsoNormal">
						<span>若视频中看不见医生，则可能是此时医生尚未结束上一个问诊，请耐心等待医生发起与您的视频； 目前视频通话支持电脑windows系统，您也可通过手机微信，扫描二维码，下载掌上浙一app用手机进行视频问诊。</span>
					</p>
				</div>

				<div class="hcquname">
					我如果未及时接到医生发起的视频怎么办？
				</div>
				<div class="hcquanswer">
					<p class="MsoNormal">
						<span>请在就诊当日打开“个人中心－专科申请记录/名医预约列表”进入该条记录详情。如显示已过号，请点击“重新候诊”按钮，即可重新进入就诊队列中，开始问诊前，仍会通过短信提醒您做好视频准备。</span>
					</p>
				</div>

				<div class="hcquname">
					怎么查看医生开出的电子病历？
				</div>
				<div class="hcquanswer">
					<p class="MsoNormal">
						<span>登录后，打开“个人中心”-“专科申请记录/名医预约列表”-“查看”操作。</span>
					</p>
				</div>

			</div>
		</div>
	</body>
</html>

<style type="text/css">
	body {
		height: 600px;
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