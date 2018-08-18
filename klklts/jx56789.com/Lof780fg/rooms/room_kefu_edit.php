<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
if(stripos(auth_group($_SESSION['login_gid']),'room_kefu')===false)exit(denied_pape());
$operation=0;

if($act=="kefu_edit"){
       $qqnum=trim($qqnum);
	kefu_edit($id,$qqtitle,$qqnum,$roomid);
        $operation=1;
        //  echo "<script>window.parent.dialog.close();alert('机器人修改成功！');window.parent.location.reload();</script>";
}
$query=$db->query("select * from {$tablepre}room_kefu where id='$id'");
if($db->num_rows($query)>0)$row=$db->fetch_row($query);
$room_list_li = room_list_li($row['roomid']);



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
<div  style="margin-bottom:50px;">

<form action="?act=kefu_edit" method="post" enctype="application/x-www-form-urlencoded">

  
<table class="table table-bordered table-hover definewidth m10">
        
        <tr>
            <td width="70" class="tableleft">房间：</td>
            <td><select name="roomid" id="roomid" >
	      <?=$room_list_li?>
            </select>&nbsp;</td>
          </tr>
        <tr>
            <td width="70" class="tableleft" style="width:40px;">客服名称：</td>
            <td><input name="qqtitle" type="text" id="qqtitle" style="width:350px;"  value="<?=$row['qqtitle']?>"/></td>
      </tr>
        <tr>
            <td width="70" class="tableleft" style="width:40px;">客服QQ：</td>
            <td><input name="qqnum" type="text" id="qqnum" style="width:350px;" value="<?=$row['qqnum']?>" /></td>
      </tr>
    </table>

  <div style="position:fixed; bottom:0; background: #FFF; width:80%; padding-bottom:20px;margin-left: 20px;">
        <input type="hidden" name="id" value="<?=$id?>">
    <button type="submit"  class="button button-success">确定</button>
    <button type="button"  class="button" onClick="window.parent.dialog2.close()">关闭</button>
    
</div>
  </form>

</div>
<script type="text/javascript" src="../assets/js/jquery-1.8.1.min.js"></script> 
<script type="text/javascript" src="../assets/layer/layer.js"></script>
<script type="text/javascript" src="../assets/js/bui.js"></script> 
<script type="text/javascript" src="../assets/js/config.js"></script> 
<script type="text/javascript" src="../../xheditor/xheditor.js"></script>
<script type="text/javascript" src="../../xheditor/xheditor_lang/zh-cn.js"></script>
<script>
   var operation=<?=$operation?>;
    if(operation==1){
layer.msg('操作成功', {icon: 1,time:3000});}


</script>
</body>
</html>
