(function($){
	$.extend({
		pagebarArea:function(container, f){
			$_links = $('#pagebar a');
			$_links.each(function() {
				var _link = $(this);
				var url = _link.attr('href');
				_link.click(function(event) {
					$_links.removeAttr('id');
					_link.attr('id', 'currentPage');
					event.preventDefault();//unable a's default action
					container.children().remove();
					container.loadData(window.encodeURI(url) + "&seed=" + new Date().getTime());
					if($.isFunction(f)) f.call($(this));
				});
			});
		},
		pagebarButton:function(button) {
			var url = button.val();
			button.bind('click', function(){
				var pageNo = $('#pagebar #pageNo');
				if(!pageNo.isNumber())
				{   
					alert('请输入正确的数字！');
					pageNo.val(''); 
					pageNo.focus(); 
					return; 
				}
				window.location.href = url + '&pageNo=' + pageNo.val();
			});		
		},
		
		pabebarButtonLoad:function(b,container, f) {
			var $_links = $('#pagebar button');
			$_links.bind('click', function() {
				var pageNo = $('#pagebar #pageNo');
				if(!pageNo.isNumber())
				{   
					alert('请输入正确的数字！');
					pageNo.val(''); 
					pageNo.focus(); 
					return; 
				}
				var url = $_links.val() + '&pageNo=' + pageNo.val();
				if(b == '0') {
					window.location.href = url + '&pageNo=' + pageNo.val();
				}
				else {
					container.children().remove();
					container.loadData(url + '&pageNo=' + pageNo.val());
				}
			});
		}
	});
	
})(jQuery);