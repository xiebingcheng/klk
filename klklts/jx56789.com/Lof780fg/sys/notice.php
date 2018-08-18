<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
if(stripos(auth_group($_SESSION['login_gid']),'sys_notice')===false)exit(denied_pape());
switch($act){
	case "notice_del":
		notice_del($id);
	break;
}
if(!isset($choice_roomid)){
       if(empty($login_roomid)){
 $choice_roomid=$default_roomid;
    }else{
     $choice_roomid=$login_roomid;
}
  }
$room_list_li=room_list_li($choice_roomid);
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
<style type="text/css">
code { padding: 0px 4px; color: #d14; background-color: #f7f7f9; border: 1px solid #e1e1e8; }
</style>
<script>
Date.prototype.Format = function (fmt) { //author: meizz 
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "h+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}
function ftime(time){
	return new Date(time*1000).Format("yyyy-MM-dd hh:mm"); ; 
}

</script>
</head>
<body>
<div class="container"  style="width:800px;">
<form  class="form-horizontal" action="" method="get"> 
  <ul class="breadcrumb">
      <a class="button button-primary" id="add_group_bt" style="float: right" href="?choice_roomid=<?=$choice_roomid?>"><i class="x-icon x-icon-small icon-white" style="    background-position: -239px -22px;"></i>刷新</a>
    <li class="active" >
        
       房间： <select name="choiceroom" id="choiceroom" OnChange="choice_room(this.value)">   
                       <?=$room_list_li;?>  
                     </select>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <button type="button"  class="button button-success" id="add_ban_bt" onClick="noticeAdd()">添加</button>
      &nbsp;&nbsp;
    </li>
  </ul>
  </form>
  <table  class="table table-bordered table-hover definewidth m10">
    <thead>
      <tr style="font-weight:bold" >
        <td width="40" align="center" bgcolor="#FFFFFF">编号</td>
        <td  align="center" bgcolor="#FFFFFF">标题</td>
        <td width="60" align="center" bgcolor="#FFFFFF">状态</td>
        <td width="30" align="center" bgcolor="#FFFFFF">排序</td>
        <td width="120" align="center" bgcolor="#FFFFFF">操作</td>
      </tr>
    </thead>
    <?php
	$query=$db->query("select * from {$tablepre}notice where roomid='$choice_roomid' order by ov desc");
	echo for_each_notice($query,'
    <tr>
      <td bgcolor="#FFFFFF" align="center">{id}</td>
      <td align="center" bgcolor="#FFFFFF">{title}</td>
	  <td align="center" bgcolor="#FFFFFF">{type}</td>
      <td align="center" bgcolor="#FFFFFF">{ov}</td>
      <td align="center" bgcolor="#FFFFFF">
      <button class="button button-mini button-success" onClick="noticeEdit(\'{id}\')"><i class="x-icon x-icon-small icon-trash icon-white"></i>修改</button>
      <button id="del{id}" class="button button-mini button-danger" onclick="if(confirm(\'确定删除？\'))location.href=\'?act=notice_del&id={id}\'" ><i class="x-icon x-icon-small icon-trash icon-white"></i>删除</button></td>
    </tr>
');?>


  </table>
  
</div>
<script type="text/javascript" src="../assets/js/jquery-1.8.1.min.js"></script> 
<script type="text/javascript" src="../assets/layer/layer.js"></script>
<script type="text/javascript" src="../assets/js/bui.js"></script> 
<script type="text/javascript" src="../assets/js/config.js"></script> 
<script type="text/javascript">
$('#del1').hide();
$('#del2').hide();
BUI.use('bui/overlay',function(Overlay){
            dialog = new Overlay.Dialog({
            title:'公告板',
            width:700,
            height:600,
            buttons:[],
            bodyContent:''
          });
});
function noticeAdd(){
	
           var title = '添加内容';
   
        var index = layer.open({
            type: 2,
            title: title,
            area: ['800px', '600px'],
            content: "notice_add.php"
        
        });
      layer.full(index);
}
function noticeEdit(id){
	
           var title = '修改内容';
   
        var index = layer.open({
            type: 2,
            title: title,
            area: ['800px', '600px'],
            content: "notice_edit.php?id="+id
        
        });
      layer.full(index);
}
function choice_room(value){
    
    if(value=='0') return;
   window.location.href="?choice_roomid="+value; 
}
      </script>
</body>
</html>
