<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
if(stripos(auth_group($_SESSION['login_gid']),'ip_blacklist')===false)exit(denied_pape());
$operation=0;
if($act=="ip_blacklist_add"){ 
 ip_blacklist_add($ip,$beizhu);
        
        $operation=1;
}

?>
<!DOCTYPE HTML>
<html>
 <head>
  <title> </title>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
       <link href="../assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/bui-min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/page-min.css" rel="stylesheet" type="text/css" /> 
   <link href="../assets/css/prettify.css" rel="stylesheet" type="text/css" />
   <link href="../assets/css/base.css" rel="stylesheet" type="text/css" />

 
 </head>
 <body>
 
    <div class="container">
  <form action="?act=ip_blacklist_add" method="post" enctype="application/x-www-form-urlencoded" onsubmit="return check()">
        <table class="">
   
      
         <tr>
        <td class="tableleft">IP：</td>
        <td><textarea name="ip" rows="1" id="ip" placeholder="输入禁止访问系统所有页面的IP地址,例如:127.0.0.1" onkeyup="value=value.replace(/[^0-9.]/g,'')"   required style="width:400px;">
</textarea></td>
      </tr>
        <tr>
        <td class="tableleft">备注：</td>
        <td><textarea name="beizhu" rows="2" id="beizhu"  style="width:400px;">
</textarea></td>
      </tr>
       <tr>
            <td class="tableleft">&nbsp;</td>
            <td><button type="submit" class="button button-success">添加</button></td>
          </tr>
        </table>
  </form>
  
 </div>
<script type="text/javascript" src="../assets/js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="../assets/layer/layer.js"></script>
<script type="text/javascript" src="../assets/js/config.js"></script> 

<script type="text/javascript">

        var operation=<?=$operation?>;
    if(operation==1){
        layer.msg('添加成功！');
        window.setTimeout("reload()",2000); 
      }
 
 function check(){

              
                if ($.trim($('#ip').val()) == "" ) {
			$('#ip').focus();
		   layer.msg('ip不能为空', {shift: 1,icon: 2});
			return false;
		}
                
               
             return true;
               
}

</script>
<body>
</html>  