<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
if(stripos(auth_group($_SESSION['login_gid']),'apps_rotate')===false)exit(denied_pape());
$operation=0;
if($act=="rotate_add"){
	rotate_add($phone,$jiangpin,$roomid);
        $operation=1;
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
 <link href="../assets/css/base.css" rel="stylesheet" type="text/css" />
<style type="text/css">
code { padding: 0px 4px; color: #d14; background-color: #f7f7f9; border: 1px solid #e1e1e8; }
input,select{vertical-align:middle;}
.liw { width:160px; height:25px; line-height:25px;}
</style>
</head>
<body>
<div class="container" >
<?php

 
      if(empty($login_roomid)){
 $choice_roomid=0;
 }else{
     $choice_roomid=$login_roomid;
    }
    $room_list_li = room_list_li($choice_roomid);   
?>
<form action="rotate_add.php" method="post" enctype="application/x-www-form-urlencoded" id="regUser">
  <ul class="breadcrumb">

<table class="">
			  <tr>
            <td width="80" class="tableleft_layer" style="width:70px;">手机号：</td>
            <td><input name="phone" type="text" id="phone" style="width:350px;" placeholder="手机号" onkeyup="value=value.replace(/[^0-9]/g,'')"  /></td>
          </tr>
	
          <tr>
            <td width="80" class="tableleft_layer" style="width:70px;">奖品：</td>
            <td><input name="jiangpin" type="text" id="jiangpin" style="width:350px;" /></td>
          </tr>
         
            <tr>
            <td width="80" class="tableleft_layer">房间：</td>
            <td><select name="roomid" id="roomid" >
         
            <?=$room_list_li?>
            </select>&nbsp;</td>
          </tr>
         
             <tr>
             <td class="tableleft_layer">&nbsp;</td>
             <td>
  <input type="button" id="formadd"  class="button button-success" value="确定"/>
    <button type="button"  class="button" onclick="layer_close()">关闭</button>
    <input type="hidden" name="act" value="rotate_add">
    </td>
      </tr>
         
        </table>

  </ul>

  </form>

</div>
<script type="text/javascript" src="../assets/js/jquery-1.8.1.min.js"></script> 
<script type="text/javascript" src="../assets/layer/layer.js"></script>
<script type="text/javascript" src="../assets/js/bui.js"></script> 
<script type="text/javascript" src="../assets/js/config.js"></script> 
<script type="text/javascript" src="../../upload/swfupload/swfupload.js"></script> 
<script>
            var operation=<?=$operation?>;
   if(operation==1){
        layer.msg('添加成功！');
         window.setTimeout("reload()",2000); 
    }
   
        function layer_close(){ 
  
    var index = parent.layer.getFrameIndex(window.name);
    parent.layer.close(index);

}

$(document).ready(function() {



	$('#formadd').click(function() {

   var phone = /^1[0-9]{10}$/ ;
                  if ($.trim($('#phone').val()) == "" || !phone.test($('#phone').val())) {
			$('#phone').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			layer.msg('手机格式不正确！');
			return false;
		}
             
		if ($.trim($('#jiangpin').val()) == "") {
			$('#jiangpin').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
		layer.msg('奖品不能为空！');
			return false;
		}
            
         

             
		
	
		

		$('#regUser').submit();
	});
	

});
</script>
</body>
</html>
