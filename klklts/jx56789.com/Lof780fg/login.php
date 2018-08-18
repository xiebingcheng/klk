<?php
require_once '../include/common.inc.php';

if($act=="user_login"){ 
   $username= $request->post('username');
   $password= $request->post('password');
    webscan_StopAttack($username,$password,$postfilter);
 if (strtolower($vcode)!=strtolower($_SESSION['vcode'])){
exit("<script>alert('验证码不正确！');top.location.href='login.php';</script>");
		}
	$query=$db->query("select * from {$tablepre}members where username='$username' and password='".md5($password)."'");
	while($row=$db->fetch_row($query)){
		if( $row['uid']=='1' || stripos(auth_group($row['gid']),'adminlogin')!==false){
			$_SESSION['admincp']=$row['username'];
			$_SESSION['login_uid']=$row['uid'];
			$_SESSION['login_gid']=$row['gid'];
			$_SESSION['login_user']=$row['username'];
                        $_SESSION['login_roomid']=$row['roomid'];
			header("location:index.php");
		}else{
			exit("<script>alert('没有权限！');top.location.href='login.php';</script>");
		}
	}
	exit("<script>alert('用户名或密码错误！');top.location.href='login.php';</script>");
}
else if($act=="user_logout"){
	$_SESSION['admincp']="";
	unset($_SESSION['admincp']);
	session_destroy(); 
	header("location:?");
}

?>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><?=$cfg['config']['title']?></title>
<script src="assets/js/jquery-1.8.1.min.js"></script>
</head>
<!--[if lt IE 10]>
<script>
window.location.href="/room/ifIE.html";
</script>
<![endif]-->

<link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="assets/css/login.css" rel="stylesheet" type="text/css" />


<body class="center" onLoad="document.getElementById('id_login_form').username.focus()">
 <div aria-hidden="false" aria-labelledby="login-label" role="dialog" tabindex="-1" class="fade in" id="login-modal" style="display: block;outline: 0;">
<div class="modal-dialog">
<div class="modal-content">
<form  method="post" id="id_login_form" name="loginForm" action="?act=user_login" onsubmit="return loginin()">
<div class="modal-header">

 <h4 id="login-label" class="modal-title">直播室后台管理系统</h4>
</div>

<div class="modal-body">
<div class="input-group input-group-lg">
<input type="text" data-name="userName" placeholder="登录账号" class="form-control" name="username" id="login-username" >
<span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>					
</div>

<p id="login-username-error" class="error"></p>	


<div class="input-group input-group-lg">
<input type="password" data-name="password" placeholder="登录密码" class="form-control" name="password" id="login-password">
<span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
</div>

<p id="login-password-error" class="error"></p>

<div class="input-group input-group-lg">
<input type="text" data-name="captcha" placeholder="验证码" class="form-control" maxlength="4" name="vcode" id="login-captcha">
<a id="ref-img" href="javascript:void(0)" class="input-group-addon input-captcha" style="padding: 6px 16px;">
<img id="captcha-img" title="点击更新"  src="inc/vcode.php" onClick="this.src='inc/vcode.php?'+Math.random()" alt="看不清，点击刷新">
                                      
</a>
</div>	

<p id="login-captcha-error" class="error"></p>

<div class="checkbox">

</div>

                                <input type="submit" class="btn btn-primary btn-lg btn-block" data-loading-text="正在登入..." id="login-button" value="登录系统" />
</div>
</form>
</div>
</div>	
</div>

<div style="bottom:10px;"><table width="700" align="center" ><tr><td align="center" height="100" valign="bottom"><font style="font-family:Arial, Helvetica, sans-serif; font-size:12px; color:#B3B8C4;">*推荐使用ie9或以上版本ie浏览器或Chrome内核浏览器访问本系统</font></td></tr></table></div>
<script>
    function loginin() {

		if ($.trim($('#login-username').val()) == "" ) {
			$('#login-username').focus();
			$('#login-username-error').html("<font color='red'><b>×用户名不能为空</b></font>");
			return false;
		}
	if ($.trim($('#login-password').val()) == "" ) {
			$('#login-password').focus();
			$('#login-password-error').html("<font color='red'><b>×密码不能为空</b></font>");
			return false;
		}
	if ($.trim($('#login-captcha').val()) == "" ) {
			$('#login-captcha').focus();
			$('#login-captcha-error').html("<font color='red'><b>×验证码不能为空</b></font>");
			return false;
		}
		
		return true;
	}
        </script>
</body>
</html>
