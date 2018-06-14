$('.item').hover(function() {
	$(this).children('.am').animate({left:'150px'});
	$(this).children('p').animate({top:'-110px'});
}, function() {
	$(this).children('.am').animate({left:'0px'});
	$(this).children('p').animate({top:'0px'});
});