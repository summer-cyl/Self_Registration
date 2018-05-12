$(function(){
    $('.hnunit').hover(function() {
        $(this).css('background-color', '#2c7dc3');
    }, function() {
    	if(!$(this).hasClass('hnuclick')){
    		$(this).css('background-color', '#3692e2');
    	}
    });
});

function building(){
	alert("该功能正在建设中！");
}