<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
if(stripos(auth_group($_SESSION['login_gid']),'apps_hongbao')===false)exit("没有权限！");

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
<div class="container"  style="width:400px;">
<form action="" method="POST" enctype="application/x-www-form-urlencoded"  class="form-horizontal" id="hd_list">
	<input type="hidden" name="act" value="rotate_del">
  <table  class="table table-bordered table-hover definewidth m10">
    <thead>
      <tr style="font-weight:bold" >
       <td  width="100" align="center" bgcolor="#FFFFFF">抢红包者</td>
        <td width="60" align="center" bgcolor="#FFFFFF">抢红包金额</td>
	<td width="120" align="center" bgcolor="#FFFFFF">抢红包的时间</td>
       </tr>
    </thead>
<?php

$sql="select g.*,m.nickname from {$tablepre}gethongbao g,{$tablepre}memberfields m where g.getuid=m.uid and g.hongbaoid='$hbid' order by g.id desc";

global $firstcount,$displaypg;
           $num=20;
	$count=$db->num_rows($db->query($sql));
	pageft($count,$num,"");
	$sql.=" limit $firstcount,$displaypg";
	$query=$db->query($sql);
        while($row=$db->fetch_row($query)){
     
       ?>
    <tr>
   

	  <td align="center" bgcolor="#FFFFFF"><?=$row['nickname']?>&nbsp;</td>
           <td align="center" bgcolor="#FFFFFF"><?=$row['getmoney']?>&nbsp;</td>
            <td align="center" bgcolor="#FFFFFF"><?=date('Y-m-d H:i:s',$row['addtime'])?>&nbsp;</td>

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
<script type="text/javascript" src="../assets/js/bui.js"></script> 
<script type="text/javascript" src="../assets/js/config.js"></script> 
<script type="text/javascript" src="../../upload/swfupload/swfupload.js"></script> 

</body>
</html>