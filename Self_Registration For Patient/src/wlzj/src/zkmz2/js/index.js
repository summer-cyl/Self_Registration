var departId = 1;
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
        //alert(historys);
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

function saveMedicalHistory(mainType) {
	if(mainType=="既往史")
	{
		var inputDe = document.getElementsByName("illness");
		var ansInput = "";
		for(var i=0;i<inputDe.length;i++)
		{
			if(inputDe[i].checked)
			{
				ansInput+=inputDe[i].value+" ";
			}
		}
		var text = $("#others1").val();
		if(ansInput==""&&text=="")
			text="无";
		$("#pastMedicalHistory").text(ansInput+" "+text);
	}
	else if(mainType=="婚育史")
	{
		var ansInput = "";
		var isMarried = $('input[name="radio1"]:checked ').val();
		if(isMarried==0)
			ansInput += "已婚 ";
		else 
			ansInput += "未婚 ";
		var isPreg = $('input[name="radio2"]:checked ').val();
		if(isPreg==0)
		{	
			ansInput += "未生育 ";
		}
		else if(isPreg==1)
		{	
			ansInput += "备孕期 ";
		}
		else if(isPreg==2)
		{
			ansInput += "怀孕期 ";
		}
		else
		{
			ansInput += "已生育 ";
		}
		$("#obstetricalHistory").text(ansInput);
	}
	else if(mainType=="过敏史")
	{
		var ansInput="";
		var med = document.getElementsByName("medecine");
		for(var i=0;i<med.length;i++)
		{
			if(med[i].checked)
			{
				ansInput+=med[i].value+" ";
			}
		}
		var food = document.getElementsByName("food");
		for(var i=0;i<food.length;i++)
		{
			if(food[i].checked)
			{
				ansInput+=food[i].value+" ";
			}
		}
		var text = $("#others3").val();
		if(ansInput==""&&text=="")
			text="无";
		$("#allergicHistory").text(ansInput+" "+text);
	}
	else if(mainType=="家族史")
	{
		var ansInput="";
		var family = document.getElementsByName("family");
		for(var i=0;i<family.length;i++)
		{
			if(family[i].checked)
			{
				ansInput+=family[i].value+" ";
			}
		}
		var text = $("#others4").val();
		if(ansInput==""&&text=="")
			text="无";
		$("#familyMedicalHistory").text(ansInput+" "+text);
	}
	else if(mainType=="个人习惯")
	{
		var ansInput = "";
		var habit = document.getElementsByName("habit");
		for(var i=0;i<habit.length;i++)
		{
			if(habit[i].checked)
			{
				ansInput+=habit[i].value+" ";
			}
		}
		var text = $("#others5").val();
		if(ansInput==""&&text=="")
			text="无";
		$("#personalHabits").text(ansInput+" "+text);
	}
	$(".inthospopup").attr('style','display:none');
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
    	$.ajax({
            type: "POST",
            url: "/hospital/AddContactDeal",
            data: "contactName=" + nameStr + "&contactId=" + cardStr,
            success: function (data) {
            	if(data=="1")
            	{
            		$(".morecase").before("<span class='ihcasename' > " + nameStr + "</span>");
            		$('.ihcasename').on("click",(addPeople));
                    $("#name2").val("");
                    $("#idCard2").val("");
                    $('.inthospopup').css('display', 'none');
            	}
            	else
            	{
            		alert("请重新提交");
            	}
            }

        });
   
    } 
}

$('.vddbutlast').click(function() {
	window.location.href="../zkmz/index.jsp";
});

