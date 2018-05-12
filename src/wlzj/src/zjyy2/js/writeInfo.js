var viewer;
$(document).ready(function() {
	var url = $("#zygwOutUrl").val()+"http://www.zy91.com/zyyy/wlzj2/imgUpload.html?action=qrcodeUpload&sessionId="+$("#sessionId").val()+"&timestamp="+$("#timestamp").val();
	updateQrCode(url);
	
	var hospitalId = $("#hospitalId").val();
	if (hospitalId == undefined) {
		$(document.body).height($(".content").height()+1);
		
		var isYy = $("#isYy").val();
		if (isYy == "0") {
			$(top.document.getElementById("zk")).addClass("hnuclick").siblings("span").removeClass("hnuclick");
			$(".deptinsdet").css("left", -($("#deptTitle").width() + $("#deptName").width() + 10) + "px");
		} else if (isYy == "1") {
			$(top.document.getElementById("my")).addClass("hnuclick").siblings("span").removeClass("hnuclick");
			$(".deptinsdet").css("left", -($("#deptTitle").width() + $("#deptName").width() + $("#doctorName").width() + $("#time").width() + 10 + 10 + 10) + "px");
		} else if (isYy == "2") {
			$(top.document.getElementById("zxys")).addClass("hnuclick").siblings("span").removeClass("hnuclick");
			$(".deptinsdet").css("left", -($("#deptTitle").width() + $("#deptName").width() + $("#doctorName").width() + $("#time").width() + 10 + 10 + 10) + "px");
		}
	}
	
	$("#pcUpload").click(function() {
		var imgNumLimit = $("#imgList").attr("imgNumLimit");
		if (imgNumLimit != undefined && imgNumLimit != "") {
			if (parseInt($("#imgList").attr("num")) < parseInt(imgNumLimit))
				$("#file").click();
			else
				alert("化验单、影像单等资料不超过"+imgNumLimit+"张");
		} else {
			$("#file").click();
		}
	});
	
	$("#file").change(function() {
		$("#imgForm").submit();
	});
	
	$("#imgForm").ajaxForm({
		success: showImg,
		dataType: "json"
	});
	
	$("#submitBtn").click(check);
	
	$(".vddtimechoose").click(function(){
		$("#yySchedule").val($(this).find("input[name='timeScope']").val());
		
		if($(this).children(".paywaycheckout").hasClass("pwchecked") || $(this).children(".paywayname").hasClass("pyncant"))
			return;
		else
			$(".paywaycheckout").removeClass("pwchecked");
		$(".paywaycheckout").children(".paywaycheck").removeAttr("checked","checked");
		$(this).children(".paywaycheckout").addClass("pwchecked");
		$(".pwchecked").children(".paywaycheck").attr("checked","checked");
	})
	
	refreshImg();
	setInterval(refreshImg, 5000);
});

var isSubmit = false;

function check() {
	// if ($("#name").isRealName() == false) {
	// 	alert("姓名格式错误！");
	// 	return;
	// }
	// var phoneReg = /^1(3|4|5|7|8)\d{9}$/;
	// var phone = $("#phone").val();
	// if (!phoneReg.test(phone.trim())) {
	// 	alert("手机号格式错误, 请输入11位手机号！");
	// 	return;
	// }
	// if ($("#idCard").isIDCard() == false) {
	// 	alert("身份证格式错误！");
	// 	return;
	// }
	
	// var diseaseDescription = $("#diseaseDescription").val();
	// if (diseaseDescription == "" || diseaseDescription == undefined) {
	// 	alert("描述不能为空");
	// 	return ;
	// }
	// if (diseaseDescription.length > 1000){
	// 	alert("描述字数过长，请适当删减!");
	// 	return;
	// }
	
	// // 打开就诊卡弹窗
	// getJzk();
}

function getJzk() {
	var name = encodeURI($("#name").val());
	var idCard = $("#idCard").val();
	var phone = $("#phone").val();
	var loading = layer.load(1);
	$.ajax({
		type: "get",
		url: "http://www.zy91.com/zyyy/login/yy.html?action=getJzk",
		data: {
			name: name,
			idCard: idCard,
			phone: phone
		},
		success: function(ret) {
			layer.close(loading);
			$("#jzkPopup").html(ret);
			$("#jzkPopup").show();
		},
		timeout: 5*60000
	});
}

