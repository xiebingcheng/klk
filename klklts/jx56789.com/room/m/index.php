<?php
require_once '../../include/common.inc.php';
//判断是否保存了密码,保存密码到cookie了，就自动登录
if(!isset($_SESSION['login_uid']) && !empty($_COOKIE["userstring"]) ){
$userstring= decrypt($_COOKIE["userstring"],$tserver_key); 
$saveuser=explode("++",$userstring);
$msg=user_login($saveuser['0'],$saveuser['1'],$rid);
}
if($cfg['config']['loginguest']=='0' && !isset($_SESSION['login_uid']) )header('location:../logging.php?rid='.$rid);
//房间状态
if($cfg['config']['state']=='2' and $_SESSION['room_'.$cfg['config']['roomid']]!=true){header("location:../login.php?rid=".$rid);exit();}
if($cfg['config']['state']=='0'){exit("<script>location.href='../error.php?rid=".$rid."&msg=系统处于关闭状态！请稍候……'</script>");exit();}
if($cfg['config']['state']=='3'){system_open_time($cfg['config']['sysstart'],$cfg['config']['sysend']);}
//游客登录
if(!isset($_SESSION['login_uid'])  &&  $cfg['config']['loginguest']=="1"){gusetLogin();}

//是否登录
if(!isset($_SESSION['login_uid'])){header("location:../../logging.php?rid=".$rid);exit();}

//用户信息
$uid=$_SESSION['login_uid'];
$db->query("update {$tablepre}members set regip='$onlineip' where uid='{$uid}'");
$userinfo=$db->fetch_row($db->query("select m.*,ms.* from {$tablepre}members m,{$tablepre}memberfields ms  where m.uid=ms.uid and m.uid='{$uid}'")); 
$_SESSION['login_gid']=$userinfo['gid'];
//游客
if($_SESSION['login_uid']==0){$userinfo['username']=$userinfo['nickname']=$_SESSION['login_nick'];$userinfo['sex']=$_SESSION['login_sex'];$userinfo['uid']=$_SESSION['login_guest_uid'];$userinfo['fuser']=$_SESSION['guest_fuser'];$userinfo['banspeak']=$_SESSION['guest_banspeak'];}

//黑名单
$query=$db->query("select * from {$tablepre}ban where (username='{$userinfo[username]}' or ip='{$onlineip}') and losttime>".gdate()." limit 1");
while($row=$db->fetch_row($query)){
	exit("<script>location.href='../error.php?msg=用户名或IP受限！过期时间".date("Y-m-d H:i:s",$row['losttime'])."'</script>");exit();
}

//聊天过滤词汇
$msg_unallowable=$msg_unallowable.$global['config']['msgban'];


//用户组
$query=$db->query("select * from {$tablepre}auth_group order by ov desc");
while($row=$db->fetch_row($query)){
	$groupli.="<div id='group_{$row[id]}'></div>";
	$grouparr.="grouparr['{$row[id]}']=".json_encode($row).";\n";
	$group["m".$row[id]]=$row;
}
//聊天历史记录
$query=$db->query("select c.*,m.touxiang from {$tablepre}chatlog c,{$tablepre}members m where c.uid=m.uid  and c.rid='".$rid."' and c.p='false' and c.state!='1' and c.type='0' order by c.id desc limit 0,30 ");

