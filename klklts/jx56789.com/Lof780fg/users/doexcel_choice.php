<?php
require_once '../../include/common.inc.php';
if(stripos(auth_group($_SESSION['login_gid']),'users_excel')===false)exit(denied_pape());
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
input,select{vertical-align:middle;}
.liw { width:160px; height:25px; line-height:25px;}
</style>
</head>
<body>
<div class="container" >

<form action="doexcel.php?gid=<?=$gid?>&roomid=<?=$roomid?>" method="post" enctype="application/x-www-form-urlencoded" id="regUser">
  <ul class="breadcrumb">

<table class="">
			  <tr>
            <td width="80" class="tableleft_layer" style="width:70px;">导出日期：</td>
            <td>    <input type="text" name="starttime" id="starttime"  required class="calendar" style="width:100px;" placeholder="起始时间" value="<?=$starttime?>"> 到
    <input type="text" name="endtime" id="endtime"  class="calendar"  required style="width:100px;" placeholder="结束时间" value="<?=$endtime?>"> 
            </td>
          </tr>
	    <tr>
             <td class="tableleft_layer">&nbsp;</td>
             <td style="    padding: 1em 0.5em 0.5em 0em;">
<input type="submit" id="reg"  class="button button-success" value="确定"/>
    <button type="button"  class="button" onclick="layer_close()">关闭</button>
   
    </td>
      </tr>
       
         
        </table>

  </ul>

  </form>

</div>
<script type="text/javascript" src="../assets/js/jquery-1.8.1.min.js"></script> 
<script type="text/javascript" src="../assets/js/bui.js"></script> 
<script type="text/javascript" src="../assets/js/config.js"></script> 
<script type="text/javascript" src="../../upload/swfupload/swfupload.js"></script> 
<script>
      BUI.use('bui/calendar',function(Calendar){
          var datepicker = new Calendar.DatePicker({
            trigger:'.calendar',
			dateMask : 'yyyy-mm-dd',
            autoRender : true
          });
        });
        function layer_close(){ 
  
    var index = parent.layer.getFrameIndex(window.name);
    parent.layer.close(index);

}
</script>
</body>
</html>
