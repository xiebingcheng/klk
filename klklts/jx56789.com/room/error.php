<?php
require_once '../include/common.inc.php';
if($type=='OtherLogin'){
    unset($_SESSION['login_uid']);
    unset($_SESSION['login_user']);
     session_destroy(); 
}
?>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>提示</title>
</head>

<body>
<style>
        body {
		margin: 0;
}
	#main {
	    background: #F6FEFF url(images/room_bg5.jpg) no-repeat;
	    background-size: cover;
	}
*{font-family:'Microsoft YaHei UI', 'Microsoft YaHei', SimSun, 'Segoe UI', Tahoma, Helvetica, Sans-Serif;}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
	<div id="main">
		<div style="color:#F00; font-size:35px; padding-top:150px; margin-bottom:20px; text-align:center">提 示</div>
<div style="text-align:center; line-height:20px;">
			<span  style="display:block; font-size:20px; color:#FFF;  margin:10px auto; width:100%; white-space:200px; line-height:40px"><?=addslashes($_GET['msg']);?></span>
<a href="../<?=$rid?>" style="display:inline-block; width:60px; margin:10px; padding:5px; background:#f46b0a;text-decoration: none; color:#FFF;border-radius: 4px;font-size: 14px;">返回</a>
</div>
	</div>
	<script type="text/javascript">
		var ch = window.innerHeight;
		var el = document.getElementById("main");
		el.style.height = ch + 'px';
	</script>
</body>
</html>