while($row=$db->fetch_row($query)){
     if(empty($row['touxiang'])){$row['touxiang']='/face/p1/null.jpg';}
	$row['msg']=html_entity_decode($row['msg']);
	$row['msg']=strip_tags($row['msg'],'<div><p><img><span><br>');
        $who=" notmine ";
        if($row['ugid']==2){$who=" manage";}else if($row['ugid']==3 || $row['ugid']==4){$who=" teacher";}
        if($row['tuid']=="Sendredbag"){$who=" redbag";}
        if($row['style']=="appsend"){$who=" appsend";}
	if($row['tuid']!="ALL" && $row['tuid']!="Sendredbag" ){ 
            if($row['tuid']=="hongbao"){
                $omsg=$row['msg'].$omsg;
                
            }else{
		$omsg="<div style='clear:both;'></div><div class='msg{$who}'  id='{$row[msgid]}'><div class='msg_head'><img src='".$row['touxiang']."' class='msg_group_ico' ></div><div class='msg_content'><div><font class='u'  >{$row[uname]}</font> &nbsp;&nbsp;  <font class='dui'>对</font> <font class='u' >{$row[tname]}</font> 说 <font class='date'>".date('H:i:s',$row[mtime])."</font></div><div class='layim_chatsay'><font>{$row[msg]}</font></div></div></div><div style='clear:both;'></div>".$omsg;
              }
	}
	else{
	  $first="<div style='clear:both;'></div><div class='msg{$who}' id='{$row[msgid]}'><div class='msg_head'><img src='".$row['touxiang']."' class='msg_group_ico' ></div><div class='msg_content'><div><font class='u' >{$row[uname]}</font>&nbsp;&nbsp; <font class='date'>".date('H:i:s',$row[mtime])."</font>";
    $deviceType = $row[device];
    $middle = '';
    if ($deviceType != null && $deviceType != '' && $deviceType != 'computer') {
      $transDeviceType = '安卓手机';
      if ($deviceType == 'ios') {
        $transDeviceType = '苹果手机';
      }
      $middle = '<img src="/images/ny_'.$deviceType.'_icon.png" title="'. $transDeviceType.'">';
}
    $omsg=$first.$middle."</div><div class='layim_chatsay'><font>{$row[msg]}</font></div></div></div><div style='clear:both;'></div>".$omsg;
  }
}
$omsg=$omsg.'<li class="history-hr-wrap"><div class="history-hr"></div><div class="history-hr-text">以上是历史消息</div></li>';
//游客观看直播时间
if(!isset($_COOKIE['first_access_time'])){
  
setcookie("first_access_time", time(), time()+315360000);
    
  }
//其他处理
$ts=explode(':',$global['config']['tserver']);

//是否为房间管理
$room_admin=check_auth('room_admin');
$_SESSION['room_admin']=$room_admin;

if(!isset($_SESSION['room_'.$uid.'_'.$cfg['config'][id]])){
        $laiyuan=$_SERVER['HTTP_REFERER'] ; //获取访客来源url
    $laiyuan_scan=false;
   $laiyuan_scan=param_webscan_StopAttack($laiyuan,$cookiefilter);//检测变量
    if($laiyuan=='' || $laiyuan_scan ){$laiyuan='直接输入网址或打开标签'; }
$db->query("insert into  {$tablepre}msgs(rid,ugid,uid,uname,tuid,tname,mtime,ip,msg,`type`,laiyuan,roomid)values('{$rid}','{$userinfo[gid]}','{$userinfo[uid]}','{$userinfo[username]}','{$cfg[config][defvideo]}','{$cfg[config][defvideonick]}','".gdate()."','{$onlineip}','手机进入直播间','3','{$laiyuan}','{$rid}')");
$_SESSION['room_'.$uid.'_'.$cfg['config'][id]]=1;
}	
 //如果没有头像调用默认头像
 if(empty($userinfo['touxiang'])){$userinfo['touxiang']='/face/p1/null.jpg';}
$videolive = $cfg['config']['phonefp'];
$videolive = html_entity_decode($videolive);

 $domain=$_SERVER['SERVER_NAME'];
 $domain_bind=$db->fetch_row($db->query("select *  from {$tablepre}domain_bind where domain='{$domain}'")); 
$planurl= empty($domain_bind)?$cfg['config']['livefp']:$domain_bind['url'];

