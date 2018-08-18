<?php
	require_once '../../include/common.inc.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>砸金蛋</title>
	<meta http-equiv="X-UA-Compatible" content="edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/main_response.css">
</head>
<body>
	<div class="loadingDiv" id="loadingDiv">
		<p class="wiatTitle">请稍等...</p>
		
	</div>
	<div class="goldContent">
		<div class="goldEggsDiv">
			<p class="tishiChouJiang">admin你好!点击金蛋抽奖</p>
			<div class="list_EggsDiv"  id="carousel">
				<div>
					<ul class="jinDanUl" id="jinDanUl1">
						<li><img src="images/egg.png" alt="egg1" title="快来砸我呀！"/></li>
						<li><img src="images/egg.png" alt="egg2" title="快来砸我呀！"/></li>
						<li><img src="images/egg.png" alt="egg3" title="快来砸我呀！"/></li>
					</ul>	
				</div>
	
				<div>
					<ul class="jinDanUl1" id="jinDanUl2">
						<li><img src="images/egg.png" alt="egg4" title="快来砸我呀！"/></li>
						<li><img src="images/egg.png" alt="egg5" title="快来砸我呀！"/></li>
						<li><img src="images/egg.png" alt="egg6" title="快来砸我呀！"/></li>
					</ul>	
				</div>
			</div>
		</div>
		<div class="footerImg">
			<img src="images/bottom.png" alt="砸金蛋活动">
		</div>
	</div>
</body>
<script  data-main="js/do_main.js" src="js/jquery-2.1.0.min.js"></script>
<script src="js/require.js"></script>
<script>
	var code = '<?=$code?>';
    var rid = '<?=$rid?>';
	var dis = 0;
	function autoWinsList(){
		dis++;
		$('.all_List_Div').scrollTop(dis);
		if ($('.all_List_Div').scrollTop()>=$('.ul_List1').height()) {
			dis = 0;
			$('.all_List_Div').scrollTop(dis);
		}
	}
	var myset=setInterval("autoWinsList()",50);
</script>
</html>