$(function(){
    $('.hnunit').hover(function() {
        $(this).css('background-color', '#2c7dc3');
    }, function() {
    	if(!$(this).hasClass('hnuclick')){
    		$(this).css('background-color', '#3692e2');
    	}
    });
});

function building(){
	alert("该功能正在建设中！");
}
loadPersonInfo();
function loadPersonInfo()
{
	$.ajax({
        type: "POST",
        url: "/hospital/GRXXLoad",
        success: function (data) {
        	console.log(data);
        	data = eval("("+data+")");
        	$("#name").text(data.name);
        	$("#tel").text(data.account);
        	$("#idCardNum").text(data.id);
        	$("#work").text(data.job);
        	$("#homePlace").text(data.livePlace);
        	
        	//计算
        	var age = GetAge(data.id);
        	$("#age").text(age);
        	var sex = GetSex(data.id);
        	$("#sex").text(sex);
        	
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
}
function GetAge(identityCard) {
    var len = (identityCard + "").length;
    if (len == 0) {
        return 0;
    } else {
        if ((len != 15) && (len != 18))//身份证号码只能为15位或18位其它不合法
        {
            return 0;
        }
    }
    var strBirthday = "";
    if (len == 18)//处理18位的身份证号码从号码中得到生日和性别代码
    {
        strBirthday = identityCard.substr(6, 4) + "/" + identityCard.substr(10, 2) + "/" + identityCard.substr(12, 2);
    }
    if (len == 15) {
        strBirthday = "19" + identityCard.substr(6, 2) + "/" + identityCard.substr(8, 2) + "/" + identityCard.substr(10, 2);
    }
    //时间字符串里，必须是“/”
    var birthDate = new Date(strBirthday);
    $("#birth").text(strBirthday);
    var nowDateTime = new Date();
    var age = nowDateTime.getFullYear() - birthDate.getFullYear();
    //再考虑月、天的因素;.getMonth()获取的是从0开始的，这里进行比较，不需要加1
    if (nowDateTime.getMonth() < birthDate.getMonth() || (nowDateTime.getMonth() == birthDate.getMonth() && nowDateTime.getDate() < birthDate.getDate())) {
        age--;
    }
    return age;
}
function GetSex(psidno){
    var sexno,sex
    if(psidno.length==18){
        sexno=psidno.substring(16,17)
    }else if(psidno.length==15){
        sexno=psidno.substring(14,15)
    }else{
        alert("错误的身份证号码，请核对！")
        return false
    }
    var tempid=sexno%2;
    if(tempid==0){
        sex='女'
    }else{
        sex='男'
    }
    return sex
}

$.ajax({
    type: "POST",
    url: "/hospital/EnsureLog",
    success: function (data) {
        alert(data);
        if (data == "1") {
            $("#caselogin1").attr('style','display: none');
            $("#caselogin2").attr('style','display: block');
            $('#usernamespan').html($("#userName").val().toString());
            $('#loginDiv').attr('style', 'display: none');
            return true;
        }
    }
});