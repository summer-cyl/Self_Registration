$('.nav-item li').click(function() {
	var address = $(this).attr('address');
	$('#contentFrame').attr('src', address);
});