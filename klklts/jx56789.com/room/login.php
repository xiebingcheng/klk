<?php
require_once '../include/common.inc.php';

if($cfg['config']['state']=='1')header("location:/".$rid);

switch($act){
case "passwdcheck":
	if($pwd===$cfg['config']['pwd'])
	{
		$_SESSION['room_'.$cfg['config']['roomid']]=true;
		echo '1';exit;
	}
	else{
	echo '0';exit;}
        break;
        case "passwdtijiao":
	if($pwd===$cfg['config']['pwd'])
	{
		$_SESSION['room_'.$cfg['config']['roomid']]=true;
		header("location:/".$rid);
	}
	else{
            echo "<script>alert('密码错误');</script>";
           // header("location:/".$rid);
            
        }
        break;
}

?>
<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><?=$cfg['config']['title']?>_房间密码</title>
<style type="text/css">
    body {
    background-position: top center;
    background-repeat: no-repeat;
    background-color: #025470;
    background-size: auto contain;
    background-image: url(./images/19.jpg);
}
.input-group {
    margin-top: 220px;
}
</style>
<link href="./skins/qqxiaoyou/bootstrap.min.css" rel="stylesheet" type="text/css"  />
</head>
<body>


	<div class="container goin-room">
		<div class="row">
			<div class="col-sm-6 col-sm-offset-3 ">
				
				
				<form  action="?act=passwdtijiao&rid=<?=$rid?>" id="goin-form" method="post" class="form-signin form-horizontal">
					<div class="form-group">
						<div class="col-xs-12">
							<label for="name" class="sr-only">房间名</label> 
							<div class="input-group input-group-lg">
								<input type="text" class="form-control"  name="pwd"  id="pwd" value="" placeholder="请输入房间密码">
								<span class="input-group-btn">
									<button id="butpas" class="btn btn-default" type="button">进入房间</button>
								</span>
</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="./script/jquery.min.js"></script>
        <script src="./script/layer.js"></script>
	<script type="text/javascript">
            var rid=<?=$rid?>;
		$(function(){
			$('#butpas').click(function(){
				var pwd = $('#pwd').val();
				$.ajax({
			type:"POST",
                        url: '?act=passwdcheck',
			data: "pwd=" + pwd+'&rid=' + rid,
		        success: function(result) {
                          if(result==1){window.location.href='/'+rid;}else{layer.tips('密码错误', '#pwd', {tips: [1, '#000']});}
			

			}
		});
                            
			});
		});
	</script>


</body></html>
