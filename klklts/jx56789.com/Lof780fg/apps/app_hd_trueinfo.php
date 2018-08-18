<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
if(stripos(auth_group($_SESSION['login_gid']),'apps_hd')===false)exit("没有权限！");
 $c1['title']="所有喊单正确率统计";
         
		$sql="SELECT username,count(*) trueinfo from {$tablepre}apps_hd  where ((lx LIKE '%买%' and pcj-kcj>0) or  (lx LIKE '%卖%' and pcj-kcj<0))";
		if($ym!=""){$sql.=" and FROM_UNIXTIME(ttime,'%Y-%m')='$ym'";
                 $c1['title']=$ym."月喊单正确率";
          
                
                }elseif(!isset($ym)){
                   $ym=date("Y-m");
                    $sql.=" and FROM_UNIXTIME(ttime,'%Y-%m')='$ym'";
                    $c1['title']=$ym."月喊单正确率";
               
                }
		$query=$db->query($sql."GROUP BY username HAVING trueinfo>0");
		
	


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
</script>
</head>
<body>
<div class="container"  style="width:600px;">
<form  class="form-horizontal" action="" method="get"> 
  <ul class="breadcrumb">
    <li class="active">

    按统计月份：
      <input type="text" name="ym" id="ym"  class="calendar" value="<?=$ym?>"> 
      &nbsp;&nbsp;
      <button type="submit"  class="button ">查询</button> 为空统计所有
    &nbsp;&nbsp;</li>
   
  </ul>
  </form>
 
	 <table  class="table table-bordered table-hover definewidth m10" style="width:600px">
             <tr style="text-align: center;font-size:18px;font-weight: bold;"><td colspan="4"  align="center"><?=$c1['title']?></td> </tr>

      <tr style="font-weight:bold" >
      <td width="80" align="center" bgcolor="#FFFFFF">喊单者(用户名)</td>
      <td width="80" align="center" bgcolor="#FFFFFF">喊单数</td>
        <td  width="80" align="center" bgcolor="#FFFFFF">正确喊单</td>
        <td width="80" align="center" bgcolor="#FFFFFF">正确率</td>
  </tr>
 
<?php
while($row=$db->fetch_row($query)){
    $sql="SELECT count(*) totle from {$tablepre}apps_hd  where username='{$row['username']}' and pcj!=''";
    if($ym!=""){$sql.=" and FROM_UNIXTIME(ttime,'%Y-%m')='$ym'";}
    $totle=$db->fetch_row($db->query($sql)); 
    
    ?>
                 
		
    <tr>
      <td align="center" bgcolor="#FFFFFF"><?=$row['username']?></td>
      <td align="center" bgcolor="#FFFFFF"><?=$totle['totle']?></td>
      <td align="center" bgcolor="#FFFFFF"><?=$row['trueinfo']?></td>
 <td align="center" bgcolor="#FFFFFF"><? echo round( $row['trueinfo']/$totle['totle']*100 , 2)."％"; ?></td>

    </tr>
<?php }?>


  </table>
	
</div>
<script type="text/javascript" src="../assets/js/jquery-1.8.1.min.js"></script> 
<script type="text/javascript" src="../assets/js/bui.js"></script> 
<script type="text/javascript" src="../assets/js/config.js"></script> 
  <script type="text/javascript">
    BUI.use('bui/calendar',function(Calendar){
          var datepicker = new Calendar.DatePicker({
            trigger:'.calendar',
			dateMask : 'yyyy-mm',
            autoRender : true
          });
        });
    BUI.use('common/page');

   

  </script>

</body>
</html>
