var mySwiper = new Swiper('.swiper-container', {
    pagination: '.swiper-pagination',
    nextButton: '.swiper-button-next',
    prevButton: '.swiper-button-prev',
    paginationClickable: true,
    spaceBetween: 30,
    centeredSlides: true,
    autoplay: 3000,
    autoplayDisableOnInteraction: true, 
    loop: true,
});
var departName;
var chooseDay;
var time;
var intro;
var isMorning=0;
$(".swiper-container").on("focusout", function(){
    setTimeout(function() {
        if($(this).find(":focus").length === 0){
            mySwiper.startAutoplay();
            console.log("focusout, startAutoplay");
        }
    }, 100);
});

$(document).on("touchmove", function(){
    mySwiper.startAutoplay();
    console.log("touchmove, startAutoplay");
});


$('.adddoctor').click(function() {
    if($(this).attr('v') == 0) {
        $('.doclistchoose').css('height', '24'+'px');
        $(this).attr('v', 1);
        $(this).text('展开');
        $(this).css('background', 'url(./image/opensearch.png) no-repeat 0 6px');
    }
    else if($(this).attr('v') == 1) {
        $('.doclistchoose').css('height', '150'+'px');
        $(this).attr('v', 0);
        $(this).text('收起');
        $(this).css('background', 'url(./image/colsesearch.png) no-repeat 0 6px');
    }
});

$('.dlclidet span').click(function() {
    $(this).addClass('dlcldc').siblings().removeClass('dlcldc');
    loadExperson();
    
});

$('.adddoctor2').click(function() {
    if($(this).attr('v') == 0) {
        $('.doclistchoose2').css('height', '24'+'px');
        $(this).attr('v', 1);
        $(this).text('展开');
        $(this).css('background', 'url(./image/opensearch.png) no-repeat 0 6px');
    }
    else if($(this).attr('v') == 1) {
        $('.doclistchoose2').css('height', '60'+'px');
        $(this).attr('v', 0);
        $(this).text('收起');
        $(this).css('background', 'url(./image/colsesearch.png) no-repeat 0 6px');
    }
});

var formTitle = "空白";
$('.zkyy').click(function() {
	formTitle=$('.zkyy').index(this);
    window.location.href = "../zkmz2/index.jsp?formTitle="+formTitle;
});
$('.myyy').click(function() {
    window.location.href = "../zjyy2/index.jsp?formTile";
});
$('.zxys').click(function() {
    window.location.href = "../zxys2/index.html";
});
$('#moreMY').click(function() {
    window.location.href = "../zjyy/index.html";
});
$('#moreZxys').click(function() {
    window.location.href = "../zxys/index.html";
});
function loadExperson()
{
	departName = $(".dlcldc").eq(0).text();
	chooseDay = $(".dlcldc").eq(1).text();
	time = $(".dlcldc").eq(2).text();
	isMorning=0;
	console.log(departName+" "+chooseDay+" "+time);
	if(time=="上午")
		isMorning=1;
	$.ajax({
        type: "POST",
        url: "/hospital/LoadExp",
        data : "departName="+departName+"&chooseDay="+chooseDay+"&isMorning="+isMorning,    
        success: function (data) {
      
    	data = eval("("+data+")");
    	$(".experlist .item").remove();
    	for(var i=0;i<data.length;i++)
		{
    		var text = "<div class='item'> <div class='docimg'> <div class='docimg'><img src='http://localhost:8080/hospital/Self_Registration/Self_Registration%20For%20Doctor/image/"+data[i].id+".jpg'>"
    		           +"<div class='docname'>"+data[i].name+"</div>"
    		           +"<div class='deptname' title='"+data[i].id+"'>"+data[i].departName+"</div>"
    		           +"<div class='docgoodin' title=''>"+data[i].intro+data[i].position+"</div>"
    		           +"<div class='orderdocbut myyy'>预约"+data[i].num+"</div>"
    				   +"</div>";
    		
    		$(".experlist").append(text);
    		$(".item").on("click", function () {
    			 departName=$(this).find(".deptname").text();
    			 intro = $(this).find(".docgoodin").text();
    			 name = $(this).find(".docname").text();
    			 id=$(this).find(".deptname").attr("title");
    			 window.location.href = "../zjyy2/index.html?departName="+departName+"&chooseDay="+chooseDay+"&isMorning="+isMorning+"&intro="+intro+"&name="+name+"&id="+id;
            });
    		
		}
        }
    });
	
}
loadExperson();
















