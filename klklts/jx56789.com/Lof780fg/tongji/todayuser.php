<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
if(stripos(auth_group($_SESSION['login_gid']),'tongji_today')===false)exit(denied_pape());
require_once '../../include/IpLocation.class.php';
$Ip = new \Org\Net\IpLocation('UTFWry.dat'); // 实例化类 参数表示IP地址库文件
$rid_sql= empty($login_roomid)?'':" and rid='$login_roomid'";
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
.tuiguang{text-decoration:none;color:#F90 !important;font-size: 11px;float: right; cursor:pointer;}
a:hover{text-decoration:none;/*指鼠标在链接*/}a:active{text-decoration:none;}/* 指正在点的链接*/ 
.fuser{    float: left;
    height: 30px;
    line-height: 30px;
    font-size: 13px;}

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
<div class="container"  style="width:1000px;">
   <ul class="nav-tabs">
      <li class="active"><a href="#">会员</a></li>
      <li><a href="./todayvisitor.php">游客</a></li>
  
    </ul> 

     
  <ul class="breadcrumb">
       <?=$fan?>
      <li class="active"></li>

  </ul>


  <table  class="table table-bordered table-hover definewidth m10">
    <thead>
      <tr style="font-weight:bold" class="m-table-th-bg">
        <td width="100" align="center" bgcolor="#FFFFFF">访问时间</td>
         <td width="100" align="center" bgcolor="#FFFFFF">访问房间</td>
        <td width="80" align="center" bgcolor="#FFFFFF">用户ID</td>
        <td  width="80" align="center" bgcolor="#FFFFFF">用户名</td>
        <td width="80" align="center" bgcolor="#FFFFFF">IP</td>
	<td width="100" align="center" bgcolor="#FFFFFF">地区</td>
        <td width="200" align="center" bgcolor="#FFFFFF">页面来源</td>
       
      </tr>
    </thead>
<?php
$beginToday=mktime(0,0,0,date('m'),date('d'),date('Y'));
$sql="select *  from {$tablepre}msgs  where ugid!=0 and type=3 and mtime>$beginToday $rid_sql order by mtime desc ";



global $db,$tablepre,$firstcount,$displaypg;
           $num=20;
	$count=$db->num_rows($db->query($sql));
	pageft($count,$num,"");
	$sql.=" limit $firstcount,$displaypg";
	$query=$db->query($sql);
        while($row=$db->fetch_row($query)){
     
       ?>
    <tr>
         <td align="center" bgcolor="#FFFFFF"><script>document.write(ftime("<?=$row['mtime']?>")); </script></td>
         <td bgcolor="#FFFFFF" align="center"><?=$row['rid']?></td>
      <td bgcolor="#FFFFFF" align="center"><?=$row['uid']?></td>
       <td bgcolor="#FFFFFF" align="center"><?=$row['uname']?></td>
       <td bgcolor="#FFFFFF" align="center"><?=$row['ip']?></td>
       <td bgcolor="#FFFFFF" align="center"><?php $area =$Ip->getlocation($row['ip']);$iparea=$area['country'].$area['area']; echo $iparea;?></td>
       <td bgcolor="#FFFFFF" align="center"><?=$row['laiyuan']?></td>


    </tr>

<? }?>

  </table>
 
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
            title:'用户设置',
            width:630,
            height:600,
            buttons:[],
            bodyContent:''
          });
});
function openUser(id,type){
	dialog.set('bodyContent','<iframe src="user_edit.php?id='+id+'&gid='+type+'" scrolling="yes" frameborder="0" height="100%" width="100%"></iframe>');
	dialog.updateContent();
	dialog.show();
}

BUI.use('bui/overlay',function(Overlay){
            dialog3 = new Overlay.Dialog({
            title:'导出excel',
            width:600,
            height:240,
            buttons:[],
            bodyContent:''
          });
});
function doexcel(){
	dialog3.set('bodyContent','<iframe src="doexcel_myuser.php" scrolling="yes" frameborder="0" height="100%" width="100%"></iframe>');
	dialog3.updateContent();
	dialog3.show();
}
  </script>
</body>
</html>
