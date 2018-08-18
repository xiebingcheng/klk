<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
if(stripos(auth_group($_SESSION['login_gid']),'apps_manage')===false)exit(denied_pape());
$operation=0;
if($act=="app_manage_add"){
	
	app_manage_add($title,$url,$ico,$w,$h,$target,$position,$s,$ov);
	$id=$db->insert_id();
	$type='edit';
        $operation=1;

}else if($act=="app_manage_edit"){
	app_manage_edit($id,$title,$url,$ico,$w,$h,$target,$position,$s,$ov);
        $operation=2;

}

$query=$db->query("select * from {$tablepre}apps_manage where id='$id'");
if($db->num_rows($query)>0)$row=$db->fetch_row($query);
else {$row[s]='0';$row[target]="POPWin"; }

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
<div class="container" style="margin-bottom:50px;">

<form action="?id=<?=$id?>&type=<?=$type?>" method="post" enctype="application/x-www-form-urlencoded">

  
<table class="">

          <tr>
            <td class="tableleft_layer" >应用名称：</td>
            <td><input name="title" type="text" id="title" value="<?=$row[title]?>"  class="input-large" /></td>
      </tr>
          <tr>
            <td class="tableleft_layer">应用图标：</td>
            <td><input name="ico" type="text" id="ico" value="<?=$row[ico]?>"  class="input-large"/>
            <button  type="button" class="button button-mini button-success" ><span id="url_bt"></span></button>  </td>
          </tr>
          <tr>
            <td class="tableleft_layer">应用连接：</td>
            <td><input name="url" type="text" id="url" value="<?=$row[url]?>"  class="input-large"/>
           <?if ($id==8){?>  <button  type="button" class="button button-mini button-success" ><span id="url_img"></span></button><? }?> </td>
          </tr>
          <tr>
            <td class="tableleft_layer">打开方式：</td>
            <td><select name="target" id="target">
            <option value="NewWin" <? if($row[target]=='NewWin') echo 'selected'; ?>>新窗口</option>
              <option value="POPWin" <? if($row[target]=='POPWin') echo 'selected'; ?>>弹出框</option>
              <option value="QPWin" <? if($row[target]=='QPWin') echo 'selected'; ?>>气泡框</option>
            </select></td>
          </tr>
          <tr>
            <td class="tableleft_layer">显示位置：</td>
            <td><select name="position" id="position">
               <option value="top" <? if($row[position]=='top') echo 'selected'; ?>>顶部导航</option>
              <option value="left" <? if($row[position]=='left') echo 'selected'; ?>>左侧导航</option>
          </select></td>
          </tr>
          <tr>
            <td class="tableleft_layer">窗体宽高：</td>
            <td><input name="w" type="text" id="w" value="<?=$row[w]?>"  />
              宽（像素） 
                <br>
                <br>
<input name="h" type="text" id="h" value="<?=$row[h]?>"  />
高（像素）</td>
          </tr>
          <tr>
            <td class="tableleft_layer">启用状态：</td>
            <td><select name="s" id="s">
            <option value="0" <? if($row[s]=='0') echo 'selected'; ?>>开启</option>
              <option value="1" <? if($row[s]=='1') echo 'selected'; ?>>关闭</option>
            </select>
              </td>
          </tr>
            <tr>
            <td class="tableleft_layer">排序：</td>
            <td><input name="ov" type="text" id="ov" value="<?=$row[ov]?>"  onkeyup="value=value.replace(/[^0-9]/g,'')" />（大至小排序）</td>
          </tr>
         <tr>
             <td class="tableleft_layer">&nbsp;</td>
             <td>
    <button type="submit"  class="button button-success">确定</button>
    <button type="button"  class="button" onclick="layer_close()">关闭</button>
    <input type="hidden" name="act" value="app_manage_<?=$type?>">
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
        var operation=<?=$operation?>;
    if(operation==1){
        layer.msg('添加成功！');
        window.setTimeout("reload()",2000); 
      }else if(operation==2){
        layer.msg('修改成功！');
    }
   
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
  swfdef.file_types="*.jpg;*.gif;*.png";
  swfdef.upload_url="../../upload/upload.php";
  swfdef.post_params={"info":"ico"}
  
  swfu = new SWFUpload(swfdef);
  
    var swfbg=swfdef;
  swfbg.button_placeholder_id="url_img";
  swfbg.file_types="*.gif;*.jpg;*.png";
  swfbg.post_params={"info":"url"}
  swfubg = new SWFUpload(swfbg);
});
        function layer_close(){ 
         window.parent.location.reload();
    var index = parent.layer.getFrameIndex(window.name);
    parent.layer.close(index);

}

</script>
</body>
</html>
