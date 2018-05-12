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

$('.myyy').click(function() {
    window.location.href = "../zjyy2/index.html";
});



