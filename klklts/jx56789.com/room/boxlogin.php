<?php
require_once '../include/common.inc.php';
switch($act){
	case "login":
		$msg=user_login($username,$password);
		if($msg===true){exit("<script>top.location.reload(true);location.href='./';</script>");}
		else{ echo "<script>top.layer.msg('{$msg}',{shift: 6});layer.msg('{$msg}',{shift: 6});</script>";}
	break;
	case "reg":
		$guestexp = '^Guest|'.$cfg['config']['regban']."Guest";
		if(preg_match("/\s+|{$guestexp}/is", $u))
		exit("<script>alert('用户名禁用！');</script>");
                if($u=="")
		exit("<script>alert('用户名不能为空！');</script>");
		
		$query=$db->query("select uid from {$tablepre}members where username='{$u}' limit 1");
		if($db->num_rows($query))exit("<script>alert('用户名已经被使用!换一个，如{$u}2015');location.href='?a=0'</script>");
				$query=$db->query("select uid from {$tablepre}members where phone='{$phone}' limit 1");
		if($db->num_rows($query))exit("<script>alert('手机号码已经被使用!请换一个手机号码');location.href='?a=0'</script>");

                $call_yzm = $_SESSION["call_yzm"];
                 if($yzm != $call_yzm || !isset($call_yzm)){
	exit("<script>alert('验证码错误');  location.href='minilogin.php?a=0';</script>");
	 exit();
}
   if ($phone != $_SESSION["call_phone"] || !isset($_SESSION["call_phone"])) {
            exit("<script>alert('请输入接收验证码的手机号');   location.href='minilogin.php?a=0';</script>");
            exit();
        }
		$regtime=gdate();
		$p=md5($p);
		if(isset($_COOKIE['tg'])){
		$tuser=userinfo($_COOKIE['tg'],'{username}');}else{
                   $tuser='system'; 
                }
                $fuser=$_SESSION['guest_fuser'];
		if($global['config']['regaudit']=='1')$state='0';
		else $state='1';
		
		$db->query("insert into {$tablepre}members(username,password,sex,email,regdate,regip,lastvisit,lastactivity,gold,realname,gid,phone,fuser,tuser,state)	values('$u','$p','2','$email','$regtime','$onlineip','$regtime','$regtime','0','$qq','1','$phone','$fuser','$tuser','$state')");
		$uid=$db->insert_id();
		$db->query("replace into {$tablepre}memberfields (uid,nickname)	values('$uid','$u')	");
		
		$db->query("insert into  {$tablepre}msgs(rid,ugid,uid,uname,tuid,tname,mtime,ip,msg,type)
	values('{$cfg[config][id]}','1','{$uid}','{$u}','{$cfg[config][defvideo]}','{$cfg[config][defvideonick]}','".gdate()."','{$onlineip}','用户注册','2')
		");
		
		$msg=user_login($u,$p2);
		if($msg===true){exit("<script>top.location.reload(true);location.href='./';</script>");}
		else{ echo "<script>top.layer.msg('注册成功！$msg',{shift: 6});layer.msg('注册成功！$msg',{shift: 6});</script>";}
	break;
	case "logout":
		unset($_SESSION['login_uid']);
		unset($_SESSION['login_user']);
		session_destroy(); 
		header("location:index.php");
	break;
}
?>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title><?=$cfg['config']['title']?> 迷你登录</title>
<meta name="viewport" content="width=device-width,height=device-height,initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-capable" content="default">
<link href="images/boxlogin.css" rel="stylesheet" type="text/css"  />
<script src="script/jquery.min.js"></script>
<script src="script/layer.js"></script>

</head>

<body>
<div class="login">
    
    <div class="header">
        <div class="switch" id="switch"><a class="switch_btn_focus" id="switch_qlogin" href="javascript:void(0);" tabindex="7">快速登录</a>
			<a class="switch_btn" id="switch_login" href="javascript:void(0);" tabindex="8">快速注册</a><div class="switch_bottom" id="switch_bottom" style="position: absolute; width: 66px; left: 0px;"></div>
        </div>
    </div>    
  
    
    <div class="web_qr_login" id="web_qr_login" style="display: block; height: 235px;">    

            <!--登录-->
            <div class="web_login" id="web_login">
               
               
               <div class="login-box">
    
            
			<div class="login_form">
				<form action="?act=login" method="post" enctype="application/x-www-form-urlencoded"  name="loginform"  id="login_form" class="loginForm" onsubmit="return  validates()" >
                <div class="uinArea" id="uinArea">
                <label class="input-tips" for="username">帐号：</label>
                <div class="inputOuter" id="uArea">
                    
                    <input type="text" id="username" name="username" class="inputstyle"/>
                </div>
                </div>
                <div class="pwdArea" id="pwdArea">
               <label class="input-tips" for="password">密码：</label> 
               <div class="inputOuter" id="pArea">
                    
                    <input type="password" id="password" name="password" class="inputstyle"/>
                </div>
                </div>
               
                <div style="padding-left:30px;margin-top:20px;"><input type="submit" value="登 录" style="width:150px;" class="button_blue"/><a onclick="layer.msg('忘记密码，请联系客服！',{shift: 6});" class="zcxy" target="_blank">忘记密码</a></div>
              </form>
           </div>
           
            	</div>
               
            </div>
            <!--登录end-->
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
					alert("发送失败！请正确填写手机号码！");
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
                  $(u_class).val(verification_countdown)
                  verification_countdown--;
                  verification_timeID = setTimeout(function() {
                      verification_settime(u_class)
                  },1000)
                  verification_timeID_array.push(verification_timeID)
              }
          }
    </script>
    <div class="qlogin" id="qlogin" style="display: none; ">
   
    <div class="web_login"> <form action="?act=reg" method="post" enctype="application/x-www-form-urlencoded" id="regUser">
        <ul class="reg_form" id="reg-ul">
        		<div id="userCue" class="cue">快速注册请注意格式</div>
                <li>
                	
                    <label for="user"  class="input-tips2">用户名：</label>
                    <div class="inputOuter2">
                        <input type="text" id="u" name="u" maxlength="16" class="inputstyle2" placeholder="3-15位字符"/>
                    </div>
                    
                </li>
                  <li>
                <label for="passwd" class="input-tips2">密码：</label>
                    <div class="inputOuter2">
                        <input type="password" id="p"  name="p" maxlength="16" class="inputstyle2"/>
                    </div>
                    
                </li>
                <li>
                <label for="passwd2" class="input-tips2">确认密码：</label>
                    <div class="inputOuter2">
                        <input type="password" id="p2" name="p2" maxlength="16" class="inputstyle2" />
                    </div>
                    
                </li>
                  <li>
                 <label for="qq" class="input-tips2">QQ：</label>
                    <div class="inputOuter2">
                       
                        <input type="text" id="qq" name="qq" maxlength="12" class="inputstyle2"/>
                    </div>
                   
                </li>
              
                   <li>
                 <label for="phone" class="input-tips2">手机：</label>
                    <div class="inputOuter2">
                      
                        <input type="text" id="phone" name="phone" maxlength="11" class="inputstyle2"/>
                    </div>
                   
                </li>
                    <li>
                 <label for="yzm" class="input-tips2">验证码：</label>
                    <div class="inputOuter3">
                        <input  type="button" onclick="get_yzm()" value="获取验证码" class="getcode text_input us_input getverify_sms " id="get_verification"> 
                        <input type="text" id="yzm" name="yzm" maxlength="30" class="inputstyle3" placeholder="手机验证码"/>
                    </div>
                   
                </li>
                
                
              
              
                <li>
                    <div class="inputArea">
                        <input type="button" id="reg"  style="margin-top:10px;margin-left:85px;" class="button_blue" value="免费注册"/>
                    </div>
                    
                </li><div class="cl"></div>
            </ul></form>
           
    
    </div>
   
    
    </div>
    <!--注册end-->
