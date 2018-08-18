define(function (){
	var jiangPinResult = function(){
		var giftname = '';
	    $.ajax({
	        url: "/apps/poundgoldegg/poundgoldegg.php?act=getgift",  
	        type: "POST",
	        dataType: "json",
	        data:{luckcode: code,rid:rid},
	        error: function(error) {
	         	console.log(error);
	            alert('Error loading XML document');  
	         },  
	        success: function(data) {
	        	giftname = data.giftname;
				var str = '';
				str += '<div class="bg-mask"></div>';
				str +='<div class="jiangPinResult">';
				str +='<img class="gongxi" src="images/gx.png" alt="恭喜你" title="恭喜">';
				str +='<p>' + giftname + '</p>';
				str +='<img class="imgJiangPin" src="'+data.giftimg+'" alt="奖品" title="奖品">';
				str +='<img class="colseJiangPin" src="images/close.png" alt="关闭" title="关闭">';
				str +='</div>';

				$('body').css({'overflow':'hidden'});
				$('body').prepend(str);

				setTimeout(function(){
					$('.jiangPinResult').addClass('active');
				},200);
	        }
	    });
	}

	var clickJinDanView = function(){
		var str = '';
		str += '<div class="bg-mask"></div>';
		str +='<div class="chouJiang">';
		str +='<p class="chouJiangTishi">请稍等...</p>';
		str +='<img class="caiDai" src="images/caidai.png" alt="彩带">';
		str +='<img class="imgDan" src="images/egg.png" alt="砸蛋" title="砸蛋">';
		str +='<img class="imgChuiZi" src="images/chuizi.png" alt="锤子">';
		str +='</div>';

		$('body').css({'overflow':'hidden'});
		$('body').prepend(str);

		setTimeout(function(){
				$('.bg-mask').remove();
				$('.chouJiang').remove();
				jiangPinResult();
			},3500);
	}

	return{
		jiangPinResult:jiangPinResult, //显示奖品的弹窗
		clickJinDanView:clickJinDanView,    //显示敲击金蛋效果
	}
});