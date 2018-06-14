<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="javatools.AccessDB,java.sql.ResultSet"%>
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
    <style>
    	.tpl-alert{
    		min-height:600px;
    	}
    </style>
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
                                <a href="yslb.html" class="active">
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
                <li class="am-active">医生列表</li>
            </ol>

            <div class="tpl-portlet-components">

                <div class="portlet-title">
                    <div class="caption font-green bold">
                        医生列表
                    </div>


                </div>
                <div class="tpl-block">
                    <div class="am-g">
					    <%
					    	AccessDB db = new AccessDB();
					    	ResultSet ans = db.excueteQuery("select * from department");
					    	
					    %>
                        <div class="am-u-sm-12 am-u-md-3">
                            <div class="am-form-group">
                                <select data-am-selected="{btnSize: 'sm'}" id="departSelect">
                                  <option value="所有科室">所有科室</option>
                                  <%while(ans!=null&&ans.next()){ %>
                                  <option value="<%=ans.getString("name")%>"><%=ans.getString("name")%></option>
                                  <%}%>
                                </select>
                            </div>
                        </div>
                        <div class="am-u-sm-12 am-u-md-3">
                            <div class="am-input-group am-input-group-sm">
                                <input type="text" class="am-form-field" placeholder="输入你要搜索的医生姓名" id="searchText">
                                <span class="am-input-group-btn">
                                    <button class="am-btn  am-btn-default am-btn-success tpl-am-btn-success am-icon-search searchBnt" type="button"></button>
                                </span>
                            </div>
                        </div>
                    </div>

                    <div class="am-g">
                        <div class="tpl-table-images">
            				<%
            				
            				    ResultSet ansDoc = db.excueteQuery("select * from doctors");
            					while(ansDoc!=null&&ansDoc.next()){
            					
            				%>
                            <div class="am-u-sm-12 am-u-md-6 am-u-lg-4 doctorsdiv">
                                <div class="tpl-table-images-content">
                                    <a href="javascript:;" class="tpl-table-images-content-i">
                                        <img src="../Self_Registration%20For%20Doctor/image/<%=ansDoc.getString("account")%>.jpg" alt="" style="border-radius: 50%; width: 120px; height: 120px; margin: auto">
                                    </a>
                                    <div class="tpl-table-images-content-block">
                                        <div style="text-align: center; font-size: 18px" >
                                            		<span class="doctorName"><%=ansDoc.getString("name")%></span>
                                        </div>
                                        
                                        <div style="font-size: 15px; margin-top: 20px;line-height: 25px;">
                                            <div class="am-g">
                                                <div class="am-u-sm-6 am-u-md-6 am-u-lg-6 tpl-i-font">所属科室</div>
                                                <div class="am-u-sm-6 am-u-md-6 am-u-lg-6 tpl-i-font doctorDepart" style="text-align: right;"><%=ansDoc.getString("departName")%></div>
                                            </div>
                                            <div class="am-g">
                                                <div class="am-u-sm-6 am-u-md-6 am-u-lg-6 tpl-i-font">职称</div>
                                                <div class="am-u-sm-6 am-u-md-6 am-u-lg-6 tpl-i-font" style="text-align: right;height:30px;overflow:auto;"><%=ansDoc.getString("position")%></div>
                                            </div>
                                            <div class="am-g">
                                                <div class="am-u-sm-6 am-u-md-6 am-u-lg-6 tpl-i-font">入职时间</div>
                                                <div class="am-u-sm-6 am-u-md-6 am-u-lg-6 tpl-i-font" style="text-align: right;"><%=ansDoc.getString("worktime")%></div>
                                            </div>
                                        </div>
                                        
                                        
                                        <div class="am-btn-toolbar" style="margin-top: 35px; margin-bottom: -15px">
                                            <div class="am-btn-group am-btn-group-xs tpl-edit-content-btn" style="text-align: center;">
                                                <p>
                                                    <button type="button" class="am-btn am-btn-default am-btn-secondary" style="margin-right: 30px; font-size: 13px" onClick="changeDoctor(<%=ansDoc.getString("account")%>)"><span class="am-icon-edit" ></span> 编辑</button>                          
                                                    <button type="button" class="am-btn am-btn-default am-btn-danger " style="font-size: 13px" onClick="deleteDoc(<%=ansDoc.getString("account")%>)"><span class="am-icon-trash-o"></span> 删除</button>
                                                </p>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        	<%} %>
                        </div>

                    </div>
                </div>
                <div class="tpl-alert"></div>
            </div>

        </div>

    </div>


    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/amazeui.min.js"></script>
    <script src="assets/js/iscroll.js"></script>
    <script src="assets/js/app.js"></script>
    <script type="text/javascript">
    function changeDoctor(account)
    {
    	window.location.href="bjys.jsp?account="+account;
    }
    function deleteDoc(account)
    {
    	var element = $(event.srcElement);
    	$.ajax({
		    url:'/hospital/DeleteDoc',
		    type:'POST',
		    data:{
		    	account:account,
		    },
		    timeout:5000,    
		    dataType:'json',
		    success:function(data){
		    	if(data>0)
		        {
		    		alert("成功");
		    		$(element).parent().parent().parent().parent().parent().remove();
		        }
		    	else
		    	{
			        alert("失败");
		    	}
		        
		    },
		    error:function(){
		        alert("数据出现错误");
		    }
		});
    }
    $("#departSelect").change(function(){
    		var text = $(this).val();
    		$(".doctorsdiv").each(function(){
    		    var depart = $(this).find(".doctorDepart").html()
    		    if(text=="所有科室"){
    		    	$(this).show();
    		    }else if(depart==text)
    		    {
    		    	$(this).show();
    		    }
    		    else
    		    {
    		    	$(this).hide();
    		    }
    		});
    	});
    	$(".searchBnt").click(function(){
    		var text = $("#searchText").val();
    		if(text!="")
    	    {
    			$(".doctorsdiv:visible").each(function(){
        		    var name = $(this).find(".doctorName").html()
        		     if(name.indexOf(text)>=0)
        		    {
        		    	$(this).show();
        		    }
        		    else
        		    {
        		    	$(this).hide();
        		    }
        		});	
    		}
    	});
    </script>
</body>

</html>