</div>
<script>
$(function(){
	
	$('#switch_qlogin').click(function(){
		$('#switch_login').removeClass("switch_btn_focus").addClass('switch_btn');
		$('#switch_qlogin').removeClass("switch_btn").addClass('switch_btn_focus');
		$('#switch_bottom').animate({left:'0px',width:'66px'});
		$('#qlogin').css('display','none');
		$('#web_qr_login').css('display','block');
		try{
		parent.layer.iframeAuto(parent.layer.getFrameIndex(window.name));
		}catch(e){}
		});
	$('#switch_login').click(function(){
		
		$('#switch_login').removeClass("switch_btn").addClass('switch_btn_focus');
		$('#switch_qlogin').removeClass("switch_btn_focus").addClass('switch_btn');
		$('#switch_bottom').animate({left:'152px',width:'66px'});
		
		$('#qlogin').css('display','block');
		$('#web_qr_login').css('display','none');
		try{
		parent.layer.iframeAuto(parent.layer.getFrameIndex(window.name));
		}catch(e){}
		});
		if(getParam("a")=='0')
		{
			$('#switch_login').trigger('click');
		}

	});
	
function logintab(){
	scrollTo(0);
	$('#switch_qlogin').removeClass("switch_btn_focus").addClass('switch_btn');
	$('#switch_login').removeClass("switch_btn").addClass('switch_btn_focus');
	$('#switch_bottom').animate({left:'152px',width:'66px'});
	$('#qlogin').css('display','none');
	$('#web_qr_login').css('display','block');
	
}


