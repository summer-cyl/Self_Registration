<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="javatools.AccessDB,java.sql.ResultSet,java.util.Date,java.util.Calendar,java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
		<link rel='stylesheet prefetch' href='css/swiper.min.css'>
		<link rel="stylesheet" href="css/style.css">
		<title>网络诊间-网络诊间</title>
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
				<div class="carouselfig">
					<div class="swiper-container">
						<div class="swiper-wrapper">
							<div class="swiper-slide">
								<img src="image/slide1.png" alt="">
							</div>
							<div class="swiper-slide">
								<img src="image/slide2.png" alt="">
							</div>
						</div>
						<div class="swiper-pagination"></div>
						<!-- <button type="button" class="swiper-button-next"></button>
						<button type="button" class="swiper-button-prev"></button> -->
					</div>
				</div>

				<div class="orderflowand">
					<div class="ihorderdiv">
						<div class="ordertop">
							就诊流程   
							<span style="font-size: 12px;color:#999;">
								上午 08:00-12:00，下午 14:00-17:30
							</span>
						</div>
						<div class="orderbottom">
							<img src="image/visitflow.png" class="orderflowimg">
						</div>
					</div>
					<div class="flowright">
						<a style="text-decoration: none;">
							<div class="flowrbut">
								<span class="frbtitle">
									问诊助手
								</span>
								<br>
								<span class="frbword">
									和医生面对面视频交流
								</span>
							</div>
						</a>
						<a style="text-decoration: none;">
							<div class="flowrbutother">
								<span class="frbtitle">
									智能导诊
								</span>
								<br>
								<span class="frbword">
									帮您准确挂对科室
								</span>
							</div>
						</a>
					</div>
				</div>

				<div class="browserc">
					<div class="bctip">
						为了您更好的就诊体验
						<br>
						推荐使用谷歌浏览器或火狐浏览器！
					</div>
					<div class="bcbowser">
						<img src="image/mozilla.png">
						<span>火狐浏览器</span>
						<div class="bcbdownload">前往下载</div>
					</div>
					<div class="bcbowser">
						<img src="image/chrome.png">
						<span>谷歌浏览器</span>
						<div class="bcbdownload">前往下载</div>
					</div>
					<a>
						<div class="dchelpbut">
							专家挂号支付帮助
						</div>
					</a>
					<div class="dcsolid"></div>
				</div>

				<div class="ihorderdiv">
					<div class="ordertop">专科门诊</div>
					<div class="orderbottom" style="padding: 10px;">
						<table class="deptlist">
							<tbody>
								<tr>
									<td>
										<img src="image/index-depart-icon_01.png">
										<span class="zkyy">心内科</span>
									</td>
									<td>
										<img src="image/index-depart-icon_02.png">
										<span class="zkyy">呼吸内科</span>
									</td>
									<td>
										<img src="image/index-depart-icon_03.png">
										<span class="zkyy">中医科</span>
									</td>
									<td>
										<img src="image/index-depart-icon_04.jpg">
										<span class="zkyy">精神卫生科</span>
									</td>
								</tr>
								<tr>
									<td>
										<img src="image/index-depart-icon_05.png">
										<span class="zkyy">神经内科</span>
									</td>
									<td>
										<img src="image/index-depart-icon_06.png">
										<span class="zkyy">内分泌代谢病科</span>
									</td>
									<td>
										<img src="image/index-depart-icon_07.png">
										<span class="zkyy">肝胆胰外科</span>
									</td>
									<td>
										<img src="image/index-depart-icon_08.png">
										<span class="zkyy">血管外科</span>
									</td>
								</tr>
								<tr>
									<td>
										<img src="image/index-depart-icon_09.png">
										<span class="zkyy">心胸外科</span>
									</td>
									<td>
										<img src="image/index-depart-icon_10.png">
										<span class="zkyy">普胸外科</span>
									</td>
									<td>
										<img src="image/index-depart-icon_11.png">
										<span class="zkyy">肿瘤外科</span>
									</td>
									<td>
										<img src="image/index-depart-icon_12.png">
										<span class="zkyy">耳鼻咽喉科</span>
									</td>
								</tr>
								<tr>
									<td>
										<img src="image/index-depart-icon_13.png">
										<span class="zkyy">眼科</span>
									</td>
									<td>
										<img src="image/index-depart-icon_14.png">
										<span class="zkyy">口腔科</span>
									</td>
									<td>
										<img src="image/index-depart-icon_10.png">
										<span class="zkyy">皮肤性病科</span>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

				<!-- 专家预约 -->
				<div class="ihorderdiv">
					<div class="ordertop">专家预约</div>
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
									    while(res!=null&&res.next())
									    {
									%>   
									    <span class="departName"><%=res.getString("name")%></span>
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
						<div class="morefamdoc">
							<span id="moreMY">
								更多专家
							</span>
						</div>
					</div>
				</div>

				<!-- 在线医生 -->
				<div class="ihorderdiv">
					<div class="ordertop">
						在线医生   
						<span style="font-size: 12px;color:#999;">
							问诊时间不固定，由医生自主设置
						</span>
					</div>
					<div class="orderbottom" id="selectZxysDiv">
						<div class="zxysCondition doclistchoose2" style="height: 60px">
							<div class="adddoctor2" v="0">收起</div>
							<div class="dlctr">
								<div class="dlcliname">科室筛选</div>
								<div class="dlclidet dept">
									<span class="dlcldc">全部科室</span>
									<span>心血管内科专家门诊</span>
									<span>血液病科专家门诊</span>
								</div>
							</div>
							<div class="dlctr">
								<div class="dlcliname">就诊日期</div>
								<div class="dlclidet day">
									<span class="dlcldc">5月9日</span>
								</div>
							</div>
						</div>
						<div class="docarea">
							<div class="item">
						    	<div class="docimg">
						    		<img src="image/slide2.png">
						    	</div>
						    	<div class="docname">姚雪艳</div>
						    	<div class="deptname" title="">心血管内科专家门诊</div>
						    	<div class="docgoodin" title="">简介：</div>
						    	<div class="orderdocbut zxys">预约(7个号)</div>
						    </div>
						</div>
						<div class="morefamdoc">
							<span id="moreZxys">更多在线医生</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
	<script src="lib/jquery-3.2.1.js"></script>
	<script src='js/swiper.min.js'></script>
	<script src="js/index.js" language="javascript" charset="utf-8"></script>
	
</html>