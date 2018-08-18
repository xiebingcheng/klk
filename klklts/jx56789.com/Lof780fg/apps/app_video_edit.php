<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
if(stripos(auth_group($_SESSION['login_gid']),'app_video')===false)exit(denied_pape());
$operation=0;
if($act=="video_edit"){  
    $url=$livetype=='1'?$localurl:$weburl;
video_edit($id,$roomid,$videoname,$cover,$videodes,$livetype,$url);
        
        $operation=1;
}
$query=$db->query("select * from {$tablepre}video where id='$id'");
if($db->num_rows($query)>0)$row=$db->fetch_row($query);
 if(!empty($row['roomid'])){$choice_roomid=$row['roomid'];}else{$choice_roomid=$default_roomid;}

$room_list_li = room_list_li($choice_roomid);
?>
<!DOCTYPE HTML>
<html>
 <head>
  <title> </title>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
       <link href="../assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/bui-min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/page-min.css" rel="stylesheet" type="text/css" /> 
   <link href="../assets/css/prettify.css" rel="stylesheet" type="text/css" />
   <link href="../assets/css/base.css" rel="stylesheet" type="text/css" />
    <link href="../assets/webuploader/webuploader.css" rel="stylesheet" type="text/css" />
 
 </head>
 <body>
  
    <div class="container">
  <form action="?act=video_edit&id=<?=$id?>" method="post" enctype="application/x-www-form-urlencoded" onsubmit="return check()">
        <table class="">
              <tr>
            <td width="80" class="tableleft">选择房间：</td>
            <td><select name="roomid" id="roomid" >
	   <?=$room_list_li?>
            </select>&nbsp;</td>
          </tr>
               <tr>
        <td class="tableleft" style="width:100px;">视频名称：</td>
        <td><input name="videoname" type="text" id="videoname" style="width:400px;" maxlength="20" value="<?=$row['videoname']?>"/><p class="roomidtip" id="roomidtip" style="margin-left:10px;display: inline-block;color:red;"></p></td>
      </tr>
        <tr>
        <td class="tableleft" style="width:100px;">直播间封面：</td>
        <td><div id="cover_default"><img src="<?=$row['cover']?>"/></div><input type="hidden" name="cover" id="cover" value="<?=$row['cover']?>">
            <div class="button button-success" onclick="$('#filedata').click()">上传</div>
       </td>
      </tr>
         <tr>
        <td class="tableleft">视频简介：</td>
        <td><textarea name="videodes" rows="2" id="videodes" style="width:400px;"><?=$row['videodes']?>
</textarea></td>
      </tr>
    
             <tr>
        <td class="tableleft">视频：</td>
        <td><div id="uploader" class="wu-example">
    <!--用来存放文件信息-->
    <div id="thelist" class="uploader-list"></div>
    
</div><div id="video_url"><textarea name="<?if($row['livetype']==1){echo 'localurl';}else{ echo 'weburl';}?>" rows="2" id="<?if($row['livetype']==1){echo 'localurl';}else{ echo 'weburl';}?>" style="width:400px;"><?if($row['livetype']==1){echo $row['localurl'];}else if($row['state']==0){ echo $row['weburl'];}?>
</textarea></div></td>
      </tr>
          
          <tr>
            <td class="tableleft">&nbsp;</td>
               <input type="hidden" name="livetype" value="<?=$row['livetype']?>">
            <td><button type="submit" class="button button-success">修改</button> <button type="button"  class="button" onclick="layer_close()">关闭</button></td>
          </tr>
        </table>
  </form>
    	<input id="filedata" type="file" size="20" name="filedata" class="input" style="display:none" onchange="uploadAvatar('filedata')">   
 </div>
<script type="text/javascript" src="../assets/js/jquery-1.9.0.min.js"></script>

<script type="text/javascript" src="../assets/layer/layer.js"></script>

    <script type="text/javascript" src="../assets/webuploader/webuploader.js"></script>
   <script type="text/javascript" src="../assets/webuploader/upload.js"></script>
<script type="text/javascript" src="/room/script/ajaxfileupload.js"></script>
<script type="text/javascript">
        var operation=<?=$operation?>;
    if(operation==1){
layer.msg('修改成功！');}

 
 $(function(){ 
 
  $(":radio").click(function(){
  if($(this).val()=='0'){
     $('#uploader').css("margin-left","-300px");
       $('#video_url').show();
  }else{
      
          $('#uploader').css("margin-left","0px");;
       $('#video_url').hide();
  }
  });
 });
 function check(){

if ($.trim($('#videoname').val()) == "" || $('#videoname').val().length < 3 || $('#videoname').val().length > 30) {
			$('#videoname').focus();
		   layer.msg('视频名称长度为3-30个字符', {shift: 1,icon: 2});
			return false;
		}
                if ($.trim($('#videodes').val()) == "" ) {
			$('#videodes').focus();
		   layer.msg('视频简介不能为空', {shift: 1,icon: 2});
			return false;
		}
                if ($('input:radio:checked').val()=='0' &&  $.trim($('#weburl').val()) == "" ) {
			$('#weburl').focus();
		   layer.msg('视频不能为空', {shift: 1,icon: 2});
			return false;
		}
                   if ($('input:radio:checked').val()=='1' &&  $.trim($('#localurl').val()) == "" ) {
			$('#localurl').focus();
		   layer.msg('视频不能为空', {shift: 1,icon: 2});
			return false;
		}
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
	                   
                                 $("#cover").val(data.msg.url);
                             $("#cover_default img").attr('src',data.msg.url);
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
<body>
</html>  