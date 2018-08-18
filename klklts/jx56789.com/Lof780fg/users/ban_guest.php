<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
if(stripos(auth_group($_SESSION['login_gid']),'ban_users')===false)exit(denied_pape());
switch($act){
	case "ban_del":
	
         banguest_del($uid); 
                
		header("location:?choice_roomid=".$choice_roomid);
	break;
}

if(!isset($choice_roomid)){
       if(empty($login_roomid)){
 $choice_roomid=0;

    }else{
     $choice_roomid=$login_roomid;
    
    }
  }
  //获取用户分组

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
     <li ><a href="./ban_user.php">禁言用户</a></li>
      <li class="active"><a href="#">禁言游客</a></li>
  
    </ul> 
<form  class="form-horizontal" action="" method="get"> 
  <ul class="breadcrumb">
  
      
    <li class="active" >
       <span style="color: #F90">房间：</span> <select name="choiceroom" id="choiceroom" OnChange="choice_room(this.value)">   
                       <?=$room_list_li;?>  
                     </select>  &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; 
        
        关键字：
      <input type="text" name="skey" id="rolename"class="abc input-default" placeholder="禁言用户名">
     
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
$roomsql=$choice_roomid==0?'':" roomid=$choice_roomid  and";
$sql="select *  from {$tablepre}guest  where   $roomsql  banspeak=1";
$skey=trim($skey);
if($skey!=""){
	$sql.=" and username like '%$skey%' ";
}

$sql.=" order by uid desc";

echo rebotlist(20,$sql,'
    <tr>
      <td bgcolor="#FFFFFF" align="center">{guestuid}</td>
	  <td align="center" bgcolor="#FFFFFF"><input type="checkbox" class="ids" name="id[]" value="{guestuid}"></td>
    <td align="center" bgcolor="#FFFFFF">{username}</td>
   <td align="center" bgcolor="#FFFFFF">{username}&nbsp;</td>
       <td align="center" bgcolor="#FFFFFF">游客</td>
	
      <td align="center" bgcolor="#FFFFFF">
     <button type="button" class="button button-mini button-danger" onclick="if(confirm(\'确定取消该用户禁言？\'))location.href=\'?choice_roomid='.$choice_roomid.'&act=ban_del&uid={guestuid}\'" ><i class="x-icon x-icon-small icon-trash icon-white"></i>取消禁言</button></td>
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