var isSubmit = false;
function writeInfoPost() {
	var name = $("#name").val();
	var phone = $("#phone").val();
	var treatmentCard = $("#treatmentCard").val();
	var idCard = $("#idCard").val();
	var diseaseDescription = $("#diseaseDescription").val();
	var pastMedicalHistory = $("#pastMedicalHistory").text();
	var obstetricalHistory = $("#obstetricalHistory").text();
	var allergicHistory = $("#allergicHistory").text();
	var familyMedicalHistory = $("#familyMedicalHistory").text();
	var personalHabits = $("#personalHabits").text();
	var isYy = $("#isYy").val();
	var patientType = $("#patientType").val();
	
	var data = {
		name: name,
		phone: phone,
		treatmentCard: treatmentCard,
		idCard: idCard,
		diseaseDescription: diseaseDescription,
		pastMedicalHistory: pastMedicalHistory,
		obstetricalHistory: obstetricalHistory,
		allergicHistory: allergicHistory,
		familyMedicalHistory: familyMedicalHistory,
		personalHabits: personalHabits,
		timestamp: $("#timestamp").val(),
		isYy: isYy,
		sum: $("#sum").text(),
		originalCost: $("#originalCost").val(),
		departmentId: $("#deptId").val(),
		department: $("#deptName").text(),
		deptScheduleId: $("#deptScheduleId").val(),
		yyDate: $("#yyDate").val(),
		yySchedule: $("#yySchedule").val(),
		yyTime: $("#yyTime").val(),
		patientType: patientType
	};
	
	// 其它医院
	var hospitalId = $("#hospitalId").val();
	var otherUserId = $("#otherUserId").val();
	if (hospitalId != undefined && hospitalId != "" && otherUserId != undefined && otherUserId != "") {
		data.hospitalId = hospitalId;
		data.otherUserId = otherUserId;
	}
	
	var doctorScheduleId = $("#doctorScheduleId").val();
	if (doctorScheduleId != undefined)
		data.doctorScheduleId = doctorScheduleId;
	
	var doctorId = $("#doctorId").val();
	if (doctorId != undefined)
		data.doctorId = doctorId;
	
	var doctorName = $("#doctorName").text();
	if (doctorName != undefined && doctorName != "")
		data.yyDoctor = doctorName;
	
	if (!isSubmit) {
		isSubmit = true;
		$("#submitBtn").html("提交中...");
		$("#submitPopup").show();
		$.ajax({
			type: "POST",
			url: "http://www.zy91.com/zyyy/login/yy.html?action=writeInfoPost",
			data: data,
			success: function(ret) {
				if (ret != null && ret.hasOwnProperty("ret_code")) {
					if (ret.ret_code == 0) {
						console.log("提交成功！");
						if (ret.isSkipPay == false) {
							if (isYy == "0") {
								window.location.href = "http://www.zy91.com/zyyy/login/yy.html?action=getYyPay&patientId="+ret.patientId;
							} else if (isYy == "1") {
								window.location.href = "http://www.zy91.com/zyyy/login/yy.html?action=getYySuccess&patientId="+ret.patientId;
							} else if (isYy == "2") {
								if (ret.isToday)
									window.location.href = "http://www.zy91.com/zyyy/login/yy.html?action=getYyPay&patientId="+ret.patientId;
								else
									window.location.href = "http://www.zy91.com/zyyy/login/yy.html?action=getYySuccess&patientId="+ret.patientId;
							}
						} else
							window.location.href = "http://www.zy91.com/zyyy/login/yy.html?action=getYySuccess&patientId="+ret.patientId;
					} else {
						if (ret.hasOwnProperty("ret_info") && ret.ret_info != "") {
							alert(ret.ret_info);
						}
					}
				}
				isSubmit = false;
				$("#submitPopup").hide();
				$("#submitBtn").html("提交申请");
			},
			dataType: "json"
		});
	}
}

function showImg(data) {
	$("#file").val("");
	if (data != null) {
		if (parseInt(data.ret_code) == 0) {
			addImg(data.picture);
		} else {
			if (data.hasOwnProperty("ret_info"))
				alert(data.ret_info);
			return false;
		}
	}
}

