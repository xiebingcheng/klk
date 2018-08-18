<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
if(stripos(auth_group($_SESSION['login_gid']),'sys_base')===false)exit(denied_pape());
$operation=0;
if($act=="config_edit"){
	$arr[title]=$title;
	$arr[keys]=$keys;
	$arr[dc]=$dc;
        $arr['tserver']=$tserver;
	$arr[logo]=$logo;
	$arr[ico]=$ico;
	$arr[msgban]=$msgban;
	$arr[regban]=$regban;
	$arr[regaudit]=$regaudit;
	$arr[tongji]=$tongji;
	$arr[copyright]=$copyright;
       $arr['goldegg']=$goldegg;
        $arr['rotate']=$rotate;
        $arr['autoplan']=$autoplan;
     
	config_edit($arr);
        $operation=1;
}


$query=$db->query("select * from  {$tablepre}global_config where id=1");
$row=$db->fetch_row($query);

 //更新全局参数到redis
 if($redis_state){
if($operation==1){
   $redis = new Redis();
   $redis->connect('127.0.0.1', 6379);
   $redis->auth($redis_password);
   $global_config=serialize($row);
   $redis->set("global_config", $global_config);
   $redis->close();
}
 }
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
?>
<!DOCTYPE HTML>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../assets/layer/skin/layer.css" rel="stylesheet" type="text/css" />
<link href="../assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
<link href="../assets/css/bui-min.css" rel="stylesheet" type="text/css" />
<link href="../assets/css/page-min.css" rel="stylesheet" type="text/css" />
<link href="../assets/css/prettify.css" rel="stylesheet" type="text/css" />
<link href="../assets/css/base.css" rel="stylesheet" type="text/css" />
<style type="text/css">
code {
	padding: 0px 4px;
	color: #d14;
	background-color: #f7f7f9;
	border: 1px solid #e1e1e8;
}
input, button {
	vertical-align:middle
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
        系统设置
           </li>
           </ul>
       
          </div>
  <form action="" method="post" enctype="application/x-www-form-urlencoded">
    <table class="">
      <tr>
        <td class="tableleft" style="width:100px;">网站标题：</td>
        <td><input name="title" type="text" id="title" style="width:400px;" value="<?=$row[title]?>"/></td>
      </tr>
      <tr>
        <td class="tableleft">关 键 字：</td>
        <td><textarea name="keys" rows="2" id="keys" style="width:400px;"><?=$row[keys]?>
</textarea></td>
      </tr>
      <tr>
        <td class="tableleft">站点描述：</td>
        <td><textarea name="dc" id="dc" style="width:400px;"><?=$row[dc]?>
</textarea></td>
      </tr>
      <tr style="display:none;">
            <td class="tableleft" style="width:100px;">websocket服务端：</td>
            <td><input name="tserver" type="text" id="tserver" style="width:400px;" value="<?=$row[tserver]?>"/></td>
          </tr>
      <tr style="display:none;">
        <td class="tableleft">LOGO：<a href="javascript:;" tip="高度49px，宽度200px左右。 "><i class="i_help"></i></a></td>
        <td><input name="logo" type="text" id="logo" style="width:400px;" value="<?=$row[logo]?>"/>
          <button  type="button" class="button button-mini button-success"><span id="logo_up_bnt"></span></button></td>
      </tr>
      <tr>
        <td class="tableleft">ICO：<a href="javascript:;" tip="网站ICON图标,显示在网站标题左边"><i class="i_help"></i></a></td>
        <td><input name="ico" type="text" id="ico" style="width:400px;" value="<?=$row[ico]?>"/>
          <button  type="button" class="button button-mini button-success" ><span id="ico_up_bnt"></span></button></td>
      </tr>
     
      <tr>
        <td class="tableleft">注册过滤：<a href="javascript:;" tip="过滤词以“|” 隔开,切记过滤词最开始和结尾不能加“|”"><i class="i_help"></i></a></td>
        <td><textarea name="regban" id="regban" style="width:400px;"><?=$row[regban]?>
</textarea></td>
      </tr>
      <tr>
        <td class="tableleft">聊天过滤：<a href="javascript:;" tip="过滤词以“|” 隔开,切记过滤词最开始和结尾不能加“|”"><i class="i_help"></i></a></td>
        <td><textarea name="msgban" id="msgban" style="width:400px;"><?=$row[msgban]?>
</textarea></td>
      </tr>
         
        <tr>
        <td class="tableleft">注册审核：<a href="javascript:;" tip="开启注册审核以后，则新注册用户必须通过管理员后台审核通过后，才能登录进入直播室"><i class="i_help"></i></a></td>
        <td>
        
          <select name="regaudit" id="regaudit" style="width:80px;">
          
            <option value="1" <? if($row[regaudit]==1) echo 'selected'; ?>>开启</option>
            <option value="0" <? if($row[regaudit]==0) echo 'selected'; ?>>关闭</option>
          </select>
&nbsp;</td>
      </tr>
        <tr  style="display:none">
        <td class="tableleft">砸金蛋：</td>
        <td>
        
          <select name="goldegg" id="goldegg" style="width:80px;">
          
            <option value="1" <? if($row['goldegg']==1) echo 'selected'; ?>>开启</option>
            <option value="0" <? if($row['goldegg']==0) echo 'selected'; ?>>关闭</option>
          </select>
      </td>
      </tr>
          <tr  style="display:none">
        <td class="tableleft">转盘抽奖：</td>
        <td>
        
          <select name="rotate" id="rotate" style="width:80px;">
          
            <option value="1" <? if($row['rotate']==1) echo 'selected'; ?>>开启</option>
            <option value="0" <? if($row['rotate']==0) echo 'selected'; ?>>关闭</option>
          </select>
      </td>
      </tr>
         <tr>
        <td class="tableleft">自动计划：<a href="javascript:;" tip="开启自动计划发送后，系统会自动调用发送计划文本里面的内容。"><i class="i_help"></i></a></td>
        <td>
        
          <select name="autoplan" id="autoplan" style="width:80px;">
          
            <option value="1" <? if($row['autoplan']==1) echo 'selected'; ?>>开启</option>
            <option value="0" <? if($row['autoplan']==0) echo 'selected'; ?>>关闭</option>
          </select>
      </td>
      </tr>
      <tr>
        <td class="tableleft">统计代码：</td>
        <td><textarea name="tongji" id="tongji" style="width:400px;"><?=tohtml($row[tongji])?>
</textarea></td>
      </tr>
      <tr>
        <td class="tableleft">版权信息：</td>
        <td><textarea name="copyright" rows="15" id="copyright" style="width:400px;"><?=tohtml($row[copyright])?>
</textarea></td>
      </tr>
      <tr>
        <td class="tableleft"></td>
        <td><button type="submit" class="button button-success"> 保存 </button>
          <input type="hidden" name="act" value="config_edit"></td>
      </tr>
    </table>
  </form>
</div>
<script type="text/javascript" src="../assets/js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="../assets/layer/layer.js"></script>
<script type="text/javascript" src="../assets/js/tip.js"></script> 
<script type="text/javascript" src="../../upload/swfupload/swfupload.js"></script>

<script>
    var operation=<?=$operation?>;
    if(operation==1){
layer.alert('保存成功', {
    title:'提示',
     shift: 1,
     closeBtn: 0, //不显示关闭按钮
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
  
  var swfico=swfdef;
  swfico.button_placeholder_id="ico_up_bnt";
  swfico.file_types="*.ico";
  swfico.post_params={"info":"ico"}
  swfuico = new SWFUpload(swfico);
  


	  
});

</script>
<body>
</html>
