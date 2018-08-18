<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
if(stripos(auth_group($_SESSION['login_gid']),'room_lists')===false)exit(denied_pape());
$operation=0;
if($act=="config_edit"){ 
        // $arr['roomid']=trim($roomid);
         $arr['title']=$title;
         $arr['keyss']=$keyss;
	$arr['dc']=$dc;
        $arr['logo']=$logo;
	$arr['ewm']=$ewm;
	$arr['bg']=$bg;
        $arr['livefp']=$livefp;
        $arr['state']=$state;
        $arr['logintip']=$logintip;
	$arr['msgblock']=$msgblock;
	$arr['msglog']=$msglog;
	$arr['msgaudit']=$msgaudit;
	$arr['logintc']=$logintc;
	$arr['loginguest']=$loginguest;
	$arr['livetype']=$livetype;
        $arr['yyfp']=$yyfp;
        $arr['livefp']=$livefp;
	$arr['phonefp']=$phonefp;
	$arr['rebots']=$rebots;
	$arr['tiyantime']=$tiyantime;
        $arr['fayanjiange']=$fayanjiange;
         $arr['defkf']=$defkf;
         $arr['pwd']=$pwd;
          $arr['tipimg']=$tipimg;
         $arr['sysstart']=$sminute*60+$shour*60*60;
        $arr['sysend']=59+$xminute*60+$xhour*60*60;
        $arr['viewkefu']=$viewkefu;
        $arr['roomadmin']=$roomadmin;
        $arr['cover']=$cover;
     //如果设置了房间管理员，设置房间管理员所属房间
     
        if(!empty($roomadmin)){
          $db->query("update {$tablepre}members set roomid=0  where roomid='$rid' and gid=17");
            $db->query("update {$tablepre}members set roomid='$rid'   where username='$roomadmin' and gid=17");
            
            }
	room_config_edit($arr,$id);
        $operation=1;
}


$query=$db->query("select * from  {$tablepre}config where id='$id'");
$row=$db->fetch_row($query);
//系统开启时间转为为时分
 if($row['sysstart']>60*60){
     $shour=floor($row['sysstart']/(60*60));
 }
 $yu=$row['sysstart']-$shour*60*60;
  if($yu>=60){
     $sminute=floor($yu/60);
 }


    
 //关闭时间转化为时分
     if($row['sysend']>60*60){
     $xhour=floor($row['sysend']/(60*60));
 }
 $yu=$row['sysend']-$xhour*60*60;
  if($yu>=60){
     $xminute=floor($yu/60);
 }

  
 for($i=0;$i<24;$i++){
     if($i==$shour){$selected='selected';}else{$selected='';}
   $shour_list.='<option value="'.$i.'"'.$selected.'>'.$i.'</option>'; 
   if($i==$xhour){$selected='selected';}else{$selected='';}
   $xhour_list.='<option value="'.$i.'"'.$selected.'>'.$i.'</option>'; 
    }
 for($i=0;$i<60;$i++){
     if($i==$sminute){$selected='selected';}else{$selected='';}
   $sminute_list.='<option value="'.$i.'"'.$selected.'>'.$i.'</option>'; 
    if($i==$xminute){$selected='selected';}else{$selected='';}
   $xminute_list.='<option value="'.$i.'"'.$selected.'>'.$i.'</option>'; 
    }
   //获取房间管理员列表 
    $query=$db->query("select uid,username from {$tablepre}members where gid='17' and (roomid=0 or roomid='$row[roomid]')  order by uid desc");
    $group='<option value="" >无</option>';
while($row2=$db->fetch_row($query)){
    if($row['roomadmin']==$row2['username']){$selected='selected';}else{$selected='';}
	$group.='<option value="'.$row2['username'].'"'.$selected.'>'.$row2['username'].'</option>';
}

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
  
    
    <div class="container">
         <div class="crumbs">
            <ul id="breadcrumbs" class="breadcrumb">
              <li>
                <i class="icon-home">
                </i>
      <a  style="color: #000;"href="rooms.php"> 房间列表</a>><?=$row['title']?>
           </li>
           </ul>
       
          </div>
     <form action="" method="post" enctype="application/x-www-form-urlencoded"  onsubmit="return check()">
        <table class="">
               <tr>
        <td class="tableleft" style="width:100px;">房间号码：</td>
        <td><input name="roomid" type="text" id="roomid" style="width:400px;" value="<?=$row['roomid']?>" disabled="disabled" /></td>
      </tr>
            <tr>
        <td class="tableleft" style="width:100px;">房间名称：</td>
        <td><input name="title" type="text" id="title" style="width:400px;" value="<?=$row['title']?>"/></td>
      </tr>
         <tr>
        <td class="tableleft">关 键 字：</td>
        <td><textarea name="keyss" rows="2" id="keyss" style="width:400px;"><?=$row[keyss]?>
