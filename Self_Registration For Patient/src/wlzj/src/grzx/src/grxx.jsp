<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="javabean.PersonInfo,javatools.AccessDB"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
		<title>网络诊间</title>
	</head>
	<body>
		<div id="userInfoDiv">
		<form action="" method="post">
			<div class="addPerson">用户信息</div>
			<div class="addCon formDiv" style="width:90%;">
				<ul class="vaildcardul">
					<li>
						<label class="dataType dataType2">
							<span style="color:red">*</span>
						    真实姓名：
						</label>
						<input type="text" id="realName" class="dataValueS" name="name">
					</li>
					<li>
						<label class="dataType dataType2">
							<span style="color:red">*</span>
						    手机号码：
						</label>
						<input type="text" id="loginName" class="dataValueS" value="13957603378" readonly="readonly" name="account" style="background: #e6e6e6;">
					</li>
					<li>
						<label class="dataType dataType2">
							<span style="color:red">*</span>
						    身份证号：
						</label>
						<input type="text" id="cardID" class="dataValueS" name="id">
					</li>
					<li>
						<label class="dataType dataType2">婚姻：</label>
						<input class="isMarred" name="isMarried" type="radio" style="margin-left:10px;" value="1">已婚
						<input class="isMarred" name="isMarried" type="radio" value="0">未婚
					</li>
					<li>
						<label class="dataType dataType2">职业：</label>
						<input name="job" type="text" id="work" class="dataValueS">
					</li>
					<li>
						<label class="dataType dataType2">民族：</label>
						<input name="people" type="text" id="nation" class="dataValueS">
					</li>
					<li>
						<label class="dataType dataType2">出生地：</label>
						<input name="bornPlace" type="text" id="birthAddress" class="dataValueS">
					</li>
					<li>
						<label class="dataType dataType2">现住地：</label>
						<input name="livePlace" type="text" id="address" class="dataValueS">
					</li>
					<li>
						<label class="dataType dataType2">工作单位：</label>
						<input name="company" type="text" id="workAddress" class="dataValueS">
					</li>
				</ul>
				<input type="submit" name="submit" id="btnSave" value="保存">
			</div>
		</form>
		</div>
	</body>
</html>
<% request.setCharacterEncoding("utf-8");%>
<%if(request.getParameter("livePlace")!=null) {%>
<jsp:useBean id="perInfo" class="javabean.PersonInfo" scope="session">
</jsp:useBean>
<jsp:setProperty property="*" name="perInfo"/>
    <%
    	PersonInfo pi = (PersonInfo)session.getAttribute("perInfo");
    	AccessDB db = new AccessDB();
    	db.excuteUpate("update patients set name='"
    			        +pi.getName()+"', id='"
    			        +pi.getId()+"',isMarried='"
    			        +pi.getIsMarried()+"',people='"
    			        +pi.getPeople()+"',company='"
    			        +pi.getCompany()+"',job='"
    			        +pi.getJob()+"',livePlace='"
    			        +pi.getLivePlace()+"',bornPlace='"
    			        +pi.getBornPlace()+"' "
    			        +"where account = '"
    			        +pi.getAccount()+"'"
    	);
    	db.close();
    	
    %>
<%} %>
<style type="text/css">

    body {
    	height: 650px;
    }

    li {
    	list-style-type: none;
    }
	.addPerson{
		color:#09719f;
		font-size:18px;
	    margin-top: 10px; 
	    margin-bottom: -10px;
	}  
	.addBtn{
		width:16px;
		height:16px;
		display:inline-block;
		vertical-align:middle;
		background:url(/zyyy/images/addper.png) no-repeat;
		background-size:100% 100%;
		border:none;
		margin:-3px 0 0 2px;
	  	cursor: pointer;
	} 	 	
	.addCon{
		background: #fafafa;
		border: 1px solid #e6e6e6;
		margin-top: 20px;
		height: 600px;
		position:relative;
	}
	.formDiv .dataType {
	    width: 90px;
	    display: inline-block;
	}
	.dataType2{
		text-align: right;
		font-size: 16px!important;
		width: 100px!important;
		text-align: right;
	}
	.addCon ul li{
		height: 50px;
		line-height: 50px;
	}
	.selectBg{
	  width: 201px;
	  height: 34px;
	  padding-left: 3px;
	  padding-right: 30px;
	  line-height: 32px;
	  background: url(/zyyy/images/typebg.png) no-repeat;
	  background-size: 100% 100%;
	  display: inline-block;
	  position: relative;
	  top: 0;
	  left: 9px;
	}
	.selectType{
	  width: 233px;
	  height: 32px;
	  display: inline-block;
	  position: relative;
	  bottom: 42px;
	  left: 114px;
	  opacity: 0;
	}
	.addCon input[type="button"],.addCon input[type="submit"]{
	  width: 100px;
	  height: 40px;
	  border-radius: 6px;
	  background-color: #1490c7;
	  border: 0;
	  color: #fff;
	  font-size: 18px;
	  clear:both;
	  display:block;
	  margin: auto;
	  position: relative;
	  top: 30px;
	}

	.formDiv .dataValueS {
	    margin-left: 10px;
	    height: 32px;
	    width: 230px;
	    display: inline-block;
	    border: 1px solid #e6e6e6;
	    border-radius: 3px;
	}
	input[type='text'] {
	    text-indent: 5px;
	    font-family: 'microsoft yahei';
	}

	.formDiv .radiocheck {
	    padding-left: 30px;
	    background: url(image/unchecked.png) no-repeat;
	    background-position: left center;
	    width: 48px;
	    margin-right: 40px;
	    display: inline-block;
	}

	.formDiv .dataRadioChecked {
	    background-image: url(image/checked.png)!important;
	}

	#btnSave {
		cursor: pointer;
		outline: none;
	}

</style>


<script type="text/javascript" src="lib/jquery-3.2.1.js"></script>
<script type="text/javascript" src="../js/index.js"></script>
<script type="text/javascript">
	$.ajax({
        type: "POST",
        url: "/hospital/GRXXLoad",
        success: function (data) {
        	console.log(data);
        	data = eval("("+data+")");
        	$("#realName").val(data.name);
        	$("#loginName").val(data.account);
        	$("#cardID").val(data.id);
        	$("#work").val(data.job);
        	$("#birthAddress").val(data.bornPlace);
        	$("#nation").val(data.people);
        	$("#address").val(data.livePlace);
        	$("#workAddress").val(data.company);
        	if(data.isMarried=="1")
       		{
       			$(".isMarred:first").attr("checked","true");
       			$(".isMarred:last").attr("checked","false");
       		}
        	else
        	{
        		$(".isMarred:first").attr("checked","false");
        		$(".isMarred:last").attr("checked","true");
        	}
        	
        }

    });
</script>
</html>