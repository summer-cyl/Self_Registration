<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>医生管理</title>
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
                        <span class="tpl-header-list-user-nick">aaa</span><span class="tpl-header-list-user-ico"> <img src="assets/img/user01.png"></span>
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
                        <ul class="tpl-left-nav-sub-menu" style="display:block">
                            <li>
                                <a href="yslb.html">
                                    <i class="am-icon-angle-right"></i>
                                    <span>医生列表</span>
                                </a>
                                <a href="tjys.html" class="active">
                                    <i class="am-icon-angle-right"></i>
                                    <span>添加医生</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    
                    <li class="tpl-left-nav-item">
                        <a href="pbgl.html" class="nav-link tpl-left-nav-link-list">
                            <i class="am-icon-home"></i>
                            <span>排班管理</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>

        <div class="tpl-content-wrapper">

            <div class="tpl-content-page-title">
                医生列表
            </div>
            <ol class="am-breadcrumb">
                <li><a href="index.html" class="am-icon-home">首页</a></li>
                <li><a href="#">医生管理</a></li>
                <li class="am-active">添加医生</li>
            </ol>

            <div class="tpl-portlet-components">
                <div class="portlet-title">
                    <div class="caption font-green bold">
                        添加医生
                    </div>
                </div>

                <div class="tpl-block ">
                    <form action="/hospital/AddDoctors" method="get" class="am-form am-form-horizontal" >
                    <div class="am-g tpl-amazeui-form" style="margin-top: 30px;">


                      
                        
                       
                        <div class="am-u-sm-6 am-u-md-6">
                            
                       
     
                                <div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">姓名</label>
                                    <div class="am-u-sm-9">
                                        <input type="text" name="name" placeholder="姓名 / Name" >
                                    </div>
                                </div>
								<div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">密码</label>
                                    <div class="am-u-sm-9">
                                        <input type="text"  placeholder="密码 / Name" name="password" >
                                    </div>
                                </div>
                                <div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">性别</label>
                                    <div class="am-u-sm-9">
                                        <input type="text" id="user-name" placeholder="性别 / sex" name="sex" >
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">出生日期</label>
                                    <div class="am-u-sm-9">
                                        <input type="text" id="user-name" placeholder="出生日期 / birth" name="birth" >
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <label for="user-phone" class="am-u-sm-3 am-form-label">手机号码</label>
                                    <div class="am-u-sm-9">
                                        <input type="tel" id="user-phone" placeholder="输入你的电话号码 / Telephone" name="tel" >
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <label for="user-email" class="am-u-sm-3 am-form-label">工作时间</label>
                                    <div class="am-u-sm-9">
                                        <input type="text" id="user-email" placeholder="工作时间 " name="worktime" >
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">个人简介</label>
                                    <div class="am-u-sm-9">
                                        <textarea  id="user-name" placeholder="个人简介" name="intro"></textarea>
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">所属科室</label>
                                    <div class="am-u-sm-9">
                                        
                                         <input type="text" id="user-name" placeholder="所属科室" name="departName" >
                                    </div>
                                </div>
								 <div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">职位</label>
                                    <div class="am-u-sm-9">
                                        <input type="text" id="user-name" placeholder="科室" name="position" >
                                    </div>
                                </div>
                                <div class="am-form-group">
                                    <label for="user-email" class="am-u-sm-3 am-form-label"></label>
                                    <div class="am-u-sm-9" style="text-align: right;">
                                        <button type="submit" class="am-btn am-btn-primary" >保存</button>
                                    </div>
                                </div>
                        </div>
                      
                        <div class="am-u-sm-4 am-u-md-4"></div>
                    </div>
                	</form>
                </div>

                 
            </div>

        </div>

    </div>


    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/amazeui.min.js"></script>
    <script src="assets/js/iscroll.js"></script>
    <script src="assets/js/app.js"></script>
</body>

</html>