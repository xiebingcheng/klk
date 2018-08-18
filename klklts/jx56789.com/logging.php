<?php
require_once './include/common.inc.php';
$echo="";
switch($act){
	case "login":
            $username= $request->post('username');
            $password= $request->post('password');
		$msg=user_login($username,$password,$rid);
		if($msg===true){
			setcookie("username", $username, gdate()+315360000);
			header("location:/".$rid);
		}
		else{ $echo ="<script>layer.msg('{$msg}',{shift: 6});</script>";}
	break;
        case "phonelogin":
		$msg=phone_login($phone,$yzm);
		if($msg===true){
			
			header("location:/");
		}
		else{exit("<script>alert('手机号或验证码不正确');location.href='logging.php?a=0';</script>");}
	break;
	case "logout":
		unset($_SESSION['login_uid']);
		unset($_SESSION['login_user']);
                setcookie("userstring", '',time()-3600,"/");
		session_destroy(); 
		header("location:/".$rid);
	break;
}
?>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>登录 <?=$cfg['config']['title']?></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no"/>
<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE" />
<link rel="shortcut icon" type="image/x-icon" href="<?=$cfg['config']['ico']?>" />
<meta content="<?=$cfg['config']['keyss']?>" name="keywords">
<meta content="<?=$cfg['config']['dc']?>" name="description">
<link href="images/base.css" rel="stylesheet" type="text/css"  />
<link href="images/login.css" rel="stylesheet" type="text/css"  />
<script src="room/script/jquery.min.js"></script>
<script src="room/script/layer.js"></script>
<script src="room/script/device.min.js"></script>
</head>

<body>
<script>if (device.mobile()){window.location = './room/minilogin.php?rid=<?=$rid?>';}</script>
<div class="mainBg">
<div class="logoBar w1000 m0 cf">
		<div class="logo fl">
			<a href="javascript:;"><img src='<?=$cfg['config']['logo']?>' border=0></a>
		</div>
		<p class="fr" style="height:50px;">
            
            <a href="javascript://"  class="regBtn trans03" style="margin-top:10px;background: #ee6229;color:#fff;" >客服中心</a>
            
		</p>
	</div>
    <div class="loginBox f14">
		<div class="loginMain cf">
            
    <div id="user_login" class="loginLeft fl h330">
        <div class="loginTitle">
            <p class="userLogin"></p>
        </div>
        <form action="?act=login&rid=<?=$rid?>" method="post" enctype="application/x-www-form-urlencoded"  name="loginform"  id="login_form" class="loginForm" onsubmit="return  validates()" >
        <div class="loginForm">
            <div class="oneLine cf">
                <span class="itemName">用户名</span>
                <span class="star">&nbsp;</span>
                <span>
                    <input name="username" id="username" type="text" value="<?=$_COOKIE['username']?>"></span>
                <span class="tishi" style="display: none"><i class="dui"></i></span>
            </div>
            <div class="oneLine cf">
                <span class="itemName">密码</span>
                <span class="star">&nbsp;</span>
                <span>
                    <input name="password" type="password" id="password" ></span>
                <span class="tishi" style="display: none"><i class="cuo">密码错误</i></span>
            </div>
            
            
            <div class="oneLine cf">
                <span class="itemName">&nbsp;</span>
                <span class="star">&nbsp;</span>
                <div class="ie7LoginWidth dib cf">
                    <p class="pr">
                        <button id="lnkLogin" class="loginBtn trans03" style="border:0px;" type="submit">登录</button>
                        <a  style="display:none;" class="tiyan f14" href="/<?=$rid?>">游客体验</a>
                    </p>
                    <p class="pt20 cf w">
                        <span class="fl"><a onclick="layer.msg('忘记密码，请联系客服！',{shift: 6});" class="forgot">忘记密码？</a></span>
                        <span class="fr"></span>
                    </p>
                </div>
            </div>
        </div>
        </form>
        
    </div>
    <div class="loginRight fl">
        <div class="loginTitle">
            <p class="toReg"></p>
        </div>
        <a href="register.php?rid=<?=$rid?>" class="regBtn mt40 trans03">立即注册</a>
        <!--  <div id="p_regBtn" class="regBtn mt40 trans03" style="display:none;">免注册登录</div>
   
        <p class="c999 pt30 f12">使用社交账号登录</p>
        <p>
           
              <a  href="qqlogin/oauth/qq_login.php" ><img src="http://qzonestyle.gtimg.cn/qzone/vas/opensns/res/img/Connect_logo_3.png"></a>
        </p>
       
		-->
    </div>


		</div>
		<div class="loginBt"></div>
	</div>
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

<?=$echo?>
<script type="text/javascript">
    $('#p_regBtn').on('click',function(){
          $('#user_login').css('display','none');
		$('#phone_login').css('display','block');
	});
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
  function validates2()
  {
   var phone = $.trim($("#phone").val());
   var yzm = $.trim($("#yzm").val());
      if(phone==''){
         layer.msg('手机号不能为空！',{shift: 6});
            $("#phone").focus();
            return false;
       }
        if(yzm==''){
         layer.msg('验证码不能为空！',{shift: 6});
            $("#yzm").focus();
            return false;
       }
       return true;
  }
    $("#call_yzm").click(function(){
		var static = $('#phone').val()
		var phone = /^1[0-9]{10}$/ ;
		
		if(!phone.test(static)){
               alert("请正确输入手机号码！");
               return false;
         }
		$.post("/apps/suiji_duanxin.php?action=call_yzm",{static:static},function(data){
				if(data['status'] == 1){
				alert('手机验证码将以短信方式发送到您的手机，请注意接收！');
                               verification_countdown--;
                u_class = '#call_yzm';
                verification_settime(u_class);
                $(u_class).attr('disabled',true);
				}else{
					alert("发送失败！");
                                         u_class = '#call_yzm';
                verification_settime(u_class);
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
                if(getParam("a")=='0')
		{
			$('#p_regBtn').trigger('click');
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
</script>
</body>
</html>
