<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
		<title>网络诊间</title>
	</head>
	<body>
		<div id="bodyH">
			<input type="hidden" id="isWlzj2" value="1">
			<div id="addUserInfoTitle" class="addPerson">
				新增联系人
				<button class="addBtn" onclick="openWindow();"></button>
			</div>

			<div id="userInfoDiv" class="addCon formDiv">
				<ul class="vaildcardul">
					<li>
						<label class="dataType dataType2">
							<span style="color:red">*</span>
						    姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：
						</label>
						<input type="text" id="name" class="dataValueS">
					</li>
					<li>
						<label class="dataType dataType2">
							<span style="color:red">*</span>
						    身份证号：
						</label>
						<input type="text" id="realName" class="dataValueS">
					</li>
				</ul>
				<button class="addClose" onclick="closeWindow();"></button>
				<input type="button" id="btnSave" value="保存" onclick="save()">
			</div>

			<table cellspacing="0" cellspacing="0" class="addTable">
				<thead>
					<tr>
						<td width="12%">姓名</td>
						<td width="10%">性别</td>
						<td width="25%">身份证号</td>
						<td width="12%">操作</td>
					</tr>
				</thead>

				<tbody id="tab">
					<tr id="noPerson">
						<td colspan="4">暂时没有就诊卡信息！</td>
					</tr>
				</tbody>
			</table>

		</div>
	</body>
</html>

<style type="text/css">

    body {
    	height: 520px;
    }

    li {
    	list-style: none;
    }
		
	.addPerson {
	    color: #09719f;
	    font-size: 18px;
	    margin-top: 10px;
	    margin-bottom: -10px;
	}
	
	.addBtn {
	    width: 16px;
	    height: 16px;
	    display: inline-block;
	    vertical-align: middle;
	    background: url(image/addper.png) no-repeat;
	    background-size: 100% 100%;
	    border: none;
	    margin: -3px 0 0 2px;
	    cursor: pointer;
	    outline: none;
	}

	.addCon {
		width: 93%;
	    padding: 25px;
	    background: #fafafa;
	    border: 1px solid #e6e6e6;
	    margin-top: 20px;
	    height: 230px;
	    position: relative;
	}

	.addCon ul li {
	    height: 50px;
	    line-height: 50px;
	}

	.formDiv .vaildcardul {
	    width: 350px;
	    float: left;
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

	.formDiv .dataValueS {
	    margin-left: 10px;
	    height: 32px;
	    width: 230px;
	    display: inline-block;
	    border: 1px solid #e6e6e6;
	    border-radius: 3px;
	}
	
	.addTable {
	    width: 100%;
	    text-align: center;
	    margin-top: 20px;
	    margin-left: -3px;
	    overflow: hidden;
	    border: 1px solid #fcfcfc;
	}

	.addTable td {
	    border: 1px solid #e6e6e6;
	    color: #666;
	    word-wrap: break-word;
	    word-break: break-all;
	}

	.addTable thead tr{
		height:40px;
		background:#ebf3fc;
	}
	.addTable thead tr td{
		/*border: 1px solid #fcfcfc;*/ 
	}

	.addTable tbody tr {
		height: 45px;
		font-size: 15px;
		line-height: 45px;
		border-bottom: 1px solid #fcfcfc;
	}

	#tab td tr {
		border-bottom: 1px solid #fcfcfc;
	}

	.addCon input[type="button"] {
	    width: 100px;
	    height: 40px;
	    border-radius: 6px;
	    background-color: #1490c7;
	    border: 0;
	    color: #fff;
	    font-size: 18px;
	    clear: both;
	    display: block;
	    margin: auto;
	    position: relative;
	    top: 30px;
	}

	.addClose {
	    width: 29px;
	    height: 28px;
	    background: url(image/addclose.png) no-repeat;
	    border: none;
	    position: absolute;
	    top: 0px;
	    right: 0px;
	    cursor: pointer;
	    outline: none;
	}

	#userInfoDiv {
		display: none;
	}

	#btnSave {
		cursor: pointer;
		outline: none;
	}
	.operation {
		height: 44px;
		line-height: 22px;

	}
	.operation span {
		color: #3b8ede;
		text-decoration: underline;
		font-size: 15px;
		cursor: pointer;
	}
}

</style>

