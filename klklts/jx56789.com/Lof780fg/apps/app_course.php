<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
if(stripos(auth_group($_SESSION['login_gid']),'app_course')===false)exit("没有权限！");
switch($act){
	case "course_del":
		
              if(is_array($id)){
                course_del(implode(',',$id));  
                } else{
                 course_del($id);   
                }
	break;
}
       global $db,$tablepre,$firstcount,$displaypg;
	
if(!isset($choice_roomid)){
       if(empty($login_roomid)){
 $choice_roomid=$default_roomid;
    }else{
     $choice_roomid=$login_roomid;
    }
  }
        $sql="select * from {$tablepre}course where rid='$choice_roomid'";

          $sql.=" order by weekid asc,paixu asc";
        $query=$db->query($sql);

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
zt['0']="启用";
zt['1']="未启用";
</script>
</head>
<body>
<div class="container"  style="width:900px;">
  <ul class="breadcrumb">

 <button type="button" class="button button-success" id="add_group_bt" style="float: right;margin-bottom: 10px;" onClick="editcourse('0','add')">添加</button>
                  <a class="button button-primary" style="float: right;margin-right: 5px;"   onclick="window.location.reload();"><i class="x-icon x-icon-small icon-white" style="background-position: -239px -22px;"></i>刷新</a>
   <li class="active"> <span style="color: #F90">房间：</span> <select name="choiceroom" id="choiceroom" OnChange="choice_room(this.value)">   
                       <?=$room_list_li;?>  
                     </select>
         <button type="button"  class="button  button-danger"  onClick="if(confirm('确定删除？'))$('#hd_list').submit()">删除所选</button>
       
 </li>
   
  </ul>


  <form action="" method="POST" enctype="application/x-www-form-urlencoded"  class="form-horizontal" id="hd_list">
      <input type="hidden" name="act" value="course_del"> 
  <table  class="table table-bordered table-hover definewidth m10">
    <thead>
      <tr style="font-weight:bold" >
                  <td width="10" align="center" bgcolor="#FFFFFF">ID</td>
        <td width="10" align="center" bgcolor="#FFFFFF"><input type="checkbox" onClick="$('.ids').attr('checked',this.checked); "></td>
       
        <td  width="30" align="center" bgcolor="#FFFFFF">日期</td>
        <td width="50"  align="center" bgcolor="#FFFFFF">时间</td>
        <td width="20" align="center" bgcolor="#FFFFFF">分析师</td>
        <td width="20" align="center" bgcolor="#FFFFFF">排序</td>

        <td width="40" align="center" bgcolor="#FFFFFF">操作</td>
      </tr>
      
    </thead>
    
<?php
while($row=$db->fetch_row($query)){
?>
    <tr>
            <td bgcolor="#FFFFFF" align="center"><?=$row['id']?></td>
	  <td align="center" bgcolor="#FFFFFF"><input type="checkbox" class="ids" name="id[]" value="<?=$row['id']?>"></td>
     <td align="center" bgcolor="#FFFFFF"><?=$row['week']?></td>
     <td align="center" bgcolor="#FFFFFF"><?=$row['coursetime']?></td>
      <td align="center" bgcolor="#FFFFFF"><?=$row['teacher']?></td>
      <td align="center" bgcolor="#FFFFFF"><?=$row['paixu']?></td>
      <td align="center" bgcolor="#FFFFFF">
        <button  type="button" class="button button-mini button-success" onClick="editcourse(<?=$row['id']?>,'edit')"><i class="x-icon x-icon-small icon-trash icon-white"></i>修改</button>
        
        <button type="button" class="button button-mini button-danger" onclick="del(<?=$row['id']?>)" ><i class="x-icon x-icon-small icon-trash icon-white"></i>删除</button></td>
    </tr>
<?php }?>


  </table>
  </form> 
</div>
<script type="text/javascript" src="../assets/js/jquery-1.8.1.min.js"></script> 
<script type="text/javascript" src="../assets/js/bui.js"></script> 
<script type="text/javascript" src="../assets/js/config.js"></script> 
<script type="text/javascript">
BUI.use('bui/overlay',function(Overlay){
            dialog = new Overlay.Dialog({
            title:'课程修改',
            width:750,
            height:530,
            buttons:[],
            bodyContent:''
          });
		  
});

function del(id){
	
	if(confirm('确定删除？'))location.href='?act=course_del&id='+id;
}
function editcourse(id,type){
	dialog.set('bodyContent','<iframe src="app_course_edit.php?id='+id+'&type='+type+'" scrolling="yes" frameborder="0" height="100%" width="100%"></iframe>');
	dialog.updateContent();
	dialog.show();
}
function choice_room(value){
    
    if(value=='0') return;
   window.location.href="?choice_roomid="+value; 
}
      </script>

</body>
</html>
