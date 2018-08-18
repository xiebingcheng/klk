<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
if(stripos(auth_group($_SESSION['login_gid']),'sys_base')===false)exit(denied_pape());
$operation=0;
if($act=="config_edit"){
	$arr[tserver]=$tserver;
	$arr[livefp]=$livefp;
        $arr[yyfp]=$yyfp;
	$arr[phonefp]=$phonefp;
	$arr[rebots]=$rebots;
	$arr[defkf]=$defkf;
	$arr[vserver]=$vserver;
	$arr[livetype]=$livetype;

	$arr[defkf]=$defkf;
	$arr[tiyantime]=$tiyantime;
        $arr[fayanjiange]=$fayanjiange;
	config_edit($arr);
        $operation=1;
}


$query=$db->query("select * from  {$tablepre}config where id=1");
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
  
    
    <div class="container">
         <div class="crumbs">
            <ul id="breadcrumbs" class="breadcrumb">
              <li>
                <i class="icon-home">
                </i>
        聊天&直播&机器人
           </li>
           </ul>
       
          </div>
     <form action="" method="post" enctype="application/x-www-form-urlencoded">
        <table class="">
          <tr style="display:none;">
            <td class="tableleft" style="width:100px;">websocket服务端：</td>
            <td><input name="tserver" type="text" id="tserver" style="width:400px;" value="<?=$row[tserver]?>"/></td>
          </tr>
          <tr style="display:none;">
            <td class="tableleft">视频服务器：</td>
            <td><input name="vserver" type="text" id="vserver" style="width:400px;" value="<?=$row[vserver]?>"/></td>
          </tr>
          <tr>
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
            <td class="tableleft">机器人最大在线数：</td>
            <td><input name="rebots" type="text" id="rebots"  value="<?=$row[rebots]?>"/>
            默认为0 不调用机器人</td>
          </tr>
           <tr>
            <td class="tableleft">游客体验时间(分钟)：</td>
            <td><input name="tiyantime" type="text" id="tiyantime"  value="<?=$row[tiyantime]?>"/>
           <a href="javascript:;" tip="默认为0不限制!"><i class="i_help"></i></a></td>
          </tr>
           <tr>
            <td class="tableleft">游客发言间隔(秒)：</td>
            <td><input name="fayanjiange" type="text" id="tiyantime"  value="<?=$row[fayanjiange]?>"/>
            默认为0 无限制</td>
          </tr>
          <tr>
            <td class="tableleft">默认客服：</td>
            <td><input name="defkf" type="text" id="defkf"  value="<?=$row[defkf]?>"/></td>
          </tr>
          <tr>
            <td class="tableleft">&nbsp;</td>
            <td><button type="submit" class="button button-success"> 保存 </button><input type="hidden" name="act" value="config_edit"></td>
          </tr>
        </table>
      </form>
     
 </div>
<script type="text/javascript" src="../assets/js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="../assets/layer/layer.js"></script>
<script type="text/javascript" src="../assets/js/tip.js"></script> 
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
</script>
<body>
</html>  