<script type="text/javascript" src="lib/jquery-3.2.1.js"></script>
<script type="text/javascript" src="../js/index.js"></script>
<script type="text/javascript">
	var count = 0;
	var option = 1;  //option为1表示添加新数据， option为2表示修改数据
    var oldName="null";
	var nowId;

	function openWindow(){
		$("#userInfoDiv").css("display", "block");
		$("#name").val("");
		$("#realName").val("");
	}

	function closeWindow(){
		$("#userInfoDiv").css("display", "none");
	}

	$("#tab").on('click', '.changeInfo', function(event) {
		nowId = $(this).parent().parent().parent().attr('id');
		var name = $(this).parent().parent().parent().find('#infoName').text();
		var realName = $(this).parent().parent().parent().find('#infoRealName').text();
		openWindow();
		$("#name").val(name);
		$("#realName").val(realName);
		option = 2;
		oldName = realName;
		
	});

	$("#tab").on('click', '.deleteInfo', function(event) {
		$(this).parent().parent().parent().remove();
		count --;
		if(count == 0)
			$("#noPerson").css("display", "table-row");
		var realName = $(this).parent().parent().parent().find('#infoRealName').text();
		oldname=realName;
		$.ajax({
            type: "POST",
            url: "/hospital/DealContact",
            data: "&contactId=" + oldName,
            success: function (data) {
            	if(data>"0")
            	{
            		$.ajax({
                        type: "POST",
                        url: "/hospital/DealContact",
                        data: "&contactId=" + realName,
                        success: function (data) {
                        	if(data=="1")
                        	{
                        		$(this).parent().parent().parent().remove();
                        		count --;
                        		if(count == 0)
                        			$("#noPerson").css("display", "table-row");            	}
                        	else
                        	{
                        		alert("请重新提交");
                        	}
                        }

                    });
                }
            	else
            	{
            		alert("请重新提交");
            	}
            }

        });
		
	});

	function save() {

		if(option == 1){
			var name = $("#name").val();

			if(name.length == 0)
				alert("姓名格式错误！");
			else {
				var realName = $("#realName").val();

				if($.trim(realName).length == 0) { 
			        alert("身份证号码未输入！");
			    } 
			    else {
			        if(isCardNo($.trim(realName)) == false) {
			            alert("身份证格式错误！");
			        }
			        else {
			        	$.ajax({
			                type: "POST",
			                url: "/hospital/AddContactDeal",
			                data: "contactName=" + name + "&contactId=" + realName,
			                success: function (data) {
			                	if(data=="1")
			                	{
			                		alert("添加成功！");
									closeWindow();

									if(parseInt(realName.substr(16, 1)) % 2 == 1)
							        	var sex = "男";
							        else
							        	var sex = "女";
              
							        var td1 = '<td id="infoName">' + name + '</td>';
							        var td2 = '<td>' + sex + '</td>';
							        var td3 = '<td id="infoRealName">' + realName + '</td>';
							        var td4 = '<td>' + '<div class="operation">' + '<span class="changeInfo">修改</span><br>' + '<span class="deleteInfo">删除</span>' + '</div>' + '</td>';


							        $("#name").val("");
							        $("#realName").val("");

							        count ++;
							        if(count == 0)
										$("#noPerson").css("display", "table-row");
									else
										$("#noPerson").css("display", "none");

							        $("#tab").append("<tr id="+count+" align='center' height='15px' border-bottom='1px solid #000000'>"
							        	+ td1
							        	+ td2
							        	+ td3
							        	+ td4
							        	+"</tr>");
			                	}
			                	else
			                	{
			                		alert("请重新提交");
			                	}
			                }

			            });
			        	
				    }
			    }
			}
		}
		
		else if(option == 2){
			
			var name = $("#name").val();
			var realName = $("#realName").val();
			var tabName = "#tab tr[id=" + nowId + "] td[id=infoName]";
			var tabRealName = "#tab tr[id=" + nowId + "] td[id=infoRealName]";
			var sexTd = "#tab tr[id=" + nowId + "] td:nth-child(2)";
			console.log(sexTd);
			$.ajax({
                type: "POST",
                url: "/hospital/DealContact",
                data: "&contactId=" + oldName,
                success: function (data) {
                	if(data>"0")
                	{
                		$.ajax({
                            type: "POST",
                            url: "/hospital/AddContactDeal",
                            data: "contactName=" + name + "&contactId=" + realName,
                            success: function (data) {
                            	if(data=="1")
                            	{
                            		
                        			
                        			$(tabName).text(name);
                        			$(tabRealName).text(realName);
                        			var sex
                        			if(parseInt(realName.substr(16, 1)) % 2 == 1)
							        	sex = "男";
							        else
							        	sex = "女";
                        			$(sexTd).text(sex);
                        			closeWindow();
                        			
                        		}
                            	else
                            	{
                            		alert("请重新提交");
                            	}
                            }

                        });
                    }
                	else
                	{
                		alert("请重新提交");
                	}
                }

            });
			
			
		}
		
	}

	//验证身份证是否合法
	function isCardNo(card) {  
	   var pattern = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;  
	   return pattern.test(card); 
	} 
	$.ajax({
        type: "POST",
        url: "/hospital/ContactLoad",
        success: function (data) {
        	var dataObj = eval("("+data+")");
        	console.log(data);
        	for(var i=0;i<dataObj.length;i++)
    		{
        		if(parseInt((dataObj[i].id).substr(16, 1)) % 2 == 1)
		        	var sex = "男";
		        else
		        	var sex = "女";
		        var td1 = '<td id="infoName">' +dataObj[i].name + '</td>';
		        var td2 = '<td>' + sex + '</td>';
		        var td3 = '<td id="infoRealName">' + dataObj[i].id+ '</td>';
		        var td4 = '<td>' + '<div class="operation">' + '<span class="changeInfo">修改</span><br>' + '<span class="deleteInfo">删除</span>' + '</div>' + '</td>';
		        $("#tab").append("<tr id="+(i+1)+" align='center' height='15px' border-bottom='1px solid #000000'>"
		        	+ td1
		        	+ td2
		        	+ td3
		        	+ td4
		        	+"</tr>");
		        count++;
    		}
	        if(dataObj==null||dataObj.length==0||count==0)
				$("#noPerson").css("display", "table-row");
			else
				$("#noPerson").css("display", "none");

        }

    });
</script>