function GetRequest() {  
	   //科室的名称
	   var url = location.search; 
	   var theRequest = new Object();   
	   if (url.indexOf("?") != -1) {   
	      var str = url.substr(url.indexOf("?")+1);   
	      strs = str.split("&|' ");   
	      for(var i = 0; i < strs.length; i ++) { 
	    	 console.log(strs[i]);
	         theRequest[strs[i].split("=")[0]]=unescape(strs[i].split("=")[1]);   
	      }   
	   } 
	   var title = new Array(
			   "心内科",
			   "呼吸内科",
			   "中医科",
			   "精神卫生科",
			   "神经内科",
			   "内分泌代谢病科",
			   "肝胆胰外科",
			   "血管外科",
			   "心胸外科",
			   "普胸外科",
			   "肿瘤外科",
			   "耳鼻咽喉科",
			   "眼科",
			   "口腔科",
			   "皮肤性病科"
	   );
	   $("#deptName").html(title[theRequest["formTitle"]]);
	   departId = theRequest["formTitle"];
	   console.log(theRequest);
}   
GetRequest();
var  time = -1;
$("#submitBtn").click(function(){
	var checked=true;
	var patient = new Object();
	//获取姓名
	patient.name = $("#patientName").val();
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
	patient.time = time;
	if(patient.time==-1)
		checked=false;
	//获取病情的描述
	patient.desease = $("#diseaseDescription").val();
	//获取选项
	var inputDe = document.getElementsByName("illness");
	var ansInput = "疾病历史:";
	for(var i=0;i<inputDe.length;i++)
	{
		if(inputDe[i].checked)
		{
			ansInput+=inputDe[i].value+" ";
		}
	}
	ansInput+="\n";
	ansInput+="婚姻情况:";
	var isMarried = $('#wrap input[name="radio1"]:checked ').val();
	if(isMarried==0)
		ansInput += "已婚 ";
	else 
		ansInput += "未婚 ";
	var isPreg = $('#wrap input[name="radio2"]:checked ').val();
	if(isPreg==0)
	{	
		ansInput += "未生育 ";
	}
	else if(isPreg==1)
	{	
		ansInput += "备孕期 ";
	}
	else if(isPreg==2)
	{
		ansInput += "怀孕期 ";
	}
	else
	{
		ansInput += "已生育 ";
	}
	ansInput+="\n";
	ansInput+="药物过敏历史:";
	var med = document.getElementsByName("medecine");
	for(var i=0;i<med.length;i++)
	{
		if(med[i].checked)
		{
			ansInput+=med[i].value+" ";
		}
	}
	var food = document.getElementsByName("medecine");
	ansInput+="\n";
	ansInput+="食物过敏历史:";
	for(var i=0;i<food.length;i++)
	{
		if(food[i].checked)
		{
			ansInput+=food[i].value+" ";
		}
	}
	ansInput+="\n";
	ansInput+="家族病史:";
	var family = document.getElementsByName("family");
	for(var i=0;i<family.length;i++)
	{
		if(family[i].checked)
		{
			ansInput+=family[i].value+" ";
		}
	}
	ansInput+="\n";
	ansInput+="个人习惯:";
	var habit = document.getElementsByName("habit");
	for(var i=0;i<habit.length;i++)
	{
		if(habit[i].checked)
		{
			ansInput+=habit[i].value+" ";
		}
	}
	ansInput+="\n";
	ansInput+="额外的描述:";
	$(".uploadother").each(function(){
		ansInput+=$(this).val()+" ";
	});
	ansInput+=" ";
	patient.history = ansInput;
	patient.departId = departId;
	if(patient.departId<0||patient.departId==null||patient.departId==""||patient.departId==undefined)
		checked=false;
	console.log(patient);
	if(checked)
	{
		$.ajax({
	        type: "POST",
	        url: "/hospital/PreSepOrderDeal",
	        data : "patient="+JSON.stringify(patient),    
	        success: function (data) {
	    	if(data=="1")
	    	{
	    		alert("挂号成功!");
	    	    window.location.href='../wlzj2/index.jsp';
	    	}
	    	else
	    		alert("挂号失败!");
	        }
	    });
	}
	else
	{
		alert("挂号失败!");
	}
	
});
time=-1;
function morningClick(valid)
{
	if(valid)
	{
		$("#morningClick").addClass("pwchecked");
		$("#aftClick").removeClass("pwchecked");
		time=0;
	}
}
function aftClick(valid)
{
	if(valid)
	{
		if(valid)
		{
			$("#morningClick").removeClass("pwschecked");
			$("#aftClick").addClass("pwchecked");
			time=0;
		}
	}
}
var dataObj;
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
function addPeople (){
	var text = $(this).html().toString();
	$("#patientName").val(text);
	$.ajax({
        type: "POST",
        url: "/hospital/ContactReadID",
        data:"patiantname="+text,
        success: function (data) {
        	console.log(data);
        	var dataObj = eval("("+data+")");
        	if(text.indexOf("本人")>=0)
    		{
        		$("#patientName").val(dataObj.name);
                $('#idCard').val(dataObj.id);
    		}
        	else
        	{
        		$('#idCard').val(dataObj.id);
        	}		
        }

    });
}
PageAddContact();


