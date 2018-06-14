<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="beans.User,beans.ExpreOrder,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" href="assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="assets/css/admin.css">
    <link rel="stylesheet" href="assets/css/app.css">
    <link rel="stylesheet" type="text/css" href="yy/css/yy.css">
</head>
<body>

	<title>专家预约</title>
    <header class="am-topbar am-topbar-inverse admin-header">
        <div class="am-topbar-brand">
            <a href="javascript:;" class="tpl-logo">
                <img src="assets/img/logo.png" alt="">
            </a>
        </div>
        <div class="am-icon-list tpl-header-nav-hover-ico am-fl am-margin-right">

        </div>

        <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

        <div class="am-collapse am-topbar-collapse" id="topbar-collapse">

            <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list tpl-header-list">
                <li class="am-dropdown" data-am-dropdown="" data-am-dropdown-toggle="">
                    <ul class="am-dropdown-content tpl-dropdown-content">
                        <li>
                            <a href="#" class="tpl-dropdown-content-message">
                                <span class="tpl-dropdown-content-photo">
                                    <img src="assets/img/user02.png" alt=""> 
                                </span>
                                <span class="tpl-dropdown-content-subject">
                                    <span class="tpl-dropdown-content-from"> 禁言小张 </span>
                                    <span class="tpl-dropdown-content-time">10分钟前 </span>
                                </span>
                                <span class="tpl-dropdown-content-font"> Amaze UI 的诞生，依托于 GitHub 及其他技术社区上一些优秀的资源；Amaze UI 的成长，则离不开用户的支持。 </span>
                            </a>
                            <a href="#" class="tpl-dropdown-content-message">
                                <span class="tpl-dropdown-content-photo">
                                    <img src="assets/img/user03.png" alt=""> 
                                </span>
                                <span class="tpl-dropdown-content-subject">
                                    <span class="tpl-dropdown-content-from"> Steam </span>
                                    <span class="tpl-dropdown-content-time">18分钟前</span>
                                </span>
                                <span class="tpl-dropdown-content-font"> 为了能最准确的传达所描述的问题， 建议你在反馈时附上演示，方便我们理解。 </span>
                            </a>
                        </li>
                    </ul>
                </li>
                
				<%
                	User self = (User)session.getAttribute("UserInfo");
                    if(self==null)
                    {
                    %>
                    <jsp:forward page="http://localhost:8080/hospital/Self_Registration/Self_Registration%20For%20Doctor/index.jsp"/>
                    <% 	
                    }
                    List<ExpreOrder> ex = (List)session.getAttribute("exprelist");
                %>
                 <li class="am-dropdown" data-am-dropdown data-am-dropdown-toggle>
                    <a class="am-dropdown-toggle tpl-header-list-link" href="javascript:;">
                        <span class="tpl-header-list-user-nick"><%=self.getName()%></span>
                        <span class="tpl-header-list-user-ico"> <img src="http://localhost:8080/hospital/Self_Registration/Self_Registration%20For%20Doctor/image/<%=self.getAccount()%>.jpg"></span>
                    </a>
                </li>
                <li><a href="###" class="tpl-header-list-link" style="font-size: 20px"><span class="am-icon-power-off"></span></a></li>
            </ul>
        </div>
    </header>

    <div class="tpl-page-container tpl-page-header-fixed">
        <div class="tpl-left-nav tpl-left-nav-hover" style="display: block;">
            <div class="tpl-left-nav-title" style="margin-top: -5px; line-height: 22px; font-size: 18px;height: 66px;">
                自助挂号医生端
            </div>
            <div class="tpl-left-nav-list">
                <ul class="tpl-left-nav-menu">

                    <li class="tpl-left-nav-item">
                        <a href="http://localhost:8080/hospital/Self_Registration/Self_Registration%20For%20Doctor/src/backgroundDoc/index.jsp" class="nav-link ">
                            <i class="am-icon-key"></i>
                            <span>个人信息</span>
                        </a>
                    </li>

                    <li class="tpl-left-nav-item">
                        <a href="javascript:;" class="nav-link active tpl-left-nav-link-list">
                            <i class="am-icon-table"></i>
                            <span>预约情况</span>
                            <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
                        </a>
                        <ul class="tpl-left-nav-sub-menu" style="display: block;">
                            <li>
                                <a href="zjyy.jsp" class="zzyy active">
                                    <i class="am-icon-angle-right active"></i>
                                    <span>专家预约</span>
                                </a>
                                <a href="zxyy.jsp">
                                    <i class="am-icon-angle-right"></i>
                                    <span>在线预约</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    
                    <li class="tpl-left-nav-item">
                        <a href="pbrl.html" class="nav-link">
                            <i class="am-icon-home"></i>
                            <span>排班日历</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>


        <div class="tpl-content-wrapper">
            <div class="tpl-portlet-components">
                <div class="tpl-block">
                    <div class="am-g">
                        <div class="am-u-sm-12 am-u-md-3">
                            <div class="am-form-group">
                                <select data-am-selected="{btnSize: 'sm'}" style="display: none;">
                                    <option value="option1">所有患者</option>
                                </select>
                            </div>
                        </div>
                        <div class="am-u-sm-12 am-u-md-3">
                            <div class="am-input-group am-input-group-sm">
                                <input type="text" class="am-form-field">
                                <span class="am-input-group-btn">
                                    <button class="am-btn  am-btn-default am-btn-success tpl-am-btn-success am-icon-search" type="button"></button>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="am-g">
                        <div class="am-u-sm-12">
                            <form class="am-form">
                               
                                <table class="am-table am-table-striped am-table-hover table-main">
                                    <thead>
                                        <tr>
                                            <th class="table-check"><input type="checkbox" class="tpl-table-fz-check"></th>
                                            <th class="table-id">序号</th>
                                            <th class="table-title">手机号</th>
                                            <!-- <th class="table-type">手机号</th> -->
                                            <th class="table-author am-hide-sm-only">姓名</th>
                                            <th class="table-date am-hide-sm-only">预约日期</th>
                                            <th class="table-set">操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                     <%for(int i=0;i<ex.size();i++){%>
                                        <tr>
                                            <td><input type="checkbox"></td>
                                            <td><%=i+1%></td>
                                            <td class="phone_id"><%=ex.get(i).getTel()%></td>
                                            <td class="am-hide-sm-only"><%=ex.get(i).getPatientName()%></td>
                                            <td class="am-hide-sm-only"><%=ex.get(i).getValidDay()%></td>
                                            <td>
                                                <div class="am-btn-toolbar">
                                                    <div class="am-btn-group am-btn-group-xs">
                                                        <div class="am-btn am-btn-default am-btn-xs am-text-secondary cnc1" id="more_btn">详细信息</div>
                                                        <div class="am-btn am-btn-default am-btn-xs am-hide-sm-only cnc2" id="ckbs_btn" >查看病史</div>
                                                        
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                      <% }%>
                                    </tbody>
                                </table>
                                
                                <div class="am-cf">
                                    <div class="am-fr">
                                        <ul class="am-pagination tpl-pagination">
                                            <li class="am-disabled" id="li_prev"><a href="#">«</a></li>
                                          
                                            <li id="li_next"><a href="#">»</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <hr>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="tpl-alert"></div>
            </div>
        </div>

    </div>
	
    <!-- 详细信息 -->
    <%for(int i=0;i<ex.size();i++){ 
    	String certificateNo = ex.get(i).getPatientId();
    	String birthday = "";
        String age = "";
        String sexCode = "";

        int year = Calendar.getInstance().get(Calendar.YEAR);
        char[] number = certificateNo.toCharArray();
        boolean flag = true;
        if (flag && certificateNo.length() == 15) {
            birthday = "19" + certificateNo.substring(6, 8) + "-"
                    + certificateNo.substring(8, 10) + "-"
                    + certificateNo.substring(10, 12);
            sexCode = Integer.parseInt(certificateNo.substring(certificateNo.length() - 3, certificateNo.length())) % 2 == 0 ? "女" : "男";
            age = (year - Integer.parseInt("19" + certificateNo.substring(6, 8))) + "";
        } else if (flag && certificateNo.length() == 18) {
            birthday = certificateNo.substring(6, 10) + "-"
                    + certificateNo.substring(10, 12) + "-"
                    + certificateNo.substring(12, 14);
            sexCode = Integer.parseInt(certificateNo.substring(certificateNo.length() - 4, certificateNo.length() - 1)) % 2 == 0 ? "女" : "男";
            age = (year - Integer.parseInt(certificateNo.substring(6, 10))) + "";
        }
    %>
    <div class="moreMessage" >
    	<div class="cover"></div>
    	<div class="moreWin" >
			<div class="moreWin-title">
				<span>详细信息</span>
				<img class="moreWin-img" src="yy/image/cross.png" width="20px" height="20px;">
			</div>
		
			<div class="moreMessage-content">
				<div>姓名：<span class="patient_name"><%=ex.get(i).getPatientName()%></span></div>
                <div>性别：<span class="patient_sex"><%=sexCode%></span></div>
                <div>年龄：<span class="patient_name"><%=age%></span></div>
				<div>联系方式：<span class="patient_phone"><%=ex.get(i).getTel()%></span></div>
				<div>预约日期：<span class="order_time"><%=ex.get(i).getValidDay()%></span></div>
				<div>病情描述：<span class="patient_address"><%=ex.get(i).getSickIntro()%></span></div>
			</div>
		</div>
    </div>
	<div class="ckbs">
        <div class="cover"></div>
        <div class="moreWin" >
            <div class="moreWin-title">
                <span>病史信息</span>
                <img class="moreWin-img" src="yy/image/cross.png" width="20px" height="20px;">
            </div>
        
            <div class="moreMessage-content">
                <div><%=ex.get(i).getSickHistory()%></div>
            </div>
        </div>  
    </div>
    <%} %>
</body>
	<script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/amazeui.min.js"></script>
    <script src="assets/js/app.js"></script>
	<script src="yy/js/yy.js"></script>
	<script type="text/javascript">
	$(".cnc1").click(function () {
		var i=$('.cnc1').index(this);
		console.log(i);
		$(".moreMessage").eq(i).css("display", "flex");
	});
	$(".cnc2").click(function () {
		console.log(i);
		var i=$('.cnc2').index(this);
		$(".ckbs").eq(i).css("display", "flex");
	})
	</script>
</html>