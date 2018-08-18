<?php
require_once '../../include/common.inc.php';
function app_hd_add($ktime,$ptime,$sp,$kcj,$lx,$cw,$zsj,$zyj,$username,$pcj,$sn){
	global $db,$tablepre;
	$time=gdate();
	$ktime=strtotime($ktime);
	$ptime=strtotime($ptime);
	$username=$_SESSION['login_user'];
	$db->query("insert into {$tablepre}apps_hd(ktime,sp,kcj,lx,cw,zsj,zyj,username,sn,ttime)values('$ktime','$sp','$kcj','$lx','$cw','$zsj','$zyj','$username','$sn','$time')");
}
function app_hd_list($num,$roomid,$key,$tpl){
	global $db,$tablepre,$firstcount,$displaypg;
	$sql="select * from {$tablepre}apps_hd where roomid='$roomid' ";
	$count=$db->num_rows($db->query($sql));
	pageft($count,$num,"");
	$sql.=" order by id desc";
	$sql.=" limit $firstcount,$displaypg";
	$query=$db->query($sql);
	while($row=$db->fetch_row($query)){
		$t=$tpl;
		if($row['username']==$_SESSION['login_user']&&$row['pcj']==""){
			$t=str_replace('{pcj}',"<a href=\"javascript:bt_hd_pc('{$row[id]}','{$row[lx]}','{$row[sp]}')\">平仓</a>",$t);
		}
		if($row['username']==$_SESSION['login_user']){
			$t=str_replace('{username}',"{username} <a href=\"javascript:bt_hd_del('{$row[id]}','{$row[lx]}','{$row[sp]}')\">删</a>",$t);
		}
		if(strpos($row[lx],'买')&&$row['pcj']!=""){
			$t=str_replace('{yld}',round($row['pcj']-$row['kcj'],2),$t);
		}
		else if(strpos($row[lx],'卖')&&$row['pcj']!=""){
			$t=str_replace('{yld}',round($row['kcj']-$row['pcj'],2),$t);
		}else{
			$t=str_replace('{yld}','',$t);
		}
		foreach($row as $k=>$value){
			$t=str_replace('{'.$k.'}',$value,$t);	
		}
		$str.=$t;
		
	}
	return $str;	
}
switch($act){
	case "z":
		if($_SESSION['z'.$id]==""&&$_COOKIE['z'.$id]==""){
			$db->query("update {$tablepre}apps_hd set z=z+1 where id='$id' ");
			$_SESSION['z'.$id]=1;
			setcookie('z'.$id, '1', gdate()+315360000);
		}
	break;
	case "hd_del":
		$db->query("delete from {$tablepre}apps_hd where username='$_SESSION[login_user]' and id='$id'");
	break;
	case "app_hd_pc":
		$db->query("update {$tablepre}apps_hd set pcj='{$pc_pcj}',ptime='".gdate()."' where id='{$pc_id}'");
		$str="<font style='border-bottom:1px solid #999; color:red;font-size:14px;'>[喊单提醒]</font><br>单号：$pc_id,$pc_lx,$pc_sp 平仓 [<font style='color:red;  cursor:pointer' onClick='$(\\\"#app_1\\\").trigger(\\\"click\\\")'>详细</font>]";
		exit('<script>top.app_sendmsg("'.$str.'");location.href="?"</script>');
	break;
	case "app_hd_add": 	
		app_hd_add($ktime,$ptime,$sp,$kcj,$lx,$cw,$zsj,$zyj,$username,$pcj,$sn);
		$id=$db->insert_id();
		$str="<font style='border-bottom:1px solid #999; color:red;font-size:14px;'>[喊单提醒]</font><br>单号：$id,$lx,$sp …… [<font style='color:red;  cursor:pointer' onClick='$(\\\"#app_1\\\").trigger(\\\"click\\\")'>详细</font>]";
		exit('<script>top.app_sendmsg("'.$str.'");location.href="?"</script>');
	break;	
}
?>
<!DOCTYPE html>

<html class="page-fin-news"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>操作建议</title>
<meta content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
<meta content="telephone=no" name="format-detection">
<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="white" name="apple-mobile-web-app-status-bar-style">
<link rel="stylesheet" href="./css/liveFinance.css">
 <style type="text/css">