$username = $userinfo['username'];
//if (strlen($userinfo['username']) > 4) {
//  $username = substr($userinfo['username'], 0, 4) . '...';
//}
?>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>
<?=$cfg['config']['title']?>
</title>
<meta content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
<meta content="telephone=no" name="format-detection">
<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="white" name="apple-mobile-web-app-status-bar-style">
<link rel="shortcut icon" type="image/x-icon" href="<?=$global['config']['ico']?>" />
<link rel="stylesheet" href="./css/index.min.css">
<link rel="stylesheet" href="./css/layer.css">
<link rel="stylesheet" href="./css/weui.css">
<link rel="stylesheet" type="text/css" href="../skins/font-awesome.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script src="script/jquery.nicescroll.min.js"></script>
<script type="text/javascript" src="js/swfobject.js"></script>
<script type="text/javascript" src="js/web_socket.js"></script>
<script type="text/javascript" src="js/json.js"></script>
<script src="script/main.m.js"></script>
<script src="script/layer.js"></script>
<script src="../script/device.min.js"></script>
<script type="text/javascript" src="/room/script/ajaxfileupload.js"></script>
<script>
//if (!device.mobile()){window.location = '.';}
var UserList;
var ToUser;
var VideoLoaded=false;
var My={dm:'<?=$_SERVER['HTTP_HOST']?>',rid:'<?=$rid?>',roomid:'<?=$rid?>',chatid:'<?=$userinfo['uid']?>',name:'<?=$userinfo['username']?>',nick:'<?=$userinfo['nickname']?>',sex:'<?=$userinfo['sex']?>',touxiang:'<?=$userinfo['touxiang']?>',age:'<?=$userinfo['banspeak']?>',fuser:'<?=$userinfo['fuser']?>',qx:'<?=$room_admin?'1':'0'?>',ip:'<?=$onlineip?>',vip:'<?=$userinfo['fuser']?>',color:'<?=$userinfo['gid']?>',cam:'0',state:'0',mood:'<?=$userinfo['mood']?>',rst:'<?=$time?>',redbags_num:'<?=$userinfo['redbags']?>',banspeak:'<?=$userinfo['banspeak']?>'}

var RoomInfo={loginTip:'<?=$cfg['config']['logintip']?>',Msglog:'<?=$cfg['config']['msglog']?>',msgBlock:'<?=$cfg['config']['msgblock']?>',msgAudit:'<?=$cfg['config']['msgaudit']?>',defaultTitle:document.title,MaxVideo:'10',VServer:'<?=$cfg['config']['vserver']?>',VideoQ:'',TServer:'<?=$ts[0]?>',TSPort:'<?=$ts[1]?>',PVideo:'<?=$cfg['config']['defvideo']?>',AutoPublicVideo:'1',AutoSelfVideo:'0',type:'1',PVideoNick:'',OtherVideoAutoPlayer:'<?=$cfg['config']['livetype']?>',r:'<?=$cfg['config']['rebots']?>',tiyantime:'<?=$cfg['config']['tiyantime']?>',banspeak:'<?=$cfg['config']['banspeak']?>',loginguest:'<?=$cfg['config']['loginguest']?>',autoplan:'<?=$global['config']['autoplan']?>'}
var grouparr=new Array();
<?=$grouparr?>
var ReLoad;
var isIE=document.all;
var aSex=['<span class="sex-womon"></span>','<span class="sex-man"></span>',''];
var aColor=['#FFF','#FFF','#FFF'];
var msg_unallowable="<?=$msg_unallowable?>";
   if (typeof console == "undefined") {    this.console = { log: function (msg) {  } };}
    WEB_SOCKET_SWF_LOCATION = "js/WebSocketMain.swf";
    WEB_SOCKET_DEBUG = true;
    var ws, name, client_list={},timeid, reconnect=false;
