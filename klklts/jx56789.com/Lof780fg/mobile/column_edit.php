<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
if(stripos(auth_group($_SESSION['login_gid']),'mobile_column')===false)exit(denied_pape());
$operation=0;
 if($act=="column_edit"){
	column_edit($id,$title,$url,$target,$status,$ov);
        $operation=1;

}
$id= intval($id);
$query=$db->query("select * from {$tablepre}mobile_column where id='$id'");
$row=$db->fetch_row($query);


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
 <link href="../assets/css/base.css" rel="stylesheet" type="text/css" />
<style type="text/css">
code { padding: 0px 4px; color: #d14; background-color: #f7f7f9; border: 1px solid #e1e1e8; }
input,select{vertical-align:middle;}
.liw { width:160px; height:25px; line-height:25px;}
</style>
</head>
<body>
<div class="container" style="margin-bottom:50px;">

    <form action="column_edit.php" method="post" enctype="application/x-www-form-urlencoded">

  
<table class="">

          <tr>
            <td class="tableleft_layer" >应用名称：</td>
            <td><input name="title" type="text" id="title" value="<?=$row['title']?>"  required  class="input-large" /></td>
      </tr>
       
          <tr>
            <td class="tableleft_layer">应用连接：</td>
            <td><input name="url" type="text" id="url" value="<?=$row['url']?>"  class="input-large" required /> </td>
          </tr>
          <tr>
            <td class="tableleft_layer">打开方式：</td>
            <td><select name="target" id="target">
            <option value="LocalWin" <? if($row['target']=='LocalWin') echo 'selected'; ?>>本页面</option>
            <option value="NewWin" <? if($row['target']=='NewWin') echo 'selected'; ?>>新窗口</option>
             </select></td>
          </tr>
         
         
          <tr>
            <td class="tableleft_layer">启用状态：</td>
            <td><select name="status" id="status">
            <option value="1" <? if($row['status']=='1') echo 'selected'; ?>>开启</option>
              <option value="0" <? if($row['status']=='0') echo 'selected'; ?>>关闭</option>
            </select>
              </td>
          </tr>
            <tr>
            <td class="tableleft_layer">排序：</td>
            <td><input name="ov" type="text" id="ov" value="<?=$row['ov']?>"  onkeyup="value=value.replace(/[^0-9]/g,'')" />（大至小排序）</td>
          </tr>
         <tr>
             <td class="tableleft_layer">&nbsp;</td>
             <td>
    <button type="submit"  class="button button-success">确定</button>
    <button type="button"  class="button" onclick="layer_close()">关闭</button>
    <input type="hidden" name="act" value="column_edit">
    <input type="hidden" name="id" value="<?=$id?>">

    </td>
</tr>
    </table>


  </form>

</div>
<script type="text/javascript" src="../assets/js/jquery-1.8.1.min.js"></script> 
<script type="text/javascript" src="../assets/layer/layer.js"></script>
<script type="text/javascript" src="../assets/js/bui.js"></script> 
<script type="text/javascript" src="../assets/js/config.js"></script> 

<script>
        var operation=<?=$operation?>;
    if(operation==1){
        layer.msg('修改成功！');
    }
   

        function layer_close(){ 
         window.parent.location.reload();
    var index = parent.layer.getFrameIndex(window.name);
    parent.layer.close(index);

}

</script>
</body>
</html>
