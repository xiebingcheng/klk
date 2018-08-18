<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
require_once '../../include/IpLocation.class.php';
$Ip = new \Org\Net\IpLocation('UTFWry.dat'); // 实例化类 参数表示IP地址库文件
if(stripos(auth_group($_SESSION['login_gid']),'sys_log')===false)exit(denied_pape());
switch($act){
	case "log_del":
		chatlog_del(implode(',',$id));
	break;
    
    case "delhistory":
       $value=$request->post('value');
     chatlog_delhistory($value);
       
        break;
}
$rid_sql= empty($login_roomid)?'':" and rid='$login_roomid'";
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
	return new Date(time*1000).Format("yyyy-MM-dd hh:mm:ss"); ; 
}
var type=[];
type["0"]="聊天";
type["1"]="登陆";
type["2"]="置顶公告";
type["3"]="管理提示";
type["4"]="私聊";
</script>
</head>
<body>
<div class="container"  style=" min-width:1300px;">
<form  class="form-horizontal" action="" method="get"> 
  <ul class="breadcrumb">
    <li class="active">
    关键字：
      <input type="text" name="key" id="key"class="abc input-default" placeholder="UID、用户名、IP、聊天内容为查询字段" value="<?=$key?>"> 
      &nbsp;&nbsp;
        类型：
      <select name="chattype" id="chattype" >
<option value="-1">全部</option>
<option value="0" <? if($chattype==='0') echo 'selected'; ?>>聊天</option>
<option value="4" <? if($chattype==4) echo 'selected'; ?>>私聊</option>

        
            </select>
             &nbsp;&nbsp;
         时间：
        <input type="text" name="starttime" id="starttime"  class="calendar" value="<?=$starttime?>"> 到
    <input type="text" name="endtime" id="endtime"  class="calendar" value="<?=$endtime?>"> 
      <button type="submit"  class="button ">查询</button>
      <button type="button"  class="button  button-danger" id="add_ban_bt" onClick="if(confirm('确定删除？'))$('#log_list').submit()">删除所选</button>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <select name="moreselAge" id="addNew" OnChange="delhistory(this.value)">   
                         <option value="0" >删除历史记录</option>
                         <option value="all" >清空所有聊天记录</option>
                         <option value="1" >删除一天前历史记录</option>
                         <option value="7" >删除一周前历史记录</option>   
                         <option value="30" >删除一个月前历史记录</option>   
                         <option value="60">删除二个月前历史记录</option>    
                     </select>    
    &nbsp;&nbsp;</li>
   
  </ul>
  </form>
  <form action="" method="POST" enctype="application/x-www-form-urlencoded"  class="form-horizontal" id="log_list"><input type="hidden" name="act" value="log_del"> 
  <table  class="table table-bordered table-hover definewidth m10">
    <thead>
      <tr style="font-weight:bold" >
        <td width="40" align="center" bgcolor="#FFFFFF">编号</td>
        <td width="19" align="center" bgcolor="#FFFFFF"><input type="checkbox" onClick="$('.ids').attr('checked',this.checked); "></td>
        <td width="74" align="center" bgcolor="#FFFFFF">UID</td>
        <td width="100" align="center" bgcolor="#FFFFFF">发言人</td>
        <td width="100" align="center" bgcolor="#FFFFFF">对象</td>
        <td style="width: 150px;" align="center" bgcolor="#FFFFFF">IP</td>
        <td style="width: 140px;" align="center" bgcolor="#FFFFFF">时间</td>
        <td width="36" align="center" bgcolor="#FFFFFF">类型</td>
        <td width="60" align="center" bgcolor="#FFFFFF">房间</td>
        <td align="center" bgcolor="#FFFFFF">聊天内容</td>
        <td width="55" align="center" bgcolor="#FFFFFF">操作</td>
      </tr>
    </thead>
 <?php
 	global $firstcount,$displaypg;
	$sql="select * from {$tablepre}chatlog where 1=1 $rid_sql ";
	if($key!="")$sql.=" and  (uid like '%$key%' or ip like '%$key%' or uname like '%$key%' or tname like '%$key%' or msg like '%$key%')";
        if($chattype!="" && $chattype!="-1" ){
	$sql.=" and type='$chattype' ";
}

if($starttime!=""){
    $int_starttime =strtotime($starttime);
  
    $sql.=" and mtime>='$int_starttime'";
    
    }
    if($endtime!=""){
    $int_endtime =strtotime($endtime)+24*3600;;

    $sql.=" and mtime<'$int_endtime' ";
    
    }
	 $num=20;
	$count=$db->num_rows($db->query($sql));
	pageft($count,$num,"");
	$sql.=" order by id desc";
	$sql.=" limit $firstcount,$displaypg";
	$query=$db->query($sql);
	  while($row=$db->fetch_row($query)){
 
 
 ?>  
        <tr>
      <td align="center" bgcolor="#FFFFFF"><?=$row['id']?></td>
      <td align="center" bgcolor="#FFFFFF"><input type="checkbox" class="ids" name="id[]" value="<?=$row['id']?>"></td>
      <td align="center" bgcolor="#FFFFFF"><?=$row['uid']?></td>
      <td align="center" bgcolor="#FFFFFF"><?=$row['uname']?></td>
      <td align="center" bgcolor="#FFFFFF"><?=$row['tname']?></td>
            <td align="center" bgcolor="#FFFFFF"><?php $area =$Ip->getlocation($row['ip']);$iparea=$area['country'].$area['area']; echo $row['ip'];echo '('.$iparea.')';?>&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF"><script>document.write(ftime(<?=$row['mtime']?>)); </script></td>
      <td align="center" bgcolor="#FFFFFF"><script>document.write(type['<?=$row['type']?>']); </script></td>
      <td align="center" bgcolor="#FFFFFF"><?=$row['rid']?></td>
      <td align="center" bgcolor="#FFFFFF"><?=html_entity_decode($row['msg'])?></td>
      <td align="center" bgcolor="#FFFFFF">
      <button type="button" class="button button-mini button-danger" onclick="if(confirm('确定删除？'))location.href='?act=log_del&id[]=<?=$row['id']?>'" ><i class="x-icon x-icon-small icon-trash icon-white"></i>删除</button></td>
    </tr>
<?php } ?>


  </table>
  </form> 
    <ul class="breadcrumb">
    <li class="active"><?=$pagenav?>
    </li>
  </ul>
</div>
<script type="text/javascript" src="../assets/js/jquery-1.8.1.min.js"></script> 
<script type="text/javascript" src="../assets/js/bui.js"></script> 
<script type="text/javascript" src="../assets/js/config.js"></script> 
<script type="text/javascript">
function delhistory(value){
    
    if(value=='0') return;
    if(confirm('确定删除历史聊天记录吗？')){
      $.post("?act=delhistory",{value:value},
  function(data){
 location.reload() ;
 alert("删除历史聊天记录成功");
  },
  "text");
    }
}
    BUI.use('bui/calendar',function(Calendar){
          var datepicker = new Calendar.DatePicker({
            trigger:'.calendar',
			dateMask : 'yyyy-mm-dd',
            autoRender : true
          });
        });
</script> 
</body>
</html>
