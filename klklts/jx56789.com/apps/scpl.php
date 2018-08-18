<?php
require_once '../include/common.inc.php';
function app_scpl_list($num,$key,$tpl) {
	global $db,$tablepre,$firstcount,$displaypg;
	$sql="select * from {$tablepre}apps_scpl";
	if($key!="")$sql.=" where title like '%$key%' or txt like '%$key%' or `user` like '%$key%'";
	
	$count=$db->num_rows($db->query($sql));
	pageft($count,$num,"");
	$sql.=" order by id desc";
	$sql.=" limit $firstcount,$displaypg";
	$query=$db->query($sql);
  while($row=$db->fetch_row($query)) {
		$t=$tpl;
    $star='<img src="img/level/'.$row['dj'].'.png">';
                $row['dj']=$star;
		foreach($row as $key=>$value){
			$t=str_replace('{'.$key.'}',$value,$t);	
		}
	$str.=$t;
	}
	return $str;	
}

switch($act) {
	case "scpl_add":
		$user=$_SESSION['login_user'];
		$db->query("insert into {$tablepre}apps_scpl(title,txt,`user`,atime,dj)values('$title','$txt','$user','".gdate()."','$dj')");
		$str="<span style='color:#0072ff;'><font style='color:red;font-size:14px;'>市场评论:</font><br>{$dj}星级 {$title} <font style='color:#fff;background-color: #e93f3f;padding: 2px 7px 2px;cursor:pointer' onClick='$(\\\"#app_4\\\").trigger(\\\"click\\\")'>查看详情</font></span>";
		exit('<script>top.app_sendmsg("'.$str.'");location.href="?"</script>');
	break;
}
$sql="select * from {$tablepre}apps_scpl";
if($id!="")$sql.=" where id='$id'";
else $sql.=" limit 1";
$row=$db->fetch_row($db->query($sql));
$star='<img src="img/level/'.$row['dj'].'.png">';
                $row['dj']=$star;
?>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>市场评论</title>
<link href="css/apps.css" rel="stylesheet" type="text/css" />
<style type="text/css">
a {     color: #4f6b72;}
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

if(check_auth('scpl_add')){
?>
<form action="?act=scpl_add" method="post" enctype="application/x-www-form-urlencoded" onsubmit="return docheck();">
<table width="100%" cellspacing="0" id="jyts_add"  class="our" style=" margin-bottom:5px; display:none;">
          <tr>
            <td class="tableleft" style="width:80px;">标题：</td>
            <td><input name="title" type="text" id="title"  style="width:50%" value=""></td>
          </tr>
          <tr>
            <td class="tableleft" style="width:80px;">等级：</td>
            <td><select name="dj" id="dj">
              <option value="1">1星</option>
              <option value="2">2星</option>
              <option value="3">3星</option>
              <option value="4">4星</option>
              <option value="5">5星</option>
            </select></td>
          </tr>
          <tr>
            <td width="30" class="tableleft" style="width:80px;">内容：</td>
            <td><textarea name="txt" id="txt" style="width:100%" class="xheditor {cleanPaste:0,height:'300',internalScript:true,inlineScript:true,linkTag:true,upLinkUrl:'../upload/upload.php',upImgUrl:'../upload/upload.php',upFlashUrl:'../upload/upload.php',upMediaUrl:'../upload/upload.php'}"></textarea></td>
      </tr>
          <tr>
            <td class="tableleft">&nbsp;</td>
            <td><input type="submit" name="button" id="button" class="btn2"  value="发布"></td>
          </tr>
    </table>
</form>
<div style="margin:5px 0px;"><button class="btn1"  onClick="document.getElementById('jyts_add').style.display=''">发布市场评论</button></div>
<?php
}
if(check_auth('scpl_view')){
?>
<div  style=" padding:20px; margin-bottom:10px;border:1px solid #CCC; <?php if($act!='scpl_view')echo 'display:none';?>">
          <div style="font-size:20px; line-height:25px; text-align:center"><strong><?=$row['title']?></strong></div>
		  <div style="text-align:center;color: #a2a2a2;"><div style="display: inline-block;vertical-align: middle;"><?=$row['dj']?></div>&nbsp;&nbsp;<?=$row['user']?>&nbsp;&nbsp <?=date('Y-m-d H:i:s', $row['atime'])?></div>
          <div><?=tohtml($row['txt'])?></div>
</div>
    
<table width="100%" cellspacing="0" id="mytable">

      <tr  >
        <th width="30" align="center" bgcolor="#FFFFFF"  style="border-left: 1px solid #C1DAD7;">编号</th>
        <th width="40"  align="left" bgcolor="#FFFFFF">星级</th>
        <th  align="left" bgcolor="#FFFFFF">标题</th>
        <th width="100"  align="left" bgcolor="#FFFFFF">发布时间</th>
        <th width="100"  align="left" bgcolor="#FFFFFF">发布人</th>
  </tr>
      

<?php
echo app_scpl_list(20,$key,'
    <tr>
    <td align="center" bgcolor="#FFFFFF"  style="border-left: 1px solid #C1DAD7;">{id}</td>
	<td bgcolor="#FFFFFF" style="width: 90px">{dj}</td>
      <td align="left" bgcolor="#FFFFFF"><a href="?id={id}&act=scpl_view">{title}</a></td>
	  <td bgcolor="#FFFFFF"> <script>document.write(ftime({atime})); </script></td>
      <td bgcolor="#FFFFFF">{user}</td>
    </tr>
')?>



</table>
<div style="height:30px; line-height:30px;"><?=$pagenav?></div>
<?php
}else{ ?>
	<div class="robot-Tips">您暂时没有权限查看市场评论，请联系客服!</div>
<?php }
?>
<script type="text/javascript" src="../xheditor/jquery/jquery-1.4.4.min.js"></script> 
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
</script>
</body>
</html>

