$(".moreWin_btn").click(function () {
	$(".moreMessage").css("display", "flex");
});
$(".medicine_btn").click(function () {
	$(".medicine").css("display", "flex");
});
$(".moreWin-img").click(function() {
	$(".moreMessage").css("display", "none");
});
$(".medicine-img").click(function() {
	$(".medicine").css("display", "none");
});
var ind = 1;
$(".tpl-pagination li a").click(function() {
	var str = $(this).text();
	var temp_ind = 1;
	if(str == "«"){
		temp_ind = parseInt(ind) - 1;
	}
	else if(str == "»"){
		temp_ind = parseInt(ind) + 1;
	}
	else {
		temp_ind = str;
	}
	if(temp_ind == "1"){
		$(".tpl-pagination li").attr("class", "");
		$("#li_prev").attr("class", "am-disabled");
		// alert("1");
	}
	else if(temp_ind == "4"){
		// alert("4");
		$(".tpl-pagination li").attr("class", "");
		$("#li_next").attr("class", "am-disabled");
	}
	else if(temp_ind!= "0" && temp_ind !="5" ){
		$(".tpl-pagination li").attr("class", "");
	}
	else {
		return;
	}
	$(".tpl-pagination li a").each(function(){
		var str1 = $(this).text();
		if(str1 == temp_ind){
			$(this).parent().attr("class","am-active");
			return;
		}
	});
	ind = temp_ind;
});
$(".am-icon-search").click(function() {
	//搜索
	var str = $(".am-form-field").val();
	//打开具有关键词的条目的网页，样式与此相同
});