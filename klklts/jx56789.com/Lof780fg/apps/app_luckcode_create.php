<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
if(stripos(auth_group($_SESSION['login_gid']),'sys_automsg')===false)exit(denied_pape());

if($act=="sysmsg_edit"){
	sysmsg_edit($state,$content,$fangshi,$jiange,$roomid);
}


?>
<!DOCTYPE HTML>
<html>
 <head>
  <title> </title>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
       <link href="../assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/bui-min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/page-min.css" rel="stylesheet" type="text/css" />   <!-- 下面的样式，仅是为了显示代码，而不应该在项目中使用-->
   <link href="../assets/css/prettify.css" rel="stylesheet" type="text/css" />
   <link href="../assets/css/base.css" rel="stylesheet" type="text/css" />
   <style type="text/css">
    code {
      padding: 0px 4px;
      color: #d14;
      background-color: #f7f7f9;
      border: 1px solid #e1e1e8;
    }
   </style>
 </head>
 <body>
  
    
    <div class="container" style="width:850px;">
  

        <table>
     
          <tr>
            <td class="tableleft" style="width:100px;">抽奖码类型：</td>
            <td><select name="getmethod" id="getmethod">
           <option value="2">砸金蛋</option>
           <option value="1">转盘抽奖</option>
            </select></td>
          </tr>
          <tr>
            <td class="tableleft">抽奖码：</td>
            <td><textarea name="content" rows="10" id="content" style="width:700px; height:300px;"></textarea>
             </td>
          </tr>
         
           <tr>
            <td class="tableleft">抽奖码条数：</td>
            <td><input name="num" type="text" id="num"  onkeyup="value=value.replace(/[^0-9]/g,'')" maxlength="5" />
          </td>
          </tr>
         
          <tr>
            <td class="tableleft">&nbsp;</td>
            <td><button type="button" id="createbut" class="button button-success"> 生成 </button></td>
          </tr>
        </table>
  
     
 </div>
<script type="text/javascript" src="../assets/js/jquery-1.8.1.min.js"></script> 
<script type="text/javascript" src="../assets/layer/layer.js"></script>
<script type="text/javascript">
$(function(){
			$('#createbut').click(function(){
				if ($.trim($('#num').val()) == "") {
			layer.msg('抽奖码条数不能为空！');		
                        return false;
		}
                var getmethod=$('#getmethod').val();
                var num=$('#num').val();
				$.ajax({
			type:"POST",
                        url: '/ajax.php?act=createLuckCode',
			data: "getmethod=" + getmethod+'&num=' + num,
                        dataType:"html",
		        success: function(result) { 
                          
                         $('#content').val(result);
			

			}
		});
                            
			});
		});


function choice_room(value){if(value=='0') return;window.location.href="?choice_roomid="+value; }


      </script>
<body>
</html>  