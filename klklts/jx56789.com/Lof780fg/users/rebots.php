<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
if(stripos(auth_group($_SESSION['login_gid']),'robot_list')===false)exit(denied_pape());
$auth_rule_userdel=false;
if(stripos(auth_group($_SESSION['login_gid']),'robot_del')!==false)$auth_rule_userdel=true;

switch($act){
	case "rebots_del":
		if(stripos(auth_group($_SESSION['login_gid']),'robot_del')===false)exit(denied_pape());
		  if(is_array($id)){
                  rebots_del(implode(',',$id));  
                }
		else{
                    rebots_del($id); 
                }
		header("location:?choice_roomid=".$choice_roomid."&sgid=".$sgid);
	break;
}

  //获取用户分组
$user_group_list=user_group_list($sgid,'2,3,4,17');
if(!isset($choice_roomid)){
       if(empty($login_roomid)){
 $choice_roomid=$default_roomid;
    }else{
     $choice_roomid=$login_roomid;
    }
  }

$room_list_li = room_list_li($choice_roomid);
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
</style>
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

function ftime2(time){
    var hour=0;
    var minute=0;
    var second=0;
       if(time>(60*60)){
        hour=parseInt(time/(60*60));
       }
       var yu=time-hour*60*60;
        if(yu>60){
           minute =parseInt(yu/60);}
         second=yu-minute*60;
        second   = second.toString()  
        if(second.length<2){
            second='0'+second;
        }
        minute   = minute.toString()  
        if(minute.length<2){
            minute='0'+minute;
        }
	 return hour+":"+minute+":"+second;
}

</script>
</head>
<body>
<div class="container"  style=" min-width:1000px;">
    <div class="guide_title"><img src="../assets/img/rebot.png" width="25px" height="25px"/>&nbsp;全部机器人</div>
<form  class="form-horizontal" action="" method="get"> 
  <ul class="breadcrumb">
      <button type="button" class="button button-success" id="add_group_bt" style="float: right" onclick="addUser()">添加机器人</button>
      
    <li class="active" >
       <span style="color: #F90">房间：</span> <select name="choiceroom" id="choiceroom" OnChange="choice_room(this.value)">   
                       <?=$room_list_li;?>  
                     </select>  &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; 
        
        关键字：
      <input type="text" name="skey" id="rolename"class="abc input-default" placeholder="机器人名称">
      用户组：
      <select name="sgid" id="sgid" >
			<option value="-1" selected = "selected">全部</option>
            <?=$user_group_list?>
            </select>
     <input type="hidden" name="choice_roomid" value="<?=$choice_roomid?>">
      &nbsp;&nbsp;
      <button type="submit"  class="button ">查询</button>
       <button type="button" class="button button-success"  onclick="doexcel()">导入机器人</button>
      <button type="button"  class="button  button-danger"  onClick="if(confirm('确定删除？'))$('#hd_list').submit()">删除所选</button>
 </li>
   
  </ul>
  </form>
    <form action="" method="POST" enctype="application/x-www-form-urlencoded"  class="form-horizontal" id="hd_list">
	<input type="hidden" name="sgid" value="<?=$sgid?>">
	<input type="hidden" name="act" value="rebots_del">
         <input type="hidden" name="choice_roomid" value="<?=$choice_roomid?>">
  <table  class="table table-bordered table-hover definewidth m10">
    <thead>
      <tr style="font-weight:bold" class="m-table-th-bg">
        <td width="40" align="center" bgcolor="#FFFFFF">机器人ID</td>
        <td width="19" align="center" bgcolor="#FFFFFF"><input type="checkbox" onClick="$('.ids').attr('checked',this.checked); "></td>
        <td width="80" align="center" bgcolor="#FFFFFF">机器人名称</td>
        <td width="60" align="center" bgcolor="#FFFFFF">用户组</td>
        <td width="60" align="center" bgcolor="#FFFFFF">用户组图标</td>
        <td width="60" align="center" bgcolor="#FFFFFF">性别</td>
        <td width="100" align="center" bgcolor="#FFFFFF">上线时间</td>
        <td width="100" align="center" bgcolor="#FFFFFF">下线时间</td>
        <td width="120" align="center" bgcolor="#FFFFFF">操作</td>
      </tr>
    </thead>
