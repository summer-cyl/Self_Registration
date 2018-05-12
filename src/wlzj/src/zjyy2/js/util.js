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
	/**
	 * 验证码
	 * 
	 * @param codeId 验证码输入框id
	 * @param len 验证码长度
	 */
	$.fn.codeImage = function(codeId, len) {
		var img = $(this);
		img.click(function() {
			update();
		});
		img.css('cursor', 'pointer');
		img.attr('title', '看不清，换一张').attr('alt', '看不清，换一张');
		update();
		function update() {
			img.attr('src', '/zyyy/verifyCode.htm?len=' + len + '&amp;seed='+new Date().getTime());
			$('#' + codeId).val('');
		}
		return img;
	};
})(jQuery);