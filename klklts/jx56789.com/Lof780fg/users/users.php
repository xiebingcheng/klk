<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
if(stripos(auth_group($_SESSION['login_gid']),'users_list')===false)exit(denied_pape());
$auth_rule_userdel=false;
if(stripos(auth_group($_SESSION['login_gid']),'users_del')!==false)$auth_rule_userdel=true;

switch($act){
	case "user_del":
		if(stripos(auth_group($_SESSION['login_gid']),'users_del')===false)exit(denied_pape());
		  if(is_array($id)){
                     foreach ($id as $value) {
                      $username=userinfo($value,'{username}');
                    $db->query("update {$tablepre}members set fuser='' where fuser='$username'");
                    $db->query("update {$tablepre}guest set fuser='' where fuser='$username'");
                      }
                  user_del(implode(',',$id));  
                }
		else{
                    $username=userinfo($id,'{username}');
                    $db->query("update {$tablepre}members set fuser='' where fuser='$username'");
                    $db->query("update {$tablepre}guest set fuser='' where fuser='$username'");
                       user_del($id); 
                }
		header("location:?gid=".$gid);
	break;
}


if(!isset($choice_roomid)){
       if(empty($login_roomid)){
 $choice_roomid=0;
 $nogid='0';
    }else{
     $choice_roomid=$login_roomid;
     $nogid='0,2';
    }
  }
  //获取用户分组
$user_group_list=user_group_list($sgid,$nogid);
$room_list_li = room_list_li_each($choice_roomid);
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
function ftime2(time){
	if(time>(60*60*24)) return parseInt(time/(60*60*24))+"天";
	else if(time>(60*60))return parseInt(time/(60*60))+"小时";
	else if(time>60)return parseInt(time/60)+"分钟";
	else return parseInt(time)+"秒";
}
function sgid(id){
	var arr=new Array();
	if(isNaN(id)) return '';
	<?php
	$query=$db->query("select * from {$tablepre}auth_group order by id desc");
while($row=$db->fetch_row($query)){
	echo "arr['{$row[id]}']='$row[title]';";
	}
	?>
	return arr[id];
}
</script>
</head>
<body>
<div class="container">
<form  class="form-horizontal" action="" method="get"> 
  <ul class="breadcrumb">
      <button type="button" class="button button-success" id="add_group_bt" style="float: right" onclick="addUser()">添加用户</button>
      
    <li class="active">  <span style="color: #F90">房间：</span> <select name="choiceroom" id="choiceroom" OnChange="choice_room(this.value)">   
                       <?=$room_list_li;?>  
                     </select>  &nbsp;&nbsp;关键字：
      <input type="text" name="skey" id="rolename"class="abc input-default" style="width: 255px;" placeholder="用户名、昵称、推广人、手机QQ为查询字段">
      用户组：
      <select name="sgid" id="sgid" >
			<option value="-1" selected = "selected">全部</option>
            <?=$user_group_list?>
            </select>
      <input type="hidden" name="fuser" value="<?=$fuser?>">
       <input type="hidden" name="choice_roomid" value="<?=$choice_roomid?>">
      &nbsp;&nbsp;
      <button type="submit"  class="button ">查询</button>
       <button type="button" class="button button-success"  onclick="doexcel('<?=$sgid?>','<?=$choice_roomid?>')">导出Excel</button>
      <button type="button"  class="button  button-danger"  onClick="if(confirm('确定删除？'))$('#hd_list').submit()">删除所选</button>
    &nbsp;&nbsp; </li>
   
  </ul>
  </form>
    <form action="" method="POST" enctype="application/x-www-form-urlencoded"  class="form-horizontal" id="hd_list">
	<input type="hidden" name="gid" value="<?=$gid?>">
	<input type="hidden" name="act" value="user_del">
  <table  class="table table-bordered table-hover definewidth m10">
    <thead>
      <tr style="font-weight:bold" class="m-table-th-bg">
        <td align="center" bgcolor="#FFFFFF" width="40">用户ID</td>
        <td align="center" bgcolor="#FFFFFF" width="20"><input type="checkbox" onClick="$('.ids').attr('checked',this.checked); "></td>
        <td align="center" bgcolor="#FFFFFF">用户名</td>
        <td align="center" bgcolor="#FFFFFF" width="80">昵称</td>
        <td align="center" bgcolor="#FFFFFF">红包</td>
		<td align="center" bgcolor="#FFFFFF">积分</td>
        <td align="center" bgcolor="#FFFFFF" width="90">手机</td>
		<td align="center" bgcolor="#FFFFFF" width="90">QQ</td>
        <td align="center" bgcolor="#FFFFFF">用户组</td>
		
		<!--
        <td align="center" bgcolor="#FFFFFF">用户归属</td>
        <td align="center" bgcolor="#FFFFFF">推广人</td>
		-->
        <td align="center" bgcolor="#FFFFFF">在线时长</td>

        <td align="center" bgcolor="#FFFFFF">备注</td>
        <td align="center" bgcolor="#FFFFFF">注册时间</td>
        <td align="center" bgcolor="#FFFFFF">最近登录</td>
        <td align="center" bgcolor="#FFFFFF" width="26">审核</td>
        <td align="center" bgcolor="#FFFFFF" width="50">操作</td>
      </tr>
    </thead>