/* CSS Document */
:link, :visited, ins {text-decoration: none;}
ol, ul, menu {list-style: none outside none;}
body {font: 12px/1.5 tahoma,arial,sans-serif;}
body{background-color: #c2ddf3;color: #fff;font-size: 13px;font-family: Tahoma,Arial,Roboto,”Droid Sans”,”Helvetica Neue”,”Droid Sans Fallback”,”Heiti SC”,”Hiragino Sans GB”,Simsun,sans-self;-webkit-overflow-scrolling: touch;}
.hdul{margin: 10px 15px;padding: 10px; border-radius: 5px; background-color: #fff; color: #7e7e7f; font-size: .84rem;}
.hdul a{color: red;}
.no-data {
    background: url(./images/ico_norecord6.png) center center no-repeat;
    background-size: 6rem;
    height: 10rem;
    position: relative;
    width: 100%;
}
.no-data span{
    position: absolute;
    bottom: 0rem;
    text-align: center;
    display: block;
    width: 100%;
    font-size: .8rem;
    color: #999;
}
.hdul .span-val{color: #404040;}
.hdul .detail {overflow: hidden; margin-top: .3rem;}
.hdul .inner {float: left; width: 30%;}
.hdul .action {float: right; margin-top: -2rem;}
.hdul .action .btn-mairu {padding: 0.5rem 1.2rem; font-size: 1rem; color: #fff; border-radius: 3px; background-color: #e96736;}
.hd-footer {height: 30px; line-height: 30px; color: #000; font-size: .8rem; margin-bottom: 3rem; margin-left: 1rem;}
.page{padding: 3px 6px;border: 1px solid #BBB;border-radius: 3px;cursor: pointer;color: #666;text-decoration:none;}
.page:hover{ color: #000;  border: 1px solid #000;}
.pagesel{color: #666;}
.button {border: none; width: 3.1rem; height: 1.5rem; border-radius: 1rem; margin-top: 0.5rem; background: -webkit-linear-gradient(left, #e96134 , #fecb67);}
#ToPage{display: inline-block; height: 20px;line-height: 20px; padding: 4px 12px; border: 1px solid #cccccc; outline: none; border-radius: 4px; vertical-align: middle;-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);-webkit-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;-o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;}
#qqOnline{background: #f6f6f6;}
</style>
</head>
<body>
<script>
Date.prototype.Format = function (fmt) { //author: meizz 
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "h+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}
function ftime(time){
	if(!time)return "";
	return new Date(time*1000).Format("yyyy-MM-dd hh:mm"); ; 
}
       function toPage(url){
  window.location.href=url+'&page='+document.getElementById('ToPage').value;
}
</script>
<div class="fg-notice-wrap">
    <div class="fg-notice-box">
<?php

if(check_auth('hd_view')){
?>

      
<?php
$html = app_hd_list(20,$rid,$key,'

    <ul class="hdul">
			    <li bgcolor="#FFFFFF"><span>标题:</span><span class="span-val">{id}</span></li>
			    <li bgcolor="#FFFFFF"><span>建仓时间:</span><span class="span-val"><script>document.write(ftime({ktime})); </script></span></li>
				<li bgcolor="#FFFFFF" class="action"><a href="?id={id}&act=z" class="btn-mairu">跟单</a></li>
      
				<ul class="detail">
					<li>
						<div class="inner">
							<div class="title">分析师:</div>
							<div class="span-val">{username}</div>
						</div>
					</li>
					<li>
						<div class="inner">
							<div class="title">类型:</div>
							<div class="span-val">{lx}</div>
						</div>
					</li>
					<li>
						<div class="inner">
							<div class="title">产品:</div>
							<div class="span-val">{sp}&nbsp;</div>
						</div>
					</li>
    </ul>

				<ul class="detail">
					<li>
						<div class="inner">
							<div class="title">成本价:</div>
							<div class="span-val">{kcj}</div>
						</div>
					</li>
					<li>
						<div class="inner">
							<div class="title">止损价:</div>
							<div class="span-val">{zsj}&nbsp;</div>
						</div>
					</li>
					<li>
						<div class="inner">
							<div class="title">目标价:</div>
							<div class="span-val">{zyj}&nbsp;</div>
						</div>
					</li>
				</ul>      
		    </ul>
 ');
	if ($html == '') {
		echo '<div class="no-data"><span>暂无数据</span></div>';
	} else {
		echo $html;
	}
	if ($html != '') {
?>  
	<div class="hd-footer"><?=$pagenav?></div>
	<?php } ?>

<?php
}else{
	echo "<div style=\" font-size:20px;color: red;text-align: center;padding-top: 30px;\">没有权限查看喊单数据！请联系客服！</div>";
}
?>
    </div>
</div>
</body>
</html>
