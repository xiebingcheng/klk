<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
if(stripos(auth_group($_SESSION['login_gid']),'room_adddel')===false)exit(denied_pape());
$operation=0;
if($act=="rooms_add"){ 
  rooms_add($roomid,$title,$keyss,$dc,$logo,$bg,$ewm,$livetype,$yyfp,$livefp,$phonefp,$state,$logintc,$msgblock,$msglog,$msgaudit,$logintip,$loginguest,$viewkefu,$cover);
        
        $operation=1;
}
$query=$db->query("select * from  {$tablepre}config where id='1'");
$row=$db->fetch_row($query);
?>
<!DOCTYPE HTML>
<html>
 <head>
  <title> </title>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
       <link href="../assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/bui-min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/page-min.css" rel="stylesheet" type="text/css" />   <!-- 下面的样式，仅是为了显示代码，而不应该在项目中使用-->
   <link href="../assets/css/prettify.css" rel="stylesheet" type="text/css" />
   <link href="../assets/css/base.css" rel="stylesheet" type="text/css" />
   <style type="text/css">
    code {
      padding: 0px 4px;
      color: #d14;
      background-color: #f7f7f9;
      border: 1px solid #e1e1e8;
    }
   </style>
 </head>
 <body>
  
     <div class="guide_title">  <i class="icon-home">
                </i>
      <a  style="color: #000;"href="rooms.php"> 房间列表</a>>增加房间
           </div> 
    <div class="container">
   
     <form action="" method="post" enctype="application/x-www-form-urlencoded"  onsubmit="return check()">
        <table class="">
               <tr>
        <td class="tableleft" style="width:100px;">房间号码：</td>
        <td><input name="roomid" type="text" id="roomid" readonly="readonly" style="width:150px;" maxlength="8"/><div class="button button-success" onclick="MathRand()">生成房间号</div><p class="roomidtip" id="roomidtip" style="margin-left:10px;display: inline-block;color:red;"></p></td>
      </tr>
            <tr>
        <td class="tableleft" style="width:100px;">房间名称：</td>
        <td><input name="title" type="text" id="title" style="width:400px;"/></td>
      </tr>
         <tr>
        <td class="tableleft">关 键 字：</td>
        <td><textarea name="keyss" rows="2" id="keyss" style="width:400px;">
</textarea></td>
      </tr>
      <tr>
        <td class="tableleft">房间描述：</td>
        <td><textarea name="dc" id="dc" style="width:400px;">
</textarea></td>
      </tr>
        <tr>
        <td class="tableleft" style="width:100px;">直播间封面：</td>
        <td><div id="cover_default"><img src="/room/images/roomcover.png"/></div><input type="hidden" name="cover" id="cover" value="/room/images/roomcover.png">
            <div class="button button-success" onclick="$('#filedata').click()">修改上传</div>
       </td>
      </tr>
        <tr>
        <td class="tableleft">LOGO：<a href="javascript:;" tip="高度49px，宽度200px左右。 "><i class="i_help"></i></a></td>
        <td><input name="logo" type="text" id="logo" style="width:400px;" />
          <button  type="button" class="button button-mini button-success"><span id="logo_up_bnt"></span></button></td>
      </tr>
        <tr>
        <td class="tableleft">房间背景：<a href="javascript:;" tip="直播室背景图"><i class="i_help"></i></a></td>
        <td><input name="bg" type="text" id="bg" style="width:400px;" />
          <button  type="button" class="button button-mini button-success" ><span id="bg_up_bnt"></span></button></td>
      </tr>
	        <tr style="display:none;">
        <td class="tableleft">房间二维码：<a href="javascript:;" tip="手机访问直播室房间二维码，宽度：160px 高度：160px"><i class="i_help"></i></a></td>
        <td><input name="ewm" type="text" id="ewm" style="width:400px;" />
          <button  type="button" class="button button-mini button-success" ><span id="ewm_up_bnt"></span></button></td>
      </tr>
     
      <tr>
       
        <input type="hidden" name="state" value="1"> 
        <input type="hidden" name="logintc" value="0"> 
         <input type="hidden" name="msgblock" value="0">
          <input type="hidden" name="msglog" value="1">
           <input type="hidden" name="msgaudit" value="0">
            <input type="hidden" name="logintip" value="1">
            <input type="hidden" name="loginguest" value="1">
           <input type="hidden" name="viewkefu" value="0">
      </tr>
 
          <tr>
            <td class="tableleft" style="width:100px;">直播视频源：</td>
            <td><select name="livetype" id="livetype">
             <option value="1">YY转播</option>
             <option value="0" selected >流媒体直播</option>
            </select>&nbsp;</td>
          </tr>
          <tr>
            <td class="tableleft">YY转播代码：</td>
            <td><textarea name="yyfp" rows="10" id="yyfp" style="width:700px; height:150px;"><?=$row['yyfp']?></textarea>
              </td>
          </tr>
          <tr>
            <td class="tableleft">流媒体直播代码：</td>
            <td><textarea name="livefp" rows="10" id="livefp" style="width:700px; height:150px;"><?=$row[livefp]?></textarea>
              </td>
          </tr>
          <tr>
            <td class="tableleft">手机直播代码：</td>
            <td><textarea name="phonefp" rows="10" id="phonefp" style="width:700px;height:150px;"><?=$row[phonefp]?></textarea></td>
          </tr>
       
          
         
         
          <tr>
            <td class="tableleft">&nbsp;</td>
            <td><button type="submit" class="button button-success">添加</button><input type="hidden" name="act" value="rooms_add"></td>
          </tr>
        </table>
      </form>
   			<input id="filedata" type="file" size="20" name="filedata" class="input" style="display:none" onchange="uploadAvatar('filedata')">  
 </div>
