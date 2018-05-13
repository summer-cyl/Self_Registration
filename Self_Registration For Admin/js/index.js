$('.actions-btn li').click(function() {
	$(this).addClass('green-on').siblings().removeClass('green-on');
});

$('.edit').click(function() {
	$(this).parent().parent().siblings().find('input').removeAttr('disabled');
	$('#pbgl-table select').removeAttr('disabled');
});

$('.confirm').click(function() {
	$(this).parent().parent().siblings().find('input').attr('disabled', 'disabled');
	$('#pbgl-table select').attr('disabled', 'disabled');
});