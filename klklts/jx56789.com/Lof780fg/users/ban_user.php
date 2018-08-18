<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
if(stripos(auth_group($_SESSION['login_gid']),'ban_users')===false)exit(denied_pape());
switch($act){
	case "ban_del":
	
         banuser_del($uid); 
                
		header("location:?choice_roomid=".$choice_roomid);
	break;
}
 $nogid='0';
if(!isset($choice_roomid)){
       if(empty($login_roomid)){
 $choice_roomid=0;
 $nogid='0';
    }else{
     $choice_roomid=$login_roomid;
     $nogid='0,2';
    }
  }
  //获取用户分组
$user_group_list=user_group_list($sgid,$nogid);
$room_list_li = room_list_li_each($choice_roomid);
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
function sgid(id){
	var arr=new Array();
	if(isNaN(id)) return '';
	<?php
	$query=$db->query("select * from {$tablepre}auth_group order by id desc");
while($row=$db->fetch_row($query)){
	echo "arr['{$row[id]}']='$row[title]';";
	}
	?>
	return arr[id];
}


</script>
</head>
<body>
<div class="container"  style="width:800px;">
 <ul class="nav-tabs">
      <li class="active"><a href="#">禁言用户</a></li>
      <li><a href="./ban_guest.php">禁言游客</a></li>
  
    </ul> 
<form  class="form-horizontal" action="" method="get"> 
  <ul class="breadcrumb">
  
      
    <li class="active" >
       <span style="color: #F90">房间：</span> <select name="choiceroom" id="choiceroom" OnChange="choice_room(this.value)">   
                       <?=$room_list_li;?>  
                     </select>  &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; 
        
        关键字：
      <input type="text" name="skey" id="rolename"class="abc input-default" placeholder="禁言用户名">
      用户组：
      <select name="sgid" id="sgid" >
			<option value="-1" selected = "selected">全部</option>
            <?=$user_group_list?>
            </select>
     <input type="hidden" name="choice_roomid" value="<?=$choice_roomid?>">
      &nbsp;&nbsp;
      <button type="submit"  class="button ">查询</button>
    
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
        <td width="40" align="center" bgcolor="#FFFFFF">UID</td>
        <td width="19" align="center" bgcolor="#FFFFFF"><input type="checkbox" onClick="$('.ids').attr('checked',this.checked); "></td>
        <td width="80" align="center" bgcolor="#FFFFFF">用户名</td>
        <td width="80" align="center" bgcolor="#FFFFFF">昵称</td>
        <td width="60" align="center" bgcolor="#FFFFFF">用户组</td>
        <td width="80" align="center" bgcolor="#FFFFFF">操作</td>
      </tr>
    </thead>
<?php
$roomsql=$choice_roomid==0?'':" m.roomid=$choice_roomid  and";
$sql="select m.*,ms.*  from {$tablepre}members m,{$tablepre}memberfields ms  where m.uid=ms.uid and  $roomsql  m.banspeak=1";
$skey=trim($skey);
if($skey!=""){
	$sql.=" and m.username like '%$skey%' ";
}

if($sgid!="" && $sgid!="-1" ){
	$sql.=" and m.gid='$sgid'";
}


$sql.=" order by m.uid desc";

echo rebotlist(20,$sql,'
    <tr>
      <td bgcolor="#FFFFFF" align="center">{uid}</td>
	  <td align="center" bgcolor="#FFFFFF"><input type="checkbox" class="ids" name="id[]" value="{uid}"></td>
    <td align="center" bgcolor="#FFFFFF">{username}</td>
   <td align="center" bgcolor="#FFFFFF">{nickname}&nbsp;</td>
       <td align="center" bgcolor="#FFFFFF"><script>document.write(sgid({gid})); </script>&nbsp;</td>
	
      <td align="center" bgcolor="#FFFFFF">
     <button type="button" class="button button-mini button-danger" onclick="if(confirm(\'确定取消该用户禁言？\'))location.href=\'?choice_roomid='.$choice_roomid.'&act=ban_del&uid={uid}\'" ><i class="x-icon x-icon-small icon-trash icon-white"></i>取消禁言</button></td>
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

function choice_room(value){
    
   
   window.location.href="?choice_roomid="+value; 
}
  </script>
</body>
</html>
