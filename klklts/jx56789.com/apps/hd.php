<?php
require_once '../include/common.inc.php';
if(!isset($rid))$rid=$_COOKIE['roomid'];
function app_hd_add($ktime,$ptime,$sp,$kcj,$lx,$cw,$zsj,$zyj,$username,$pcj,$roomid,$sn){
	global $db,$tablepre;
	$time=gdate();
	$ktime=strtotime($ktime);
	$ptime=strtotime($ptime);
	$username=$_SESSION['login_user'];
         $nickname=userinfo($_SESSION['login_uid'],'{nickname}');
	$db->query("insert into {$tablepre}apps_hd(ktime,sp,kcj,lx,cw,zsj,zyj,username,uname,sn,roomid,ttime)values('$ktime','$sp','$kcj','$lx','$cw','$zsj','$zyj','$username','$nickname','$sn','$roomid','$time')");
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
			$t=str_replace('{uname}',"{uname} <a href=\"javascript:bt_hd_del('{$row[id]}','{$row[lx]}','{$row[sp]}','{$roomid}')\">删</a>",$t);
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
		$str="<span style='color:#0072ff;'><font style=' color:red;font-size:14px;'>即时策略：</font><br>单号：$pc_id,$pc_lx,平仓交易商品【".$pc_sp."】 <font style='color:#fff;background-color: #e93f3f;padding: 2px 7px 2px;cursor:pointer' onClick='$(\\\"#app_1\\\").trigger(\\\"click\\\")'>查看详情</font></span>";
		exit('<script>top.app_sendmsg("'.$str.'");location.href="?roomid='.$rid.'&rid='.$rid.'"</script>');
	break;
	case "app_hd_add": 	
		app_hd_add($ktime,$ptime,$sp,$kcj,$lx,$cw,$zsj,$zyj,$username,$pcj,$roomid,$sn);
		$id=$db->insert_id();
		$str="<span style='color:#0072ff;'><font style='color:red;font-size:14px;'>即时策略：</font><br>单号：$id,$lx,开仓交易商品【".$sp."】 <font style='color:#fff;background-color: #e93f3f;padding: 2px 7px 2px;cursor:pointer' onClick='$(\\\"#app_1\\\").trigger(\\\"click\\\")'>查看详情</font></span>";
		exit('<script>top.app_sendmsg("'.$str.'");location.href="?roomid='.$rid.'&rid='.$rid.'"</script>');
	break;	
}
?>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>喊单提醒</title>
<link href="css/apps.css" rel="stylesheet" type="text/css" />
</head>

