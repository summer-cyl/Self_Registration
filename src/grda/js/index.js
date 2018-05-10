$('.hnunit').click(function() {
	$(this).addClass('hnuclick').siblings().removeClass('hnuclick');
	var address = $(this).attr('address');
	$('#contentFrame').attr('src', address);
});