<?php
$sql="select r.*,a.title,a.ico from {$tablepre}rebot_custom r,{$tablepre}auth_group a  where r.roomid='$choice_roomid' and  r.gid=a.id ";
$skey=trim($skey);
if($skey!=""){
	$sql.=" and r.rebotname like '%$skey%' ";
}

if($sgid!="" && $sgid!="-1" ){
	$sql.=" and r.gid='$sgid'";
}


$sql.=" order by id desc";
if(!$auth_rule_userdel)$display_delbutton='style="display:none"';
echo rebotlist(20,$sql,'
    <tr>
      <td bgcolor="#FFFFFF" align="center">{id}</td>
	  <td align="center" bgcolor="#FFFFFF"><input type="checkbox" class="ids" name="id[]" value="{id}"></td>
    <td align="center" bgcolor="#FFFFFF">{rebotname}</td>
   <td align="center" bgcolor="#FFFFFF">{title}&nbsp;</td>
    <td align="center" bgcolor="#FFFFFF">{ico}&nbsp;</td>
	  <td align="center" bgcolor="#FFFFFF">{sex}&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF"><script>document.write(ftime2({shangxian})); </script></td>
      <td align="center" bgcolor="#FFFFFF"><script>document.write(ftime2({xiaxian})); </script></td>
      <td align="center" bgcolor="#FFFFFF">
      <button type="button" class="button button-mini button-info" onClick="openUser({id},{gid})" ><i class="x-icon x-icon-small icon-wrench icon-white"></i>修改</button>
      <button type="button" class="button button-mini button-danger" onclick="if(confirm(\'确定删除用户？\'))location.href=\'?choice_roomid='.$choice_roomid.'&act=rebots_del&id={id}\'" '.$display_delbutton.'><i class="x-icon x-icon-small icon-trash icon-white"></i>删除</button></td>
    </tr>
')?>


  </table>
    </form> 
    <ul class="breadcrumb">
    <li class="active"><?=$pagenav?>
    </li>
  </ul>
</div>
<script type="text/javascript" src="../assets/js/jquery-1.8.1.min.js"></script> 
<script type="text/javascript" src="../assets/js/bui.js"></script> 
<script type="text/javascript" src="../assets/js/config.js"></script> 
<script type="text/javascript" src="../../upload/swfupload/swfupload.js"></script> 
<script>
    
BUI.use('bui/overlay',function(Overlay){
            dialog = new Overlay.Dialog({
            title:'机器人设置',
            width:630,
            height:570,
            buttons:[],
            bodyContent:''
          });
});
function openUser(id,type){
	dialog.set('bodyContent','<iframe src="rebot_edit.php?id='+id+'&gid='+type+'" scrolling="yes" frameborder="0" height="100%" width="100%"></iframe>');
	dialog.updateContent();
	dialog.show();
}
BUI.use('bui/overlay',function(Overlay){
            dialog2 = new Overlay.Dialog({
            title:'添加机器人',
            width:630,
            height:570,
            buttons:[],
            bodyContent:''
          });
});
function addUser(){
	dialog2.set('bodyContent','<iframe src="rebot_add.php" scrolling="yes" frameborder="0" height="100%" width="100%"></iframe>');
	dialog2.updateContent();
	dialog2.show();
}
BUI.use('bui/overlay',function(Overlay){
            dialog3 = new Overlay.Dialog({
            title:'导入机器人',
            width:400,
            height:350,
            buttons:[],
            bodyContent:''
          });
});
function doexcel(){
	dialog3.set('bodyContent','<iframe src="dotxt.php" scrolling="yes" frameborder="0" height="100%" width="100%"></iframe>');
	dialog3.updateContent();
	dialog3.show();
}
function choice_room(value){
    
    if(value=='0') return;
   window.location.href="?choice_roomid="+value; 
}
  </script>
</body>
</html>
