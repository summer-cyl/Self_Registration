<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
		<title>网络诊间</title>
	</head>
	<body style="height:400px; background-color:#ebeff0;">
		<div style="width: 100%;height: 100%">
			<div style="overflow: hidden;">
				<div class="cpwd-tt">修改密码</div>
				<ul class="change-left">
					<li>
						<label>原密码：</label>
						<input type="password" id="passWord_old">
					</li>
					<li>
						<label>新密码：</label>
						<input type="password" id="passWord_new">
					</li>
					<li>
						<label>确认新密码：</label>
						<input type="password" id="passWord_news">
					</li>
					<li>
						<label></label>
						<input type="button" value="确认修改"  id="changePwd">
					</li>
				</ul>
			</div>
		</div>
	</body>
</html>

<style type="text/css">

	body {
		height: 450px;
	}

	li {
		list-style-type: none;
	}

	.change-pwd{
		width:94%;
		margin:0 auto;
		margin-top:50px;
	}
	.cpwd-tt{
		font-size:22px;
		color:#1491c9;
		border-bottom:1px solid #c9c9c9;
		line-height:50px;
		margin-bottom:40px;
	}
	.change-left li{
		margin-bottom:24px;
		font-size:15px;
	}
	.change-left li label{
		color:#666666;
		width:100px;
		display:inline-block;
		vertical-align:middle;
		text-align:right;
	}
	.change-left input{
		font-family:"microsoft yahei";
	}
	.change-pwd {
		overflow:hidden;
	}
	.change-left {
		float:left;
		margin: 0;
	}
	.change-left input[type="password"],.change-left input[type="text"]{
		width:228px;
		height:34px;
		line-height:34px;
		border:1px solid #e2e1e2;
		text-indent:6px;
	}
	.change-right img{
		width:188px;
		height:220px;
		margin-left:130px;
	}
	.change-left input[type="button"]{
		width:100px;
		height:40px;
		border-radius:6px;
		background-color:#1490c7;
		border:0;
		color:#fff;
		font-size:18px;
	}

	.change-left li .lage-lable{
		width:auto;
		font-size:15px;
	}
	.lage-lable span{
		color:#fea100;
	}
	.search-pwd li label{
		width:auto;
	}
	.change-left input.back-lbtn{
		background-color:#f5f5f5;
		border:1px solid #e6e6e6;
		color:#999999;
	}

	#changePwd {
		cursor: pointer;
		outline: none;
	}

</style>


<script type="text/javascript" src="lib/jquery-3.2.1.js"></script>
<script type="text/javascript" src="../js/index.js"></script>
<script>
	$("#changePwd").click(function(){
		var old = $('#passWord_old').val();
		var newPassword = $('#passWord_new').val();
		var newPassword2 = $('#passWord_news').val();
		if(newPassword2!=newPassword)
		{
			alert("两次新的密码不一样！");
		}
		else
		{
			$.ajax({
                type: "POST",
                url: "/hospital/ChangePassword",
                data: "oldPass="+old+"&newPass="+newPassword,
                success: function (data) {
                	if(data=="1")
                	{
                		alert("修改成功");       	
                	}
                	else
                	{
                		alert("修改失败");  
                	}
                }

            });
		}
		
	});
</script>
