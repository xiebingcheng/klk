<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
if(stripos(auth_group($_SESSION['login_gid']),'app_video')===false)exit(denied_pape());
$operation=0;
if($act=="video_add"){ 
 video_add($roomid,$videoname,$cover,$videodes,$livetype,$localurl,$weburl);
        
        $operation=1;
}

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
  
     <div class="guide_title">  <i class="icon-home">
                </i>
         <a  style="color: #000;"href="app_video_list.php">视频库</a>>添加视频
           </div> 
    <div class="container">
  <form action="?act=video_add" method="post" enctype="application/x-www-form-urlencoded" onsubmit="return check()">
        <table class="">
              <tr>
            <td width="80" class="tableleft">选择房间：</td>
            <td><select name="roomid" id="roomid" >
	      <? echo room_list_li($default_roomid);?>
            </select>&nbsp;</td>
          </tr>
               <tr>
        <td class="tableleft" style="width:100px;">视频名称：</td>
        <td><input name="videoname" type="text" id="videoname" style="width:400px;" maxlength="20"/><p class="roomidtip" id="roomidtip" style="margin-left:10px;display: inline-block;color:red;"></p></td>
      </tr>
        <tr>
        <td class="tableleft" style="width:100px;">直播间封面：</td>
        <td><div id="cover_default"><img src="/images/cover_video.png"/></div><input type="hidden" name="cover" id="cover" value="/images/cover_video.png">
            <div class="button button-success" onclick="$('#filedata').click()">上传</div>
       </td>
      </tr>
         <tr>
        <td class="tableleft">视频简介：</td>
        <td><textarea name="videodes" rows="2" id="videodes" style="width:400px;">
</textarea></td>
      </tr>
    
   
    
 
          <tr>
            <td class="tableleft" style="width:100px;">直播来源：</td>
            <td><input type="radio" checked="checked" name="livetype" value="0" />远程链接&nbsp;&nbsp;&nbsp;<input type="radio" name="livetype" value="1" />本地上传</td>
          </tr>
             <tr>
        <td class="tableleft">视频：</td>
        <td><div id="uploader" class="wu-example">
    <!--用来存放文件信息-->
    <div id="thelist" class="uploader-list"></div>
    <div class="btns">
        <div id="picker">选择文件</div>
 <input type="hidden" name="localurl" id="localurl" value="">
        <div id="ctlBtn" class="button webuploader-btn" style="display:none;">开始上传</div>
    </div>
</div><div id="video_url"><textarea name="weburl" rows="2" id="weburl" style="width:400px;">
</textarea></div></td>
      </tr>
       
          
         
         
          <tr>
            <td class="tableleft">&nbsp;</td>
            <td><button type="submit" class="button button-success">添加</button></td>
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
layer.alert('视频已添加', {
    title:'提示',
     shift: 1,
          closeBtn: 0, //不显示关闭按钮
  icon: 1,
  time:1000
});  window.location.href="app_video_list.php"; }

 
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
</script>
<body>
</html>  