<?php
require_once '../../include/common.inc.php';
?>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<title>抽奖</title>
<style>
* {
	margin: 0;
	padding: 0
}

body {
	font-family: "Microsoft Yahei"
}

.dowebok {
	width: 894px;
	height: 563px;
	margin: 0 auto;
	background-image: url(images/s3_bg.png)
}

.rotary {
	position: relative;
	float: left;
	width: 504px;
	height: 504px;
    margin: 24px 0 0 24px;
	/*background-image: url(images/g.png)*/
}

.hand {
	position: absolute;
	left: 144px;
	top: 144px;
	width: 216px;
	height: 216px;
	cursor: pointer
}

.list {
	float: right;
	width: 300px;
	margin-top: 85px;
	overflow: hidden
}

.dowebok strong {
	position: relative;
	top: 45px;
	
	height: 65px;
	line-height: 65px;
	font-size: 32px;
	color: #ffe63c
}

.list h4 {
	height: 45px;
	margin: 30px 0 10px;
	line-height: 45px;
	font-size: 24px;
	color: #fff
}

.list ul {
	line-height: 36px;
	list-style-type: none;
	font-size: 12px;
	color: #fff;
	overflow: hidden;
        height:276px;
}

.list span {
	display: inline-block;
	width: 94px
}

.phoneMobile {
	position: absolute;
	z-index: 9020;
	left: 45%;
	top: 45%;
	margin-top: -77px;
	margin-left: -203px;
	background-color: #fff;
	padding: 0 20px;
	border: 8px solid #fc5085
}

.phoneMobile h1 {
	text-align: center;
	margin: 18px 0;
	font-size: 16px;
	font-weight: 700
}

.registerNewconter {
	padding: 0 35px 0 0;
	margin-top: 26px;
	overflow: hidden;
	text-align: right;
	font-size: 12px
}

.registerNewconter input {
	width: 145px;
	height: 23px;
	border: 1px #fc5085 solid;
	padding: 2px 10px;
	color: #a0a0a0
}

.btn-send {
	background-color: #ebebeb;
	padding: 5px;
	text-decoration: none;
	border: 1px solid #CCC;
	font-size: 12px;
	margin-left: 10px
}

.registerNewconter {
	padding: 0 35px 0 0;
	margin-top: 26px;
	overflow: hidden;
	text-align: right;
	font-size: 12px
}

.registercode {
	text-align: left;
	width: 180px
}

.registerNewconter input#code {
	width: 90px
}

.buttonBlu {
	text-shadow: 0 -1px 0 rgba(0,0,0,.2);
	text-align: center;
	background: #1289cd;
	outline: 0;
	width: 90px;
	height: 30px;
	font-size: 14px;
	letter-spacing: 2px;
	margin-left: 150px;
	margin-top: 15px;
	margin-bottom: 15px;
	color: #fff;
	border: 0
}

.windowMessBtn1 {
	width: 25px;
	height: 25px;
	position: absolute;
	cursor: pointer;
	border-radius: 50%;
	border: 3px solid #fc5085;
	background: url(./images/messageBtn.png) no-repeat left -3px
}
.windowMessBtn2 {
        right: 79px;
    top: 51px;
	width: 25px;
	height: 25px;
	position: absolute;
	cursor: pointer;
	border-radius: 50%;

	background: url(./images/messageBtn.png) no-repeat left -3px
}
a:active,a:hover,a:link,a:visited {
	color: #333
}

input,textarea {
	outline: 0
}

</style>
</head>

<body>
    <div class="windowMessBtn2" onclick="parent.layer.close(parent.rotate);"></div>
<div class="phoneMobile" style="z-index: 9020; display: none;"><h1>请输入抽奖码~</h1><div class="registerNewconter"> 抽奖码：<input type="text" name="luckcode" id="luckcode" class="mobilemin" maxlength="20" placeholder="请输入抽奖码" ></div><button class="buttonBlu" id="reporting" onclick="rotateMobile()">开始抽奖</button><div class="windowMessBtn1" style="right:-15px;top:-15px"></div><div class="windowMessBtn1" style="right:-15px;top:-15px"></div><div class="windowMessBtn1" style="right:-15px;top:-15px"></div><div class="windowMessBtn1" style="right:-15px;top:-15px"></div></div>
<div class="dowebok">
	<div class="rotary">
		<canvas id="bg" height="500" width="500"></canvas>
		<img class="hand" src="images/z.png" alt="">
	</div>
    <strong>中奖用户名单</strong>
	<div class="list" id="scrollDiv">
		
		
		<ul>
                          <?php
                          $query = $db->query("select r.*,m.nickname from {$tablepre}rotate r,{$tablepre}memberfields m where r.uid=m.uid and r.jiangpin!='' and r.getmethod=1  and r.roomid='$rid' order by r.addtime DESC limit 0,20");

while($row=$db->fetch_row($query)){ 
    
	$list.="<li><span>{$row['nickname']}</span> <span>{$row['jiangpin']}</span></li>";
}
echo $list;
?>
		</ul>
	</div>
</div>

