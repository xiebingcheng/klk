<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
if(stripos(auth_group($_SESSION['login_gid']),'room_lists')===false)exit(denied_pape());
$auth_rule_userdel=false;


switch($act){
	case "room_del":
	if(stripos(auth_group($_SESSION['login_gid']),'room_adddel')===false)exit(denied_pape());
		 
                    room_del($id); 
              
		header("location:?");
	break;
}

$query=$db->query("select id,title from {$tablepre}auth_group where id not in (2,3,4) order by id desc");
while($row=$db->fetch_row($query)){
	$group.='<option value="'.$row[id].'">'.$row[title].'</option>';
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
     <div class="guide_title"><i class="icon-home"></i>&nbsp;房间列表</div>
<div class="container"  style=" min-width:1000px;">
   
<form  class="form-horizontal" action="" method="get"> 
  <ul class="breadcrumb">
      <a class="button button-success" id="add_group_bt" style="float: right" href="rooms_add.php">添加房间</a>
      
    <li class="active">关键字：
      <input type="text" name="skey" id="rolename"class="abc input-default" placeholder="房间号码或者房间名称">
     

      &nbsp;&nbsp;
      <button type="submit"  class="button ">查询</button>
 
 </li>
   
  </ul>
  </form>
    <form action="" method="POST" enctype="application/x-www-form-urlencoded"  class="form-horizontal" id="hd_list">
	<input type="hidden" name="gid" value="<?=$gid?>">
	<input type="hidden" name="act" value="rebots_del">
  <table  class="table table-bordered table-hover definewidth m10">
    <thead>
      <tr style="font-weight:bold" >
        <td width="40" align="center" bgcolor="#FFFFFF">编号</td>
        <td width="80" align="center" bgcolor="#FFFFFF">房间号码</td>
        <td width="60" align="center" bgcolor="#FFFFFF">房间名称</td>
        <td width="60" align="center" bgcolor="#FFFFFF">房间封面</td>
        <td width="60" align="center" bgcolor="#FFFFFF">房间状态</td>
        <td width="60" align="center" bgcolor="#FFFFFF">直播视频源</td>
        <td width="100" align="center" bgcolor="#FFFFFF">游客体验时间</td>
        <td width="100" align="center" bgcolor="#FFFFFF">房间链接</td>
      <td width="120" align="center" bgcolor="#FFFFFF">操作</td>
      </tr>
    </thead>
<?php
$sql="select * from {$tablepre}config where 1=1 $room_sql ";
$skey=trim($skey);
if($skey!=""){
	$sql.=" and (roomid like '%$skey%'  or title like '%$skey%'  ) ";
}

$sql.=" order by id desc";
if(!$auth_rule_userdel)$display_delbutton='style="display:none"';

global $firstcount,$displaypg;
           $num=20;
	$count=$db->num_rows($db->query($sql));
	pageft($count,$num,"");
	$sql.=" limit $firstcount,$displaypg";
	$query=$db->query($sql);
        while($row=$db->fetch_row($query)){
    ?>
    <tr>
      <td bgcolor="#FFFFFF" align="center"><?=$row['id']?></td>

    <td align="center" bgcolor="#FFFFFF" ><?=$row['roomid']?></td>
   <td align="center" bgcolor="#FFFFFF"><?=$row['title']?></td>
   <td align="center" bgcolor="#FFFFFF"><img src="<?=$row['cover']?>" width="100"/></td>
    <td align="center" bgcolor="#FFFFFF"><?if($row['state']==1){echo '开启';}else if($row['state']==0){echo '关闭';}else if($row['state']==2){echo '加密';}else{echo '开启时间';}?></td>
    
    <td align="center" bgcolor="#FFFFFF"><? if($row['livetype']==1){echo 'YY转播';}else{echo '流媒体直播';} ?></td>
      <td align="center" bgcolor="#FFFFFF"><?if($row['tiyantime']!=0){echo  $row['tiyantime'].'分钟';}else{echo '无限制';}?></td>
      <td align="center" bgcolor="#FFFFFF"><a href="<?='http://'.$_SERVER['HTTP_HOST'].'/'.$row['roomid']?>" target="_blank"><?='http://'.$_SERVER['HTTP_HOST'].'/'.$row['roomid']?></a></td>
      <td align="center" bgcolor="#FFFFFF">
      <a class="button button-mini button-info" href="rooms_edit.php?id=<?=$row['id']?>" ><i class="x-icon x-icon-small icon-wrench icon-white"></i>修改</a>
      <button type="button" class="button button-mini button-danger" <? if($row['id']==1){echo 'style="display:none;"';}?> onclick="if(confirm('确定删除该房间吗？'))location.href='?act=room_del&id=<?=$row['id']?>'"><i class="x-icon x-icon-small icon-trash icon-white"></i>删除</button></td>
    </tr>
<? }?>


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
            dialog2 = new Overlay.Dialog({
            title:'添加机器人',
            width:630,
            height:470,
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
            width:600,
            height:230,
            buttons:[],
            bodyContent:''
          });
});
function doexcel(){
	dialog3.set('bodyContent','<iframe src="dotxt.php" scrolling="yes" frameborder="0" height="100%" width="100%"></iframe>');
	dialog3.updateContent();
	dialog3.show();
}
  </script>
</body>
</html>
