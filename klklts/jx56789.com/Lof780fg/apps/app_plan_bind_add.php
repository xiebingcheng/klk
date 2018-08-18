<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
if(stripos(auth_group($_SESSION['login_gid']),'sys_set')===false)exit(denied_pape());
$operation=0;
if($act=="plan_bind_add"){ 
 plan_bind_add($domain,$url,$beizhu);
        
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
  <form action="?act=plan_bind_add" method="post" enctype="application/x-www-form-urlencoded" onsubmit="return check()">
        <table class="">
          
               <tr>
        <td class="tableleft" style="width:100px;">访问域名：</td>
        <td><input name="domain" type="text" id="domain" style="width:400px;" onkeyup="value=value.replace(/[\u4E00-\u9FA5]/g,'')" placeholder="网址前不要加http://"/></td>
      </tr>
      
         <tr>
        <td class="tableleft">计划链接：</td>
        <td><textarea name="url" rows="2" id="url" style="width:400px;">
</textarea></td>
      </tr>
        <tr>
        <td class="tableleft">备注：</td>
        <td><textarea name="beizhu" rows="2" id="beizhu" style="width:400px;">
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
var url = /^(http)(s?:\/\/)([^\/]+)/i;
if ($.trim($('#domain').val()) == "" || $('#domain').val().length < 3 ) {
			$('#domain').focus();
		   layer.msg('访问域名不能为空', {shift: 1,icon: 2});
			return false;
		}
                 if(url.test($('#domain').val())){
                        $('#domain').focus();
                      layer.msg('访问域名网址前面不加http://', {shift: 1,icon: 2});  
                            return false;  
                      }
                if ($.trim($('#url').val()) == "" ) {
			$('#url').focus();
		   layer.msg('计划链接不能为空', {shift: 1,icon: 2});
			return false;
		}
                
                  if(!url.test($('#url').val())){
                        $('#url').focus();
                      layer.msg('计划链接要以http://开头', {shift: 1,icon: 2});  
                            return false;  
                      }
             return true;
               
}

</script>
<body>
</html>  