</script>
<style type="text/css" media="screen">
#flashContent {
	display: block;
	text-align: left;
}
</style>
</head>
<body style="background: #f8f8f8 none repeat scroll 0 0; overflow: hidden; background-position: initial initial; background-repeat: no-repeat no-repeat;">
<live-room-m chat="true" video="true">
	<div class="zhezhao"></div>
	<div id="sharedWrap"> </div>
	<div id="shared" style="display:none"></div>
	<div id="redpackage" style="display: none">
		<div class="fixed-amount-tip" style="display:none" id="fixed-amount-tip">平均每人不能少于0.01元</div>
		<div class="self-weui-cell">
			<div class="weui-cell__hd">
				<label class="weui-label">红包个数</label>
			</div>
			<div class="weui-cell__bd">
				<input maxlength="2" class="weui-input" placeholder="填写个数" id="redpackage-num" onfocus="hideErrorTip('num')">
				个 </div>
		</div>
		<div class="fixed-amount-tip error-tip" id="redpackage-num-tip" style="display:none"></div>
		<div class="self-weui-cell">
			<div class="weui-cell__hd">
				<label class="weui-label">总金额</label>
			</div>
			<div class="weui-cell__bd">
				<input maxlength="4" class="weui-input"  placeholder="填写金额" id="redpackage-amount" onfocus="hideErrorTip('amount')">
				元 </div>
		</div>
		<div class="fixed-amount-tip error-tip" id="redpackage-amount-tip" style="display:none"></div>
		<div class="change-redpackage-type"> 
			<!-- <span>金额固定，</span> <span class="change-content">改为普通红包</span> --> 
		</div>
		<div class="self-weui-cell">
			<div class="weui-cell__hd">
				<label class="weui-label">留言</label>
			</div>
			<div class="weui-cell__bd">
				<input class="weui-input" placeholder="恭喜发财!" id="redpackapge-remarks">
			</div>
		</div>
		<button class="weui-btn weui-btn_disabled weui-btn_warn btn-confirm">塞钱进红包</button>
		<button class="weui-btn weui-btn_disabled weui-btn_warn btn-sending" style="display:none">发送中...</button>
		<button class="weui-btn weui-btn_default cancel-send-redpackage">取消</button>
	</div>
	<article>
		<section id="#head_1">
			<section class="video-show-wrap" style="display:none">
				<div class="login-info">
					<?php
          if($_SESSION['login_uid']>0)
          {
            echo "<div class='user-info-container'><span class='login-username'><font size='2'>". $username ."</font></span><span class='fa fa-caret-down'></span></div>";
          }else {
            echo '<div id="loginBtn" onClick="location.href=\'../minilogin.php?rid='.$rid.'\'">注册/登陆</div>';
          }
        ?>
					<div class="account-info-box">
						<ul class="account-list">
							<li class="account-item account-amount"> <a href="javascript:void(0)">余额:<span class="account-money">
								<?=$userinfo['moneyred']?>
								</span> <span class="withdraw" onclick="withdraw(<?=$_SESSION['login_uid']?>)">提现</span></a> </li>
							<li class="account-item"> <a href="javascript:void(0)">积分:<span class="account-credit">
								<?=$userinfo['redbags']?>
								</span></a> </li>
							<li class="account-item oneself-profile"> <a href="editprofile.php?rid=<?=$rid?>">个人资料</a> </li>
							<li class="account-item exit-btn"> <a href='../minilogin.php?act=logout&rid=<?=$rid?>'>退出登录</a> </li>
						</ul>
					</div>
				</div>
				<a id="video-show" class="videoShow" href="javascript:void(0);"><img src="video.png"></a>
				<a id="video-hide" class="videoShow" href="javascript:void(0);"style="display:none"><img src="video.png"></a> </section>
			<section class="video-container">
				<div id="logo"> <img src="<?=$cfg['config']['logo']?>" alt="" height="25px"> </div>
				<div class="videoTitle"> 
					<!-- <img src="./images/group.png"> --><span>在线</span> <span id="OnlineUserNum"></span><span>人</span> </div>
				<!-- 视频 -->
				<div id="mvMask"></div>
				<div class="video-box">
					<div class="video-wrap" id="view-wrap-container">
						<div class="video-win" id="video-win"></div>
					</div>
				</div>
			</section>
			<nav class="tab-nav">
				<ul style="overflow:hidden;" id="tabMenu">
					<li class="active">
						<h2>聊天</h2>
					</li>
					<li>
						<h2>客服</h2>
					</li>
				</ul>
				<div class="more-menu" style="display:none">
					<ul class="menu-list">
					</ul>
				</div>
			</nav>
		</section>
		<section class="tab-content">
			<div class="top" id="announcement">
				<marquee scrollamount="3" id="msg_tip_show" behavior="scroll" loop="infinite">
				<?php
        $query=$db->query("select * from {$tablepre}chatlog where  rid='".$rid."' and type='2'  order by id desc limit 1");
          while($row=$db->fetch_row($query)){
            echo "<nobr style='color:white;'>".tohtml($row[msg])."</bobr>";
          }
        ?>
				</marquee>
			</div>
			<div class="weui-gallery" id="gallery"> <span class="weui-gallery__img" id="galleryImg"></span> </div>
			<!-- 聊天区域 -->
			<div id="publicChat" class="publicChat" style="overflow-y: auto; display: block;" >
				<div class="history-hr-wrap"><a class="history-hr-text more-message" page="1">查看更多消息</a></div>
				<?=$omsg?>
			</div>
			<!-- 进入直播间提醒 -->
			<div class="abs-top-left" id="whocomein" style="bottom: 186px;display:block;position: absolute;left:0;z-index:9999;"> </div>
			<!-- 在线管理 -->
			<div id="adminContent" class="adminContent" style="width: 100%; display:none">
				<div class="OnLineUser">
					<div id="group_my"></div>
					<?=$groupli?>
				</div>
				<div id="kefuContent" class="kefuContent" style="width: 100%;">
					<div class="kefuContent-container">
						<?php
            if($cfg['config']['viewkefu']==1) {  
              $query=$db->query("select * from  {$tablepre}room_kefu where roomid={$rid} order by id desc limit 0,4 ");
              while($row=$db->fetch_row($query)){
                //$list.="<a class='btn flash1' target='_blank' title='{$row['qqtitle']}' href='http://wpa.qq.com/msgrd?v=3&amp;uin={$row['qqnum']}&amp;site=qq&amp;menu=yes'><i class='fa fa-qq'></i>{$row['qqtitle']}</a>";
                $list.="<div class='kefu clearfix'><div class='avatar nocustomer'><img src='./images/kefu.png'></div><a class='button btn-qq nocustomer' href='http://wpa.qq.com/msgrd?v=3&amp;uin={$row['qqnum']}&amp;site=qq&amp;menu=yes' target='_blank'><i class='icon icon-qq'></i>QQ交谈</a><div class='name ellipsis nocustomer online'>{$row['qqtitle']}</div></div>";
              }
            } else {
              $time=mktime(0,0,0,date('m'),date('d'),date('Y'));
              $time=time()-$time;
              $query=$db->query("select m.realname,ms.nickname from {$tablepre}members m,{$tablepre}memberfields ms  where m.uid=ms.uid  and m.gid=3 and m.realname!=''  and (m.roomid={$rid} or m.roomid='') and ((ms.onlinestart<=ms.onlineend  and ms.onlinestart<=$time and  ms.onlineend>=$time) or ( ms.onlinestart>ms.onlineend and ms.onlinestart<=$time and  ms.onlineend<=$time) or ( ms.onlinestart>ms.onlineend and ms.onlinestart>=$time and  ms.onlineend>=$time))  order by m.lastactivity DESC  ");
              while($row=$db->fetch_row($query)) {
                $list.="<div class='kefu clearfix'><div class='avatar nocustomer'><img src='./images/kefu.png'></div><a class='button btn-qq nocustomer' href='http://wpa.qq.com/msgrd?v=3&amp;uin={$row['realname']}&amp;site=qq&amp;menu=yes' target='_blank'><i class='icon icon-qq'></i>QQ交谈</a><div class='name ellipsis nocustomer online'>{$row['nickname']}</div></div>";
              }
            }
            echo $list;
          ?>
					</div>
				</div>
			</div>
			<!-- common frame -->
			<div id="commonFrame" class="common-frame" style="width: 100%; display: none;" class="white">
			<div class="iframe-wrapper" style="-webkit-overflow-scrolling: touch; overflow-y: auto;">
				<iframe src="" width='100%' style="border:none"></iframe>
			</div>
			</div>
			<div class="signin-container"> <img src="./images/signin-icon.png"> </div>
			<!--<div class="pound-gold-egg"> <img src="./images/egg.png"> </div>-->
			<?php if(check_auth('room_admin')){
echo "<div class='leftAside'> <img src='./images/hall_redpackage_icon.png'> </div>";
}else{ }?>
		</section>
		
