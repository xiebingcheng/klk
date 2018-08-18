<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
if(stripos(auth_group($_SESSION['login_gid']),'apps_hongbao')===false)exit(denied_pape());
function hongbao_del($ids){
    global $db,$tablepre;
       if($ids=="")return;
	$db->query("delete from {$tablepre}sendhongbao where id  in ($ids)");
}
switch($act){
	case "rotate_del":
	   if(is_array($id)){
                  hongbao_del(implode(',',$id));  
                }
		else{
                    
                    hongbao_del($id); 
                }
		header("location:?");
	break;
     
}
if(!isset($choice_roomid)){
       if(empty($login_roomid)){
 $choice_roomid=0;

    }else{
     $choice_roomid=$login_roomid;

    }
  }

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

</head>
<body>
<div class="container"  style="width:850px;">
    <div class="guide_title"><img src="../assets/img/hongbao.png" width="25px" height="25px"/>&nbsp;红包统计</div>
<form  class="form-horizontal" action="" method="get"> 
  <ul class="breadcrumb">
   <li class="active"><span style="color: #F90">房间：</span> <select name="choiceroom" id="choiceroom" OnChange="choice_room(this.value)">   
                       <?=$room_list_li;?>  
                     </select> &nbsp;&nbsp;&nbsp;&nbsp;关键字：
      <input type="text" name="skey" id="rolename"class="abc input-default" placeholder="发送人">
     

      &nbsp;&nbsp;
      <input type="hidden" name="choice_roomid" value="<?=$choice_roomid?>">
      <button type="submit"  class="button ">查询</button>
  
      <button type="button"  class="button  button-danger"  onClick="if(confirm('确定删除？'))$('#hongbao_list').submit()">删除所选</button>
 </li>
   
  </ul>
  </form>
   <form action="" method="POST" enctype="application/x-www-form-urlencoded"  class="form-horizontal" id="hongbao_list">
	<input type="hidden" name="act" value="rotate_del">
  <table  class="table table-bordered table-hover definewidth m10">
    <thead>
      <tr style="font-weight:bold" >
        <td width="20" align="center" bgcolor="#FFFFFF">ID</td>
        <td width="19" align="center" bgcolor="#FFFFFF"><input type="checkbox" onClick="$('.ids').attr('checked',this.checked); "></td>
        <td width="60" align="center" bgcolor="#FFFFFF">金额</td>
        <td  width="100" align="center" bgcolor="#FFFFFF">发送人</td>
        <td width="140" align="center" bgcolor="#FFFFFF">发送时间</td>
	<td width="40" align="center" bgcolor="#FFFFFF">数量</td>
        <td width="170" align="center" bgcolor="#FFFFFF">红包留言</td>
        <td width="170" align="center" bgcolor="#FFFFFF">房间</td>
        <td width="120" align="center" bgcolor="#FFFFFF">操作</td>
      </tr>
    </thead>
<?php
 $roomsql=$choice_roomid==0?'':"  and s.roomid=$choice_roomid" ;
$sql="select s.*,m.nickname from {$tablepre}sendhongbao s,{$tablepre}memberfields m where s.senduid=m.uid  $roomsql ";
$skey=trim($skey);
if($skey!=""){
	$sql.=" and m.nickname like '%$skey%' ";
}


$sql.=" order by s.addtime desc";


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
 <td align="center" bgcolor="#FFFFFF"><?=$row['realmoney']?>&nbsp;</td>
	  <td align="center" bgcolor="#FFFFFF"><?=$row['nickname']?>&nbsp;</td>
            <td align="center" bgcolor="#FFFFFF"><?=date('Y-m-d H:i:s',$row['addtime'])?>&nbsp;</td>
            <td align="center" bgcolor="#FFFFFF"><?=$row['realnumber']?>&nbsp;</td>
     <td align="center" bgcolor="#FFFFFF"><?=$row['beizhu']?>&nbsp;</td>
     <td align="center" bgcolor="#FFFFFF"><?=$row['roomid']?>&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF">
     <button  type="button" class="button button-mini button-success" onClick="editcourse(<?=$row['id']?>)"><i class="x-icon x-icon-small icon-trash icon-white"></i>详细</button>
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
<script type="text/javascript">
BUI.use('bui/overlay',function(Overlay){
            dialog = new Overlay.Dialog({
            title:'查看当前抢红包的人',
            width:450,
            height:530,
            buttons:[],
            bodyContent:''
          });
		  
});


function editcourse(id){
	dialog.set('bodyContent','<iframe src="app_hongbao_info.php?hbid='+id+'" scrolling="yes" frameborder="0" height="100%" width="100%"></iframe>');
	dialog.updateContent();
	dialog.show();
}
function choice_room(value){
    
  
   window.location.href="?choice_roomid="+value; 
}
      </script>
</body>
</html>