function refreshImg() {
//	console.log(new Date() + "获取图片");
	
	var imgIdArray = new Array();
	$("#imgList img").each(function(index) {
		imgIdArray[index] = $(this).attr("id");
	});
	$.ajax({
		type: "get",
		url: "http://www.zy91.com/zyyy/wlzj2/imgUpload.html?action=getImgList&timestamp="+$("#timestamp").val(),
		success: function(ret) {
			if (ret != null && ret.hasOwnProperty("ret_code") && ret.ret_code == 0) {
				var imgList = ret.imgList;
				for (var i = 0; i < imgList.length; i++) {
					var img = imgList[i];
					var id = img.id;
					
					var flag = false;
					for (var j = 0; j < imgIdArray.length; j++) {
						if (imgIdArray[j] == id) {
							flag = true;
							break;
						}
					}
					
					if (!flag) {
						addImg(img);
						$("#contentFrame", top.document).height($(".content").height());
						console.log(new Date() + "添加图片 "+id);
					}
				}
			}
		},
		dataType: "json"
	});
}

function addImg(img) {
	var imgStr = "<li><div class=\"uploadpho\"><div class=\"refuseupimg\" onclick=\"deleteItem(this, "+img.id+")\"></div>" +
		"<img id=\""+img.id+"\" class=\"xphotos\" src=\"" + img.url + "\" alt='图片' /></div></li>";
	$("#imgList").append(imgStr);
	var num = parseInt($("#imgList").attr("num"));
	$("#imgList").attr("num", num+1);
	// 图片浏览器
	if (viewer == undefined)
		viewer = new Viewer(document.getElementById('imgList'));
	else
		viewer.update();
	
	$("#contentFrame", top.document).height($(".content").height());
}

function deleteItem(a, pictureId) {
	$.ajax({
		type: "get",
		url: "http://www.zy91.com/zyyy/wlzj2/imgUpload.html?action=deleteImg&id="+pictureId,
		success: function(ret) {
			if (ret != null && ret.hasOwnProperty("ret_code")) {
				if (ret.ret_code == 0) {
					var num = $("#imgList").attr("num");
					var src = $(a).attr("src");
					$(a).parent().parent().remove();
					$("#contentFrame", top.document).height($(".content").height());
					$("#imgList").attr("num",num-1);
				} else {
					if (ret.hasOwnProperty("ret_info"))
						alert(ret.ret_info);
				}
			}
		},
		dataType: "json"
	});
}

function selectCard(info) {
	var arr = info.split("?");
	if (typeof(arr) != "undefined" && arr.length == 4)
	{
		$("#name").val(arr[0]);
		//$("#phone").val(arr[1]);
		$("#idCard").val(arr[2]);
		$("#treatmentCard").val(arr[3]);
	}
}

function getLink() {
	var length = $('.addMan').children('span').length;
	if (length < 10)
	{
		var txt = $("#treatCardType").find("option:selected").text();
		$("#selectBg").text(txt)
		$("#addPop").show();
	}
	else
	{
		alert('就诊卡数量达到了上限，无法添加了');
		return false;
	}
}

function selectOpt() {
	var txt = $("#treatCardType").find("option:selected").text();
	$("#selectBg").text(txt);
}

function closePop() {
	$("#addPop").hide();
}

function save()
{
	var name = $("#name2").val();
//	var phone = $("#phone2").val();
	var treatCard = $("#treatCard2").val();
	var idCard = $("#idCard2").val();
	var cardType = $("#treatCardType option:selected").val();
	var regPhone = /^\d{11}$/; 
	var regCard = /^[a-zA-Z0-9]+$/;
	
	// if ($("#name2").isRealName() == false)
	// {
	// 	alert('姓名格式错误!');
	// 	return false;
	// }
	// if ($("#idCard2").isIDCard() == false)
	// {
	// 	alert('身份证格式错误!');
	// 	return false;
	// }
//	if (!regPhone.test($("#phone2").val().trim()))
//	{
//		alert('手机号格式错误, 请输入11位手机号!');
//		return false;
//	}
	if (treatCard.length > 0 && !regCard.test(treatCard))
	{
		alert('就诊卡格式错误!');
		return false;
	}
	$("#btnSave").attr("onclick", "javascript:void();");
	var isSubmit = false;
	if (!isSubmit) {
		isSubmit = true;
		$("#btnSave").html("提交中...");
		$.post(
			"http://www.zy91.com/zyyy/login/medicalCard.htm?action=addMedicalCard", 
			{
				name: name, 
				idCard:idCard,
				type: cardType,
				treatCard: treatCard
			}, 
			function(res){
				$("#btnSave").html("保存");
				$("#btnSave").attr("onclick", "save()");
				if (parseInt(res.ret_code) == 0)
				{
					var isYy = $("#isYy").val();
					if (isYy != undefined) {
						if (isYy == "0")
							window.location.href = "http://www.zy91.comzyyy/login/zk.html?action=writeInfo&isWlzj2=1&deptScheduleId="+$("#deptScheduleId").val();
						else if (isYy == "1" || isYy == "2")
							window.location.href="http://www.zy91.com/zyyy/login/my.html?action=writeInfo&isWlzj2=1&doctorScheduleId="+$("#doctorScheduleId").val();
					}
					return true;
				}
				else
				{
					isSubmit = false;
					alert(res.ret_info);
					return false;
				}
			},
			"json"
		);
	}
}

