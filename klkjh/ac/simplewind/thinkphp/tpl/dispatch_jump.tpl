{__NOLAYOUT__}
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" > 
<meta name="format-detection" content="telephone=no">
<title>跳转提示</title>
<link rel="stylesheet" href="/public/tips/css/bootstrap.min.css">
<link rel="stylesheet" href="/public/tips/css/style.css">
</head>
<body>
<div id="page-tips" class="wrap tips">
	<?php switch ($code) {?>
	<?php case 1:?>
	<img alt="成功" src="/public/tips/images/success.png" />
	<?php break;?>
	<?php case 0:?>
	<img alt="失败" src="/public/tips/images/fail.png" />
	<?php break;?>
	<?php } ?>
	
	<p class="msg"><?php echo(strip_tags($msg));?></p>	
	<p class="jump"> 页面自动 <a id="href" href="<?php echo($url);?>">跳转</a> 等待时间： <b id="wait"><?php echo($wait);?></b></p>
</div>
<script type="text/javascript">
(function(){
	var wait = document.getElementById('wait'),
	href = document.getElementById('href').href;
	var interval = setInterval(function(){
		var time = --wait.innerHTML;
		if(time <= 0) {
			location.href = href;
			clearInterval(interval);
		};
		}, 1000);          
})();
</script>
</body>
</html>