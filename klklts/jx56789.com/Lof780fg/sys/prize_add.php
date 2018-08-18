<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
if(stripos(auth_group($_SESSION['login_gid']),'sys_notice')===false)exit(denied_pape());
$operation=0;

if($act=="prize_add"){
	prize_add($giftname,$v,$giftimg,$getmethod);
	
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
<div class="container" style="margin-bottom:50px;">
<form action="?act=prize_add" method="post" enctype="application/x-www-form-urlencoded">
<table class="">
          <tr>
            <td width="30" class="tableleft_layer" style="width:40px;">奖品名称：</td>
            <td><input name="giftname" type="text" id="giftname" style="width:350px;" required /></td>
      </tr>
         <tr>
        <td class="tableleft" style="width:100px;">奖品图片：</td>
        <td><div id="cover_default"><img src="/apps/poundgoldegg/images/jiangpin.png"/></div><input type="hidden" name="giftimg" id="giftimg" value="/apps/poundgoldegg/images/jiangpin.png">
            <div class="button button-success" onclick="$('#filedata').click()">上传</div>
       </td>
      </tr>
       
          <tr>
            <td width="30" class="tableleft_layer">权重：</td>
            <td><input name="v" type="text" id="v" required maxlength="4" style="width:350px;"  onkeyup="value=value.replace(/[^0-9]/g,'')"  placeholder="权重越大中奖几率越大" /> </td>
      </tr>
      
              <tr>
             <td class="tableleft_layer">&nbsp;</td>
             <td>
    <button type="submit"  class="button button-success">确定</button>
    <button type="button"  class="button" onClick="layer_close()">关闭</button>
    <input type="hidden" name="getmethod" value="<?=$getmethod?>">
    </td>
      </tr>
    </table>

  </form>
    	<input id="filedata" type="file" size="20" name="filedata" class="input" style="display:none" onchange="uploadAvatar('filedata')"> 
</div>
<script type="text/javascript" src="../assets/js/jquery-1.8.1.min.js"></script> 
<script type="text/javascript" src="../assets/layer/layer.js"></script>
<script type="text/javascript" src="../assets/js/bui.js"></script> 
<script type="text/javascript" src="../assets/js/config.js"></script> 
<script type="text/javascript" src="/room/script/ajaxfileupload.js"></script>

<script>
   var operation=<?=$operation?>;
  if(operation==1) {
    layer.msg('添加成功', {icon: 1,time:700});
    window.setTimeout("reload()",2000); 
  }

 
          function layer_close(){ 
  
    var index = parent.layer.getFrameIndex(window.name);
    parent.layer.close(index);

}
 function uploadAvatar(ElementId) {
         
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
	                   
                                 $("#giftimg").val(data.msg.url);
                             $("#cover_default img").attr('src',data.msg.url);
	                    }
	                }
	            },
	            error: function(data, status, e){
	                alert(e);
	            }
	    	});
        }
</script>
</body>
</html>
