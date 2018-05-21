var chooseDay;
var doctorId;
function chooseClick(mainType){
// }
// $('.medhischoose a').click(function() {
    // var str = "chooseHistory" + $(this).attr('val');
    // $('#'+str).css('display', 'block');
    var history;
    if (mainType == "既往史") {
        history = $("#pastMedicalHistory").text();
        $('#chooseHistory1').css('display', 'block');
    } else if (mainType == "婚育史") {
        history = $("#obstetricalHistory").text();
        $('#chooseHistory2').css('display', 'block');
    } else if (mainType == "过敏史") {
        history = $("#allergicHistory").text();
        $('#chooseHistory3').css('display', 'block');
    } else if (mainType == "家族史") {
        history = $("#familyMedicalHistory").text();
        $('#chooseHistory4').css('display', 'block');
    } else if (mainType == "个人习惯") {
        history = $("#personalHabits").text();
        $('#chooseHistory5').css('display', 'block');
    }
    
    if (history != "无") {
        // alert(historys);
        var historys = history.split("、");
        // $(".in-label input").removeAttr("checked");
        for (var i = 0; i < historys.length; i++) {
            // alert(historys[i]);
            var flag = false;
            $(".in-label").each(function() {
                if ($(this).text() == historys[i]) {
                    $(this).find("input").prop("checked", true);
                    // $(this).attr("checked",true);
                    flag = true;
                    return;
                }
            });
            if (!flag) {
                $("#others").val(historys[i]);
            }
        }
    }
}
// );

$('.closeihconpop').click(function() {
    $('.inthospopup').hide();
});
$("#submitBtn").click(function(){
	var checked=true;
	var patient = new Object();
	//获取姓名
	patient.name = $("#name").val();
	if(patient.name==""||patient.name==null||patient.name==undefined)
		checked=false;
	//获取号码
	patient.tel = $("#phone").val();
	if(patient.tel==""||patient.tel==null||patient.tel==undefined)
		checked=false;
	//身份证
	patient.id = $('#idCard').val();
	if(patient.id==""||patient.id==null||patient.id==undefined)
		checked=false;
	//获取时间
	patient.time = chooseDay;
	
	//获取病情的描述
	patient.desease = $("#diseaseDescription").val();
	//获取选项
	patient.history="既往史:"+$("#pastMedicalHistory").text()+"\n"
					+"婚育史:"+$("#pastMedicalHistory").text()+"\n"
					+"过敏史"+$('#allergicHistory').text()+"\n"
					+"家族史"+$('#familyMedicalHistory').text()+"\n"
					+"个人习惯"+$('#personalHabits').text()+"\n";
	patient.doctorId = doctorId;
	patient.chooseDay = chooseDay;
	
	console.log(patient);
	$.ajax({
        type: "POST",
        url: "/hospital/DealOnlineOrder",
        data : "patient="+JSON.stringify(patient),    
        success: function (data) {
    	if(data=="1")
    		alert("挂号成功!");
    	else
    		alert("挂号失败!");
        }
    });
});
function saveMedicalHistory(mainType) {
    var str="";
    if(mainType != "婚育史"){
        $("input[type='checkbox']:checked").each(function(){
            var ss=$(this).parents(".in-label").text();
            str += ss+"、";
            // alert(ss);
        });

        var others = "";
        if (mainType == "既往史") {
            others = $("#others1").val();
        } else if (mainType == "过敏史") {
            others = $("#others3").val();
        } else if (mainType == "家族史") {
            others = $("#others4").val();
        } else if (mainType == "个人习惯") {
            others = $("#others5").val();
        }
        // alert("others: " + others);
        if(others!=""){
            str += others;
        }
        $("input[type='checkbox']:checked").each(function(){
            $(".in-label input").attr("checked",false);
        });
    }else{
        $("input[type='radio']:checked").each(function(){
            var ss ="";
            ss=$(this).parents(".in-label").text();
            str += ss+"、";
        });
    }
    if(mainType == "婚育史" && str == ""){
        alert("请选择婚姻及生育状况！");
        return;
    }
    if(str==""){
        str="无";
    }
    if(str.length>1){
        if(str.substring(str.length - 1) == "、"){
            str=str.substring(0,str.length-1);
        }
    }
    
    if (mainType != undefined) {
        if (mainType == "既往史") {
            $("#pastMedicalHistory").text(str);
        } else if (mainType == "婚育史") {
            $("#obstetricalHistory").text(str);
        } else if (mainType == "过敏史") {
            $("#allergicHistory").text(str);
        } else if (mainType == "家族史") {
            $("#familyMedicalHistory").text(str);
        } else if (mainType == "个人习惯") {
            $("#personalHabits").text(str);
        }
    }
    $('.inthospopup').css('display', 'none');

    // 高度
    $("#contentFrame", top.document).height($(".content").height());
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
function save()
{
    var nameStr = $("#name2").val();
    var cardStr = $("#idCard2").val();
    if(nameStr == "" || cardStr == ""){
        alert("有输入为空！请输入！");
    }
    else {
        $(".morecase").before("<span class='ihcasename' > " + nameStr + "</span>");
        $("#name2").val("");
        $("#idCard2").val("");
        $('.inthospopup').css('display', 'none');
    } 
}

$('.vddbutlast').click(function() {
    window.location.href = "../zxys/index.html";
});
function GetQueryString(name)
{
     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
     var r = window.location.search.substr(1).match(reg);
     if(r!=null)
        return  decodeURI(r[2]);
      return null;
}
function GetRequest() {  
	  
	   $("#deptName").text(GetQueryString("departName"));
	   doctorId = GetQueryString("id")
	   $("#doctorName").text(GetQueryString("name"));
	   chooseDay = GetQueryString("chooseDay");
	   $("#time").text("时间"+GetQueryString("chooseDay"));
	   $(".diddet").text(GetQueryString("intro"));
	   
}   
GetRequest();
function addPeople (){
	var text = $(this).text().toString();
	$("#name").val(text);
	$.ajax({
        type: "POST",
        url: "/hospital/ContactReadID",
        data:"patiantname="+text,
        success: function (data) {
        	console.log(data);
        	var dataObj = eval("("+data+")");
        	if(text.indexOf("本人")>=0)
    		{
        		$("#name").val(dataObj.name);
                $('#idCard').val(dataObj.id);
    		}
        	else
        	{
        		$('#idCard').val(dataObj.id);
        	}		
        }

    });
}
function PageAddContact()
{
	$.ajax({
        type: "POST",
        url: "/hospital/ContactLoad",
        success: function (data) {
        	var dataObj = eval("("+data+")");
        	for(var i=0;i<dataObj.length;i++)
    		{
        		$(".morecase").before("<span class='ihcasename' > " + dataObj[i].name + "</span>");
        		$('.ihcasename').on("click",(addPeople));
    		}
        }

    });
}
$('.ihcasename').click(addPeople);

PageAddContact();
