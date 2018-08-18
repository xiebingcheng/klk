<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
if(stripos(auth_group($_SESSION['login_gid']),'sys_notice')===false)exit(denied_pape());
$operation=0;

if($act=="notice_add"){
	notice_add($title,$txt,$ov,$ntype,$contenttype,$content,$roomid);
	
          $operation=1;
}

      if(empty($login_roomid)){
 $choice_roomid=0;
 }else{
     $choice_roomid=$login_roomid;
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
 <link href="../assets/css/base.css" rel="stylesheet" type="text/css" />
<style type="text/css">
code { padding: 0px 4px; color: #d14; background-color: #f7f7f9; border: 1px solid #e1e1e8; }
input,select{vertical-align:middle;}
.liw { width:160px; height:25px; line-height:25px;}
#uploadImgContainer input {
  width: 62%;
}
#uploadImgContainer .content-img-item {
  margin-bottom: 13px;
  width: 500px;
}
#uploadImgContainer .content-img-item a {
  margin-left: 12px;
}
#uploadImgContainer .content-img-item a.mgr {
  margin-left: 16px;
}
#uploadImgContainer .content-img-item img {
  width: 23px;
  margin-left: 12px;
  cursor: pointer;
}
</style>
</head>
<body>
<div class="container" style="margin-bottom:50px;">
<form action="?act=notice_add" method="post" enctype="application/x-www-form-urlencoded">
<table class="">
          <tr>
            <td width="30" class="tableleft_layer" style="width:40px;">标题：</td>
            <td><input name="title" type="text" id="title" style="width:350px;" required /></td>
      </tr>
        <tr>
            <td width="30" class="tableleft_layer">房间：</td>
            <td><select name="roomid" id="roomid" >
	      <?=$room_list_li?>
            </select>&nbsp;</td>
          </tr>

          <tr>
            <td class="tableleft_layer">状态：</td>
            <td><label class="radio"><input name="ntype" type="radio" value="1"  checked />开启 </label>&nbsp;&nbsp;&nbsp;&nbsp;
<label class="radio"><input name="ntype" type="radio" value="0"  />关闭 </label> </td>
          </tr>
       
          <tr>
            <td width="30" class="tableleft_layer">排序：</td>
            <td><input name="ov" type="text" id="ov" placeholder="大到小排序" /> </td>
      </tr>
          <tr>
        <td class="tableleft_layer">类型：</td>
        <td id="contentType">
          <label class="radio"><input name="contenttype" type="radio" value="1"  checked>编辑器编辑内容 </label>&nbsp;&nbsp;&nbsp;&nbsp;
          <label class="radio"><input name="contenttype" type="radio" value="2"/>轮播图 </label> 
        </td>
      </tr>
      <tr>
            <td width="30" class="tableleft_layer">内容：</td>
        <td id="editorContainer">
          <textarea name="txt" id="txt" style="width:100%;"  class="xheditor {cleanPaste:0,height:'350',internalScript:true,inlineScript:true,linkTag:true,upLinkUrl:'../../upload/upload.php',upImgUrl:'../../upload/upload.php',upFlashUrl:'../../upload/upload.php',upMediaUrl:'../../upload/upload.php'}"><?=tohtml($row[txt])?></textarea>
        </td>
        <td id="uploadImgContainer" style="display:none">
          <div class="content-img-item-container">
            <div class="content-img-item">
              <input name="content[]" type="text" class="content" placeholder="图片路径">
              <a href="javascript:void(0)" class="button">上传图片</a>
            </div>
            <div class="content-img-item">
              <input name="content[]" type="text" class="content" placeholder="图片路径">
              <a href="javascript:void(0)" class="button">上传图片</a>
            </div>
          
            <input id="filedata" type="file" size="20" name="filedata" class="input" style="display:none">
          </div>
          <div id="addImgContainer">
            <a class="button" id="btnAddImg">增加图片</a>
          </div>
        </td>
      </tr>
              <tr>
             <td class="tableleft_layer">&nbsp;</td>
             <td>
    <button type="submit"  class="button button-success">确定</button>
    <button type="button"  class="button" onClick="layer_close()">关闭</button>
   
    </td>
      </tr>
    </table>

  </form>
</div>
<script type="text/javascript" src="../assets/js/jquery-1.8.1.min.js"></script> 
<script type="text/javascript" src="../assets/layer/layer.js"></script>
<script type="text/javascript" src="../assets/js/bui.js"></script> 
<script type="text/javascript" src="../assets/js/config.js"></script> 
<script type="text/javascript" src="../../xheditor/xheditor.js"></script>
<script type="text/javascript" src="../../xheditor/xheditor_lang/zh-cn.js"></script>
<script type="text/javascript" src="/room/script/ajaxfileupload.js"></script>
<script>
   var operation=<?=$operation?>;
  if(operation==1) {
    layer.msg('添加成功', {icon: 1,time:700});
    window.setTimeout("reload()",2000); 
  }
  $(function() {
    $('#contentType input').click(function(){
      if ($(this).val() == 2) {
        $('#editorContainer').hide();
        $('#uploadImgContainer').show();
      } else {
        $('#editorContainer').show();
        $('#uploadImgContainer').hide();
      }
    });
    $('.content-img-item-container').delegate('.button', 'click', function() {
      $('#filedata').click();
      var that = $(this);
      $('#filedata').change(function() {
        var tar = $(that.parent()[0].children[0]);
        uploadAvatar('filedata', tar);
      });
    });
    $('#btnAddImg').click(function() {
      var _div = '<div class="content-img-item">' + 
                    '<input name="content[]" type="text" class="content" placeholder="图片路径">' +
                    '<a href="javascript:void(0)" class="button mgr">上传图片</a>' +
                    '<img src="../assets/img/delete.png" class="delete-btn">' + 
                  '</div>';
      $('.content-img-item-container').append(_div);
      $('.delete-btn').click(function() {
        $(this).parent().remove();
      });
    });
        });
  function uploadAvatar(ElementId, target) {
    //上传文件
    $.ajaxFileUpload({
        url:'/upload/upload.php',//处理图片脚本
        secureuri :false,
        fileElementId :'filedata',//file控件id
        dataType : 'json',
        data: {type: ElementId },
        success : function (data, status){ 
            if(typeof(data.err) != 'undefined'){
                if(data.err != ''){
                    alert(data.err);
                }else{
                  target.val(data.msg.url);
                }
            }
        },
        error: function(data, status, e){
            alert(e);
        }
    });
  }
          function layer_close(){ 
  
    var index = parent.layer.getFrameIndex(window.name);
    parent.layer.close(index);

}
</script>
</body>
</html>
