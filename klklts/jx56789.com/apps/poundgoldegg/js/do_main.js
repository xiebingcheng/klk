require.config({
　　　　baseUrl: "js",
　　　　paths: {
			"jquery": "jquery-2.1.0.min",
			"alert": "alert",
			"layer": "/room/script/layer"
　　　　}
　　});

requirejs(['jquery','alert', 'layer'],
	function($,alert, layer){
	$(document).ready(function(){
		//加载完成之后关闭loading
		$('.loadingDiv').hide();

		//点击抽奖
		$('body').on('click','.list_EggsDiv ul li',function(){
			alert.clickJinDanView();   //砸蛋
		});

		//关闭抽奖结果
		$('body').on('click','.colseJiangPin',function(){
			$('.bg-mask').remove();
			$('.jiangPinResult').remove();
			$('body').css({"overflow":"visible"});
			parent.layer.closeAll();
		});
	});
});
