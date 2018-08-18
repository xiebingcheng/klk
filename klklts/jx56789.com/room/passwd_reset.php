<?php
require_once '../include/common.inc.php';
switch($act){
	
	case "resetpasswd":
     if ($phone != $_SESSION["call_phone"] || !isset($_SESSION["call_phone"])) {
            exit("<script>alert('请正确填写接收验证码的手机号');   location.href='passwd_reset.php';</script>");
            exit();
        }
        
           $call_yzm = $_SESSION["call_yzm"];
                 if($yzm != $call_yzm || !isset($call_yzm)){
	exit("<script>alert('验证码错误');  location.href='passwd_reset.php';</script>");}
	
        $query=$db->query("select uid from {$tablepre}members where phone='{$phone}' limit 1");
		if(!$db->num_rows($query))exit("<script>alert('该手机号暂未注册会员');  location.href='passwd_reset.php';</script>");
                if($p!=$p2)exit("<script>alert('两次密码输入不一致');  location.href='passwd_reset.php';</script>");
		
		$p=md5($p);
		$db->query("update {$tablepre}members set  password='".$p."' where phone='$phone'");
		
	 echo "<script>top.layer.alert('密码修改成功！', {title:'提示',shift: 1,icon: 1,time:3000});top.layer.closeAll('iframe');</script>";
         exit();
	break;
	

}

?>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>找回密码_<?=$cfg['config']['title']?></title>
<meta name="viewport" content="width=device-width,height=device-height,initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-capable" content="default">
<link href="images/passwd_reset.css" rel="stylesheet" type="text/css"  />
<script src="script/jquery.min.js"></script>
<script src="script/layer.js"></script>

</head>

<body>
<div class="login">
    
    <div class="header">
        <div class="switch" id="switch"><a class="switch_btn_focus" id="switch_qlogin" href="javascript:void(0);" tabindex="7">找回密码</a>
			<div class="switch_bottom" id="switch_bottom" style="position: absolute; width: 66px; left: 0px;"></div>
        </div>
    </div>    
  

  <!--注册-->
  <script>
          function get_yzm(){
		var static1 = $('#phone').val()
		var phone = /^1[0-9]{10}$/ ;
		
		if(!phone.test(static1)){
              $('#phone').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
              alert("请正确输入手机号码！");
               return false;
         }
		$.post("/apps/suiji_duanxin.php?action=call_yzm",{static:static1},function(data){
			if(data['status'] == 1){
				alert('手机验证码将以短信方式发送到您的手机，请注意接收！');
                verification_countdown--;
                u_class = '.getverify_sms';
                verification_settime(u_class);
                $(u_class).attr('disabled',true);
                               
				}else{
					alert("发送失败！请联系管理员！");
                u_class = '.getverify_sms';
                verification_settime(u_class);
					}
			},'json');
		}
          var verification_countdown=60;
          var verification_timeID;
          var verification_timeID_array = new Array();


          function verification_settime(u_class) {
              if (verification_countdown == 0) {
                  verification_countdown = 60;
                  $(u_class).removeAttr('disabled');
                  $(u_class).val('获取验证码');
                  for(i=0;i<verification_timeID_array.length;i++){
                      clearTimeout(verification_timeID_array[i]);
                  }
                  verification_timeID_array = new Array();

              } else if(verification_countdown == 60) {

              }else{
                  $(u_class).val(verification_countdown+'秒后重发')
                  verification_countdown--;
                  verification_timeID = setTimeout(function() {
                      verification_settime(u_class)
                  },1000)
                  verification_timeID_array.push(verification_timeID)
              }
          }
    </script>
    <div class="qlogin" id="qlogin" >
   
    <div class="web_login"> <form action="?act=resetpasswd" method="post" enctype="application/x-www-form-urlencoded" id="resetpasswd">
        <ul class="reg_form" id="reg-ul">
            <div id="userCue" class="cue"></div>
          <li>
                 <label for="phone" class="input-tips2">手机：</label>
                    <div class="inputOuter2">
                      
                        <input type="text" id="phone" name="phone" maxlength="11" class="inputstyle2" placeholder="请输入注册账户手机号"/>
                    </div>
                   
                </li>
                    <li>
                 <label for="yzm" class="input-tips2">验证码：</label>
                    <div class="inputOuter3">
                        <input  type="button" onclick="get_yzm()" value="获取验证码" class="getcode text_input us_input getverify_sms " id="get_verification"> 
                        <input type="text" id="yzm" name="yzm" maxlength="30" class="inputstyle3" placeholder="请输入验证码"/>
                    </div>
                   
                </li>
                
                  <li>
                <label for="passwd" class="input-tips2">重设密码：</label>
                    <div class="inputOuter2">
                        <input type="password" id="p"  name="p" maxlength="16" class="inputstyle2" placeholder="请设置密码"/>
                    </div>
                    
                </li>
                <li>
                <label for="passwd2" class="input-tips2">确认密码：</label>
                    <div class="inputOuter2">
                        <input type="password" id="p2" name="p2" maxlength="16" class="inputstyle2" placeholder="请确认密码" />
                    </div>
                    
                </li>
                
              
              
                <li>
                    <div class="inputArea">
                        <input type="button" id="reset"  style="margin-top:10px;margin-left:85px;" class="button_blue" value="确定"/>
                    </div>
                    
                </li><div class="cl"></div>
            </ul></form>
           
    
    </div>
   
    
    </div>
    <!--注册end-->
</div>
<script>
$(document).ready(function() {


	$('#reset').click(function() {
                  var phone = /^1[0-9]{10}$/ ;
                  if ($.trim($('#phone').val()) == "" || !phone.test($('#phone').val())) {
			$('#phone').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			$('#userCue').html("<font color='red'><b>×手机号格式不正确</b></font>");
			return false;
		}else {
			$('#phone').css({
				border: "1px solid #D7D7D7",
				boxShadow: "none"
			});
			
		}
             
                if ($.trim($('#yzm').val()) == "") {
			$('#yzm').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			$('#userCue').html("<font color='red'><b>×验证码不能为空</b></font>");
			return false;
		}else {
			$('#yzm').css({
				border: "1px solid #D7D7D7",
				boxShadow: "none"
			});
			
		}
	
                  if ($('#p').val().length < 6) {
			$('#p').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			$('#userCue').html("<font color='red'><b>×密码不能小于6位</b></font>");
			return false;
		}else {
			$('#p').css({
				border: "1px solid #D7D7D7",
				boxShadow: "none"
			});
			
		}
		if ($('#p2').val() != $('#p').val()) {
			$('#p2').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			$('#userCue').html("<font color='red'><b>×两次密码不一致！</b></font>");
			return false;
		}else {
			$('#p2').css({
				border: "1px solid #D7D7D7",
				boxShadow: "none"
			});
			$('#userCue').html("<font><b>×正在提交...</b></font>");
		}
              $('#resetpasswd').submit();
	});
	

});
</script>
</body>
</html>