// function getHistory(mainType) {
// 	$.ajax({
// 		type: "get",
// 		url: "/zyyy/login/yy.html?action=getHistory&mainType="+encodeURI(encodeURI(mainType)),
// 		success: function(ret) {
// 			$("#chooseHistory").html(ret);
// 			$("#chooseHistory").show();
// 		},
// 		dataType: "text"
// 	});
// }

// function saveMedicalHistory(mainType) {
// 	var str="";
	
// 	if(mainType != "婚育史"){
// 		$("input[type='checkbox']:checked").each(function(){
// 	    	var ss=$(this).parents(".in-label").text();
// 	    	str += ss+"、";
// 		});

// 		var others = "";
// 		if (mainType == "既往史") {
// 			others = $("#others1").val();
// 		} else if (mainType == "过敏史") {
// 			others = $("#others3").val();
// 		} else if (mainType == "家族史") {
// 			others = $("#others4").val();
// 		} else if (mainType == "个人习惯") {
// 			others = $("#others5").val();
// 		}
// 		// alert("others: " + others);
// 		if(others!=""){
// 			str += others;

// 		}
// 		$("input[type='checkbox']:checked").each(function(){
// 	    	$(".in-label input").attr("checked",false);
// 		});
// 	}else{
// 		$("input[type='radio']:checked").each(function(){
// 	    	var ss=$(this).parents(".in-label").text();
// 	    	str += ss+"、";
// 		});
// 	}
// 	if(mainType == "婚育史" && str == ""){
// 		alert("请选择婚姻及生育状况！");
// 		return;
// 	}
// 	if(str==""){
// 		str="无";
// 	}
// 	if(str.length>1){
// 		if(str.substring(str.length - 1) == "、"){
// 			str=str.substring(0,str.length-1);
// 		}
// 	}
	
// 	if (mainType != undefined) {
// 		if (mainType == "既往史") {
// 			$("#pastMedicalHistory").text(str);
// 		} else if (mainType == "婚育史") {
// 			$("#obstetricalHistory").text(str);
// 		} else if (mainType == "过敏史") {
// 			$("#allergicHistory").text(str);
// 		} else if (mainType == "家族史") {
// 			$("#familyMedicalHistory").text(str);
// 		} else if (mainType == "个人习惯") {
// 			$("#personalHabits").text(str);
// 		}
// 	}
//     //$("#chooseHistory").hide();
//     $('.inthospopup').css('display', 'none');

//     // 高度
//     $("#contentFrame", top.document).height($(".content").height());
// }

function closeChooseHistory(){
	$("#chooseHistory").hide();
}

//二维码
// function updateQrCode(data) {
// 	if (data == undefined || data == "")
// 		return;
// 	var options = {
// 		// render method: "canvas", "image" or "div"
// 		render: "image",
// 		// error correction level: "L", "M", "Q" or "H"
// 		ecLevel: "L",
// 		// size in pixel
// 		size: 250,
// 		// content
// 		text: data,
// 		mode: 0,
// 		//mode: 4, // 图片
// 		mSize: 0.2,
// 		mPosX: 0.5,
// 		mPosY: 0.5/*,
// 		image: $("#logo")[0]*/
// 	};
// 	$("#qrcodeUpload").empty().qrcode(options);
// }