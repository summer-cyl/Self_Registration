<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="javatools.AccessDB,net.sf.json.JSONArray,net.sf.json.JSONObject,java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
		<title>网络诊间</title>
		<style type="text/css">
		   table{
		       margin:auto;
		       margin-top:50px;
		       border:0;
		       cellspacing:0;
		       cellpadding:0;
		   }
		            
		   table tr{
		   
		        border:none;
		        padding:0;
		        margin:0;
		   }
		   td {
	       text-align:center;
	       border:none;
		   	margin:0;
		   	padding:0;
		   	width:150px;
		   }
	
			.tableTitle {
				background-color:#3385FF;
				font-size:16px;
				color:white;
			}
			.tableTitle td{
				height:35px;
				text-align:center;
			} 
			.tableContent:nth-child(even){
			    font-size:15px;
				background-color:white;
				color:#9f9f9f;	
				height:30px;
			}
			.tableContent:nth-child(odd){
			    font-size:15px;
				background-color:#7ba6e0;
				color:white;
				height:30px;	
			}
    </style>
    <link rel="stylesheet" href="../css/style.css">
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
					<a hidefocus="hidefocus" style="color:#1695CA;">
						<span id="usernamespan">XXXX</span>
						，您好
					</a>
					<span class="sep" id="usernamespan"> | </span>
					<span><a style="color:#1695CA;" hidefocus="hidefocus" href="javascript:logout()">安全退出</a></span>
				</div>
			</div>
		</div>
		<div class="inthospopup" id="loginDiv" style="display: none">
			<div class="cover"></div>
			<div id="loginContentDiv" class="ihconpop">
				<div class="closeihconpop"></div>
				<div class="ihcphead">登陆/注册</div>
				<div class="ihcpbody hp-loginpop">
					<img class="hp-loginuser" src="image/loginuser.png">
					<img class="hp-loginkey" src="image/loginkey.png">
					<input type="text" class="loginuser" id="userName" placeholder="请输入手机号">
					<input type="password" class="loginuser loginuserkey" id="password" placeholder="请输入密码">
					<div class="loginusered">
						<a id="forgetPassWord" class="forgetkey">忘记密码</a>
						<div>
							<div id="login" class="loginbut">登录</div>
							<a href="../zc/index.html" style="text-decoration: none;">
								<div id="register" class="loginbut">注册</div>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="headnavarea" id="headnavarea">
			<div class="headnav">
				<a href="info.html"><span id="wlzj" class="hnunit">个人资料</span></a>
				<a href="menzhen.html"><span id="zk" class="hnunit hnuclick">门诊记录</span></a>
				<a onclick="building();return false;"><span id="my" class="hnunit">处方记录</span></a>
				<a href="jiancha.html"><span id="zxys" class="hnunit">检查记录</span></a>
				<a href="huanyuan.html"><span id="helpCenter" class="hnunit">检验记录</span></a>
				<a onclick="building();return false;"><span id="personalCenter" class="hnunit">住院记录</span></a>
			</div>
		</div>
		
		<div id="content" class="personal-data" style="height: 50px;">
			<table cellspacing="0">
		  		<tr class="tableTitle">
			  		<td>
			  			患者姓名
			  		</td>
			  		<td>
			  			患者身份证
			  		</td>
			  		<td>
			  			科室名称
			  		</td>
			  		<td>
			  			有效日期
			  		</td>
		  		</tr>
		  		<%
				String id = (String)session.getAttribute("Userid");
				String select = "select * from spepreorder inner join department on spepreorder.departId=department.id where userAccount = '"+"666666"+"'" +
				"order by validDay desc";
				AccessDB db = new AccessDB();
				ResultSet resultSet = db.excueteQuery(select);
				JSONArray jsonArray = new JSONArray();
				JSONObject jsonObject = null;
				try {
					while(resultSet!=null&&resultSet.next())
					{
						jsonObject = new JSONObject();
						String name = resultSet.getString("name");
						jsonObject.put("name",name);
						String patientId = resultSet.getString("patientId");
						jsonObject.put("patientId",patientId);
						String departName = resultSet.getString("department.name");
						jsonObject.put("departName",departName);
						int isMorning = resultSet.getInt("isMorning");
						String ans = "上午";
						if(isMorning==1)
							ans = "下午";
						String validday = resultSet.getString("validday");
						jsonObject.put("validday",validday+" "+ans);
						jsonArray.put(jsonObject);
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
		  	%>
		  	<%for(int i=0;i<jsonArray.length();i++){ %>
		  		<tr class="tableContent">
		  			<td>
		  				<%=((JSONObject)jsonArray.get(i)).get("name")%>
		  			</td>
		  			<td> 
		  			    <%=((JSONObject)jsonArray.get(i)).get("patientId")%>
		  			</td>
		  			<td> 
		  			    <%=((JSONObject)jsonArray.get(i)).get("departName")%>
		  			</td>
		  			<td>
		  			    <%=((JSONObject)jsonArray.get(i)).get("validday")%>
		  			</td>
		  		</tr>
		  	<%}%>
		  </table>
			
			
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
	<script>
	$('#login').click(function(){
		if ($("#userName").val() == "") {
	        alert("用户名不能为空！");
	        $("#userName").focus();
	        return false;
	    }
	    if ($("#password").val() == "") {
	        alert("密码不能为空！");
	        $("#password").focus();
	        return false;
	    }
	    $.ajax({
	        type: "POST",
	        url: "/hospital/LoginDeal",
	        data: "name=" + $("#userName").val().toString() + "&password=" + $("#password").val().toString(),
	        success: function (data) {
	        	alert(data);
	            if (data == "1") {
	                $("#caselogin1").attr('style','display: none');
	                $("#caselogin2").attr('style','display: block');
	                $('#usernamespan').html($("#userName").val().toString());
	                $('#loginDiv').attr('style', 'display: none');
	                return true;
	            }
	            else {
	                alert("请确认您输入的用户名或密码输入是否正确！");
	                $("#userName").val("");
	                $("#password").val("");
	                $("#userName").focus();
	                return false;
	            }
	        }

	    });
	});
	function logout()
	{
		 $.ajax({
		        type: "POST",
		        url: "/hospital/LogoutDeal",
		        success: function (data) {
		        	alert("登出成功");
		            $("#caselogin2").attr('style','display: none');
		            $("#caselogin1").attr('style','display: block');
		        }

		    });
	           
	}
	$('#caselogin1').click(function() {
	    $('#loginDiv').attr('style', 'display: block');
	});

	$('.closeihconpop').click(function() {
	    $('#loginDiv').attr('style', 'display: none');
	});
	</script>
</html>