</textarea></td>
      </tr>
      <tr>
        <td class="tableleft">房间描述：</td>
        <td><textarea name="dc" id="dc" style="width:400px;"><?=$row[dc]?>
</textarea></td>
      </tr>
        <tr>
        <td class="tableleft" style="width:100px;">直播间封面：</td>
        <td><div id="cover_default"><img src="<?=$row['cover']?>"/></div><input type="hidden" name="cover" id="cover" value="<?=$row['cover']?>">
            <div class="button button-success" onclick="$('#filedata').click()">修改上传</div>
       </td>
      </tr>
        <tr>
        <td class="tableleft">LOGO：<a href="javascript:;" tip="高度49px，宽度200px左右。 "><i class="i_help"></i></a></td>
        <td><input name="logo" type="text" id="logo" style="width:400px;" value="<?=$row['logo']?>"/>
          <button  type="button" class="button button-mini button-success"><span id="logo_up_bnt"></span></button></td>
      </tr>
        <tr>
        <td class="tableleft">房间背景：<a href="javascript:;" tip="直播室背景图"><i class="i_help"></i></a></td>
        <td><input name="bg" type="text" id="bg" style="width:400px;" value="<?=$row[bg]?>"/>
          <button  type="button" class="button button-mini button-success" ><span id="bg_up_bnt"></span></button></td>
      </tr>
	        <tr style="display:none">
        <td class="tableleft">房间二维码：<a href="javascript:;" tip="手机访问直播室二维码，宽度：160px 高度：160px"><i class="i_help"></i></a></td>
        <td><input name="ewm" type="text" id="ewm" style="width:400px;" value="<?=$row[ewm]?>"/>
          <button  type="button" class="button button-mini button-success" ><span id="ewm_up_bnt"></span></button></td>
      </tr>
     
      <tr>
        <td class="tableleft">房间状态：</td>
        <td><select name="state" id="state" style="width:100px;" onChange="system_state(this.value);">
           <option value="1"<? if($row[state]==1) echo 'selected'; ?>>开启</option>
            <option value="0" <? if($row[state]==0) echo 'selected'; ?>>关闭</option>
            <option value="2" <? if($row[state]==2) echo 'selected'; ?>>加密</option>
           <option value="3" <? if($row[state]==3) echo 'selected'; ?>>开启时间</option>
          </select>
          <label id="pwd_s" style="display:none"> 密码：
            <input name="pwd" type="text" id="pwd" value="<?=$row[pwd]?>"/>
          </label>
        <label id="opentime" style="display:none">&nbsp;&nbsp;
                 <select name="shour" id="shour" style="width:70px;" ><?=$shour_list?></select>&nbsp;<label class="control-label">时</label>
                 <select name="sminute" id="sminute" style="width:70px;" ><?=$sminute_list?></select>&nbsp;<label class="control-label">分</label>
                &nbsp;<span style="color:#F90">至</span>&nbsp;
                    <select name="xhour" id="xhour" style="width:70px;" ><?=$xhour_list?></select>&nbsp;<label class="control-label">时</label>
                 <select name="xminute" id="xminute" style="width:70px;" ><?=$xminute_list?></select>&nbsp;<label class="control-label">分</label>
                  </label>
        </td>
         
      </tr>
        <tr>
        <td class="tableleft">进入房间弹窗：<a href="javascript:;" tip="弹窗图片尺寸 宽度：800px,高度：285px"><i class="i_help"></i></a></td>
        <td><select name="logintc" id="logintc" style="width:100px;" onChange="tipimg_state(this.value);">
           <option value="1"<? if($row['logintc']==1) echo 'selected'; ?>>开启</option>
            <option value="0" <? if($row['logintc']==0) echo 'selected'; ?>>关闭</option>
           </select>&nbsp;
         <label id="tip_s" style="display:none"> 弹窗图片： <input name="tipimg" type="text" id="tipimg" style="width:400px;" value="<?=$row['tipimg']?>"/>
          <button  type="button" class="button button-mini button-success" ><span id="tipimg_up_bnt"></span></button></label>
          </td>
         
      </tr>
      <tr>
        <td class="tableleft">&nbsp;</td>
        <td>消息屏蔽：<a href="javascript:;" tip="具备直播室房间管理员权限的用户，可以对直播室的消息进行及时回滚删除"><i class="i_help"></i></a>
          <label for="msgblock"></label>
          <select name="msgblock" id="msgblock" style="width:80px;">
          
            <option value="1" <? if($row[msgblock]==1) echo 'selected'; ?>>开启</option>
            <option value="0" <? if($row[msgblock]==0) echo 'selected'; ?>>关闭</option>
          </select>
          &nbsp;消息记录：<a href="javascript:;" tip="直播室发言内容和用户操作日志记录保存在数据库中，可在“系统设置-》日志管理/聊天记录”里查看"><i class="i_help"></i></a>
          <label for="msglog"></label>
          <select name="msglog" id="msglog" style="width:80px;">
         
            <option value="1" <? if($row[msglog]==1) echo 'selected'; ?>>开启</option>
            <option value="0" <? if($row[msglog]==0) echo 'selected'; ?>>关闭</option>
          </select>
         &nbsp; 消息审核：<a href="javascript:;" tip="具备直播室房间管理员权限的用户，可以对直播室的消息进行审核。只有通过审核的消息，直播室中的其他所有用户才能看到"><i class="i_help"></i></a>
          <label for="msgaudit"></label>
          <select name="msgaudit" id="msgaudit" style="width:80px;">
            
            <option value="1" <? if($row[msgaudit]==1) echo 'selected'; ?>>开启</option>
            <option value="0" <? if($row[msgaudit]==0) echo 'selected'; ?>>关闭</option>
          </select></td>
      </tr>
      <tr>
        <td class="tableleft">&nbsp;</td>
        <td>登录提示：<a href="javascript:;" tip="以游客身份进入本聊天室的用户，每15分钟弹出注册登录提示窗口"><i class="i_help"></i></a>
          <label for="logintip"></label>
          <select name="logintip" id="select6" style="width:80px;">
           
            <option value="1" <? if($row[logintip]==1) echo 'selected'; ?>>开启</option>
            <option value="0" <? if($row[logintip]==0) echo 'selected'; ?>>关闭</option>
          </select>
          &nbsp;游客登录：<a href="javascript:;" tip="是否让游客可以进入直播室"><i class="i_help"></i></a>
          <select name="loginguest" id="loginguest" style="width:80px;">
          
            <option value="1" <? if($row[loginguest]==1) echo 'selected'; ?>>开启</option>
            <option value="0" <? if($row[loginguest]==0) echo 'selected'; ?>>关闭</option>
          </select>
          <!--
