<?php
require_once '../include/common.inc.php';
function app_jyts_list($num,$key,$tpl){
	global $db,$tablepre,$firstcount,$displaypg;
	$sql="select * from {$tablepre}apps_jyts";
	if($key!="")$sql.=" where title like '%$key%' or txt like '%$key%' or `user` like '%$key%'";
	
	$count=$db->num_rows($db->query($sql));
	pageft($count,$num,"");
	$sql.=" order by id desc";
	$sql.=" limit $firstcount,$displaypg";
	$query=$db->query($sql);
	return for_each($query,$tpl);	

}

switch($act){
	case "jyts_add":
		$user=$_SESSION['login_user'];
		$db->query("insert into {$tablepre}apps_jyts(title,txt,`user`,atime)values('$title','$txt','$user','".gdate()."')");
		$str="<span style='color:#0072ff;'><font style='color:red;font-size:14px;'>交易提示:</font><br>{$title} <font style='color:#fff;background-color: #e93f3f;padding: 2px 7px 2px;cursor:pointer'  onClick='$(\\\"#app_3\\\").trigger(\\\"click\\\")'>查看详情</font></span>";
		exit('<script>top.app_sendmsg("'.$str.'");location.href="?"</script>');
	break;
}
$sql="select * from {$tablepre}apps_jyts";
if($id!="")$sql.=" where id='$id'";
else $sql.=" limit 1";
$row=$db->fetch_row($db->query($sql));
?>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
<title>在线答疑</title>
<link href="css/apps.css" rel="stylesheet" type="text/css" />
<link href="/room/skins/nuoyun.css" rel="stylesheet" type="text/css" />
<style type="text/css">
a {     color: #4f6b72;}
.tcontent img {
    max-width: 700px;
    max-height: 499px;
    margin-bottom: -3px;
}
@media screen and (max-width: 500px) {
  .tcontent img {
      max-width: 300px;
      max-height: 400px;
      margin-bottom: -3px;
  }
}
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
	return new Date(time*1000).Format("yyyy-MM-dd hh:mm");
}
</script>

<?php

if(check_auth('jyts_add')){
?>
<form action="?act=jyts_add" method="post" enctype="application/x-www-form-urlencoded" onsubmit="return docheck();">
<table width="100%" cellspacing="0" id="jyts_add" class="our"  style=" margin-bottom:5px; display:none ">
          <tr>
            <td class="tableleft" style="width:80px;">标题：</td>
            <td><input name="title" type="text" id="title" style="width:98%" value=""></td>
          </tr>
          <tr>
            <td width="30" class="tableleft" style="width:80px;">问题：</td>
            <td><textarea name="txt" id="txt" style="width:100%" class="xheditor {cleanPaste:0,height:'300',internalScript:true,inlineScript:true,linkTag:true,upLinkUrl:'../upload/upload.php',upImgUrl:'../upload/upload.php',upFlashUrl:'../upload/upload.php',upMediaUrl:'../upload/upload.php'}"></textarea></td>
      </tr>
          <tr>
            <td class="tableleft">&nbsp;</td>
            <td><input type="submit" name="button" id="button" class="btn2" value="发布"></td>
          </tr>
    </table>
</form>
<?php
}
if(check_auth('jyts_view')){
?>
<div  style=" padding:20px; margin-bottom:10px;border:1px solid #CCC; <?php if($act!='jyts_view')echo 'display:none';?>">
          <div style="font-size:20px; line-height:25px; text-align:center"><strong><?=$row['title']?></strong></div>
		  <div style="text-align:center;color: #a2a2a2;"><?=date('Y-m-d H:i:s', $row['atime'])?> <?=$row['user']?></div>
          <div><?=tohtml($row['txt'])?></div>
</div>
<div style="overflow-y: auto;height: 549px;">
<?php
$num=20;
  global $db,$tablepre,$firstcount,$displaypg;
	$sql="select * from {$tablepre}apps_jyts";
	if($key!="")$sql.=" where title like '%$key%' or txt like '%$key%' or `user` like '%$key%'";
	
	$count=$db->num_rows($db->query($sql));
	pageft($count,$num,"");
	$sql.=" order by id desc";
	$sql.=" limit $firstcount,$displaypg";
	$query=$db->query($sql);
        while($row=$db->fetch_row($query)){
        ?>
  <div class="card">
    <div class="card-content">
        <div class="card-content-inner">
           <br>
          <?=htmlspecialchars_decode($row['txt'])?><br>  
        </div>
    </div>
    <div class="card-footer">
      <script>document.write(ftime(<?=$row['atime']?>)); </script>&nbsp;&nbsp;&nbsp;&nbsp;<?=$row['user']?>
    </div>
  </div>
        <? }?>
<div style="height:30px; line-height:30px;"><?=$pagenav?></div>
</div>
<?php
}else{ ?>
	<div class="robot-Tips">您暂时没有权限查看交易提示，请联系客服!</div>
<?php }
?>
<!-- <script type="text/javascript" src="../xheditor/jquery/jquery-1.4.4.min.js"></script>  -->
<script src="/room/script/jquery.min.js"></script>
<script src="/room/script/layer.js"></script>
<script type="text/javascript" src="../xheditor/xheditor.js"></script>
<script type="text/javascript" src="../xheditor/xheditor_lang/zh-cn.js"></script>

<script>
 function docheck() {
        
      var title =$.trim($("#title").val());
      var txt =$.trim($("#txt").val());
       
        if(title==''){
            
           alert('标题不能为空！');
            return false;
            
        }
        if(txt==''){
            
           alert('内容不能为空！');
            return false;
            
        }
        return true;
    }
   
    function toPage(url){
  window.location.href=url+'&page='+$("#ToPage").val();
}

$(function() {
  $(".card-content-inner img").click(function() {
    if($(this).width()>=300||$(this).height()>=300) {
      var cardImg = layer.open({
          type: 1,
          title: false,
          shadeClose: true,
          skin: 'layui-layer-rim', //加上边框
          area: 'auto',
          maxWidth: '700px',
          maxHeight: '499px',
          content:'<div class="tcontent"><img src="'+ $(this).attr('src') +'" /></div>'
      });
    }
  })
})
</script>
</body>
</html>

