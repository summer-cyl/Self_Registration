(function(){
	
	// 修复ie8不支持trim()方法的问题
	String.prototype.trim = function ()  
	{  
	    return this.replace(/(^\s*)|(\s*$)/g, "");  
	}  
	String.prototype.ltrim = function ()  
	{  
	    return this.replace(/(^\s*)/g, "");  
	}  
	String.prototype.rtrim = function ()  
	{  
	    return this.replace(/(\s*$)/g, "");  
	}  
	//end

	var navHover = function(){
		var subtop = $('.j-subtop'), subbottom = $('.j-subnav'),subtopA = $('.j-subtop a'),crt,subshow;

		$('#J_Nav li').mouseenter(function(){
			if(!$(this).hasClass('j-crt')){
				$(this).addClass('hover');
			}
		});
		$('#J_Nav li').mouseleave(function(){
			$(this).removeClass('hover');
		});

		function setCurrentMenu(){
			subtopA.each(function(){
				if($(this).hasClass('j-crt')){
					crt = $(this).parent().attr('tab');
				}
			})
		}

		setCurrentMenu();

		function showSubmenu(classname){
			subbottom.each(function(){
				if($(this).hasClass(classname)){
					$(this).show();
				}else{
					$(this).hide();
				}
			});
		}
		
		function hideSubmenu(){
			subbottom.each(function(){
				if($(this).hasClass(crt)){
					$(this).show();
				}else{
					$(this).hide();
				}
			});
		}

		subtop.mouseenter(function(e){
			
			if($(this).hasClass('shouye')){
				$('#J_SubNav').addClass('m-subnav-w');
			}else{
				$('#J_SubNav').removeClass('m-subnav-w');
			}
			if($('#J_SubNav').css('display') === 'none'){
				subshow = true;
				$('#J_SubNav').show();
				$('#innerid').slideDown(500);
			}
			var name = $(this).attr('tab');
			showSubmenu(name);
		});
		
		$('#J_Header').mouseleave(function(){
			hideSubmenu();
			$('#J_SubNav').removeClass('m-subnav-w');
			if(subshow){
				$('#J_SubNav').hide();
				$('#innerid').slideUp(50);
			}
		});
		
	};
	
	$().ready(function(){
		navHover();
	});
})();