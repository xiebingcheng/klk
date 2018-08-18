<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
if(stripos(auth_group($_SESSION['login_gid']),'robot_edit')===false)exit(denied_pape());
if($act=="rebot_edit"){
    if(is_array($week)){
               $week=implode(',',$week);  
                }
	rebot_edit($id,$rebotname,$gid,$sex,$shour,$sminute,$ssecond,$xhour,$xminute,$xsecond,$week,$roomid);
          echo "<script>window.parent.dialog.close();alert('机器人修改成功！');window.parent.location.reload();</script>";
}
  //获取用户分组
$user_group_list=user_group_list($gid,'2,3,4,17');

$query=$db->query("select * from {$tablepre}rebot_custom where id='{$id}'");
 $userinfo=$db->fetch_row($query);
$shour=$sminute=$ssecond=$xhour=$xminute=$xsecond=0;
//上线时间转为为时分秒
 if($userinfo['shangxian']>60*60){
     $shour=floor($userinfo['shangxian']/(60*60));
 }
 $yu=$userinfo['shangxian']-$shour*60*60;
  if($yu>60){
     $sminute=floor($yu/60);
 }
 $ssecond=$yu- $sminute*60;

    
 //下线时间转化为时分秒
     if($userinfo['xiaxian']>60*60){
     $xhour=floor($userinfo['xiaxian']/(60*60));
 }
 $yu=$userinfo['xiaxian']-$xhour*60*60;
  if($yu>60){
     $xminute=floor($yu/60);
 }
 $xsecond=$yu- $xminute*60;
  
 for($i=0;$i<24;$i++){
     if($i==$shour){$selected='selected';}else{$selected='';}
   $shour_list.='<option value="'.$i.'"'.$selected.'>'.$i.'</option>'; 
   if($i==$xhour){$selected='selected';}else{$selected='';}
   $xhour_list.='<option value="'.$i.'"'.$selected.'>'.$i.'</option>'; 
    }
 for($i=0;$i<60;$i++){
     if($i==$sminute){$selected='selected';}else{$selected='';}
   $sminute_list.='<option value="'.$i.'"'.$selected.'>'.$i.'</option>'; 
    if($i==$xminute){$selected='selected';}else{$selected='';}
   $xminute_list.='<option value="'.$i.'"'.$selected.'>'.$i.'</option>'; 
    }
    for($i=0;$i<60;$i++){
     if($i==$ssecond){$selected='selected';}else{$selected='';}
   $ssecond_list.='<option value="'.$i.'"'.$selected.'>'.$i.'</option>'; 
    if($i==$xsecond){$selected='selected';}else{$selected='';}
   $xsecond_list.='<option value="'.$i.'"'.$selected.'>'.$i.'</option>'; 
    }
     if(!empty($login_roomid)){
        $query=$db->query("select * from {$tablepre}config where roomid='$login_roomid'");   
     
    }else{
        $query=$db->query("select * from {$tablepre}config");

    }
while($roomlist=$db->fetch_row($query)){
    if($roomlist['roomid']==$userinfo['roomid']){$selected='selected';}else{$selected='';}
	$room_list_li.='<option value="'.$roomlist['roomid'].'"'.$selected.'>'.$roomlist['title'].'</option>';
}
 ?>