<div class="moppmenu" style="display:none">
<li><a href="#" target="_blank">客服</a></li>
<li><a href="#" target="_blank">开奖</a></li>
<li><a href="#" target="_blank">导航</a></li>
</div>
	</article>
	<div id="footer" style="display: block;">
		<div class="more-function" id="moreFunction"><img src="./images/add.png"></div>
		<div class="sendBtn fr" id="sendBtn">发送</div>
		<!-- <div id="sharedBtn"> <span>分享</span> </div> -->
		<div class="smile"> <img src="./images/smile.png" alt="表情" width="26px" height="26px"> </div>
		<div id="editor">
			<div class="messageEditor" id="messageEditor" contenteditable="true"></div>
		</div>
	</div>
	<div class="more-function-container" style="display:none" id="moreFunction">
		<dl>
			<dd>
				<div class="img-container" id="sharedBtn"><img src="./images/Share.png"></div>
				<div class="text-container"><span>分享</span></div>
			</dd>
			<? if(check_auth('send_img')){?>
			<dd>
				<div class="img-container" id="UploadImgBtn" onclick="$('#filedata').click()"><img src="./images/upload-img.png"></div>
				<div class="text-container"><span>图片</span></div>
			</dd>
			<? }?>
			<? if($room_admin){?>
			<dd>
				<div class="img-container" id="shutBtn"><img src="./images/shut.png"></div>
				<div class="text-container"><span id="shutinfo">
					<? if($cfg['config']['banspeak']==1){echo '取消禁言';}else{echo '禁言';} ?>
					</span></div>
			</dd>
			<? }?>
			<dd>
				<div class="img-container" id="barrageBtn"><img src="./images/barrage.png"></div>
				<div class="text-container"><span id="barrageInfo">开启</span></div>
			</dd>
		</dl>
		<input id="filedata" type="file" size="20" name="filedata" class="input" style="display:none" onchange="uploadAvatar('filedata', '#messageEditor')">
	</div>
	<div class="loginWrap"></div>
	<div class="tipMesWrap"></div>
	<!-- <div class="qqchat"> <span></span><img src="./images/mobilefloat.png"></div> -->
	<div class="setting-expression-layer" style='display: none;'>
		<div class="expression" id="expressions">
			<table class="expr-tab expr-tab1">
			</table>
		</div>
	</div>
