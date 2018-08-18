<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
if(stripos(auth_group($_SESSION['login_gid']),'ip_blacklist')===false)exit(denied_pape());



switch($act){
	case "ip_blacklist_del":

		     if(is_array($id)){
                  
                ip_blacklist_del(implode(',',$id));  
                } else{
                 ip_blacklist_del($id);   
                }
              
		header("location:?");
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
<!-- 下面的样式，仅是为了显示代码，而不应该在项目中使用-->
<link href="../assets/css/prettify.css" rel="stylesheet" type="text/css" />
<style type="text/css">
code { padding: 0px 4px; color: #d14; background-color: #f7f7f9; border: 1px solid #e1e1e8; }
</style>
</head>
<body>

<div class="container"  style="width:800px;">
   
<form  class="form-horizontal" action="" method="get"> 
  <ul class="breadcrumb">
      <a class="button button-success" id="add_group_bt" style="float: right" onclick="add_ip_blacklist()">添加</a>
      
    <li class="active">
         关键字：
      <input type="text" name="key" id="key"class="abc input-default" placeholder="IP地址"> 
      &nbsp;&nbsp;
      <button type="submit"  class="button ">查询</button>
   <button type="button"  class="button  button-danger"  onClick="if(confirm('确定删除？'))$('#plan_bind_list').submit()">删除所选</button>
 </li>
   
  </ul>
  </form>
    <form action="?" method="POST" enctype="application/x-www-form-urlencoded"  class="form-horizontal" id="plan_bind_list">
	
	<input type="hidden" name="act" value="ip_blacklist_del">
  <table  class="table table-bordered table-hover definewidth m10">
    <thead>
      <tr style="font-weight:bold" >
        <td width="10" align="center" bgcolor="#FFFFFF">ID</td>
           <td width="1" align="center" bgcolor="#FFFFFF"><input type="checkbox" onClick="$('.ids').attr('checked',this.checked); "></td>
        <td width="80" align="center" bgcolor="#FFFFFF">IP</td>
     
        <td width="100" align="center" bgcolor="#FFFFFF">备注</td>
        <td width="50" align="center" bgcolor="#FFFFFF">操作</td>
      </tr>
    </thead>
<?php
$sql="select * from {$tablepre}ip_blacklist ";
if($key!="")$sql.=" where ip like '%$key%'";
$sql.=" order by id desc";


global $firstcount,$displaypg;
           $num=20;
	$count=$db->num_rows($db->query($sql));
	pageft($count,$num,"");
	$sql.=" limit $firstcount,$displaypg";
        
	$query=$db->query($sql);
        while($row=$db->fetch_row($query)){
    ?>
    <tr>
      <td bgcolor="#FFFFFF" align="center"><?=$row['id']?></td>
  <td align="center" bgcolor="#FFFFFF"><input type="checkbox" class="ids" name="id[]" value="<?=$row['id']?>"></td>
    <td align="center" bgcolor="#FFFFFF" ><?=$row['ip']?></td>

   <td align="center" bgcolor="#FFFFFF"><?=$row['beizhu']?></td>
    <td align="center" bgcolor="#FFFFFF">
      <button type="button" class="button button-mini button-danger"  onclick="if(confirm('确定删除吗？'))location.href='?act=ip_blacklist_del&id=<?=$row['id']?>'"><i class="x-icon x-icon-small icon-trash icon-white"></i>删除</button></td>
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

<script>


function add_ip_blacklist(){
	   var title = '添加IP黑名单';

        var index = layer.open({
            type: 2,
            title: title,
            area: ['700px', '300px'],
            content: "ip_blacklist_add.php"
        
        });
      // layer.full(index);
}
  </script>
</body>
</html>
