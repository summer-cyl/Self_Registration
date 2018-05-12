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
    window.location.href = "../zjyy/index.html";
});
