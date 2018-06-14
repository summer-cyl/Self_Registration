<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
		<link rel="stylesheet" href="css/style.css">
		<title>用户注册</title>
	</head>
	<body>
		<div id="head">
        	<div class="mod-header">
				<a href="#">
					<img src="image/icon.png">
				</a>	
			</div>
        </div>

		<div class="main">
		 	<div id="idid_1" style="margin:0;padding: 0;">
		 		<div style="margin-top: 15px;">
					<img style="width: 959px;height: 112px;" 
					src="image/zyyylogin.png">
				</div>
			</div>
			<div class="maincss">
				<div class="zctop">
					<div class="yhzccss">用户注册</div>
					<div class="helpcss"><a href="#">帮助</a>
					</div>
				</div>
			
				<div class="regDiv">
	    			<li>
	    				<label class="datatype">手机：</label>
	    				<input type="text" name="phone" id="phone" class="dataValue">
	    			</li>
	    			<li>
	    				<label class="datatype">密码：</label>
	    				<input type="password" name="pwd" id="pwd" class="dataValue">
	    			</li>
	    			<li>
	    				<label class="datatype">重复密码：</label>
	    				<input type="password" name="pwd" id="repwd" class="dataValue">
	    			</li>
	    	
	    			<li style="height:50px; margin-top: 20px">
	    				<button id="register" class="regbtn">注册</button>
	    			</li>

				</div>
		
			</div>
		</div>
	</body>
	<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
	<script src="js/index.js"></script>
	<script type="text/javascript">
		$("#register").click(function(){
			var tel = $("#phone").val();
			var password = $("#pwd").val();
			var rePassword = $("#repwd").val();
			if(password!=rePassword)
			{
				alert("两次密码不一致");
			}
			else if(tel.length!=11||password=="")
			{
				alert("信息格式不对");
			}
			else
			{
				$.ajax({
			        type: "POST",
			        url: "/hospital/ResignDeal",
			        data : "account="+tel+"&password="+password,    
			        success: function (data) {
			    		if(data=="1")
			    		{	
			    			alert("注册成功");
			    			window.location.href='../../index.jsp';
			    		}
			    		else alert("注册失败");
					
			        }
			    });
				
			}
			
		});
		
	</script>
</html>