<script src="../room/script/jquery.min.js"></script>

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
function bt_hd_pc(id,lx,sp){
	//$("#act_pc_from").find('input[type=text]').val("");
	$("#pc_lx").val(lx);
	$("#pc_sp").val(sp);
	$("#pc_id").val(id);
	$("#pc_no_id").text(id);
	$("#pc_pcj").focus();
	$("#act_pc_from").show();
	$("#act_add_from").hide();
}
function bt_hd_del(id,lx,sp,roomid){
	if(confirm('确定删除？')){location.href="?act=hd_del&id="+id+"&roomid="+roomid+"&rid="+roomid;}
}
function bt_hd_add(){
	//$("#act_add_from").find('input[type=text]').val(""); 
	$("#cw").focus();
	$("#act_add_from").show();
	$("#act_pc_from").hide();
}
</script>
<?php
if(check_auth('hd_add')){
?>
<form action="?roomid=<?=$rid?>&rid=<?=$rid?>" method="post" enctype="application/x-www-form-urlencoded">
<table width="100%" cellspacing="0" id="act_pc_from"  style="border-left: 1px solid #CCC;border-top: 1px solid #CCC; margin-bottom:5px; display:none ">
          <tr>
            <td width="80" align="center" class="tableleft" >单号：<span id="pc_no_id"></span></td>
            <td width="50" align="right" class="tableleft" >类型：</td>
            <td><input type="text" name="pc_lx" id="pc_lx" readonly></td>
            <td width="80" align="right">商品：</td>
            <td><input type="text" name="pc_sp" id="pc_sp" readonly></td>
            <td align="right">平仓价：</td>
            <td><input type="text" name="pc_pcj" id="pc_pcj">&nbsp;</td>
            <td>
            <input name="act"  type="hidden" id="act" value="app_hd_pc"/> 
            <input name="pc_id"  type="hidden" id="pc_id" />
            <input type="submit" name="button2" id="button2" value="平仓"></td>
      </tr>
    </table>
</form>
<form action="?roomid=<?=$rid?>&rid=<?=$rid?>" method="post" enctype="application/x-www-form-urlencoded" onsubmit="return docheck();">
<table width="100%" cellspacing="0" id="act_add_from"  class="our" style=" margin-bottom:5px; display:none  ">
          <tr>
            <td width="30" align="right" class="tableleft" style="width:80px;">类型：</td>
            <td><select name="lx" id="lx">
              <option value="现价买入">现价买入</option>
              <option value="现价卖出">现价卖出</option>
              <option value="到价买入">到价买入</option>
              <option value="到价卖出">到价卖出</option>
              <option value="限价买入">限价买入</option>
              <option value="限价卖出">限价卖出</option>
            </select></td>
            <td width="80" align="right">仓位：</td>
            <td><input name="cw" type="text" id="cw" style="ime-mode:disabled">
            %</td>
            <td align="right"><span class="tableleft">商品：</span></td>
            <td><input name="sp" type="text" id="sp" style="ime-mode:disabled"></td>
            <td>
            <input name="act"  type="hidden" id="act" value="app_hd_add"/> 
            <input name="ktime"  type="hidden" id="ktime" value="<?=date('Y-m-d H:i:s',gdate())?>"  class="calendar calendar-time"  style="ime-mode:disabled"/></td>
      </tr>
          <tr>
            <td align="right" class="tableleft">开仓价：</td>
            <td><input name="kcj" type="text" id="kcj"  style="ime-mode:disabled"></td>
            <td align="right"><span class="tableleft">止损价：</span></td>
            <td><input name="zsj" type="text" id="zsj"  style="ime-mode:disabled"></td>
            <td align="right">止盈价：</td>
            <td><input name="zyj" type="text" id="zyj"  style="ime-mode:disabled"></td>
            <td><input type="submit" name="button" class="btn2" id="button" value="马上发布"></td>
          </tr>
    </table>
</form>
<div style="margin:5px 0px;"><button class="btn1" onClick="bt_hd_add()">发布喊单</button></div>
<?php
}
if(check_auth('hd_view')){
?>
<table width="100%" cellspacing="0" id="mytable">

      <tr  >
        <th width="30" align="center" bgcolor="#FFFFFF"  style="border-left: 1px solid #CCC;">单号</th>
        <th  align="center" bgcolor="#FFFFFF">开仓时间</th>
        <th  align="center" bgcolor="#FFFFFF">类型</th>
        <th  align="center" bgcolor="#FFFFFF">仓位</th>
        <th  align="center" bgcolor="#FFFFFF">商品</th>
        <th align="center" bgcolor="#FFFFFF">开仓价</th>
        <th align="center" bgcolor="#FFFFFF">止损价</th>
        <th align="center" bgcolor="#FFFFFF">止盈价</th>
        <th align="center" bgcolor="#FFFFFF">平仓时间</th>
        <th align="center" bgcolor="#FFFFFF">平仓价</th>
		<th align="center" bgcolor="#FFFFFF">盈利点数</th>
        <th align="center" bgcolor="#FFFFFF">点赞</th>
        <th align="center" bgcolor="#FFFFFF">分析师</th>
  </tr>
      
<?php
echo app_hd_list(20,$rid,$key,'

    <tr>
    <td align="center" bgcolor="#FFFFFF"  style="border-left: 1px solid #ccc;">{id}</td>
      <td align="center" bgcolor="#FFFFFF"><script>document.write(ftime({ktime})); </script></td>
      <td align="center" bgcolor="#FFFFFF">{lx}</td>
      <td align="center" bgcolor="#FFFFFF">{cw}%&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF">{sp}&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF">{kcj}</td>
      <td align="center" bgcolor="#FFFFFF">{zsj}&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF">{zyj}&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF"><script>document.write(ftime({ptime})); </script></td>
      <td align="center" bgcolor="#FFFFFF">{pcj}&nbsp;</td>
	  <td align="center" bgcolor="#FFFFFF">{yld}&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF">{z} <a href="?id={id}&act=z&rid='.$rid.'">赞</a></td>
      <td align="center" bgcolor="#FFFFFF">{uname}</td>
      
    </tr>
 ')?>   


</table>
<div style="height:30px; line-height:30px;margin-top: 2px;"><?=$pagenav?></div>
<?php
}else{
	echo "<script>top.layer.msg('没有权限查看喊单数据！请联系客服！');</script>";
}
?>

<script type="text/javascript">
    function docheck() {
        
     
      var cw =$.trim($("#cw").val());
      var kcj =$.trim($("#kcj").val());
      var zsj =$.trim($("#zsj").val());
      var zyj =$.trim($("#zyj").val());
if(cw==''){alert('仓位不能为空！');return false}if(kcj==''){alert('开仓价不能为空！');return false}if(zsj==''){alert('止损价不能为空！');return false}if(zyj==''){alert('止盈价不能为空！');return false}
        return true;
    }
       function toPage(url){
  window.location.href=url+'&page='+$("#ToPage").val();
}
</script>
</body>
</html>