//根据参数名获得该参数 pname等于想要的参数名 
function getParam(pname) { 
    var params = location.search.substr(1); // 获取参数 平且去掉？ 
    var ArrParam = params.split('&'); 
    if (ArrParam.length == 1) { 
        //只有一个参数的情况 
        return params.split('=')[1]; 
    } 
    else { 
         //多个参数参数的情况 
        for (var i = 0; i < ArrParam.length; i++) { 
            if (ArrParam[i].split('=')[0] == pname) { 
                return ArrParam[i].split('=')[1]; 
            } 
        } 
    } 
}  
    function checkusername(username) {
        
        username = $.trim(username);
        
       
        if(username==''){
      
            layer.msg('用户名不能为空！',{shift: 6});
            $("#username").focus();
            return false;
            
        }
        return true;
    }
    function checkpassword(pw)
    {
        pw = $.trim(pw);
        
        if(pw==''){
            layer.msg('密码不能为空！',{shift: 6});
            $("#password").focus();
            return false;
            
        }
        return true;
        
	
    }
    function validates()
    {
      
        if(!checkusername($("#username").val()))return false;
        if(!checkpassword($("#password").val()))return false;
        
        
    }

var reMethod = "GET",
	pwdmin = 6;

$(document).ready(function() {


	$('#reg').click(function() {

		if ($.trim($('#u').val()) == "") {
			$('#u').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			$('#userCue').html("<font color='red'><b>×用户名不能为空</b></font>");
			return false;
		}



		if ($('#u').val().length < 3 || $('#u').val().length > 15) {

			$('#u').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			$('#userCue').html("<font color='red'><b>×用户名位3-15字符</b></font>");
			return false;

		}
		$.ajax({
			type: reMethod,
                        async: true,
			url: '../ajax.php?act=regcheck',
			data: "username=" + $("#u").val() + '&temp=' + new Date(),
			dataType: 'html',
			success: function(result) {

				if (result!='1') {
					$('#u').focus().css({
						border: "1px solid red",
						boxShadow: "0 0 2px red"
					});
					if(result=='-1')
					$("#userCue").html("<font color='red'><b>×用户名含关键字，不能使用！</b></font>");
					else if(result=='0')
					$("#userCue").html("<font color='red'><b>×用户名被占用！</b></font>");
					return false;
				} else {
					$('#u').css({
						border: "1px solid #D7D7D7",
						boxShadow: "none"
					});
				}

			}
		});
                  if ($('#p').val().length < pwdmin) {
			$('#p').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			$('#userCue').html("<font color='red'><b>×密码不能小于" + pwdmin + "位</b></font>");
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
			
		}
                   var sqq = /^[1-9]{1}[0-9]{4,9}$/;
		if (!sqq.test($('#qq').val()) || $('#qq').val().length < 5 || $('#qq').val().length > 12) {
			$('#qq').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			$('#userCue').html("<font color='red'><b>×QQ号码格式不正确</b></font>");
			return false;
		} else {
			$('#qq').css({
				border: "1px solid #D7D7D7",
				boxShadow: "none"
			});
			
		}
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
			$('#userCue').html("<font ><b>正在注册中...</b></font>");
		}
	
		

		$('#regUser').submit();
	});
	

});
</script>
</body>
</html>