</live-room-m>
<input id="MyMoney" type="hidden" value="<?=$userinfo['moneyred']?>" />
<div style="display:none">
	<?=tohtml($global['config']['tongji'])?>
</div>
<div class="egg-code-container">
	<div class="inputInfo"> 
		<!-- <img class="colseLogin" src="/images/messageBtn.png" alt="关闭"> -->
		<div class="colseLogin"></div>
		<p class="inputInfoTitle">输入抽奖</p>
		<div class="codeDiv">
			<label for="codeInput">抽奖码:</label>
			<input class="codeInput" id="codeInput" type="text"  placeholder="请输入抽奖码">
		</div>
		<input class="submitTijiao" type="button" value="提交" id="submitCode">
	</div>
</div>
<script>
  var barrage = false;
  var commonExpression, ISSHOWEGG = <?=$global['config']['goldegg']?> == '1' ? true : false;
  var registerUrl = '<?=$planurl?>';
  OnInit();
  $("body").on("click", ".redbagclose",
      function() { 
          $(this).parent().remove()
  });
  var headeH = document.getElementById('#head_1').offsetHeight,
      wH = document.body.offsetHeight,
      fH = $('#footer').height(),
      videoShowWrap = $('.video-show-wrap').height(),
      tabNav = $('.tab-nav').height(),
      videoH = $('.video-container').height();

  
  $("#video-hide").on("click", function() {
    headeH = document.getElementById('#head_1').offsetHeight;
    $(".video-container").height(0);
    $('.video-show-wrap').show();
    $('#video-hide').hide();
    $('#video-show').show();
    $('#video-win').hide();
    $('#video-win').empty();
    $('#mvMask').hide();

    $('section #publicChat').height(wH - fH - videoShowWrap - tabNav);
    $('#commonFrame .iframe-wrapper').height(wH - videoShowWrap - tabNav);
    $('#commonFrame .iframe-wrapper iframe').height(wH - videoShowWrap - tabNav);
    $('#adminContent').height(wH - videoShowWrap - tabNav);
  })

  $("#video-show").on("click", function() {
      $(".video-container").animate({height: videoH});
      $('#video-hide').show();
      $('#video-show').hide();
      $('#video-win').append('<?=$videolive?>');
      $('#video-win').show();
      $('#mvMask').show();

      $('section #publicChat').height(wH - fH - videoShowWrap - headeH);
      $('#commonFrame .iframe-wrapper').height(wH - videoShowWrap - headeH);
      $('#commonFrame .iframe-wrapper iframe').height(wH - videoShowWrap - headeH);
      $('#adminContent').height(wH - videoShowWrap - headeH);
  })

  function init() {
    $('#messageEditor').on('click', function () {
      var target = this;
      setTimeout(function(){
            target.scrollIntoViewIfNeeded();
          },400);
    });

    <?php if($cfg['config']['banspeak']==1) { ?>
      $('#shutBtn').css('background-color', 'gainsboro');
    <?php } else { ?>
      $('#shutBtn').css('background-color', 'white');  
    <?php } ?> 
    $("#video-hide").click();
  }
  init();
</script>
</body>
</html>