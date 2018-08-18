<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
if(stripos(auth_group($_SESSION['login_gid']),'apps_rotate')===false)exit(denied_pape());
function rotate_del($ids){
    global $db,$tablepre;
       if($ids=="")return;
	$db->query("delete from {$tablepre}rotate where id  in ($ids)");
}
switch($act){
	case "rotate_del":
	   if(is_array($id)){
                  rotate_del(implode(',',$id));  
                }
		else{
                    
                    rotate_del($id); 
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
<link href="../assets/css/prettify.css" rel="stylesheet" type="text/css" />
<style type="text/css">
code { padding: 0px 4px; color: #d14; background-color: #f7f7f9; border: 1px solid #e1e1e8; }
</style>

</head>
<body>
<div class="container"  style="width:800px;">
    <div class="guide_title"><img src="../assets/img/rebot.png" width="25px" height="25px"/>&nbsp;全部抽奖记录</div>
<form  class="form-horizontal" action="" method="get"> 
  <ul class="breadcrumb">
  
      <li class="active"><a style="margin-right:30px;color: #319dfc;text-decoration: none;" href="app_rotate.php"><<返回</a> <span style="color: #F90">房间：</span> <select name="choiceroom" id="choiceroom" OnChange="choice_room(this.value)">   
                       <?=$room_list_li;?>  
                     </select> &nbsp;&nbsp;&nbsp;&nbsp;关键字：
      <input type="text" name="skey" id="rolename"class="abc input-default" placeholder="手机号">
     

      &nbsp;&nbsp;
      <input type="hidden" name="choice_roomid" value="<?=$choice_roomid?>">
      <button type="submit"  class="button ">查询</button>
  
      <button type="button"  class="button  button-danger"  onClick="if(confirm('确定删除？'))$('#hd_list').submit()">删除所选</button>
 </li>
   
  </ul>
  </form>
   <form action="" method="POST" enctype="application/x-www-form-urlencoded"  class="form-horizontal" id="hd_list">
	<input type="hidden" name="act" value="rotate_del">
  <table  class="table table-bordered table-hover definewidth m10">
    <thead>
      <tr style="font-weight:bold" >
        <td width="20" align="center" bgcolor="#FFFFFF">ID</td>
        <td width="19" align="center" bgcolor="#FFFFFF"><input type="checkbox" onClick="$('.ids').attr('checked',this.checked); "></td>
        <td width="80" align="center" bgcolor="#FFFFFF">用户ID</td>
        <td width="80" align="center" bgcolor="#FFFFFF">用户昵称</td>
        <td  width="100" align="center" bgcolor="#FFFFFF">奖品</td>
        <td width="120" align="center" bgcolor="#FFFFFF">抽奖时间</td>
	
        <td width="120" align="center" bgcolor="#FFFFFF">操作</td>
      </tr>
    </thead>
<?php
$roomsql=$choice_roomid==0?'':" r.roomid=$choice_roomid  and";
$sql="select r.*,m.nickname  from {$tablepre}rotate r,{$tablepre}memberfields m where r.uid=m.uid and $roomsql 1=1  ";
$skey=trim($skey);
if($skey!=""){
	$sql.=" and (r.uid like '%$skey%' or r.jiangpin like '%$skey%')";
}


$sql.=" order by r.addtime desc";


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
          <td align="center" bgcolor="#FFFFFF"><?=$row['uid']?></td>
 <td align="center" bgcolor="#FFFFFF"><?=$row['nickname']?></td>
	  <td align="center" bgcolor="#FFFFFF"><?=$row['jiangpin']?></td>
            <td align="center" bgcolor="#FFFFFF"><?=date('Y-m-d H:i:s',$row['addtime'])?></td>
  
      <td align="center" bgcolor="#FFFFFF">

      <button type="button" class="button button-mini button-danger" onclick="if(confirm('确定删除该条信息？'))location.href='?act=rotate_del&id=<?=$row['id']?>'"><i class="x-icon x-icon-small icon-trash icon-white"></i>删除</button></td>
    </tr>

<? }?>

  </table>
    </form> 
    <ul class="breadcrumb">
    <li class="active"><?=$pagenav?>
    </li>
  </ul>
</div>
    <script>

function choice_room(value){
    
  
   window.location.href="?choice_roomid="+value; 
}
  </script>
</body>
</html>
