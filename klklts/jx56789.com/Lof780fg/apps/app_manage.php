<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
if(stripos(auth_group($_SESSION['login_gid']),'apps_manage')===false)exit("没有权限！");
switch($act){
	case "manage_del":
		manage_del(implode(',',$id));
	break;
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

<link href="../assets/css/prettify.css" rel="stylesheet" type="text/css" />
<style type="text/css">
code { padding: 0px 4px; color: #d14; background-color: #f7f7f9; border: 1px solid #e1e1e8; }
.run-status-running{color: #090;}
.run-status-expired{color: #F00;}
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
var zt=new Array();
zt['0']="<span class='run-status-running'>开启</span>";
zt['1']="<span class='run-status-expired'>关闭</span>";
</script>
</head>
<body>
<div class="container"  style="min-width:800px;">
<form  class="form-horizontal" action="" method="get"> 
  <ul class="breadcrumb"><button type="button" class="button button-success" id="add_group_bt" style="float: right" onClick="openAppManage(0,'add')">添加</button>
    <li class="active">
    
    关键字：
      <input type="text" name="key" id="key"class="abc input-default" placeholder=""> 
      &nbsp;&nbsp;
      <button type="submit"  class="button ">查询</button>
      <button type="button"  class="button  button-danger"  onClick="if(confirm('确定删除？'))$('#hd_list').submit()">删除所选</button>
    &nbsp;&nbsp;</li>
   
  </ul>
  </form>
  <form action="" method="POST" enctype="application/x-www-form-urlencoded"  class="form-horizontal" id="hd_list"><input type="hidden" name="act" value="manage_del"> 
  <table  class="table table-bordered table-hover definewidth m10">
    <thead>
      <tr style="font-weight:bold"  class="m-table-th-bg">
        <td width="5" align="center" bgcolor="#FFFFFF">编号</td>
        <td style="width:10px;" align="center" bgcolor="#FFFFFF"><input type="checkbox" onClick="$('.ids').attr('checked',this.checked); "></td>
        <td  width="50" align="center" bgcolor="#FFFFFF">应用名称</td>
        <td width="20"  align="center" bgcolor="#FFFFFF">图标</td>
        <td width="20" align="center" bgcolor="#FFFFFF">打开方式</td>
        <td width="20" align="center" bgcolor="#FFFFFF">状态</td>
        <td width="20" align="center" bgcolor="#FFFFFF">排序</td>
        <td width="50" align="center" bgcolor="#FFFFFF">操作</td>
      </tr>
      
    </thead>
    
<?php
echo app_manage_list(20,$key,'
    <tr>
      <td align="center" bgcolor="#FFFFFF">{id}</td>
      <td align="center" bgcolor="#FFFFFF"><input type="checkbox" class="ids" name="id[]" value="{id}"></td>
      <td align="center" bgcolor="#FFFFFF">{title} </td>
      <td align="center" bgcolor="#FFFFFF"><img src="{ico}" style="width:30px; height:30px;"></td>
      <td align="center" bgcolor="#FFFFFF">{target}</td>
      <td align="center" bgcolor="#FFFFFF"><script>document.write(zt["{s}"]); </script></td>
      <td align="center" bgcolor="#FFFFFF">{ov}</td>
      <td align="center" bgcolor="#FFFFFF">
        <button  type="button" class="button button-mini button-success" onClick="openAppManage(\'{id}\',\'edit\')"><i class="x-icon x-icon-small icon-trash icon-white"></i>修改</button>
        
        <button type="button" class="button button-mini button-danger" onclick="del(\'{id}\')" id="delbt{id}" ><i class="x-icon x-icon-small icon-trash icon-white"></i>删除</button></td>
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
<script type="text/javascript">

$('#delbt1').hide();
$('#delbt2').hide();
$('#delbt3').hide();
$('#delbt4').hide();
$('#delbt5').hide();
$('#delbt6').hide();
$('#delbt7').hide();
$('#delbt8').hide();
$('#delbt16').hide();
function del(id){
	var arr=['1','2','3','4','5','6','7','8'];
	for(var i in arr){
		
		if(id==arr[i]){alert('内置应用不能删除！你可以设置状态为"未启用"来禁用！');return;}
	}
	if(confirm('确定删除？'))location.href='?act=manage_del&id[]='+id;
}
function openAppManage(id,type){

	   var title = '编辑应用';
   
        var index = layer.open({
            type: 2,
            title: title,
            area: ['700px', '600px'],
            content: "app_manage_edit.php?id="+id+'&type='+type
        
        });
      // layer.full(index);

}
      </script>

</body>
</html>
