/**
 * jquery扩写
 */

(function($){
	 $.extend({
		/**
		 * 处理翻页页面部分刷新问题
		 * container:重新导入页面时放入的对象
		 * f:点击处理
		 */
		pagebarArea2: function(container, f) {
			$_links = $('#pagebar a');
			$_links.each(function() {
				var _link = $(this);
				var url = _link.attr('href');
				//_link.attr('href', 'javascript:void(0)');//unable a's default action
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
		/**
		 * 从后台或者缓存读取当前城市代码
		 * f:function(cityName) {} 参数即为城市代码
		 */
		getCityCodeByIp: function(f) {
			var b = $('body');//store in body
			var cityCode = b.data('city_name');
			if(!cityCode) {
				if(!!Cookie) { //get from cookie
					var cookieObj = new Cookie(document, 'zwjk_cityName');
					var c = cookieObj.get();
					if(!!c) cityCode = c;
					f.call(f, cityCode);
				}
				if(!cityCode) {
					$.get("/ipAddress.jspx?seed="+new Date().getTime(), function(data) {
						b.data('city_name', data.cityCode);
						if($.isFunction(f)) f.call(f, data.cityCode);
					}, 'json');
				}
			} else {
				f.call(f, cityCode);
			};
		},
		/**
		 * get city name by city code
		 * 
		 * @param code
		 * @returns
		 */
		getNameByCode: function(code) {
			var def = '杭州';
			$('#city_list').find('[id^=city_list_]').each(function() {
				if($(this).attr('value') == code)
					def = $(this).text();
			});
			return def;
		},
		getUrlWithoutDomain: function() {
			return url.substring($.getUrlWithoutDomainAndParam());
		},
		getDomain: function() {
			var url = window.location.href;
			var temp = url.substring(0, url.indexOf('?') == -1 ? url.length : url.indexOf('?'));
			return temp.substring(0, temp.lastIndexOf('/') + 1);
		},
		getUrlWithoutDomainAndParam: function() {
			var url = window.location.href;
			var temp = url.substring(0, url.indexOf('?') == -1 ? url.length : url.indexOf('?'));
			return temp.substring(temp.lastIndexOf('/') + 1);
		},
		/**
		 * 第一个大写字母或者.号前的字母
		 * 
		 * @param str
		 * @returns
		 */
		firstIndexofUpperCase: function(str) {
			return str.search(/[A-Z]|\./);
		}
	 });
	 /**
	  * prevent cache, add login button
	  */
	 $.fn.loginBoxButton = function(url) {
		 var u = 'checkIsLogin.jspx';
		 var $this = $(this);
		 var $u = $this.attr('url');
		 u = !url? !$u? u: $u : url;
		 $.ajax({url: u,
			 cache: false,
			 dataType: 'json',
			 success: function(data) {
				 if(data.isLogin == 1)
					 return;
				 else {
					 var $loginA = $('<a id="to_login_div" name="to_login_div">登陆</a>');
					 $this.append($loginA);
					 $loginA.loginBox();
				 }
			 }
		 })
		 .fail(function() {
			 $(this).append('<div class="error">加载登陆失败，请重新刷新页面！</div>');
		 });
		 $(this).append();
	 };
	 /**
	  * 添加登录对话框到对应的元素上
	  */
	 $.fn.loginBox = function(opts) {
		 var defaultOpts = {
				 title: '登录',
				 event: 'click',
				 okBtnName: '登录',
				 showButton: false,
				 showCancel: false,
				 content: "/login.jspx?seed="+new Date().getTime(),
				 contentType: 'ajax',
				 focus: '#username'
			 };
		 var o = $.extend({}, defaultOpts, opts);
		 $.reloadAfterLogin = true;
		 if((typeof (options)).match('object|undefined') && opts)
			 $weeboxs.open(o.content, o);
		 $(this).bind(defaultOpts.event, function() {
			 $.weeboxs.open(o.content, o);
		 });
	 };
	 /**
	  * 添加到主页
	  */
	$.fn.addToHomePage = function(url) {
		var $u = $(this).attr('href');
		var u = url? url: $u && $u.substring(0, 'http://'.length)=='http://'? $u: $.getDomain();
		if(document.all) {
			document.body.style.behavior = 'url(#default#homepage)';
			document.body.setHomePage(u);
		}
		else if(window.sidebar) {
			if (window.netscape) {
				try {
					netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
				} catch(e) {
					alert("该操作被浏览器拒绝，请手动将本站地址（" + u + "）写入主页");
				}
				 var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
				 prefs.setCharPref('browser.startup.homepage', u);
			}
		}
	};
	$.fn.addToFavorites = function(title, url) {
		var $u = $(this).attr('href');
		var u = url? url: $u && $u.substring(0, 'http://'.length)=='http://'? $u: $.getDomain();
		var t = title || $(window.document).find('head title').text();
		try {
            window.external.addFavorite(u, t);
        }
        catch (e) {
            try {
                window.sidebar.addPanel(t, u, "");
            }
            catch (e) {
                alert("加入收藏失败,请手动添加.");
            }
        }
	};
	/**
	 * 从head中导入地区和城市列表
	 * clickF在点击时回调，其中的this为点击的具体城市(a元素)jquery包装对象
	 * loadF在load即加载完成后调用，其中的this为当前jquery对象的this
	 */
	$.fn.loadAreaFromHeader = function(clickF, loadF) {
		var $areaList = $('#city_list');
		var _li = '<li class="areaFromHeader_el"><a href="javascript:void(0)"></a></li>';//item string
		var _title = '<h2></h2>';//title string
		var $_container = $('<div id="areaFromHeader_container"></div>');
		var item_container = '<div class="areaFromHeader_container_item"></div>';
		$areaList.find('[id^=city_list_]').each(function() {
			var $area = $(this);
			var $item_container = $(item_container);
			var $_title = $(_title).text($area.find('[id^=list_title_]').text());
			$_ul = $('<ul></ul>');
			$item_container.append($_title).append($_ul);
			$area.find('li').each(function() {//add city to area
				$_li = $(_li);
				$_a = $_li.find('a').text($(this).text()).attr('value', $(this).attr('value'));
				$_ul.append($_li);
				if($.isFunction(clickF))
					$_a.bind('click', clickF);//click to find callback
			});
			$_container.append($item_container);
		});
		$(this).html($_container);
		if($.isFunction(loadF))
			loadF.call(this);
	};
	/**
	 * 导入
	 */
	$.fn.loadData = function(url, f){
		var jqueryDom = $(this);
		var url = !url?jqueryDom.attr("url"): url;
		jqueryDom.append("<div class='loading'>加载中...</div>");
		$.get(url, function(data) {
			jqueryDom.find(".loading").remove();
			jqueryDom.append(data);
			if($.isFunction(f)) f.call(f, data);
		});
		return jqueryDom;
	};
	
	$.fn.getFormDatas = function() {
		var $form = $(this);
		var formDatas = {};
		$form.find('input, textArea, radio, select').each(function() {
			var $item = $(this);
			if($item.attr('name'))
				eval('formDatas.' + $item.attr('name') + '="' + $item.val() + '"');
		});
		return formDatas;
	};
	
	$.fn.valLengthValid = function(length){
		length = !!length? length: 4;
		var reg = eval('/^.{' + length + ',}$/');
		var value = $(this).val();
		return reg.test(value);
	};
	//验证码
	$.fn.verifycode = function() {
		var reg = /^[0-9]{6}$/;
//		console.log(length+$(this).val()+reg.test($(this).val()));
		return reg.test($(this).val());
	};
	
	$.fn.hasValue = function(){
		return $(this).val();  
	};
	
	$.fn.isEmail = function(){
		var reg = /^[a-zA-Z0-9](([a-zA-Z0-9_\-\.]*[a-zA-Z0-9])*[@]([a-zA-Z0-9]([a-zA-Z0-9\-]*[a-zA-Z0-9])*[\.])+)([a-zA-Z]{2,5})$/;  
		return reg.test($(this).val());  
	};

	$.fn.isMobile = function(){
		var reg = /^\d{5,15}$/;  
		return reg.test($(this).val());  
	};

	$.fn.isZipcode = function(){
		var reg = /^\d{3,8}$/;  
		return reg.test($(this).val());  
	};
	
	$.fn.isNumber= function(){
		var reg = /^0*\d+$/;
		return reg.test($(this).val());
	};
	
	$.fn.isLoginName = function(){
		var reg = /^[a-zA-Z0-9](\w){4,18}[a-zA-Z0-9]$/;  
		return reg.test($(this).val());  
	};
	
	$.fn.isHdmm = function(){
		var reg = /^[a-zA-Z0-9](\w){4,18}[a-zA-Z0-9]$/;  
		return reg.test($(this).val());  
	};
	
	$.fn.isPassword = function(){
//		var reg = /^.{6,32}$/;  
		var reg = /^[a-zA-Z0-9](\w){4,18}[a-zA-Z0-9]$/; 
		return reg.test($(this).val());  
	};
	
	$.fn.isAge = function(){
		var reg = /^([1][0-3]|[1-9]{0,1})[0-9]$/;  
		return reg.test($(this).val());  
	};
	
	$.fn.isRealName = function(){
		var reg = /^([\u4e00-\u9fa5]+)[·]?[\u4e00-\u9fa5]+$/;  
		return reg.test($(this).val().trim());  
	};
	
	$.fn.isPhone = function(){
		//var reg = /^1(3|4|5|8)\d{9}$/;  
		var reg = /^1\d{10}$/;
		return reg.test($(this).val()); 
	};
	
	$.fn.isTel = function(){
		var reg = /^(\(\d{3,4}\)|\d{3,4}-|\s)?\d{8}$/;  
		return reg.test($(this).val()); 
	};
	
	$.fn.isBirth = function() {
		var reg = /^\d{8}$/;
		var str = $(this).val();
		if(!reg.test(str))
			return false;
		var y = parseInt(str.substring(0, 4), 10);
		var m = parseInt(str.substring(4, 6), 10);
		var d = parseInt(str.substring(6, 8), 10);
		var b = y % 4 == 0 && y % 100 != 0? true: false;//是否润年
		if(m > 12 || m < 1 || d < 1 || d > 31) return false;//月份在1～12间， 日期在1～31之间
		if((m < 7 && m % 2 == 0) || (m > 8 && m % 2 == 1)) {//小月
			if(m == 2 && b && d > 29) return false;//润年二月
			else if(m == 2 && !b && d > 28) return false;//非润年二月
			else if(m > 30) return false;//其他小月
		}
		var b = new Date(y + "/" + m + "/" + d);
		return b.getTime() < new Date().getTime();//今天之前
	};
	
	//身份证
	$.fn.isIDCard = function(){
		var v;
		//var Errors=new Array("验证通过!","身份证号码位数不对!","身份证号码出生日期超出范围或含有非法字符!","身份证号码校验错误!","身份证地区非法!");
		var area={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"};
		var idcard = $(this).val().trim().toUpperCase(),Y,JYM;
		var S,M;
		var idcard_array = new Array();
		idcard_array = idcard.split("");
		if(area[parseInt(idcard.substr(0,2))]==null) v= false;//alert( Errors[4]);
		switch(idcard.length){
			case 15:
			  if ((parseInt(idcard.substr(6,2))+1900) % 4 == 0 || ((parseInt(idcard.substr(6,2))+1900) % 100 == 0 && (parseInt(idcard.substr(6,2))+1900) % 4 == 0 )){
			    ereg = /^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$/;//测试出生日期的合法性
			  }
			  else{
			    ereg = /^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$/;//测试出生日期的合法性
			  }
			  if(ereg.test(idcard))
				  v= true;//alert( Errors[0]);
			  else
				  v= false;//alert( Errors[2]);
			break;
		  case 18:
		    if ( parseInt(idcard.substr(6,4)) % 4 == 0 || (parseInt(idcard.substr(6,4)) % 100 == 0 && parseInt(idcard.substr(6,4))%4 == 0 )){
//		      ereg = /^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$/;//闰年出生日期的合法性正则表达式
//		      ereg = /^[1-9][0-9]{5}(19|20)[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$/;
		      ereg = /^(\d{6})(\d{4})(\d{2})(\d{2})(\d{3})([0-9]|X)$/;
		    }
		    else{
//		    ereg = /^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$/;//平年出生日期的合法性正则表达式
//		   ereg = /^[1-9][0-9]{5}(19|20)[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2] [0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2] [0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$/;
		    ereg = /^(\d{6})(\d{4})(\d{2})(\d{2})(\d{3})([0-9]|X)$/;
		    }
		    if(ereg.test(idcard)){
		      S = (parseInt(idcard_array[0]) + parseInt(idcard_array[10])) * 7 + (parseInt(idcard_array[1]) + parseInt(idcard_array[11])) * 9 + (parseInt(idcard_array[2]) + parseInt(idcard_array[12])) * 10 + (parseInt(idcard_array[3]) + parseInt(idcard_array[13])) * 5 + (parseInt(idcard_array[4]) + parseInt(idcard_array[14])) * 8 + (parseInt(idcard_array[5]) + parseInt(idcard_array[15])) * 4 + (parseInt(idcard_array[6]) + parseInt(idcard_array[16])) * 2 + parseInt(idcard_array[7]) * 1 + parseInt(idcard_array[8]) * 6 + parseInt(idcard_array[9]) * 3 ;
		      Y = S % 11;
		      M = "F";
		      JYM = "10X98765432";
		     
		      M = JYM.substr(Y,1);
		      if(M.toLowerCase() == idcard_array[17].toLowerCase()){
		    	  v= true;//alert( Errors[0]);
		    	  }
		      else{
		    	  v= false;//alert( Errors[3]);
		    	  }
		    }
		    else{
		      v= false;//alert( Errors[2]);
		      }
		    break;
		  	default:
		    v = false;//alert( Errors[1]);
		    break;
		  }
		return v;  
	};
})(jQuery);