<script type="text/javascript" src="../assets/js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="../assets/layer/layer.js"></script>
<script type="text/javascript" src="../assets/js/tip.js"></script> 
<script type="text/javascript" src="../../upload/swfupload/swfupload.js"></script>
<script type="text/javascript" src="/room/script/ajaxfileupload.js"></script>
<script>
    var operation=<?=$operation?>;
    if(operation==1){
layer.alert('添加房间成功', {
    title:'提示',
     shift: 1,
  icon: 1
}, function(){
 window.location.href="rooms.php"; 
})}


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
  swfdef.button_placeholder_id="logo_up_bnt";
  swfdef.file_types="*.gif;*.jpg;*.png";
  swfdef.upload_url="../../upload/upload.php";
  swfdef.post_params={"info":"logo"}
  
  swfu = new SWFUpload(swfdef);
  
 
  
  var swfbg=swfdef;
  swfbg.button_placeholder_id="bg_up_bnt";
  swfbg.file_types="*.gif;*.jpg;*.png";
  swfbg.post_params={"info":"bg"}
  swfubg = new SWFUpload(swfbg);
  
  var swfewm=swfdef;
  swfewm.button_placeholder_id="ewm_up_bnt";
  swfewm.file_types="*.gif;*.jpg;*.png";
  swfewm.post_params={"info":"ewm"}
  swfuewm = new SWFUpload(swfewm);



	  
});
$("#roomid").blur(function() { 

                var  a = $.trim($("#roomid").val());
                var c = /^[0-9]*$/;
               if(!c.test(a)){
                $("#roomidtip").text("房间号码为纯数字");
                 $('#roomid').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
               }else{
                   if(a=='' || a==0){
                   $("#roomidtip").text("房间号码不能为空");
                       $('#roomid').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
                   
                   }else{
                       $.ajax({
			type: "GET",
                        async: true,
			url: '../admin_ajax.php?act=roomidcheck',
			data: "roomid=" + a + '&temp=' + new Date(),
			dataType: "text",
			success: function(result) {

				if (result=='1') {
					$('#roomid').focus().css({
						border: "1px solid red",
						boxShadow: "0 0 2px red"
					});
					$("#roomidtip").text("房间号码已经存在！");
				} else {
					  $("#roomidtip").text("");
                                     $('#roomid').css({
				    border:" 1px solid #d3d3d3",
				boxShadow: "inset 0 2px 5px #ebebeb"
			}); 
				}

			}
		});
                  
                   }
               }
              
            });
function check(){
  var phone = /^[0-9]*$/ ;
                  if ($.trim($('#roomid').val()) == "" || !phone.test($('#roomid').val())) {
			$('#roomid').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			layer.msg('房间号码为纯数字', {shift: 1,icon: 7})
			return false;
		}
                      if ($.trim($('#title').val()) == "") {
			$('#title').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			layer.alert('请填写房间名称', {title:'提示',shift: 1,icon: 2})
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
 function MathRand() { 
var Num=""; 

for(var i=0;i<7;i++) 
{ 
Num+=Math.floor(Math.random()*10); 
} 

$("#roomid").val("8"+Num); 

} 
</script>
<body>
</html>  