<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="javatools.AccessDB,java.sql.ResultSet,java.util.Date,java.util.Calendar,java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
		<link rel="stylesheet" href="css/style.css">
		<title>网络诊间-专家预约</title>
	</head>
	<body>
		<iframe id="c_iframe" height="0" width="0" src="../../index.html" style="display:none"></iframe>
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
					<img src="image/zxys.png">
				</div>

				<div class="clinicdetail">
					<div class="clinicflowc">
						<img src="image/docoppfc1.png">
					</div>

					<div class="ordertop" style="height: auto;">
						 在线医生   
						<span style="font-size: 12px;color:#999;">
						</span>
					</div>

					<div class="orderbottom">
						<div class="doclistchoose">
							<div class="adddoctor" v="0">收起</div>
							<div class="dlctr">
								<div class="dlcliname">科室筛选</div>
								<div class="dlclidet dept">
								<span class="Onlinedept dlcldc">全部科室</span>
								    <%
								    	AccessDB deptdb = new AccessDB();
								        ResultSet resultSet = deptdb.excueteQuery("select departName from onlinedoctor inner join doctors on onlinedoctor.id = doctors.account");
								        while(resultSet!=null&&resultSet.next())
								        {
								        	
								    %>
								    	   <span class="Onlinedept"><%=resultSet.getString("departName")%></span>
								    <%
								        }
								    %>
									
								</div>
							</div>
							<div class="dlctr">
								<div class="dlcliname">就诊日期</div>
								<div class="dlclidet day">
								 <%
								    Date date = new Date();  
							        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
							        String specifiedDay = sdf.format(date);
							     %>
									<span class="dlcldc exvalidday"><%=specifiedDay%></span>
								</div>
							</div>
						</div>
						<div class="docarea onlinedoctors">
							<div class="item">
								<div class="docimg">
									<img src="image/zxys.png">
								</div>
								<div class="docname">韦菊英</div>
								<div class="deptname" title="">血液病科专家门诊</div>
								<div class="docgoodin" title="">简介：1997年毕业于上海铁道大学医学院，2008年获浙江大学医学硕士学位，现为浙江大学附属第一医院血液科副主任医师 。</div>
								<div class="orderdocbut zxys">预约(10个号)</div>
							</div>
							<div class="item">
								<div class="docimg">
									<img src="image/zxys.png">
								</div>
								<div class="docname">韦菊英</div>
								<div class="deptname" title="">血液病科专家门诊</div>
								<div class="docgoodin" title="">简介：1997年毕业于上海铁道大学医学院，2008年获浙江大学医学硕士学位，现为浙江大学附属第一医院血液科副主任医师 。</div>
								<div class="orderdocbut zxys">预约(10个号)</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</body>
	<script src="lib/jquery-3.2.1.js"></script>
	<script src="js/index.js"></script>
</html>