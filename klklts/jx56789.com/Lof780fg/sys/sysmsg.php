<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
if(stripos(auth_group($_SESSION['login_gid']),'sys_automsg')===false)exit(denied_pape());

if($act=="sysmsg_edit"){
	sysmsg_edit($state,$content,$fangshi,$jiange,$roomid);
}



if(!isset($choice_roomid)){
       if(empty($login_roomid)){
 $choice_roomid=$default_roomid;
    }else{
     $choice_roomid=$login_roomid;
    }
  }

$room_list_li = room_list_li($choice_roomid);
$query=$db->query("select * from  {$tablepre}sysmsg where roomid='$choice_roomid' ");
$row=$db->fetch_row($query);
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
        <ul class="breadcrumb" style="padding: 25px 20px 17px 89px;">
  <li class="active"> <span style="color: #F90">房间：</span> <select name="choiceroom" id="choiceroom" OnChange="choice_room(this.value)">   
                       <?=$room_list_li;?>  
                     </select>

 </li>
   
  </ul>
     <form action="" method="post" enctype="application/x-www-form-urlencoded">
        <table>
     
          <tr>
            <td class="tableleft" style="width:100px;">广播状态：</td>
            <td><select name="state" id="state">
           <option value="1" <? if($row[state]==1) echo 'selected'; ?>>开启</option>
           <option value="0" <? if($row[state]==0) echo 'selected'; ?>>关闭</option>
            </select></td>
          </tr>
          <tr>
            <td class="tableleft">广播内容：</td>
            <td><textarea name="content" rows="10" id="content" style="width:700px; height:300px;"><?=$row[content]?></textarea>
              <br>
              <a>一行一条广播</a></td>
          </tr>
          <tr>
            <td class="tableleft">广播方式：</td>
            <td><select name="fangshi" id="fangshi">
           <option value="1" <? if($row[fangshi]==1) echo 'selected'; ?>>随机广播</option>
           <option value="2" <? if($row[fangshi]==2) echo 'selected'; ?>>循环广播</option>
           <option value="3" <? if($row[fangshi]==3) echo 'selected'; ?>>登陆广播</option>
            </select></td>
          </tr>
           <tr>
            <td class="tableleft">广播推送时间间隔(秒)：</td>
            <td><input name="jiange" type="text" id="jiange"  value="<?=$row[jiange]?>"/>
          </td>
          </tr>
         
          <tr>
            <td class="tableleft">&nbsp;</td>
            <td><button type="submit" class="button button-success"> 保存 </button><input type="hidden" name="act" value="sysmsg_edit"><input type="hidden" name="roomid" value="<?=$choice_roomid?>"></td>
          </tr>
        </table>
      </form>
     
 </div>
<script type="text/javascript" src="../assets/js/jquery-1.8.1.min.js"></script> 
<script type="text/javascript">



function choice_room(value){if(value=='0') return;window.location.href="?choice_roomid="+value; }


      </script>
<body>
</html>  