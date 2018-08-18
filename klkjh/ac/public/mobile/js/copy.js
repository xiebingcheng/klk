$(function(){
	var qlink;
	var welink;
	$.ajax({
		type:"post",
		url:"/public/index.php/mobile/ajax/getWeixinQQ",
		dataType:"json",
		success:function(data){
			qlink = data.result.qq;
			qtext = qlink.substring(0,7)+'...';
			welink = data.result.weixin;
			wetext = welink.substring(0,7)+'...';
			$("#weicode").html(wetext);
			$("#qqcode").html(qtext);
			$('.noticwei').attr('data-clipboard-text',welink);
			$('.noticqq').attr('data-clipboard-text',qlink);
		}
	});
	var u = navigator.userAgent, app = navigator.appVersion;
	var isAndroid = u.indexOf('Android') > -1 || u.indexOf('Linux') > -1;
	var isIOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/);
	
	$('.noticqq').click(function(){
		$('.copy_q span').html('QQ');
		$('.copydiv').show();
		var qqurl;
		if (isAndroid) {
		   qqurl = 'mqqwpa://im/chat?chat_type=wpa&uin='+qlink+'&version=1&src_type=web';
		}
		if (isIOS) {
			qqurl = 'mqq://im/chat?chat_type=wpa&uin='+qlink+'&version=1&src_type=web';
		}
		$('.yes a').attr('href',qqurl);
		
	});	
	
	$('.noticwei').click(function(){		
		$('.copy_q span').html('微信');
		$('.copydiv').show();
		var weurl = 'weixin://';
		$('.yes a').attr('href',weurl);		
	});

	$('.no').click(function(){
		$('.copydiv').hide();
	});
	
	var clipboard = new ClipboardJS('.copyclip');
	
	clipboard.on('success', function(e) {
	    e.clearSelection();
	});
	
	clipboard.on('error', function(e) {
	});
});
