<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
if(stripos(auth_group($_SESSION['login_gid']),'apps_vote')===false)exit("没有权限！");
$operation=0;

if($act=="vote_add"){
     vote_add($title,$content,$roomid);
	  $operation=1;
}

$room_list_li=room_list_li();

if($type=='edit'){
    $room_list_li='';
    $query=$db->query("select * from {$tablepre}config");
while($roomlist=$db->fetch_row($query)){
    if($roomlist['roomid']==$row['roomid']){$selected='selected';}else{$selected='';}
	$room_list_li.='<option value="'.$roomlist['roomid'].'"'.$selected.'>'.$roomlist['title'].'</option>';
}}

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
input,select{vertical-align:middle;}
.liw { width:160px; height:25px; line-height:25px;}
input[class="content"]{    width: 350px;display: block;margin-bottom: 20px;}
.new-content-item input {
    display: inline-block;
}
.new-content-item img {
  width: 24px;
  vertical-align: middle;
  margin-bottom: 20px;
  margin-left: 12px;
  cursor: pointer;
}
</style>
</head>
<body>
<div class="container" style="margin-bottom:50px;">

<form action="?act=vote_add" method="post" enctype="application/x-www-form-urlencoded">

  
<table class="table table-bordered table-hover definewidth m10">
          <tr>
            <td width="30" class="tableleft" style="width:40px;">标题：</td>
            <td><input name="title" type="text" id="title" style="width:350px;" /></td>
      </tr>
        <tr>
            <td width="30" class="tableleft">房间：</td>
            <td><select name="roomid" id="roomid" >
	      <?=$room_list_li?>
            </select>&nbsp;</td>
          </tr>
       
          <tr>
            <td width="30" class="tableleft">内容：</td>
            <td>
              <input name="content[]" type="text"  class="content"  placeholder="请输入投票内容"/>
                <input name="content[]" type="text"  class="content"    placeholder="请输入投票内容"/>
                <input name="content[]" type="text"  class="content"   placeholder="请输入投票内容"/>
                <div id="fenge" style="margin-top:12px;"><a  onclick="addcontent()"class="button">增加内容</a></div>
            </td>
      </tr>
    </table>

  <div style="position:fixed; bottom:0; background: #FFF; width:100%; padding-top:5px;">
    <button type="submit"  class="button button-success">确定</button>
    <button type="button"  class="button" onClick="window.parent.dialog.close()">关闭</button>
    
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

function addcontent(){
  var _div = '<div class="new-content-item"><input name="content[]" type="text"  class="content"   placeholder="请输入投票内容"/><img src="../assets/img/delete.png" class="delete-btn"></div>';
  $("#fenge").prepend(_div); 
  $('.delete-btn').click(function() {
    $(this).parent().remove();
  });
}
</script>
</body>
</html>