<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/jquery.rotate.min.js"></script>
<script src="js/jq_scroll.js" type="text/javascript"></script>
<script>
    var rid=<?=$rid?>;
	$(document).ready(function(){
	        $("#scrollDiv").Scroll({line:1,speed:500,timer:3000});
	});
	$(function(){
	    $(".windowMessBtn1").click(function () {
	  $('.phoneMobile').css('display','none');
	  });
		var $hand = $('.hand');

		$hand.click(function(){
	          
	            $('.phoneMobile').show();
		 });
	      
		
	});
    function hand_run(luckcode) {
        $.get("rotate.php?act=ismobile&luckcode="+luckcode+"&rid="+rid, function(data,status) {
			if(data=='noMobile'){
	            $('.phoneMobile').show();
				return false;
			}
	        data=parseInt(data);
			switch(data){
				case 1:
					rotateFunc(1,13,'恭喜你抽中了话费10元');
					break;
				case 2:
					rotateFunc(2,39,'未中奖,再接再厉');
					break;
				case 3:
					rotateFunc(3,64,'恭喜你抽中了赠金200');
					break;
				case 4:
					rotateFunc(4,90,'恭喜你抽中了赠金5000');
					break;
				case 5:
					rotateFunc(5,116,'恭喜你抽中了话费20元');
					break;
				case 6:
					rotateFunc(6,142,'未中奖,再接再厉');
					break;
				case 7:
					rotateFunc(7,167,'恭喜你抽中了赠金500');
					break;
				case 8:
					rotateFunc(8,193,'未中奖,再接再厉');
					break;
				case 9:
					rotateFunc(9,219,'恭喜你抽中了话费5元');
					break;
				case 10:
					rotateFunc(10,244,'未中奖,再接再厉');
					break;
				case 11:
					rotateFunc(10,244,'恭喜你抽中了赠金1000');
					break;
				case 12:
					rotateFunc(12,296,'恭喜你抽中了iPhone7一台');
					break;
	                        case 13:
					rotateFunc(13,321,'恭喜你抽中了iPad平板电脑');
					break;
				case 14:
					rotateFunc(14,347,'未中奖,再接再厉');
					break;
			}
        });
	}
    var $hand = $('.hand');
	var rotateFunc = function(awards,angle,text){
		$hand.stopRotate();
		$hand.rotate({
			angle: 0,
			duration: 5000,
			animateTo: angle + 1440,
			callback: function(){
                                alert(text);
			}
		});
	};
	function rotateSendMsg(e){
		var tel=$("#mobile");
		var v=tel.val();
		var isTelephone=/1[34758]{1}\d{9}$/.test(v);
		if(!v){
			alert("手机号不能为空");
			return false;
		}else if(!isTelephone){
			alert('手机号不正确');
			return false;	
		}

		$.post("/apps/suiji_duanxin2.php?action=call_yzm",{static:v},function(data){
						if(data['status'] == 1){
						timeCount=setInterval("waitRotateMsg()",1000);
						alert('发送成功');
		                               
						}else{
							alert("发送失败！请联系管理员！");
		                                 

							}
					},'json');
	}

	rotateWAIT=60;

	function waitRotateMsg(){

		$('.registerNewconter .btn-send').html(rotateWAIT+'秒后重新发送');
		$('.registerNewconter .btn-send').attr('onclick','');
		rotateWAIT--;
		if(rotateWAIT==0){
			clearInterval(timeCount);
			rotateWAIT=60;
			$('.registerNewconter .btn-send').html('获取短信验证码');
			$('.registerNewconter .btn-send').attr('onclick','rotateSendMsg(this)');
		}
	}

	function rotateMobile() {
		var luckcode=$("#luckcode").val();
		
		if(!luckcode){
			alert("抽奖码不能为空");
			return false;
		}
		$.ajax({
	         url: "rotate.php?act=addmobile",  
	         type: "POST",
	         data:{luckcode:luckcode,rid:rid},
	         //dataType: "json",
	         error: function(){  
	             alert('Error loading XML document');  
	         },  
	         success: function(data){ 
				if(data=='success'){
					$('.phoneMobile').css('display','none');
					hand_run(luckcode);
				}else if(data=='nohave'){
					alert("抽奖码不正确");
				}else if(data=='isuse'){
					alert("抽奖码已被使用");
				}
	         }
	     }); 
	}
	/*画转盘*/
	var fillStyle = ['rgb(119,201,249)','rgb(252,81,135)']
		,fillText = ['20元话费','未中奖','赠金500','未中将','5元话费','未中将','赠金1000','iphone7','ipad','未中将','10元话费','未中奖','赠金200', '赠金5000']
		,width = 500
		,height = 500
		,c_x = 250
		,c_y =250
		,radius = 250 // 圆盘半径
		,canvas = document.getElementById('bg');

	function drawCircle() {
		var deg = Math.PI/7;
		var startAngle = Math.PI/14;
		var endAngle = Math.PI * 3/14;
		canvas.height = height;
		canvas.width = width;
		var ctx=canvas.getContext('2d');
		for(var i=0;i<14;i++) {
			ctx.beginPath();
			if (i%2 == 0) {
				ctx.fillStyle = fillStyle[0];
			} else {
				ctx.fillStyle = fillStyle[1];
			}

			// 绘制扇形
			ctx.moveTo(c_x,c_y);
			ctx.arc(c_x,c_y,radius,startAngle,endAngle,false);
			ctx.fill();

			// 绘制扇形上的文字
			ctx.save(); //保存画布
			ctx.translate(250,250);
			ctx.rotate(endAngle); //旋转画布
			ctx.translate(-250,-250);
			ctx.font="18px Microsoft YaHei";
			ctx.fillStyle = '#fff';
			ctx.textAlign = "center";
			ctx.fillText(fillText[i], 430, 220);

			ctx.restore(); //恢复画布位置
			startAngle += deg;
			endAngle += deg;
		}
	}
	drawCircle();
</script>
</body>
</html>