<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
if(stripos(auth_group($_SESSION['login_gid']),'apps_files')===false)exit("没有权限！");
if($act=="app_files_add"){
	
	app_files_add($title,$url,$user);
	$id=$db->insert_id();
	$type='edit';
}else if($act=="app_files_edit"){
	app_files_edit($id,$title,$url,$user);
}

$query=$db->query("select * from {$tablepre}apps_files where id='$id'");
if($db->num_rows($query)>0)$row=$db->fetch_row($query);
else {$row[user]=$_SESSION[admincp]; }

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

  
<table>

          <tr>
            <td width="30" class="tableleft_layer lb-required" style="width:80px;">共享名称：</td>
            <td><input name="title" type="text" id="title" value="<?=$row[title]?>"  /></td>
      </tr>
          <tr>
            <td class="tableleft_layer lb-required">附件：</td>
            <td><input name="url" type="text" id="url" value="<?=$row[url]?>"  /> *当前服务器允许上传最大<?=ini_get('upload_max_filesize');?>,运行最长时间<?=ini_get('max_execution_time');?>秒，支持zip,rar格式<br><br>
            <button  type="button" class="button button-mini button-success" ><span id="url_bt"></span></button>  </td>
          </tr>
          <tr>
            <td class="tableleft_layer lb-required">共享人：</td>
            <td><input name="user" type="text" id="user" value="<?=$row[user]?>" /></td>
          </tr>
          <tr>
            <td class="tableleft_layer">&nbsp;</td>
            <td>
              <button type="submit"  class="button button-success">确定</button>
              <button type="button"  class="button" onclick="layer_close()">关闭</button>
              <input type="hidden" name="act" value="app_files_<?=$type?>">
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
<script type="text/javascript" src="../../upload/swfupload/swfupload.js"></script> 
<script>
  function swfupload_ok(fileObj,server_data){
	 
	 var data=eval("("+server_data+")") ;
	 $("#"+data.msg.info).val(data.msg.url);
  }
  $(function(){


  var swfdef={
	  // 按钮设置
	    file_post_name:"filedata",
		button_width: 30,
		button_height: 18,
		button_window_mode: SWFUpload.WINDOW_MODE.TRANSPARENT,
		button_cursor: SWFUpload.CURSOR.HAND,
		button_text: '上传',
		button_text_style: ".upbnt{ color:#00F}",
		button_text_left_padding: 0,
		button_text_top_padding: 0,
		upload_success_handler : swfupload_ok,
		file_dialog_complete_handler:function(){this.startUpload();},
		file_queue_error_handler:function(){alert("选择文件错误");}
		}
  swfdef.flash_url="../../upload/swfupload/swfupload.swf";
  swfdef.button_placeholder_id="url_bt";
  swfdef.file_types="*.zip;*.rar";
  swfdef.upload_url="../../upload/upload.php";
  swfdef.post_params={"info":"url"}
  
  swfu = new SWFUpload(swfdef);
  
  var swfico=swfdef;
  swfico.button_placeholder_id="ico_up_bnt";
  swfico.file_types="*.ico";
  swfico.post_params={"info":"ico"}
  swfuico = new SWFUpload(swfico);
  
  var swfbg=swfdef;
  swfbg.button_placeholder_id="bg_up_bnt";
  swfbg.file_types="*.gif;*.jpg;*.png";
  swfbg.post_params={"info":"bg"}
  swfubg = new SWFUpload(swfbg);
  


	  
});
        function verify() {
          $('#title').css({ border: "1px solid #D7D7D7",boxShadow: "none"});
          $('#url').css({ border: "1px solid #D7D7D7 !important",boxShadow: "none"});
          $('#user').css({ border: "1px solid #D7D7D7",boxShadow: "none"});

          if ($.trim($('#title').val()) == '') {
            $('#title').focus().css({
              border: "1px solid red",
              boxShadow: "0 0 2px red"
            });
            layer.msg('必须填写共享名称！');
            return false;
          }
          if ($.trim($('#url').val()) == '') {
            $('#url').css({
              border: "1px solid red !important",
              boxShadow: "0 0 2px red"
            });
            layer.msg('必须填写附件！');
            return false;
          }
          if ($.trim($('#user').val()) == '') {
            $('#user').focus().css({
              border: "1px solid red",
              boxShadow: "0 0 2px red"
            });
            layer.msg('必须填写共享人！');
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
