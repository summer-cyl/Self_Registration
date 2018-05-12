var aa=new zturn({
	id:"zturn",
	opacity:0.9,
	width:400,
	Awidth:1024,
	scale:0.7,
	auto:true,//是否轮播 默认5000
	turning:2000//轮播时长
})
var ab=new zturn({
	id:"zturn2",
	opacity:0.8,
	width:400,
	Awidth:1024,
	scale:0.8,
	auto:true
})

$('.poster-list li').click(function() {
	var scale = "matrix(1, 0, 0, 1, 0, 0)";
	if($(this).css('transform') == scale) {
		var href = $(this).attr('href');
		if(href != "")
			window.open(href);
	}
});