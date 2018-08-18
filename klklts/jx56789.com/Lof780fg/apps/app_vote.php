<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
if(stripos(auth_group($_SESSION['login_gid']),'apps_vote')===false)exit("没有权限！");
function vote_del($vid){
     global $db,$tablepre;
       if($vid=="")return;
	$db->query("delete from {$tablepre}vote where id=$vid ");
        $db->query("delete from {$tablepre}vote_content where vid=$vid ");
        $db->query("delete from {$tablepre}vote_info where vid=$vid ");
}
switch($act){
	case "vote_del":
	  vote_del($vid); 
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

</head>
<body>
<div class="container"  style="width:850px;">

  <ul class="breadcrumb">

         <button type="button" class="button button-success" id="add_group_bt" style="float: right" onclick="addvote()">添加投票</button>
                  <a class="button button-primary" style="float: right;margin-right: 5px;"   onclick="window.location.reload();"><i class="x-icon x-icon-small icon-white" style="background-position: -239px -22px;"></i>刷新</a>
   <li class="active"> <span style="color: #F90">房间：</span> <select name="choiceroom" id="choiceroom" OnChange="choice_room(this.value)">   
                       <?=$room_list_li;?>  
                     </select>
       
 </li>
   
  </ul>

   <form action="" method="POST" enctype="application/x-www-form-urlencoded"  class="form-horizontal" id="hd_list">
	<input type="hidden" name="act" value="rotate_del">
  <table  class="table table-bordered table-hover definewidth m10">
    <thead>
      <tr style="font-weight:bold" >
        <td width="20" align="center" bgcolor="#FFFFFF">ID</td>
        <td width="19" align="center" bgcolor="#FFFFFF"><input type="checkbox" onClick="$('.ids').attr('checked',this.checked); "></td>
        <td width="200" align="center" bgcolor="#FFFFFF">标题</td>
    
        <td width="140" align="center" bgcolor="#FFFFFF">发布时间</td>
	
        <td width="120" align="center" bgcolor="#FFFFFF">操作</td>
      </tr>
    </thead>
<?php
 
$sql="select * from  {$tablepre}vote where rid='$choice_roomid' order by addtime desc";

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
 <td align="center" bgcolor="#FFFFFF"><?=$row['title']?>&nbsp;</td>

            <td align="center" bgcolor="#FFFFFF"><?=date('Y-m-d H:i:s',$row['addtime'])?>&nbsp;</td>
 
      <td align="center" bgcolor="#FFFFFF">
     <button  type="button" class="button button-mini button-success" onClick="vote_content(<?=$row['id']?>)"><i class="x-icon x-icon-small icon-tasks icon-white"></i>详细</button>
      <button type="button" class="button button-mini button-danger" onclick="del(<?=$row['id']?>)" ><i class="x-icon x-icon-small icon-trash icon-white"></i>删除</button>
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
            title:'发布投票',
            width:750,
            height:530,
            buttons:[],
            bodyContent:''
          });
		  
});


function addvote(){
	dialog.set('bodyContent','<iframe src="app_vote_add.php" scrolling="yes" frameborder="0" height="100%" width="100%"></iframe>');
	dialog.updateContent();
	dialog.show();
}
BUI.use('bui/overlay',function(Overlay){
            dialog2 = new Overlay.Dialog({
            title:'投票信息',
            width:700,
            height:600,
            buttons:[],
            bodyContent:''
          });
});
function vote_content(vid){
	dialog2.set('bodyContent','<iframe src="app_vote_content.php?vid='+vid+'" scrolling="yes" frameborder="0" height="100%" width="100%"></iframe>');
	dialog2.updateContent();
	dialog2.show();
}
function choice_room(value){
    
    if(value=='0') return;
   window.location.href="?choice_roomid="+value; 
}
function del(id){
	
	if(confirm('确定删除？'))location.href='?act=vote_del&vid='+id;
}
      </script>
</body>
</html>
