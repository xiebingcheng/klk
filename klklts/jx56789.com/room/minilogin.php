<?php
require_once '../include/common.inc.php';

switch($act){
	case "login":
            $username= $request->post('username');
            $password= $request->post('password');
               $msg=user_login($username,$password,$rid);
		if($msg===true){
              if(!empty($remember)){     
              //如果用户选择了，记录登录状态就把用户名和密码加密放到cookie里面 
                $userstring=$username.'++'.$password; 
               $userstring= encrypt($userstring,$tserver_key);
        
             setcookie("userstring", $userstring, time()+3600*24*15,"/"); 
            
               }  
                    exit("<script>top.location.reload(true);location.href='/".$rid."';</script>");
                    
                }
		else{ echo "<script>top.layer.msg('{$msg}',{shift: 6});layer.msg('{$msg}',{shift: 6});</script>";}
	break;
	case "reg":
		$guestexp = '^Guest|'.$global['config']['regban']."Guest";
		if(preg_match("/\s+|{$guestexp}/is", $u))
		exit("<script>alert('用户名禁用！');</script>");
                if($u=="")
		exit("<script>alert('用户名不能为空！');</script>");
		
		$query=$db->query("select uid from {$tablepre}members where username='{$u}' limit 1");
		if($db->num_rows($query))exit("<script>alert('用户名已经被使用!换一个，如{$u}2015');location.href='?a=0&rid=$rid'</script>");
		    if ($captcha != $_SESSION["captcha"] || !isset($_SESSION["captcha"])) {
	exit("<script>alert('验证码错误');  location.href='minilogin.php?a=0&rid=$rid';</script>");
                    exit();}

         
		$regtime=gdate();
                $p2=$p;
		$p=md5($p);
		 $tuser=$_SESSION['guest_tuser'];
                $fuser=$_SESSION['guest_fuser'];
		if($global['config']['regaudit']=='1')$state='0';
		else $state='1';
		
		$db->query("insert into {$tablepre}members(username,password,sex,email,regdate,regip,lastvisit,lastactivity,gold,realname,gid,phone,fuser,tuser,state,roomid)	values('$u','$p','2','$email','$regtime','$onlineip','$regtime','$regtime','0','$qq','1','$phone','$fuser','$tuser','$state','$rid')");
		$uid=$db->insert_id();
		$db->query("replace into {$tablepre}memberfields (uid,nickname)	values('$uid','$u')	");
		
		$db->query("insert into  {$tablepre}msgs(rid,ugid,uid,uname,tuid,tname,mtime,ip,msg,type,roomid)
	values('{$rid}','1','{$uid}','{$u}','{$cfg[config][defvideo]}','{$cfg[config][defvideonick]}','".gdate()."','{$onlineip}','用户注册','2','$rid')
		");
		
		$msg=user_login($u,$p2,$rid);
		if($msg===true){exit("<script>top.location.reload(true);location.href='/".$rid."';</script>");}
		else{ echo "<script>top.layer.msg('注册成功！$msg',{shift: 6});layer.msg('注册成功！$msg',{shift: 6});</script>";}
	break;
	case "logout":
		unset($_SESSION['login_uid']);
		unset($_SESSION['login_user']);
		session_destroy(); 
                setcookie("userstring", '',time()-3600,"/");
              
		header("location:/room/m/?rid=".$rid);
	break;
}


?>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>
<?=$cfg['config']['title']?>
_登录注册</title>
<meta name="viewport" content="width=device-width,height=device-height,initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-capable" content="default">
<link href="images/minilogin.css" rel="stylesheet" type="text/css"  />
<script src="script/jquery.min.js"></script>
<script src="script/layer.js"></script>
</head>

<body>
<div class="login">
	<div class="header">
		<div class="switch" id="switch"><a class="switch_btn_focus" id="switch_qlogin" href="javascript:void(0);" tabindex="7">登&nbsp;录</a> <a class="switch_btn" id="switch_login" href="javascript:void(0);" tabindex="8">注&nbsp;册</a>
			<div class="switch_bottom" id="switch_bottom" style="position: absolute; width: 66px; left: 0px;"></div>
		</div>
	</div>
	<div class="web_qr_login" id="web_qr_login" style="display: block; height: 285px;"> 
		
		<!--登录-->
		<div class="web_login" id="web_login">
			<div class="login-box">
				<div class="login_form">
					<form action="?act=login&rid=<?=$rid?>" method="post" enctype="application/x-www-form-urlencoded"  name="loginform"  id="login_form" class="loginForm" onSubmit="return  validates()" >
						<div class="uinArea" id="uinArea"> <span class="input-tips username" for="username"><i></i></span>
							<div class="inputOuter" id="uArea">
								<input type="text" id="username" name="username" class="inputstyle" placeholder="用户名"/>
							</div>
						</div>
						<div class="pwdArea" id="pwdArea"> <span class="input-tips password" for="password"><i></i></span>
							<div class="inputOuter" id="pArea">
								<input type="password" id="password" name="password" class="inputstyle" placeholder="密码"/>
							</div>
						</div>
						<div class="control-password clearfix">
                                                    <label>
			      <input type="checkbox" name="remember" id="remember" value="1" >15天内自动登录
			    </label>
                                                    <a href="http://wpa.qq.com/msgrd?v=3&uin=12345678&site=qq&menu=yes" target="_blank" title="去找回密码">忘记密码?</a> 
                                                </div>
						<div  class="button-container">
							<input type="submit" value="立即登录"  class="button_blue button_login"/>
						</div>
					</form>
					<div class="ruc-third-way-login forgin-login" style="display:none"> <span>社区账号登录</span>
						<ul class="ruc-third-way-list clearfix">
							<li class="third-way-list-item icon-use-qq"> <a class="ruc-use-qq" data-type="4" target="_blank" href="/qqlogin/oauth/qq_login.php"></a> </li>
							<li class="third-way-list-item icon-use-wechat"> <a class="ruc-use-wechat" data-type="3"  href="/sociallogin.php?act=login&rid=<?=$rid?>"></a> </li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!--登录end--> 
	</div>
	
	<!--注册--> 
	<script>
          function get_yzm(){
		var static1 = $('#phone').val();
                var captcha = $('#captcha').val();
                var phone = /^1[0-9]{10}$/ ;
		
		if(!phone.test(static1)){
              $('#phone').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
              alert("请正确输入手机号码！");
               return false;
         }
		$.post("/apps/suiji_duanxin.php?action=call_yzm",{static:static1,captcha:captcha},function(data){
			if(data['status'] == 1){
				alert('手机验证码将以短信方式发送到您的手机，请注意接收！');
                verification_countdown--;
                u_class = '.getverify_sms';
                verification_settime(u_class);
                $(u_class).attr('disabled',true);
                               
				}else{ 
                                    if(data['status'] == -1){
                                      alert("图片验证码不正确");  
                                       $('#captcha').focus().css({
                          border: "1px solid red",
                          boxShadow: "0 0 2px red"
                      });
                                    }else{
					alert("发送失败！请联系管理员！");
                u_class = '.getverify_sms';
                verification_settime(u_class);}
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
    <div class="qlogin" id="qlogin" style="display: none;height: 435px; ">
        <div class="web_login">
            <div class="login_form">
                <form action="?act=reg&rid=<?= $rid ?>" method="post" enctype="application/x-www-form-urlencoded" id="regUser">
                    <div class="uinArea" id="uinArea"> <span class="input-tips username" for="user"><i></i></span>
                        <div class="inputOuter2" id="uArea">
                            <input type="text" id="u" name="u" class="inputstyle"   maxlength="16"  placeholder="用户名3-15位字符" onKeyUp="value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5]/g,'')">
                        </div>
                    </div>
                    <div class="regArea"> <span class="input-tips password" for="passwd"><i></i></span>
                        <div class="inputOuter2">
                            <input type="password" id="p" name="p" class="inputstyle" maxlength="16" placeholder="密码">
                        </div>
                    </div>
                    <div class="regArea" style="display:none">
                        <span class="input-tips qq" for="qq"><i></i></span> 
                        <div class="inputOuter2">

                            <input type="text" id="qq" name="qq" class="inputstyle" maxlength="12" placeholder="QQ号码">
                        </div>
                    </div>
                    <div class="regArea" style="display:none">
                        <span class="input-tips phone" for="phone"><i></i></span> 
                        <div class="inputOuter2">

                            <input type="text" id="phone" name="phone" class="inputstyle" maxlength="11" placeholder="手机">
                        </div>
                    </div>
                    <div class="regArea" > <span class="input-tips captcha" for="captcha"><i></i></span>
                        <div class="inputOuter2"> <img id="captcha-img" title="点击更新" src="/include/vcode.php" onClick="this.src='/include/vcode.php?'+Math.random()" alt="看不清，点击刷新">
                            <input  type="text" id="captcha" name="captcha" class="inputstyle" maxlength="4" placeholder="输入右侧数字">
                        </div>
                    </div>
                    <div id="userCue" class="common-error-msg-container"></div>
                    <div class="button-container">
                        <input type="button" id="reg" class="button_blue button_reg" value="免费注册"/>
                    </div>
                </form>
            </div>
        </div>
    </div>
	<!--注册end-->
	<div class="footer"> </div>
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
        $("#u").blur(function(){
              $.ajax({
                  type: "GET",
                   url: '../ajax.php?act=regcheck',
                  data: "username=" + $("#u").val() + '&temp=' + new Date(),
                    success: function(result) {
                      var v = JSON.parse(result);
                      result = v.code;
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
                          $("#userCue").html(" ");
                      }
                  
                  }
              });
          });

    var pwdmin = 6;

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
                        var u = /[=|+-]/ ;
                      if(u.test($('#u').val())){
                        $('#u').focus().css({
                                    border: "1px solid red",
                                    boxShadow: "0 0 2px red"
                            });
                            $('#userCue').html("<font color='red'><b>×用户名中不能包含+ | - =特殊字符</b></font>");
                            return false;  
                      }
                          if ($('#u').val().length < 3 || $('#u').val().length > 15) {

                            $('#u').focus().css({
                                    border: "1px solid red",
                                    boxShadow: "0 0 2px red"
                            });
                            $('#userCue').html("<font color='red'><b>×用户名为3-15字符</b></font>");
                            return false;

                    }
	
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
                          var sqq = /^[1-9]{1}[0-9]{4,9}$/;
                        if ($.trim($('#qq').val())!= "") {   
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
                        }
                var phone = /^1[3|5|7|8]\d{9}$/ ;
                if ($.trim($('#phone').val())!= "") {  
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
                            $('#userCue').html("<font ><b>正在注册中...</b></font>");
                    }
                }
             
	
                          if ($.trim($('#captcha').val()) == "") {
                            $('#captcha').focus().css({
                                    border: "1px solid red",
                                    boxShadow: "0 0 2px red"
                            });
                            $('#userCue').html("<font color='red'><b>×验证码不能为空</b></font>");
                            return false;
                    }else {
                            $('#captcha').css({
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
