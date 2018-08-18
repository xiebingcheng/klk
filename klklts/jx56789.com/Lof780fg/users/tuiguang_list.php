<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
if(stripos(auth_group($_SESSION['login_gid']),'users_tuiguang')===false)exit(denied_pape());
$auth_rule_userdel=false;
if(stripos(auth_group($_SESSION['login_gid']),'users_del')!==false)$auth_rule_userdel=true;



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
function ftime(time){
	return new Date(time*1000).Format("yyyy-MM-dd hh:mm"); ; 
}
function ftime2(time){
	if(time>(60*60*24)) return parseInt(time/(60*60*24))+"天";
	else if(time>(60*60))return parseInt(time/(60*60))+"小时";
	else if(time>60)return parseInt(time/60)+"分钟";
	else return parseInt(time)+"秒";
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
<div class="container"  style="width:900px;">

    <form action="" method="POST" enctype="application/x-www-form-urlencoded"  class="form-horizontal" id="hd_list">
	<input type="hidden" name="gid" value="<?=$gid?>">
	<input type="hidden" name="act" value="user_del">
  <table  class="table table-bordered table-hover definewidth m10">
    <thead>
      <tr style="font-weight:bold" >
  
        <td width="80" align="center" bgcolor="#FFFFFF">用户名</td>
        <td align="center" bgcolor="#FFFFFF">昵称</td>
        <td width="80" align="center" bgcolor="#FFFFFF">手机</td>
		<td width="80" align="center" bgcolor="#FFFFFF">QQ</td>
        <td width="60" align="center" bgcolor="#FFFFFF">用户组</td>
        <td width="60" align="center" bgcolor="#FFFFFF">用户归属</td>
        <td width="60" align="center" bgcolor="#FFFFFF">推广人</td>
        <td width="100" align="center" bgcolor="#FFFFFF">注册时间</td>
        <td width="100" align="center" bgcolor="#FFFFFF">最近登录</td>
      
      </tr>
    </thead>
<?php
$room_sql= empty($login_roomid)?'':" and m.roomid='$login_roomid'";
$sql="select m.*,ms.*  from {$tablepre}members m,{$tablepre}memberfields ms  where m.uid=ms.uid and m.uid!=0 and m.tuser='$tuser' $room_sql ";
if($starttime!=""){
    $int_starttime =strtotime($starttime);
  
    $sql.=" and regdate>='$int_starttime'";
    
    }
    if($endtime!=""){
    $int_endtime =strtotime($endtime)+24*3600;;

    $sql.=" and regdate<'$int_endtime'";
    
    }
$sql.=" order by m.uid desc";
if(!$auth_rule_userdel)$display_delbutton='style="display:none"';
echo userlist(15,$sql,'
    <tr>

      <td align="center" bgcolor="#FFFFFF">{username}</td>
      <td align="center" bgcolor="#FFFFFF">{nickname}</td>
	  <td align="center" bgcolor="#FFFFFF">{phone}&nbsp;</td>
	  <td align="center" bgcolor="#FFFFFF">{realname}&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF"><script>document.write(sgid({gid})); </script>&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF">{fuser}&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF">{tuser}&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF"><script>document.write(ftime({regdate})); </script></td>
      <td align="center" bgcolor="#FFFFFF" title="登录IP:{regip}" onClick="alert(\'登录IP:{regip}\')"><script>document.write(ftime({lastactivity})); </script></td>

    </tr>
')?>
 

  </table>
 
    </form> 
    <ul class="breadcrumb">
    <li class="active"><?=$pagenav?>
    </li>
  </ul>
             <button type="button"  class="button" onclick="window.parent.dialog.close()">关闭</button>
</div>
<script type="text/javascript" src="../assets/js/jquery-1.8.1.min.js"></script> 
<script type="text/javascript" src="../assets/js/bui.js"></script> 
<script type="text/javascript" src="../assets/js/config.js"></script> 
<script type="text/javascript" src="../../upload/swfupload/swfupload.js"></script> 
<script>
    
BUI.use('bui/overlay',function(Overlay){
            dialog = new Overlay.Dialog({
            title:'推广的用户列表',
            width:630,
            height:600,
            buttons:[],
            bodyContent:''
          });
});
function openUser(tuser){
	dialog.set('bodyContent','<iframe src="user_edit.php" scrolling="yes" frameborder="0" height="100%" width="100%"></iframe>');
	dialog.updateContent();
	dialog.show();
}

  </script>
</body>
</html>