&nbsp;第三方登录：
<label for="loginqq"></label>
<select name="loginqq" id="loginqq" style="width:70px;">
<option value="<?=$row[loginqq]?>"><?=$row[loginqq]?>:不变</option>
  <option value="1">1是</option>
  <option value="0">0否</option>
</select>
-->
         
&nbsp;</td>
      </tr>
          <tr style="display:none">
            <td class="tableleft" style="width:100px;">直播视频源：</td>
            <td><select name="livetype" id="livetype">
             <option value="1"  <? if($row['livetype']==1) echo 'selected'; ?>>YY转播</option>
             <option value="0" <? if($row['livetype']==0) echo 'selected'; ?>>流媒体直播</option>
            </select>&nbsp;</td>
          </tr>
          <tr>
            <td class="tableleft">YY转播代码：</td>
            <td><textarea name="yyfp" rows="10" id="yyfp" style="width:700px; height:150px;"><?=$row['yyfp']?></textarea>
              </td>
          </tr>
          <tr style="display:none">
            <td class="tableleft">流媒体直播代码：</td>
            <td><textarea name="livefp" rows="10" id="livefp" style="width:700px; height:150px;"><?=$row[livefp]?></textarea>
              </td>
          </tr>
          <tr style="display:none">
            <td class="tableleft">手机直播代码：</td>
            <td><textarea name="phonefp" rows="10" id="phonefp" style="width:700px;height:150px;"><?=$row[phonefp]?></textarea></td>
          </tr>
          <tr>
            <td class="tableleft">机器人最大在线数：</td>
            <td><input name="rebots" type="text" id="rebots"  value="<?=$row[rebots]?>"/>
            默认为0 不调用机器人</td>
          </tr>
           
           <tr>
            <td class="tableleft">游客体验时间(分钟)：</td>
            <td><input name="tiyantime" type="text" id="tiyantime" maxlength="7"  value="<?=$row[tiyantime]?>"/>
           <a href="javascript:;" tip="默认为0不限制!"><i class="i_help"></i></a></td>
          </tr>
           <tr>
            <td class="tableleft">游客发言间隔(秒)：</td>
            <td><input name="fayanjiange" type="text" id="tiyantime"  value="<?=$row[fayanjiange]?>"/>
            默认为0 无限制</td>
          </tr>
           <tr>
            <td class="tableleft" style="width:100px;">房间客服QQ：</td>
            <td><select name="viewkefu" id="viewkefu" style="width:152px;">
             <option value="1"  <? if($row['viewkefu']==1) echo 'selected'; ?>>客服QQ设置</option>
             <option value="0" <? if($row['viewkefu']==0) echo 'selected'; ?>>调用助理用户QQ</option>
                </select><a href="javascript:;" tip="若选择“客服QQ设置”可以在【房间管理】->【客服QQ设置】里面设置QQ号"><i class="i_help"></i></a>&nbsp;</td>
          </tr>
          
          <tr <?php if(!empty($login_roomid)){echo 'style="display:none;"';}?>>
            <td class="tableleft" style="width:100px;">房间管理员：</td>
            <td><select name="roomadmin" id="roomadmin" style="width:152px;">
            <?=$group?>
            </select>&nbsp;</td>
          </tr>
          <tr style="display:none;">
            <td class="tableleft">默认助理：</td>
            <td><input name="defkf" type="text" id="defkf"  value="<?=$row[defkf]?>"/></td>
          </tr>
          <tr>
            <td class="tableleft">&nbsp;</td>
            <td><button type="submit" class="button button-success"> 保存 </button><input type="hidden" name="id" value="<?=$row['id']?>"><input type="hidden" name="rid" value="<?=$row['roomid']?>"><input type="hidden" name="act" value="config_edit"></td>
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
layer.alert('保存成功', {
    title:'提示',
     shift: 1,
  icon: 1,
time:1000
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

var swftip=swfdef;
  swftip.button_placeholder_id="tipimg_up_bnt";
  swftip.file_types="*.gif;*.jpg;*.png";
  swftip.post_params={"info":"tipimg"}
  swfutip = new SWFUpload(swftip);

	  
});

