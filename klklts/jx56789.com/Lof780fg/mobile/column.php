<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
if(stripos(auth_group($_SESSION['login_gid']),'mobile_column')===false)exit("没有权限！");
switch($act){
	case "column_del":
		column_del(implode(',',$id));
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
zt['1']="<span class='run-status-running'>开启</span>";
zt['0']="<span class='run-status-expired'>关闭</span>";
</script>
</head>
<body>
<div class="container"  style="width:800px;">
<form  class="form-horizontal" action="" method="get"> 
  <ul class="breadcrumb"><button type="button" class="button button-success" id="add_group_bt" style="float: right" onClick="ColumnAdd()">添加</button>
    <li class="active">
    
    关键字：
      <input type="text" name="key" id="key"class="abc input-default" placeholder=""> 
      &nbsp;&nbsp;
      <button type="submit"  class="button ">查询</button>
      <button type="button"  class="button  button-danger"  onClick="if(confirm('确定删除？'))$('#column_list').submit()">删除所选</button>
    &nbsp;&nbsp;</li>
   
  </ul>
  </form>
  <form action="" method="POST" enctype="application/x-www-form-urlencoded"  class="form-horizontal" id="column_list"><input type="hidden" name="act" value="column_del"> 
  <table  class="table table-bordered table-hover definewidth m10">
    <thead>
      <tr style="font-weight:bold"  class="m-table-th-bg">
        <td width="5" align="center" bgcolor="#FFFFFF">ID</td>
        <td style="width:10px;" align="center" bgcolor="#FFFFFF"><input type="checkbox" onClick="$('.ids').attr('checked',this.checked); "></td>
        <td  width="50" align="center" bgcolor="#FFFFFF">应用名称</td>
        <td width="20" align="center" bgcolor="#FFFFFF">打开方式</td>
        <td width="20" align="center" bgcolor="#FFFFFF">状态</td>
        <td width="20" align="center" bgcolor="#FFFFFF">排序</td>
        <td width="50" align="center" bgcolor="#FFFFFF">操作</td>
      </tr>
      
    </thead>
    
<?php
global $db,$tablepre,$firstcount,$displaypg;

	$sql="select * from {$tablepre}mobile_column";
	if($key!="")$sql.=" where title like '%$key%'";
	  $num=20;
	$count=$db->num_rows($db->query($sql));
	pageft($count,$num,"");
	$sql.=" order by status desc,ov desc,id desc";
	$sql.=" limit $firstcount,$displaypg";
       
	$query=$db->query($sql);
      while($row=$db->fetch_row($query)){
    ?>
    <tr>
      <td align="center" bgcolor="#FFFFFF"><?=$row['id']?></td>
      <td align="center" bgcolor="#FFFFFF"><input type="checkbox" class="ids" name="id[]" value="<?=$row['id']?>"></td>
      <td align="center" bgcolor="#FFFFFF"><?=$row['title']?></td>
       <td align="center" bgcolor="#FFFFFF"><?=$row['target']?></td>
      <td align="center" bgcolor="#FFFFFF"><script>document.write(zt["<?=$row['status']?>"]); </script></td>
      <td align="center" bgcolor="#FFFFFF"><?=$row['ov']?></td>
      <td align="center" bgcolor="#FFFFFF">
        <button  type="button" class="button button-mini button-success" onClick="ColumnEdit('<?=$row['id']?>')"><i class="x-icon x-icon-small icon-trash icon-white"></i>修改</button>
        
        <button type="button" class="button button-mini button-danger" onclick="del('<?=$row['id']?>')" id="delbt<?=$row['id']?>" ><i class="x-icon x-icon-small icon-trash icon-white"></i>删除</button></td>
    </tr>
<? }?>


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

function del(id){
	var arr=['1','2'];
	for(var i in arr){
		
		if(id==arr[i]){alert('内置应用不能删除！你可以设置状态为"关闭"来禁用！');return;}
	}
	if(confirm('确定删除？'))location.href='?act=column_del&id[]='+id;
}
function ColumnEdit(id){

	   var title = '编辑应用';
   
        var index = layer.open({
            type: 2,
            title: title,
            area: ['600px', '400px'],
            content: "column_edit.php?id="+id
        
        });
      // layer.full(index);

}
function ColumnAdd(){
       var title = '添加应用';
   
        var index = layer.open({
            type: 2,
            title: title,
            area: ['600px', '400px'],
            content: "column_add.php"
        
        });
      // layer.full(index);
    
    
}
      </script>

</body>
</html>


