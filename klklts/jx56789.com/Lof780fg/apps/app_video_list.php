<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
if(stripos(auth_group($_SESSION['login_gid']),'app_video')===false)exit(denied_pape());
$auth_rule_userdel=false;


switch($act){
	case "video_del":
	if(stripos(auth_group($_SESSION['login_gid']),'app_video')===false)exit(denied_pape());
		 
                    if(is_array($id)){
                video_del(implode(',',$id));  
                } else{
                 video_del($id);   
                }
              
		header("location:?");
	break;
}

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
     <div class="guide_title"><i class="icon-home"></i>&nbsp;视频库</div>
<div class="container"  style=" min-width:1000px;">
   
<form  class="form-horizontal" action="" method="get"> 
  <ul class="breadcrumb">
      <a class="button button-success" id="add_group_bt" style="float: right" href="app_video_add.php">添加视频</a>
      
    <li class="active"><span style="color: #F90">房间：</span> <select name="choiceroom" id="choiceroom" OnChange="choice_room(this.value)">   
                       <?=$room_list_li;?>  
                     </select> &nbsp;&nbsp;&nbsp;&nbsp;关键字：
      <input type="text" name="skey" id="rolename"class="abc input-default" placeholder="视频名称">
     

      &nbsp;&nbsp;
      <button type="submit"  class="button ">查询</button>
   <button type="button"  class="button  button-danger"  onClick="if(confirm('确定删除？'))$('#video_list').submit()">删除所选</button>
 </li>
   
  </ul>
  </form>
    <form action="?" method="POST" enctype="application/x-www-form-urlencoded"  class="form-horizontal" id="video_list">
	
	<input type="hidden" name="act" value="video_del">
  <table  class="table table-bordered table-hover definewidth m10">
    <thead>
      <tr style="font-weight:bold" >
        <td width="40" align="center" bgcolor="#FFFFFF">编号</td>
           <td width="1" align="center" bgcolor="#FFFFFF"><input type="checkbox" onClick="$('.ids').attr('checked',this.checked); "></td>
        <td width="80" align="center" bgcolor="#FFFFFF">视频名称</td>
        <td width="100" align="center" bgcolor="#FFFFFF">视频简介</td>
        <td width="60" align="center" bgcolor="#FFFFFF">视频封面</td>
        <td width="200" align="center" bgcolor="#FFFFFF">视频地址</td>
        <td width="60" align="center" bgcolor="#FFFFFF">时间</td>
        <td width="50" align="center" bgcolor="#FFFFFF">添加者</td>
        <td width="50" align="center" bgcolor="#FFFFFF">操作</td>
      </tr>
    </thead>
<?php
$sql="select * from {$tablepre}video where roomid='$choice_roomid' ";
$skey=trim($skey);
if($skey!=""){
	$sql.=" and (videoname like '%$skey%'  or videodes like '%$skey%'  ) ";
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
  <td align="center" bgcolor="#FFFFFF"><input type="checkbox" class="ids" name="id[]" value="<?=$row['id']?>"></td>
    <td align="center" bgcolor="#FFFFFF" ><?=$row['videoname']?></td>
   <td align="center" bgcolor="#FFFFFF"><?=$row['videodes']?></td>
   <td align="center" bgcolor="#FFFFFF"><img src="<?=$row['cover']?>" width="100"/></td>
    <td align="center" bgcolor="#FFFFFF"><?if($row['livetype']==1){echo $row['localurl'];}else if($row['state']==0){ echo $row['weburl'];}?></td>
    
    <td align="center" bgcolor="#FFFFFF"><?= date('Y-m-d H:i:s',$row['vaddtime'])?></td>
      <td align="center" bgcolor="#FFFFFF"><?=$row['username']?></td>
      <td align="center" bgcolor="#FFFFFF">
          <a class="button button-mini button-info" onclick="openvideo(<?=$row['id']?>)" ><i class="x-icon x-icon-small icon-wrench icon-white"></i>修改</a>
      <button type="button" class="button button-mini button-danger" <? if($row['id']==1){echo 'style="display:none;"';}?> onclick="if(confirm('确定删除该视频吗？'))location.href='?act=video_del&id=<?=$row['id']?>'"><i class="x-icon x-icon-small icon-trash icon-white"></i>删除</button></td>
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
<script type="text/javascript" src="../assets/layer/layer.js"></script>
<script type="text/javascript" src="../assets/js/bui.js"></script> 
<script type="text/javascript" src="../assets/js/config.js"></script> 

<script>
function choice_room(value){
    
    if(value=='0') return;
   window.location.href="?choice_roomid="+value; 
}
function openvideo(id){
	   var title = '编辑视频';
   
        var index = layer.open({
            type: 2,
            title: title,
            area: ['800px', '600px'],
            content: "app_video_edit.php?id="+id
        
        });
      // layer.full(index);
}
  </script>
</body>
</html>
