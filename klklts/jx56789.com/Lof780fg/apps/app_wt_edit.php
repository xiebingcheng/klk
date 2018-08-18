<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
if(stripos(auth_group($_SESSION['login_gid']),'apps_wt')===false)exit("没有权限！");
if($act=="app_wt_add"){
	
	app_wt_add($q,$a,$quser,$auser,$zt);
	$id=$db->insert_id();
	$type='edit';
}else if($act=="app_wt_edit"){
	app_wt_edit($id,$q,$a,$quser,$auser,$zt);
}

$query=$db->query("select * from {$tablepre}apps_wt where id='$id'");
if($db->num_rows($query)>0)$row=$db->fetch_row($query);
else {$row[qtime]=gdate();$row[zt]='0';}

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
<link href="../assets/css/base.css" rel="stylesheet" type="text/css" />
<style type="text/css">
code { padding: 0px 4px; color: #d14; background-color: #f7f7f9; border: 1px solid #e1e1e8; }
input,select{vertical-align:middle;}
.liw { width:160px; height:25px; line-height:25px;}
.lb-required:before {
  content: '*';
  color: red;
}
</style>
</head>
<body>
<div class="container" style="margin-bottom:50px;">

<form action="?id=<?=$id?>&type=<?=$type?>" method="post" enctype="application/x-www-form-urlencoded" onsubmit="return verify()">
  <table class="">
    <tr>
      <td width="30" class="tableleft_layer lb-required" style="width:80px;">提问人：</td>
      <td><input name="quser" type="text" id="quser" value="<?=$row[quser]?>"  /></td>
      <td width="80" class="tableleft_layer">回答人：</td>
      <td><input name="auser" type="text" id="auser" value="<?=$row[auser]?>" /></td>
    </tr>
    <tr>
      <td class="tableleft_layer lb-required">问题：</td>
      <td><textarea name="q" id="q" style="width:220px; height:160px;"><?=$row[q]?></textarea></td>
      <td class="tableleft_layer">答案：</td>
      <td><textarea name="a" id="a"  style="width:220px;height:160px;"><?=$row[a]?></textarea></td>
    </tr>
    <tr>
      <td class="tableleft_layer">提问时间：</td>
      <td><?=date('Y-m-d H:i',$row[qtime])?></td>
      <td class="tableleft_layer">审核：</td>
      <td><select name="zt" id="zt">
        <option value="<?=$row[zt]?>"><?=$row[zt]=='0'?'通过':'不通过'?></option>
        <option value="0">通过</option>
        <option value="1">不通过</option>
      </select></td>
    </tr>
    <tr>
      <td class="tableleft_layer">&nbsp;</td>
      <td>
        <button type="submit"  class="button button-success">确定</button>
        <button type="button"  class="button" onclick="layer_close()">关闭</button>
        <input type="hidden" name="act" value="app_wt_<?=$type?>">
        <input type="hidden" name="id" value="<?=$id?>">
        <input type="hidden" name="type" value="<?=$type?>">
      </td>
    </tr>
  </table>
</form>

</div>
<script type="text/javascript" src="../assets/js/jquery-1.8.1.min.js"></script> 
<script type="text/javascript" src="../assets/layer/layer.js"></script>
<script type="text/javascript" src="../assets/js/bui.js"></script> 
<script type="text/javascript" src="../assets/js/config.js"></script> 
    <script type="text/javascript">
        BUI.use('bui/calendar',function(Calendar){
            var datepicker = new Calendar.DatePicker({
              trigger:'.calendar-time',
              showTime:true,
              autoRender : true
            });
        });
        function verify() {
          $('#quser').css({ border: "1px solid #D7D7D7",boxShadow: "none"});
          $('#q').css({ border: "1px solid #D7D7D7",boxShadow: "none"});
          if ($.trim($('#quser').val()) == '') {
            $('#quser').focus().css({
              border: "1px solid red",
              boxShadow: "0 0 2px red"
            });
            layer.msg('必须填写提问人！');
            return false;
          }
          if ($.trim($('#q').val()) == '') {
            $('#q').focus().css({
              border: "1px solid red",
              boxShadow: "0 0 2px red"
            });
            layer.msg('必须填写问题！');
            return false;
          }
        }
        function layer_close(){ 
          window.parent.location.reload();
          var index = parent.layer.getFrameIndex(window.name);
          parent.layer.close(index);
        }
      </script>
</body>
</html>