function check(){
  var phone = /^[0-9]*$/ ;
                  if ($.trim($('#roomid').val()) == "" || !phone.test($('#roomid').val())) {
			$('#roomid').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			layer.alert('房间号码为纯数字', {title:'提示',shift: 1,icon: 2})
			return false;
		}
  /*检查体验时间*/
  var intreg = /^[0-9]*$/,
      time = $.trim($('#tiyantime').val());
  if (!intreg.test(time)) {
    layer.alert('体验时间必须为大于等于0的整数', {title:'提示',shift: 1,icon: 2});
    $('#tiyantime').val(0);
    return false;
}
  if ( parseInt(time) > 142560) {
    layer.alert('体验时间不能超过99天(142560分钟)', {title:'提示',shift: 1,icon: 2});
    $('#tiyantime').val(142560);
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
function system_state(value){ 

if(value=='2'){$('#pwd_s').show();
}else if(value=='3'){
    
    $('#pwd_s').hide();
 $('#opentime').show();   
}else {
    $('#pwd_s').hide();
    $('#opentime').hide(); 
}
}
function tipimg_state(value){ 

if(value=='1'){$('#tip_s').show();
}else {
    $('#tip_s').hide();
  }
}
var roomstate=<?=$row['state']?>; if(roomstate=='2')$('#pwd_s').show(); if(roomstate=='3')$('#opentime').show(); 
var logintc=<?=$row['logintc']?>;if(logintc=='1')$('#tip_s').show();
</script>
<body>
</html>  