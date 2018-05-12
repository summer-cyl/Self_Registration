$(document).ready(function() {
	var value;

	$(".pplnul").click(function(){
		$(".pplnul").removeClass("pplnulclick");
		$(this).addClass("pplnulclick");
		value = String($(this).find('span').attr("class"));
		$("#rightFrame").attr("src", $(this).attr("href"));

		$("#rightFrame").on('load', function() {
		    $(this).height($(this).contents().find("body").height());
		});	

	});


	$(".pplnul").mouseover(function(){
		$(this).addClass("pplnulclick");
	});

	$(".pplnul").mouseleave(function(event) {
		var val = String($(this).find('span').attr("class"));
		if(val != value){
			$(this).removeClass("pplnulclick");
		}
		
	});

});

