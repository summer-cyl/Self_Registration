<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>管理员端</title>
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
                    <a class="am-dropdown-toggle tpl-header-list-link" href="javascript:;">
                    
                        <span class="tpl-header-list-user-nick"><%=(String)session.getAttribute("account")%></span><span class="tpl-header-list-user-ico"></span>
                    </a>
                </li>
                <li><a href="" style="font-size: 20px"><span class="am-icon-power-off" title="退出"></span></a></li>
            </ul>
        </div>
    </header>

    <div class="tpl-page-container tpl-page-header-fixed">
        <div class="tpl-left-nav tpl-left-nav-hover">
            <div class="tpl-left-nav-title" style="margin-top: -5px; line-height: 22px; font-size: 18px;height: 66px;">
                自助挂号管理员端
            </div>
            <div class="tpl-left-nav-list">
                <ul class="tpl-left-nav-menu">

                    <li class="tpl-left-nav-item">
                        <a href="index.html" class="nav-link tpl-left-nav-link-list">
                            <i class="am-icon-key"></i>
                            <span>个人管理</span>
                        </a>
                    </li>

                    <li class="tpl-left-nav-item">
                        <a href="javascript:;" class="nav-link tpl-left-nav-link-list">
                            <i class="am-icon-table"></i>
                            <span>医生管理</span>
                            <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
                        </a>
                        <ul class="tpl-left-nav-sub-menu">
                            <li>
                                <a href="yslb.jsp">
                                    <i class="am-icon-angle-right"></i>
                                    <span>医生列表</span>
                                </a>
                                <a href="tjys.html">
                                    <i class="am-icon-angle-right"></i>
                                    <span>添加医生</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    
                    <li class="tpl-left-nav-item">
                        <a href="pbgl.html" class="nav-link">
                            <i class="am-icon-home"></i>
                            <span>排班管理</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>

         <div class="tpl-content-wrapper">

           
            <div class="tpl-portlet-components">
                <div class="portlet-title">
                    <div class="caption font-green bold">
                        密码修改
                    </div>
                </div>

                <div class="tpl-block ">

                    <div class="am-g tpl-amazeui-form" style="margin-top: 30px;">
                        
                        <div class="am-u-sm-6 am-u-md-6" style="margin-left: 22%;">
                            <form class="am-form am-form-horizontal">
                                <div class="am-form-group">
                                    <label for="user-name"   class="am-u-sm-3 am-form-label">原密码</label>
                                    <div class="am-u-sm-9">
                                        <input type="password"  id="oldPassword" >
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">新密码</label>
                                    <div class="am-u-sm-9">
                                        <input type="password"  id="newPassword">
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <label for="user-name"  class="am-u-sm-3 am-form-label">确认密码</label>
                                    <div class="am-u-sm-9">
                                        <input type="password" id="newPassword1">
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <label for="user-email" class="am-u-sm-3 am-form-label"></label>
                                    <div class="am-u-sm-9" style="text-align: right;">
                                        <button type="button" class="am-btn am-btn-primary" onClick="changePassword(<%=(String)session.getAttribute("account")%>)">确认修改</button>
                                    </div>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>

    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/amazeui.min.js"></script>
    <script src="assets/js/iscroll.js"></script>
    <script src="assets/js/app.js"></script>
    <script type="text/javascript">
    	function changePassword(account)
    	{
    		var oldPassword = $("#oldPassword").val();
    		var newPassword = $("#newPassword").val();
    		var newPassword1 = $("#newPassword1").val();
    		if(newPassword==newPassword1){
    		$.ajax({
                type: "post",
                url: "/hospital/AdminChangePassword",
                data: 
                {
                	account:account, 
                	oldPassword:oldPassword,
                	newPassword:newPassword
                },
                dataType: "json",
                success: function(data){
                           alert("成功！");
              }
            });
    	  }
    	}
    </script>
</body>

</html>