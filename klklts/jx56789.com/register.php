<?php
require_once './include/common.inc.php';
$echo="";
switch($act){
case "reg":
        $guestexp = '^Guest|' . $cfg['config']['regban'] . "Guest";
        if (preg_match("/\s+|{$guestexp}/is", $u))
            exit("<script>alert('用户名禁用！');</script>");
        if ($u == "")
            exit("<script>alert('用户名不能为空！');</script>");
        $query = $db->query("select uid from {$tablepre}members where username='{$u}' limit 1");
        if ($db->num_rows($query))
            exit("<script>alert('用户名已经被使用!换一个，如{$u}2015');location.href='register.php?rid=$rid'</script>");
        $query = $db->query("select uid from {$tablepre}members where phone='{$phone}' limit 1");
        if ($db->num_rows($query))
            exit("<script>alert('手机号码已经被使用!请换一个手机号码');location.href='register.php?rid=$rid'</script>");
        $call_yzm = $_SESSION["call_yzm"];

        if ($yzm != $call_yzm || !isset($call_yzm)) {
            exit("<script>alert('验证码错误');  location.href='register.php?rid=$rid';</script>");
            exit();
        }
        if ($phone != $_SESSION["call_phone"] || !isset($_SESSION["call_phone"])) {
            exit("<script>alert('请输入接收验证码的手机号');  location.href='register.php?rid=$rid';</script>");
            exit();
        }
        $regtime=gdate();
		$p=md5($p);
		if(isset($_COOKIE['tg'])){
		$tuser=userinfo($_COOKIE['tg'],'{username}');}else{
                   $tuser='system'; 
                }
		if($global['config']['regaudit']=='1')$state='0';
		else $state='1';
		
		$db->query("insert into {$tablepre}members(username,password,sex,email,regdate,regip,lastvisit,lastactivity,gold,realname,gid,phone,tuser,state,roomid)	values('$u','$p','2','$email','$regtime','$onlineip','$regtime','$regtime','0','$qq','1','$phone','$tuser','$state','$rid')");
		$uid=$db->insert_id();
		$db->query("replace into {$tablepre}memberfields (uid,nickname)	values('$uid','$u')	");
		
		
		$db->query("insert into  {$tablepre}msgs(rid,ugid,uid,uname,tuid,tname,mtime,ip,msg,type,roomid)
	values('{$rid}','1','{$uid}','{$u}','{$cfg[config][defvideo]}','{$cfg[config][defvideonick]}','".gdate()."','{$onlineip}','用户注册','2','{$rid}')
		");
		
		$msg=user_login($u,$p2,$rid);
		if($msg===true){
			setcookie("username", $u, gdate()+315360000);
			header("location:/");
		}
		else{ $echo= "<script>layer.alert('注册成功！$msg',{ icon: 1});</script>";}
	break;
}
?>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>注册 <?=$cfg['config']['title']?></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no"/>
<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE" />
<link rel="shortcut icon" type="image/x-icon" href="<?=$cfg['config']['ico']?>" />
<meta content="<?=$cfg['config']['keyss']?>" name="keywords">
<meta content="<?=$cfg['config']['dc']?>" name="description">
<link href="images/base.css" rel="stylesheet" type="text/css"  />
<link href="images/login.css" rel="stylesheet" type="text/css"  />
<script src="room/script/jquery.min.js"></script>
<script src="room/script/layer.js"></script>
</head>

<body>
<div class="mainBg" >
<div class="logoBar w1000 m0 cf">
		<div class="logo fl">
			<a href="javascript:;"><img src='<?=$cfg['config']['logo']?>' border=0></a>
		</div>
		<p class="fr" style="height:50px;">
            
            <a href="javascript://"  class="regBtn trans03" style="margin-top:10px;background: #ee6229;color:#fff;" >客服中心</a>
            
		</p>
	</div>
    <form action="?act=reg&rid=<?=$rid?>" method="post" enctype="application/x-www-form-urlencoded" id="regUser" onsubmit="return reg()">
    <div class="loginBox f14">
		<div class="loginMain cf">
            
    <div class="loginLeft fl">
        <div class="loginTitle">
            <p class="userReg"></p>
        </div>
        
        <div class="loginForm">
            <div class="oneLine cf">
                <span class="itemName">用户名</span>
                <span class="star">*</span>
                <span>
                    <input name="u" type="text" maxlength="16" id="u" placeholder="3-15位字符"></span>
<span id="userCue"></span>
            </div>
                <div class="oneLine cf">
                <span class="itemName">密码</span>
                <span class="star">*</span>
                <span>
                    <input name="p" type="password" id="p" placeholder="6-15位，可包含字母、数字及特殊符号" value=""></span>
<span id="pwCue"></span>
            </div>
            <div class="oneLine cf">
                <span class="itemName">确认密码</span>
                <span class="star">*</span>
                <span>
                    <input name="p2" type="password" id="p2"></span>

            </div>
            <div id="MainContent_AccountMainContent_divMobile" class="oneLine cf">
				<span class="itemName">手机</span>
				<span class="star">*</span>
				<span><input name="phone" type="text" id="phone"></span>
                                 <span id="phoneCue"></span>
                             
			</div>
            <div class="oneLine cf">
                <span class="itemName">图形验证</span>
                <span class="star">*</span>
               
                <span>
                    <input class="captcha" name="captcha" type="text" maxlength="50" id="captcha" placeholder="输入右侧数字">
                </span>
             <img id="captcha-img" title="点击更新" src="/include/vcode.php" onclick="this.src='/include/vcode.php?'+Math.random()" alt="看不清，点击刷新">

            </div>
               <div class="oneLine cf">
                <span class="itemName">验证码</span>
                <span class="star">*</span>
               
                <span>
                    <input class="yzm" name="yzm" type="text" maxlength="50" id="yzm">
                </span>
                <input type="button" id="call_yzm" value="获取验证码" class="getcode text_input">
 <span id="yzmCue"></span>
            </div>
			<div id="MainContent_AccountMainContent_divQQ" class="oneLine cf">
				<span class="itemName">QQ</span>
				<span class="star">*</span>
				<span><input name="qq" type="text" id="qq" value=""></span>	
                                <span id="qqCue"></span>
			</div>
     
            
            <div class="oneLine cf">
                <span class="itemName"></span>
                <span class="star">&nbsp;</span>
                <div class="dib">
                    <p>
                     
                        	<input type="submit"  class="regBtn2 trans03" style="border:0px;height: 58px;width: 302px;cursor:pointer;" value="同意条款并注册" />
                    </p>
                  
                </div>
            </div>
        </div>
    </div>
    <div class="loginRight fl">
        <div class="loginTitle">
            <p class="toLogin"></p>
        </div>
        <a href="logging.php?rid=<?=$rid?>" class="loginBtn2 trans03 mt40">立即登录</a>

    </div>
    



		</div>
		<div class="loginBt"></div>
	</div>
    
    </form>
    <div class="footer w" >
    <div class="fLinks cf">
        <div class="w1000 m0">
            <span class="fl">友情链接：</span>
            <ul class="fl">
                <li><a href="http://www.95599.cn/cn/" target="_blank">农业银行</a></li>
                <li><a href="http://www.icbc.com.cn/icbc/" target="_blank">工商银行</a></li>
                <li><a href="http://www.ccb.com/" target="_blank">建设银行</a></li>
                <li><a href="http://www.boc.cn" target="_blank">中国银行</a></li>
            </ul>
        </div>
        <div>
            
            
        </div>
    </div>
    <div class="copy">
        <div id="MainContent_footer_divFooterLog" class="w1000 m0 cf">
            
<div class="fl">
				<p class="cfff">投资有风险，入市须谨慎</p>
				<p><span ><?=tohtml($cfg['config']['copyright'])?></span>   </p>
				<p>
                     </p>
			</div>
            <p id="MainContent_footer_pLogo4RJ" class="fr pt10">&nbsp;</p>
        </div>
    </div>
</div>
</div>

<script>
    function reg() {
                  var u = /[=|+-]/ ;
                  if(u.test($('#u').val())){
                    $('#u').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			$('#userCue').html("<font color='red'><b>×用户名中不能包含+ | - =特殊字符</b></font>");
			return false;  
                  }
		if ($.trim($('#u').val()) == "" || $('#u').val().length < 3 || $('#u').val().length > 15) {
			$('#u').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			$('#userCue').html("<font color='red'><b>×用户名为3-15字符</b></font>");
			return false;
		}else {
			$('#u').css({
				border: "1px solid #D7D7D7",
				boxShadow: "none"
                              
			});
                     $('#userCue').html("");
                }

		$.ajax({
			type: 'get',
			url: 'ajax.php?act=regcheck',
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
                                        $('#userCue').html("");
				}

			}
		});

          if ($('#p').val().length < 6) {
			$('#p').focus();
			$('#pwCue').html("<font color='red'><b>×密码不能小于" + 6 + "位</b></font>");
			return false;
		}
		if ($('#p2').val() != $('#p').val()) {
			$('#p2').focus();
			$('#pwCue').html("<font color='red'><b>×两次密码不一致！</b></font>");
			return false;
		}else {
			$('#p2').css({
				border: "1px solid #D7D7D7",
				boxShadow: "none"
                              
			});
                     $('#pwCue').html("");
                }
	        var phone = /^1[0-9]{10}$/ ;
                  if ($('#phone').val() == "" || !phone.test($('#phone').val())) {
			$('#phone').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			$('#phoneCue').html("<font color='red'><b>×手机号格式不正确</b></font>");
			return false;
		}else {
			$('#phone').css({
				border: "1px solid #D7D7D7",
				boxShadow: "none"
                              
			});
                     $('#phoneCue').html("");
                }
                if ($.trim($('#yzm').val()) == "") {
			$('#yzm').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			$('#yzmCue').html("<font color='red'><b>×请填写正确的验证码</b></font>");
			return false;
		}else {
			$('#yzm').css({
				border: "1px solid #D7D7D7",
				boxShadow: "none"
                              
			});
                     $('#yzmCue').html("");
                }
		var sqq = /^[1-9]{1}[0-9]{4,9}$/;
		if (!sqq.test($('#qq').val()) || $('#qq').val().length < 5 || $('#qq').val().length > 12) {
			$('#qq').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			$('#qqCue').html("<font color='red'><b>×QQ号码格式不正确</b></font>");
			return false;
		} else {
			$('#qq').css({
				border: "1px solid #D7D7D7",
				boxShadow: "none"
			});
		$('#qqCue').html("");	
		}
		
		return true;
	}
$("#call_yzm").click(function(){
		var static = $('#phone').val()
                 var captcha = $('#captcha').val();
		var phone = /^1[0-9]{10}$/ ;
		
		if(!phone.test(static)){
               alert("请正确输入手机号码！");
               return false;
         }
		$.post("/apps/suiji_duanxin.php?action=call_yzm",{static:static,captcha:captcha},function(data){
				if(data['status'] == 1){
				alert('手机验证码将以短信方式发送到您的手机，请注意接收！');
                                       verification_countdown--;
                u_class = '#call_yzm';
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
                    u_class = '#call_yzm';
                            verification_settime(u_class);}

					}
			},'json');
		});
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
<?=$echo?>
</body>
</html>
