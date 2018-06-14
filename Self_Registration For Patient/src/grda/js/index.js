$('.hnunit').click(function() {
	$(this).addClass('hnuclick').siblings().removeClass('hnuclick');
	var address = $(this).attr('address');
	$('#contentFrame').attr('src', address);
});

$('#caselogin1').click(function() {
    $('#loginDiv').attr('style', 'display: block');
});

$('.closeihconpop').click(function() {
    $('#loginDiv').attr('style', 'display: none');
});
