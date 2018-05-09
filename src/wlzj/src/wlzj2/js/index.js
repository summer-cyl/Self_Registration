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



















