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
					<img src="image/docoppoint.png">
				</div>

				<div class="clinicdetail">
					<div class="clinicflowc">
						<img src="image/docoppfc1.png">
					</div>

					<div class="ordertop" style="height: auto;">
						 专家预约   
						<span style="font-size: 12px;color:#999;">
							上午 08:00-12:00，下午 14:00-17:30
						</span>
					</div>

					<div class="orderbottom" id="selectMYDiv">
						<div class="myCondition doclistchoose">
							<div class="adddoctor" v="0">收起</div>
							<div class="dlctr">
								<div class="dlcliname">科室筛选</div>
								<div class="dlclidet dept">
									<span class="dlcldc departName">全部科室</span>
									<% 
										AccessDB db = new AccessDB();
									    ResultSet res = db.excueteQuery("select name from department order by id asc");
									    String a[] = new String[100];
									    int i=0;
									    while(res!=null&&res.next())
									    {
									    	a[i]=new String(res.getString("name"));
									    	
									    	
									%>   
									    <span class="departName"><%=a[i++]%></span>
									<%
									    }
									    db.close();
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
							        
							        Calendar c = Calendar.getInstance();  
							     
							        c.setTime(date);  
							        int day = c.get(Calendar.DATE);  
							        c.set(Calendar.DATE, day + 1);  
							  
							        String dayAfter = new SimpleDateFormat("yyyy-MM-dd")  
							                .format(c.getTime()); 
							        
							        c.setTime(date);  
							        day = c.get(Calendar.DATE);  
							        c.set(Calendar.DATE, day + 2);  
							  
							        String dayAfter1 = new SimpleDateFormat("yyyy-MM-dd")  
							                .format(c.getTime());
							        
							        c.setTime(date);  
							        day = c.get(Calendar.DATE);  
							        c.set(Calendar.DATE, day + 3);  
							        String dayAfter2 = new SimpleDateFormat("yyyy-MM-dd")  
							                .format(c.getTime());
							        
							        c.setTime(date);  
							        day = c.get(Calendar.DATE);  
							        c.set(Calendar.DATE, day + 4);  
							        String dayAfter3 = new SimpleDateFormat("yyyy-MM-dd")  
							                .format(c.getTime());
							        
							    	//选中的按钮的样式 pwchecked
							        %>
									<span class="dlcldc exvalidday"><%=specifiedDay%></span>
									<span class="exvalidday"><%=dayAfter%></span>
									<span class="exvalidday"><%=dayAfter1%></span>
									<span class="exvalidday"><%=dayAfter2%></span>
									<span class="exvalidday"><%=dayAfter3%></span>
								</div>
							</div>
							<div class="dlctr">
								<div class="dlcliname">就诊时段</div>
								<div class="dlclidet timeScope">
									<span class="dlcldc timeSec">上午</span>
									<span class="timeScope timeSec">下午</span>
								</div>
							</div>
						</div>
						<div class="docarea experlist">
							<div class="item">
								<div class="docimg">
									<img src="image/slide2.png">
								</div>
								<div class="docname">韦菊英</div>
								<div class="deptname" title="">血液病科专家门诊</div>
								<div class="docgoodin" title="">简介：1997年毕业于上海铁道大学医学院，2008年获浙江大学医学硕士学位，现为浙江大学附属第一医院血液科副主任医师 。</div>
								<div class="orderdocbut myyy">预约(10个号)</div>
							</div>
							<div class="item">
								<div class="docimg">
									<img src="image/slide2.png">
								</div>
								<div class="docname">韦菊英</div>
								<div class="deptname" title="">血液病科专家门诊</div>
								<div class="docgoodin" title="">简介：1997年毕业于上海铁道大学医学院，2008年获浙江大学医学硕士学位，现为浙江大学附属第一医院血液科副主任医师 。</div>
								<div class="orderdocbut myyy">预约(10个号)</div>
							</div>
							<div class="item">
								<div class="docimg">
									<img src="image/slide2.png">
								</div>
								<div class="docname">韦菊英</div>
								<div class="deptname" title="">血液病科专家门诊</div>
								<div class="docgoodin" title="">简介：1997年毕业于上海铁道大学医学院，2008年获浙江大学医学硕士学位，现为浙江大学附属第一医院血液科副主任医师 。</div>
								<div class="orderdocbut myyy">预约(10个号)</div>
							</div>
							<div class="item">
								<div class="docimg">
									<img src="image/slide2.png">
								</div>
								<div class="docname">韦菊英</div>
								<div class="deptname" title="">血液病科专家门诊</div>
								<div class="docgoodin" title="">简介：1997年毕业于上海铁道大学医学院，2008年获浙江大学医学硕士学位，现为浙江大学附属第一医院血液科副主任医师 。</div>
								<div class="orderdocbut orderdocbutstt">停诊</div>
							</div>
						</div>
						
					</div>
			</div>
		</div>
	</body>
	<script src="lib/jquery-3.2.1.js"></script>
	<script src="js/index.js"></script>
</html>