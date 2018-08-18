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
		header("location:?getmethod=$getmethod");
	break;
        case "paijiang":
	   global $db,$tablepre;
            $db->query("update {$tablepre}rotate set status=1 where id='$jid'");
            exit('1');
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
<div class="container"  style="width:900px;">
 <ul class="nav-tabs">
     <li <?if($getmethod==2)echo 'class="active"';?> ><a href="app_rotate.php?getmethod=2">砸金蛋</a></li>
      <li <?if($getmethod==1)echo 'class="active"';?>><a href="app_rotate.php?getmethod=1">转盘抽奖</a></li>
  
    </ul> 
<form  class="form-horizontal" action="" method="get"> 
  <ul class="breadcrumb">
      <a class="button button-info"  onclick="addRotate()" style="float:right; margin-left: 12px;display: none;">添加抽奖记录</a>
      <a class="button button-success"  href="app_allrotate.php" style="float:right;display: none;">全部抽奖记录</a>
     
   <li class="active"><span style="color: #F90">房间：</span> <select name="choiceroom" id="choiceroom" OnChange="choice_room(this.value,'<?=$getmethod?>')">   
                       <?=$room_list_li;?>  
                     </select> &nbsp;&nbsp;&nbsp;&nbsp;关键字：
      <input type="text" name="skey" id="rolename"class="abc input-default" placeholder="用户ID或者奖品名称">
     
<input type="hidden" name="choice_roomid" value="<?=$choice_roomid?>">
<input type="hidden" name="getmethod" value="<?=$getmethod?>">
      &nbsp;&nbsp;
      <button type="submit"  class="button ">查询</button>
  
      <button type="button"  class="button  button-danger"  onClick="if(confirm('确定删除？'))$('#hd_list').submit()">删除所选</button>
 </li>
   
  </ul>
  </form>
   <form action="" method="POST" enctype="application/x-www-form-urlencoded"  class="form-horizontal" id="hd_list">
	<input type="hidden" name="act" value="rotate_del">
        <input type="hidden" name="getmethod" value="<?=$getmethod?>">
  <table  class="table table-bordered table-hover definewidth m10">
    <thead>
      <tr style="font-weight:bold" >
        <td width="20" align="center" bgcolor="#FFFFFF">ID</td>
        <td width="19" align="center" bgcolor="#FFFFFF"><input type="checkbox" onClick="$('.ids').attr('checked',this.checked); "></td>
        <td width="80" align="center" bgcolor="#FFFFFF">用户ID</td>
        <td width="80" align="center" bgcolor="#FFFFFF">用户昵称</td>
        <td  width="100" align="center" bgcolor="#FFFFFF">奖品</td>
        <td width="130" align="center" bgcolor="#FFFFFF">抽奖时间</td>
        <td width="50" align="center" bgcolor="#FFFFFF">房间</td>
	<td width="80" align="center" bgcolor="#FFFFFF">状态</td>
        <td width="120" align="center" bgcolor="#FFFFFF">操作</td>
      </tr>
    </thead>
<?php
$roomsql=$choice_roomid==0?'':" r.roomid=$choice_roomid  and";
$sql="select r.*,m.nickname  from {$tablepre}rotate r,{$tablepre}memberfields m where r.uid=m.uid and r.getmethod='$getmethod' and  $roomsql r.jiangpin!=''  ";
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
          <td align="center" bgcolor="#FFFFFF"><?=$row['uid']?>&nbsp;</td>
 <td align="center" bgcolor="#FFFFFF"><?=$row['nickname']?>&nbsp;</td>
	  <td align="center" bgcolor="#FFFFFF"><?=$row['jiangpin']?>&nbsp;</td>
            <td align="center" bgcolor="#FFFFFF"><?=date('Y-m-d H:i:s',$row['addtime'])?>&nbsp;</td>
            <td align="center" bgcolor="#FFFFFF"><?=$row['roomid']?>&nbsp;</td>
     <td align="center" bgcolor="#FFFFFF" jid="<?=$row['id']?>"><? if($row['status']==1){echo '<font color="#090">已派奖</font>';}else{ echo '<font color="red">等待派奖</font>';}?></td>
      <td align="center" bgcolor="#FFFFFF">
     <?if($row['status']==0){?> <div type="button" class="button button-mini button-info paijiang" getmethod="<?=$row['getmethod']?>"  jpid="<?=$row['id']?>" ><i class="x-icon x-icon-small icon-wrench icon-white"></i>派奖</div> <?}?>
      <button type="button" class="button button-mini button-danger" onclick="if(confirm('确定删除该条信息？'))location.href='?act=rotate_del&id=<?=$row['id']?>&getmethod=<?=$row['getmethod']?>'"><i class="x-icon x-icon-small icon-trash icon-white"></i>删除</button></td>
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
function addRotate(){
	
           var title = '添加虚拟抽奖';
   
        var index = layer.open({
            type: 2,
            title: title,
            area: ['600px', '420px'],
            content: "rotate_add.php"
        
        });
      // layer.full(index);
}
$(".paijiang").live("click", function () { 
    if(confirm('确定派送奖品？')){
    var id = $(this).attr("jpid");
    var getmethod = $(this).attr("getmethod");
$.ajax({
                url: "?act=paijiang&getmethod="+getmethod,
                data: {jid:id},
                 type: "POST",
                dataType: "JSON",
                success: function (rep) {
                    if (rep==1){
               
                   $('td[jid="' + id +'"]').html('<font color="#090">已派奖</font>');
                   $('div[jpid="' + id +'"]').hide();
                    }
                       
                }
            });
    }
});
function choice_room(value,getmethod){
    
  
   window.location.href="?choice_roomid="+value+"&getmethod="+getmethod; 
}
  </script>
</body>
</html>
