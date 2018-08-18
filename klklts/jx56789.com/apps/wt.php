<?php
require_once '../include/common.inc.php';

function app_wt_list($num,$key,$tpl){
	global $db,$tablepre,$firstcount,$displaypg;
	$sql="select * from {$tablepre}apps_wt where zt=0";
	
	$count=$db->num_rows($db->query($sql));
	pageft($count,$num,"");
	$sql.=" order by id desc";
	$sql.=" limit $firstcount,$displaypg";
	$query=$db->query($sql);
	return for_each($query,$tpl);	

}
$msgban=$cfg['config']['msgban'];
function cleanWords($text,$msgban){
 $badwords = explode('|',$msgban);
foreach($badwords as $v){
  $text = str_replace($v,'***',$text);
 }
 return $text;
}

switch($act){
	case "wt_re": 	
            $a=cleanWords($a,$msgban);
		$db->query("update {$tablepre}apps_wt set a='$a', auser='$auser' where id='$id'");
		$str="<font style='border-bottom:1px solid #999; color:red;font-size:14px;'>[回答问题]</font><br>问题编号【{$id}】有了答案！请查看 …… [<font style='color:red;  cursor:pointer' onClick='$(\\\"#app_2\\\").trigger(\\\"click\\\")'>详细</font>]";
		exit('<script>top.app_sendmsg("'.$str.'");location.href="?"</script>');
	break;	
	case "wt_add":
            $q=cleanWords($q,$msgban);
		$quser=$_SESSION['login_user'];
		$db->query("insert into {$tablepre}apps_wt(q,quser,zt,qtime)values('$q','$quser',0,'".gdate()."')");
		$str="<font style='border-bottom:1px solid #999; color:#09F;font-size:14px;'>[提出问题]</font><br>问题【{$q}】期待答案！ …… [<font style='color:red;  cursor:pointer' onClick='$(\\\"#app_2\\\").trigger(\\\"click\\\")'>详细</font>]";
		exit('<script>top.app_sendmsg("'.$str.'");location.href="wt.php"</script>');
	break;
}

$row=$db->fetch_row($db->query("select * from {$tablepre}apps_wt where id='$id'"));
?>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>在线答疑</title>
<link href="css/apps.css" rel="stylesheet" type="text/css" />
<script src="js/jquery.min.js"></script>
<script src="/room/script/layer.js"></script>
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
if(check_auth('wt_re')&&$act=="wt_view"){
?>
<form action="?act=wt_re&id=<?=$row['id']?>" method="post" enctype="application/x-www-form-urlencoded">
<table width="70%" cellspacing="0" id="mytable" class="our"  style=" margin-bottom:5px;">
    <tbody>
          <tr>
            <td width="30" class="tableleft" style="width:80px;" align="right">问题：</td>
            <td ><span style="color:#f46b0a;"><?=$row['q']?></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(提问者：<?=$row[quser]?>&nbsp;&nbsp;&nbsp;发布时间：<script>document.write(ftime(<?=$row['qtime']?>)); </script>)</td>
      </tr>
          <tr>
            <td align="right">答案：</td>
            <td ><textarea name="a" rows="3" id="a" style="width:98%"><?=$row[a]?></textarea></td>
          </tr>
          <tr>
          <td align="right"><span >回答者</span>：</td>
            <td><input name="auser" type="hidden" id="auser" value="<?=$_SESSION['login_user']?>"><?=$_SESSION['login_user']?></td>
          </tr>
          <tr>
            <td >&nbsp;</td>
            <td ><input type="submit" name="button" id="button" class="btn2" value="回答问题"></td>
          </tr>
          </tbody>
    </table>
</form>
<?php
}
if(check_auth('wt_add')){
?>
<form action="?act=wt_add" method="post" enctype="application/x-www-form-urlencoded" onsubmit="return docheck();">
<table width="70%" cellspacing="0" id="wt_add" class="our"  style=" margin-bottom:5px; display:none">
          <tr>
            <td width="30" class="tableleft" align="right" style="width:80px;">问题：</td>
            <td><textarea name="q" rows="3" id="q" style="width:98%"></textarea></td>
      </tr>
          <tr>
            <td class="tableleft">&nbsp;</td>
            <td><input type="submit" name="button" id="button" class="btn2" value="发布问题"></td>
          </tr>
    </table>
</form>

<?php
}

if(check_auth('wt_view')){
?>
<table width="100%" cellspacing="0" id="mytable" style="position:relative;">
<tr>
        <th width="30" align="center" bgcolor="#FFFFFF"  style="border-left: 1px solid #CCC;">编号</th>
        <th  align="left" bgcolor="#FFFFFF">问题/答案 <div style="position: absolute;right: 10px;top: 6px;"><button class="btn1" onClick="<? if(check_auth('wt_add')){echo "document.getElementById('wt_add').style.display=''";}else{echo "alert('没有提问权限')";}?>">提出问题</button></div></th>
        
  </tr>
      

<?php
echo app_wt_list(10,$key,'
    <tr>
    <td align="center" bgcolor="#FFFFFF"  style="border-left: 1px solid #CCC;">{id}</td>
      <td align="left" bgcolor="#FFFFFF">问题：{q} ( {quser} <script>document.write(ftime({qtime})); </script> )<br>
      答案：{a} ( {auser} ) 【<a href="?id={id}&act=wt_view">回答</a>】
      </td>
      
    </tr>
')?>



</table>
<div style="height:30px; line-height:30px;"><?=$pagenav?></div>
<?php
}else{
	echo "<script>top.layer.msg('没有权限查看在线答疑！请联系客服！');</script>";
}
?>

<script type="text/javascript">
    function docheck() {
        
      var question =$.trim($("#q").val());
        
       
        if(question=='' || question.length < 10){
            
           layer.msg('问题内容不能少于10个字符！');
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

