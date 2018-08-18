<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
if(stripos(auth_group($_SESSION['login_gid']),'room_kefu')===false)exit(denied_pape());
$operation=0;
function kefu_del($id){
     global $db,$tablepre;
       if(empty($id))return;
	$db->query("delete from {$tablepre}room_kefu where id in ($id) ");
      
}
switch($act){
	case "kefu_del":
	  if(is_array($id)){
                kefu_del(implode(',',$id));  
                } else{
                 kefu_del($id);   
                }
         
	break;
        case "kefu_add":
            $qqnum= trim($qqnum);
              kefu_add($qqtitle,$qqnum,$roomid);
	 $operation=1;
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

         <button type="button" class="button button-success" id="add_kefu_bt" style="float: right">添加客服QQ</button>
                  <a class="button button-primary" style="float: right;margin-right: 5px;"   onclick="window.location.reload();"><i class="x-icon x-icon-small icon-white" style="background-position: -239px -22px;"></i>刷新</a>
   <li class="active"> <span style="color: #F90">房间：</span> <select name="choiceroom" id="choiceroom" OnChange="choice_room(this.value)">   
                       <?=$room_list_li;?>  
                     </select>
        <button type="button"  class="button  button-danger"  onClick="if(confirm('确定删除？'))$('#hd_list').submit()">删除所选</button>
 </li>
   
  </ul>
<div style="color:red; margin-bottom: 10px;">添加的QQ需要到【shang.qq.com】登录后在【商家沟通组建—设置】开启QQ的在线状态，否则将显示“未启用”</div>
   <form action="" method="POST" enctype="application/x-www-form-urlencoded"  class="form-horizontal" id="hd_list">
	<input type="hidden" name="act" value="kefu_del">
  <table  class="table table-bordered table-hover definewidth m10">
    <thead>
      <tr style="font-weight:bold" >
        <td width="20" align="center" bgcolor="#FFFFFF">ID</td>
        <td width="19" align="center" bgcolor="#FFFFFF"><input type="checkbox" onClick="$('.ids').attr('checked',this.checked); "></td>
        <td width="200" align="center" bgcolor="#FFFFFF">客服名称</td>
    
        <td width="140" align="center" bgcolor="#FFFFFF">QQ号</td>
	
        <td width="120" align="center" bgcolor="#FFFFFF">操作</td>
      </tr>
    </thead>
<?php
 
$sql="select * from  {$tablepre}room_kefu where roomid=$choice_roomid order by addtime desc";

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
 <td align="center" bgcolor="#FFFFFF"><?=$row['qqtitle']?>&nbsp;</td>

            <td align="center" bgcolor="#FFFFFF"><?=$row['qqnum']?></td>
 
      <td align="center" bgcolor="#FFFFFF">
     <button  type="button" class="button button-mini button-success" onClick="kefu_edit(<?=$row['id']?>)"><i class="x-icon x-icon-small icon-tasks icon-white"></i>修改</button>
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
    <div id="kefu_add" class="container" style="display: none;">

<form action="?act=kefu_add" method="post" enctype="application/x-www-form-urlencoded">

  
<table class="table table-bordered table-hover definewidth m10">
        
        <tr>
            <td width="70" class="tableleft">房间：</td>
            <td><select name="roomid" id="roomid" >
	      <?=$room_list_li?>
            </select>&nbsp;</td>
          </tr>
          <tr>
            <td width="70" class="tableleft" style="width:40px;">客服名称：</td>
            <td><input name="qqtitle" type="text" id="qqtitle" style="width:350px;" /></td>
      </tr>
        <tr>
            <td width="70" class="tableleft" style="width:40px;">客服QQ：</td>
            <td><input name="qqnum" type="text" id="qqnum" style="width:350px;" /></td>
      </tr>
    </table>

  <div style="position:absolute; bottom:0; background: #FFF; width:80%; padding-bottom:20px;margin-left: 20px;">
    <button type="submit"  class="button button-success">确定</button>
    <button type="button"  class="button" onClick="dialog.close()">关闭</button>
    
</div>
  </form>

</div>
<script type="text/javascript" src="../assets/js/jquery-1.8.1.min.js"></script> 
<script type="text/javascript" src="../assets/layer/layer.js"></script>
<script type="text/javascript" src="../assets/js/bui.js"></script> 
<script type="text/javascript" src="../assets/js/config.js"></script> 
<script type="text/javascript" src="../../upload/swfupload/swfupload.js"></script> 
<script type="text/javascript">
BUI.use('bui/overlay',function(Overlay){
            dialog = new Overlay.Dialog({
            title:'添加客服QQ',
            width:500,
            height:330,
            buttons:[],
            contentId:'kefu_add'
          });
		  
});

    $('#add_kefu_bt').on('click',function () {
          dialog.show();
        });



function choice_room(value){if(value=='0') return;window.location.href="?choice_roomid="+value; }
function del(id){
	
	if(confirm('确定删除？'))location.href='?act=kefu_del&id='+id;
}
   var operation=<?=$operation?>;
    if(operation==1){
layer.msg('操作成功', {icon: 1,time:3000});}
BUI.use('bui/overlay',function(Overlay){
            dialog2 = new Overlay.Dialog({
            title:'客服QQ修改',
            width:500,
            height:300,
            buttons:[],
            bodyContent:''
          });
});
function kefu_edit(id){
	dialog2.set('bodyContent','<iframe src="room_kefu_edit.php?id='+id+'" scrolling="yes" frameborder="0" height="100%" width="100%"></iframe>');
	dialog2.updateContent();
	dialog2.show();
}

      </script>
</body>
</html>
