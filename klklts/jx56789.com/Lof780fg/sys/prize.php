<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
if(stripos(auth_group($_SESSION['login_gid']),'sys_prize')===false)exit(denied_pape());
switch($act){
	case "prize_del":
		prize_del($id);
	break;
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

</head>
<body>
<div class="container"  style="width:800px;">
     <ul class="nav-tabs">
         <li <?if($getmethod==2)echo 'class="active"';?> ><a href="prize.php?getmethod=2">砸金蛋</a></li>
      <li <?if($getmethod==1)echo 'class="active"';?>><a href="prize.php?getmethod=1">转盘抽奖</a></li>
  
    </ul> 
<form  class="form-horizontal" action="" method="get"> 
  <ul class="breadcrumb">
      <a class="button button-primary" id="add_group_bt" style="float: right" href="?getmethod=<?=$getmethod?>"><i class="x-icon x-icon-small icon-white" style="    background-position: -239px -22px;"></i>刷新</a>
    <li class="active" >
    <button type="button"  class="button button-success" id="add_ban_bt" onClick="prizeAdd(<?=$getmethod?>)">添加</button>
   </li>
  </ul>
  </form>
  <table  class="table table-bordered table-hover definewidth m10">
    <thead>
      <tr style="font-weight:bold" >
        <td width="60" align="center" bgcolor="#FFFFFF">奖品ID</td>
        <td  align="center" bgcolor="#FFFFFF">奖品名称</td>
        <td width="60" align="center" bgcolor="#FFFFFF">权重</td>
       <td width="120" align="center" bgcolor="#FFFFFF">操作</td>
      </tr>
    </thead>
    <?php
	$sql="select * from {$tablepre}gift_goods where getmethod='$getmethod' order by id desc";
	global $db,$tablepre,$firstcount,$displaypg;
           $num=20;
	$count=$db->num_rows($db->query($sql));
	pageft($count,$num,"");
	$sql.=" limit $firstcount,$displaypg";
	$query=$db->query($sql);
        while($row=$db->fetch_row($query)){
     
       ?>
    <tr>
      <td bgcolor="#FFFFFF" align="center"><?=$row['id']?></td>
      <td align="center" bgcolor="#FFFFFF"><?=$row['giftname']?></td>
	  <td align="center" bgcolor="#FFFFFF"><?=$row['v']?></td>
    
      <td align="center" bgcolor="#FFFFFF">
      <button class="button button-mini button-success" onClick="prizeEdit('<?=$row['id']?>','<?=$row['getmethod']?>')"><i class="x-icon x-icon-small icon-trash icon-white"></i>修改</button>
      <button id="del{id}" class="button button-mini button-danger" onclick="if(confirm('确定删除？'))location.href='?act=prize_del&id=<?=$row['id']?>&getmethod=<?=$row['getmethod']?>'" ><i class="x-icon x-icon-small icon-trash icon-white"></i>删除</button></td>
    </tr>
        <? }?>


  </table>
    <ul class="breadcrumb">
    <li class="active"><?=$pagenav?>
    </li>
  </ul>
</div>
<script type="text/javascript" src="../assets/js/jquery-1.8.1.min.js"></script> 
<script type="text/javascript" src="../assets/layer/layer.js"></script>
<script type="text/javascript" src="../assets/js/bui.js"></script> 
<script type="text/javascript" src="../assets/js/config.js"></script> 
<script type="text/javascript">

function prizeAdd(getmethod){
	
           var title = '添加奖品';
   
        var index = layer.open({
            type: 2,
            title: title,
            area: ['600px', '600px'],
            content: "prize_add.php?getmethod="+getmethod
        
        });
     layer.full(index);
}
function prizeEdit(id,getmethod){
	
           var title = '修改奖品';
   
        var index = layer.open({
            type: 2,
            title: title,
              area: ['600px', '600px'],
            content: "prize_edit.php?id="+id+"&getmethod="+getmethod
        
        });
     layer.full(index);
}

      </script>
</body>
</html>
