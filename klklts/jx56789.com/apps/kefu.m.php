<?php
require_once '../include/common.inc.php';
$query=$db->query("select m.*,ms.* from {$tablepre}members m,{$tablepre}memberfields ms  where m.uid=ms.uid and m.gid=3 order by m.uid  ");
while($row=$db->fetch_row($query)){
	$list.="

  <div class='li'>
    <div class='li_img'><img src='../face/img.php?t=p2&u={$row[uid]}'></div>
    <div class='li_qq'><a href='mqqwpa://im/chat?chat_type=wpa&uin={$row[realname]}&version=1&src_type=web&web_src=oicqzone.com'   target='oqq'>
    {$row[nickname]}</a></div>
    <div class='li_phone'>{$row[phone]}</div>
  </div>
";
}

?>
<!DOCTYPE html>

<html class="page-fin-news"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <title>客服列表</title>
 <link rel="stylesheet" href="http://page.yy.com/finance/assets/css/liveFinance.css">
  <style type="text/css">
/* CSS Document */


body{background-color: #c2ddf3;}
.list { float: left; margin-bottom:20px;}
.li { float: left; margin:1px; width: 110; padding: 1px; border: 1px solid #aec5d8; background-color: #fff; height:208px;}
.li_img img{ width:100px; height: 140px; border: 1px #CCCCCC solid; padding: 1px; margin:1px; }
.li_qq { background: url(img/pop_btn1.png) no-repeat; display: block; margin: 0 auto; color: #fff; font-size: 14px; padding-left: 25px; margin-top: 3px; width: 80px; height: 26px; line-height: 26px; overflow:hidden }
.li_qq:hover{opacity: 0.9;}
.li_phone { background: url(img/pop_btn2.png) no-repeat 1px 3px; display: block; height: 22px; line-height: 22px; padding-left: 12px; width: 90px; margin: 0 auto; font-size: 13px;  overflow:hidden; color:#F00}
</style>
</head>
<body>
<div class="fg-notice-wrap">
    <div class="fg-notice-box">
     <div class='list'>
<?=$list?>
</div>   
    </div>
</div>
</body></html>