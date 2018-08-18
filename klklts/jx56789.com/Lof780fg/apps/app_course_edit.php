<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
if(stripos(auth_group($_SESSION['login_gid']),'app_course')===false)exit("没有权限！");
if($act=="app_course_add"){
	
	app_course_add($weekid,$coursetime,$teacher,$paixu,$roomid);
	$id=$db->insert_id();
	$type='edit';
        echo "<script>window.parent.dialog.close();alert('添加成功！');window.parent.location.reload();</script>";
}else if($act=="app_course_edit"){
	app_course_edit($id,$weekid,$coursetime,$teacher,$paixu,$roomid);
        echo "<script>window.parent.dialog.close();alert('修改成功！');window.parent.location.reload();</script>";
}

$query=$db->query("select * from {$tablepre}course where id='$id'");
if($db->num_rows($query)>0)$row=$db->fetch_row($query);
 if(!empty($row['rid'])){$choice_roomid=$row['rid'];}else{$choice_roomid=$default_roomid;}

$room_list_li = room_list_li($choice_roomid);
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
<div class="container" style="margin-bottom:50px;">

<form action="?id=<?=$id?>" method="post" enctype="application/x-www-form-urlencoded">

  
<table class="table table-bordered table-hover definewidth m10">
 <tr>
            <td width="70" class="tableleft">房间：</td>
            <td><select name="roomid" id="roomid" >
	      <?=$room_list_li?>
            </select>&nbsp;</td>
          </tr>
          <tr>
            <td width="30" class="tableleft" style="width:80px;">课程日期：</td>
            <td><select name="weekid" id="weekid">
            <option value="1" <? if($row['weekid']==1) echo 'selected'; ?>>星期一</option>
              <option value="2" <? if($row['weekid']==2) echo 'selected'; ?>>星期二</option>
              <option value="3" <? if($row['weekid']==3) echo 'selected'; ?>>星期三</option>
              <option value="4" <? if($row['weekid']==4) echo 'selected'; ?>>星期四</option>
              <option value="5" <? if($row['weekid']==5) echo 'selected'; ?>>星期五</option>
              <option value="6" <? if($row['weekid']==6) echo 'selected'; ?>>星期六</option>
              <option value="7" <? if($row['weekid']==7) echo 'selected'; ?>>星期日</option>
            </select></td>
      </tr>
         <tr>
            <td width="30" class="tableleft" style="width:80px;">时间：</td>
            <td><input name="coursetime" type="text" id="coursetime" value="<?=$row['coursetime']?>"  /></td>
      </tr>
           <tr>
            <td width="30" class="tableleft" style="width:80px;">分析师：</td>
            <td><input name="teacher" type="text" id="teacher" value="<?=$row['teacher']?>"  /></td>
      </tr>
          <tr>
            <td class="tableleft">排序：</td>
            <td>
              <input name="paixu" type="text" id="paixu" value="<?=$row['paixu']?>"  />
排序（从小到大升序排列）</td>
          </tr>
    </table>

  <div style="position:fixed; bottom:0; background: #FFF; width:100%; padding-top:5px;">
    <button type="submit"  class="button button-success">确定</button>
    <button type="button"  class="button" onclick="window.parent.dialog.close()">关闭</button>
    <input type="hidden" name="act" value="app_course_<?=$type?>">
    <input type="hidden" name="id" value="<?=$id?>">
</div>
  </form>

</div>

</body>
</html>
