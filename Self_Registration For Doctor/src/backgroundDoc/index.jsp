<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="beans.User,java.util.*"%>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>医生端</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <link rel="stylesheet" href="assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="assets/css/admin.css">
    <link rel="stylesheet" href="assets/css/app.css">
    <script src="assets/js/echarts.min.js"></script>
</head>

<body data-type="index">


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
                <li class="am-dropdown" data-am-dropdown data-am-dropdown-toggle>
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
        <div class="tpl-left-nav tpl-left-nav-hover">
            <div class="tpl-left-nav-title" style="margin-top: -5px; line-height: 22px; font-size: 18px;height: 66px;">
                自助挂号医生端
            </div>
            <div class="tpl-left-nav-list">
                <ul class="tpl-left-nav-menu">

                    <li class="tpl-left-nav-item">
                        <a href="http://localhost:8080/hospital/Self_Registration/Self_Registration%20For%20Doctor/src/backgroundDoc/index.jsp" class="nav-link active">
                            <i class="am-icon-key"></i>
                            <span>个人信息</span>
                        </a>
                    </li>

                    <li class="tpl-left-nav-item">
                        <a href="javascript:;" class="nav-link tpl-left-nav-link-list">
                            <i class="am-icon-table"></i>
                            <span>预约情况</span>
                            <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
                        </a>
                        <ul class="tpl-left-nav-sub-menu">
                            <li>
                                <a href="zjyy.jsp">
                                    <i class="am-icon-angle-right"></i>
                                    <span>专家预约</span>
                                </a>
                                <a href="zxyy.jsp">
                                    <i class="am-icon-angle-right"></i>
                                    <span>在线预约情况</span>
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
       <form action="SetIntroAction" method="post" class="am-form am-form-horizontal">
        <div class="tpl-content-wrapper">
            <div class="tpl-portlet-components">
                <div class="portlet-title">
                    <div class="caption font-green bold">
                        基本信息
                    </div>
                </div>

                <div class="tpl-block ">

                    <div class="am-g tpl-amazeui-form" style="margin-top: 30px;">


                        <div class="am-u-sm-2 am-u-md-2" style="margin-left: 10%">
                            <div class="am-form-group">
                                <div class="am-form-group am-form-file" style="text-align: center">
                                    <div class="tpl-form-file-img">
                                        <img src="http://localhost:8080/hospital/Self_Registration/Self_Registration%20For%20Doctor/image/<%=self.getAccount()%>.jpg" alt="" style="width: 120px; height: 120px; border-radius: 50%">
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                        
                        <div class="am-u-sm-6 am-u-md-6">
                            
                                <div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">姓名</label>
                                    <div class="am-u-sm-9">
                                        <input type="text" id="user-name" placeholder="姓名 / Name" disabled="disabled" value="<%=self.getName()%>">
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">性别</label>
                                    <div class="am-u-sm-9">
                                        <input type="text" id="user-name" placeholder="性别 / sex" disabled="disabled" value="<%=self.getSex()%>">
                                    </div>
                                </div>
                                <div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">手机号</label>
                                    <div class="am-u-sm-9">
                                        <input type="text" id="user-name" name="tel" placeholder="手机号" value="<%=self.getTel()%>">
                                    </div>
                                </div>
								<div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">出生日期</label>
                                    <div class="am-u-sm-9">
                                        <input type="text" id="user-name" name="birth" placeholder="出生日期" value="<%=self.getBirth()%>">
                                    </div>
                                </div>
                                <div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">入职日期</label>
                                    <div class="am-u-sm-9">
                                        <input type="text" id="user-name" placeholder="入职时间" disabled="disabled" value="<%=self.getWorktime()%>">
                                    </div>
                                </div>
                            
                        </div>

                        <div class="am-u-sm-4 am-u-md-4"></div>
                    </div>
                </div>

            </div>

            <div class="tpl-portlet-components">
                <div class="portlet-title">
                    <div class="caption font-green bold">
                        职业信息
                    </div>
                </div>

                <div class="tpl-block ">

                    <div class="am-g tpl-amazeui-form" style="margin-top: 30px;">
                        
                        <div class="am-u-sm-6 am-u-md-6" style="margin-left: 22%;">
                          
                                <div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">在职医院</label>
                                    <div class="am-u-sm-9">
                                        <input type="text" id="user-name" placeholder="医院" value="XXXXX医院" disabled="disabled">
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">所属科室</label>
                                    <div class="am-u-sm-9">
                                        <input type="text" id="user-name" placeholder="科室" disabled="disabled" value="<%=self.getDepartName()%>">
                                    </div>
                                </div>
								<div class="am-form-group">
                                    <label for="user-intro" class="am-u-sm-3 am-form-label">职位</label>
                                    <div class="am-u-sm-9">
                                        <textarea class="" rows="5" id="user-intro" placeholder="职位" disabled="disabled"> <%=self.getPosition()%></textarea>
                                    </div>
                                </div>
								
                                <div class="am-form-group">
                                    <label for="user-intro" class="am-u-sm-3 am-form-label">个人简介</label>
                                    <div class="am-u-sm-9">
                                        <textarea class="" rows="5" name="intro" id="user-intro-detail" placeholder="个人简介" ><%=self.getIntro()%></textarea>
                                    </div>
                                </div>
								<div class="am-form-group">
                                    <label for="user-email" class="am-u-sm-3 am-form-label"></label>
                                    <div class="am-u-sm-9" style="text-align: right;">
                                        <button type="submit" class="am-btn am-btn-primary" id="reserveInfo">保存</button>
                                    </div>
                                </div>
                           
                        </div>
                    </div>
                </div>

            </div>
        </div>
		</form>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/amazeui.min.js"></script>
    <script src="assets/js/iscroll.js"></script>
    <script src="assets/js/app.js"></script>
    <script type="text/javascript">
        
    	
    </script>
</body>

</html>