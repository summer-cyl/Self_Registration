var name = "null"
$('.hnunit').click(function() {
	$(this).addClass('hnuclick').siblings().removeClass('hnuclick');
	var address = $(this).attr('address');
	$('#contentFrame').attr('src', address);
});

$('#caselogin1').click(function() {
    $('#loginDiv').attr('style', 'display: block');
});

$('.closeihconpop').click(function() {
    $('#loginDiv').attr('style', 'display: none');
});
$('#login').click(function(){
	if ($("#userName").val() == "") {
        alert("用户名不能为空！");
        $("#userName").focus();
        return false;
    }
    if ($("#password").val() == "") {
        alert("密码不能为空！");
        $("#password").focus();
        return false;
    }
    $.ajax({
        type: "POST",
        url: "/hospital/LoginDeal",
        data: "name=" + $("#userName").val().toString() + "&password=" + $("#password").val().toString(),
        success: function (data) {
        	alert(data);
            if (data == "1") {
                $("#caselogin1").attr('style','display: none');
                $("#caselogin2").attr('style','display: block');
                $('#usernamespan').html($("#userName").val().toString());
                $('#loginDiv').attr('style', 'display: none');
                return true;
            }
            else {
                alert("请确认您输入的用户名或密码输入是否正确！");
                $("#userName").val("");
                $("#password").val("");
                $("#userName").focus();
                return false;
            }
        }

    });
});
function logout()
{
	 $.ajax({
	        type: "POST",
	        url: "/hospital/LogoutDeal",
	        success: function (data) {
	        	alert("登出成功");
	            $("#caselogin2").attr('style','display: none');
	            $("#caselogin1").attr('style','display: block');
	        }

	    });
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