<?php
$roomsql=$choice_roomid==0?'':" m.roomid=$choice_roomid  and";
$sql="select m.*,ms.*  from {$tablepre}members m,{$tablepre}memberfields ms  where m.uid=ms.uid and  $roomsql  m.uid!=0";
$skey=trim($skey);
if($skey!=""){
	$sql.=" and (m.username like '%$skey%' or m.fuser like '%$skey%' or m.tuser like '%$skey%' or ms.nickname like 	'%$skey%' or m.phone like '%$skey%' or m.realname like '%$skey%')";
}

if($sgid!="" && $sgid!="-1" ){
	$sql.=" and m.gid='$sgid'";
}
if($fuser!=""){
	$sql.=" and(m.fuser='$fuser' or m.tuser='$fuser')";
}

$sql.=" order by m.uid desc";
if(!$auth_rule_userdel)$display_delbutton='style="display:none"';
echo userlist(20,$sql,'
    <tr>
      <td bgcolor="#FFFFFF" align="center">{uid}</td>
	  <td align="center" bgcolor="#FFFFFF"><input type="checkbox" class="ids" name="id[]" value="{uid}"><a title="充值" class="icon-cancel-chong" onclick="chongmoney({uid})"></a><a title="提现" class="icon-cancel-tixian" onclick="tixianmoney({uid})"></a></td>
      <td align="center" bgcolor="#FFFFFF">{username}</td>
      <td align="center" bgcolor="#FFFFFF">{nickname}</td>
      <td align="center" bgcolor="#FFFFFF">{moneyred}</td>
	  <td align="center" bgcolor="#FFFFFF">{redbags}&nbsp;</td>
	  <td align="center" bgcolor="#FFFFFF">{phone}&nbsp;</td>
	  <td align="center" bgcolor="#FFFFFF">{realname}&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF"><script>document.write(sgid({gid})); </script>&nbsp;</td>
      

      <td align="center" bgcolor="#FFFFFF">{onlinetime}</td>

      <td align="center" bgcolor="#FFFFFF">{sn}</td>
      <td align="center" bgcolor="#FFFFFF"><script>document.write(ftime({regdate})); </script></td>
      <td align="center" bgcolor="#FFFFFF" title="登录IP:{regip}" onClick="alert(\'登录IP:{regip}\')"><script>document.write(ftime({lastactivity})); </script></td>
	  <td align="center" bgcolor="#FFFFFF">{state}</td>
      <td align="center" bgcolor="#FFFFFF">
      <button type="button" class="button button-mini button-info" onClick="openUser({uid},{gid})" ><i class="x-icon x-icon-small icon-wrench icon-white"></i>修改</button>
      <button type="button" class="button button-mini button-danger" onclick="if(confirm(\'确定删除用户？\'))location.href=\'?act=user_del&id={uid}\'" '.$display_delbutton.'><i class="x-icon x-icon-small icon-trash icon-white"></i>删除</button></td>
    </tr>
')?>


  </table>
    </form> 
    <ul class="breadcrumb">
    <li class="active"><?=$pagenav?>
    </li>
  </ul>
</div>
<script type="text/javascript" src="../assets/js/jquery-1.8.1.min.js"></script> 
<script type="text/javascript" src="../assets/layer/layer.js"></script>
<script type="text/javascript" src="../assets/js/bui.js"></script> 
<script type="text/javascript" src="../assets/js/config.js"></script> 

<script>

function openUser(id,gid){

        var title = '用户资料修改';
   
        var index = layer.open({
            type: 2,
            title: title,
            area: ['700px', '700px'],
            content: "user_edit.php?id="+id+'&gid='+gid
        
        });
      // layer.full(index);
}

function addUser(){
	
           var title = '添加用户';
   
        var index = layer.open({
            type: 2,
            title: title,
            area: ['600px', '420px'],
            content: "user_add.php"
        
        });
      // layer.full(index);
}

function doexcel(sgid,roomid){

          var index = layer.open({
            type: 2,
            title: '导出excel',
            area: ['600px', '400px'],
            content: "doexcel_choice.php?gid="+sgid+"&roomid="+roomid
        
        });
      // layer.full(index);
}
BUI.use('bui/overlay',function(Overlay){
            dialog4 = new Overlay.Dialog({
            title:'充值',
            width:350,
            height:300,
            buttons:[],
            bodyContent:''
          });
});
function chongmoney(uid){
    
    dialog4.set('bodyContent','<iframe src="chongmoney.php?uid='+uid+'" scrolling="yes" frameborder="0" height="100%" width="100%"></iframe>');
	dialog4.updateContent();
	dialog4.show();
}
BUI.use('bui/overlay',function(Overlay){
            dialog5 = new Overlay.Dialog({
            title:'提现',
            width:350,
            height:300,
            buttons:[],
            bodyContent:''
          });
});
function tixianmoney(uid){
    
    dialog5.set('bodyContent','<iframe src="tixianmoney.php?uid='+uid+'" scrolling="yes" frameborder="0" height="100%" width="100%"></iframe>');
	dialog5.updateContent();
	dialog5.show();
}
function choice_room(value){
    
  
   window.location.href="?choice_roomid="+value; 
}
  </script>
</body>
</html>