<!DOCTYPE HTML>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
<link href="../assets/css/bui-min.css" rel="stylesheet" type="text/css" />
<link href="../assets/css/page-min.css" rel="stylesheet" type="text/css" />
<!-- 下面的样式，仅是为了显示代码，而不应该在项目中使用-->
<link href="../assets/css/prettify.css" rel="stylesheet" type="text/css" />
<style type="text/css">
code { padding: 0px 4px; color: #d14; background-color: #f7f7f9; border: 1px solid #e1e1e8; }
input,select{vertical-align:middle;}
.liw { width:160px; height:25px; line-height:25px;}
</style>
</head>
<body>
<div class="container" style="margin-bottom:50px;">
<form action="?id=<?=$userinfo['id']?>" method="post" enctype="application/x-www-form-urlencoded">
  <ul class="breadcrumb">
<table class="table table-bordered table-hover definewidth m10">
	
		  <tr>
            <td width="80" class="tableleft" style="width:70px;">机器人名称：</td>
            <td><input name="rebotname" type="text" id="rebotname" style="width:140px;" value="<?=$userinfo['rebotname']?>" placeholder="汉字、数字、字母组合" onkeyup="value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5]/g,'')"/></td>
          </tr>
          <tr>
            <td width="80" class="tableleft">用 户 组：</td>
            <td><select name="gid" id="gid" >
	      <?=$user_group_list?>
            </select>&nbsp;</td>
          </tr>
          <tr>
            <td width="80" class="tableleft">房间：</td>
            <td><select name="roomid" id="roomid" >
	      <?=$room_list_li?>
            </select>&nbsp;</td>
          </tr>
          <tr>
            <td width="80" class="tableleft">性别：</td>
            <td><label class="radio"><input name="sex" type="radio" value="1"  <? if($userinfo['sex']==1) echo 'checked'; ?> />男 </label>&nbsp;&nbsp;&nbsp;&nbsp;
<label class="radio"><input name="sex" type="radio" value="0"  <? if($userinfo['sex']==0) echo 'checked'; ?>/>女</label></td>
          </tr>
          <tr>
            <td width="80" class="tableleft">上线时间：</td>
            <td>
                <input type="checkbox" name="week[]" value="1" <? if(strpos($userinfo['week'],'1')!== false) echo 'checked="checked"'; ?>/>星期一&nbsp;
                <input type="checkbox" name="week[]" value="2" <? if(strpos($userinfo['week'],'2')!== false) echo 'checked="checked"'; ?>/>星期二&nbsp;
                <input type="checkbox" name="week[]" value="3" <? if(strpos($userinfo['week'],'3')!== false) echo 'checked="checked"'; ?> />星期三&nbsp;
                <input type="checkbox" name="week[]" value="4" <? if(strpos($userinfo['week'],'4')!== false) echo 'checked="checked"'; ?>/>星期四&nbsp;
                <input type="checkbox" name="week[]" value="5" <? if(strpos($userinfo['week'],'5')!== false) echo 'checked="checked"'; ?>/>星期五&nbsp;
                <input type="checkbox" name="week[]" value="6" <? if(strpos($userinfo['week'],'6')!== false) echo 'checked="checked"'; ?>/>星期六&nbsp;
                <input type="checkbox" name="week[]" value="7" <? if(strpos($userinfo['week'],'7')!== false) echo 'checked="checked"'; ?>/>星期日
                <br/><br/>
                <select name="shour" id="shour" style="width:70px;" ><?=$shour_list?></select>&nbsp;<label class="control-label">时</label>
                 <select name="sminute" id="sminute" style="width:70px;" ><?=$sminute_list?></select>&nbsp;<label class="control-label">分</label>
               <select name="ssecond" id="ssecond" style="width:70px;" ><?=$ssecond_list?></select>&nbsp;<label class="control-label">秒</label>
              </td>
          </tr>
          <tr>
            <td width="80" class="tableleft">下线时间：</td>
           <td>
                <select name="xhour" id="xhour" style="width:70px;" ><?=$xhour_list?></select>&nbsp;<label class="control-label">时</label>
                 <select name="xminute" id="xminute" style="width:70px;" ><?=$xminute_list?></select>&nbsp;<label class="control-label">分</label>
               <select name="xsecond" id="xsecond" style="width:70px;" ><?=$xsecond_list?></select>&nbsp;<label class="control-label">秒</label>
              </td>
          </tr>
     </table>

  </ul>
  <div style="position:fixed; bottom:0; background: #FFF; width:100%; padding-top:5px;">
    <button type="submit"  class="button button-success">确定</button>
    <button type="button"  class="button" onclick="window.parent.dialog.close()">关闭</button>
    <input type="hidden" name="act" value="rebot_edit">
</div>
  </form>

</div>
<script type="text/javascript" src="../assets/js/jquery-1.8.1.min.js"></script> 
<script type="text/javascript" src="../assets/js/bui.js"></script> 
<script type="text/javascript" src="../assets/js/config.js"></script> 
<script type="text/javascript" src="../../upload/swfupload/swfupload.js"></script> 
<script>

</script>
</body>
</html>
