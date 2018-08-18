<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
if(stripos(auth_group($_SESSION['login_gid']),'tongji_h')===false)exit(denied_pape());
if(!isset($choice_roomid)){
       if(empty($login_roomid)){
 $choice_roomid=0;

    }else{
     $choice_roomid=$login_roomid;
     }
  }
$room_list_li = room_list_li_each($choice_roomid);
$arr_history=array();
//默认日期最近7天
$beforetime=strtotime("-1 week");
if($choice_roomid=='0'){
  $sql="SELECT SUM(num) as num,addtime FROM {$tablepre}history_online  where 1=1  ";  
}else{
$sql="SELECT *  FROM {$tablepre}history_online where roomid='$choice_roomid'  ";    
}

if($starttime!=""){
    $int_starttime =strtotime($starttime);
  
    $sql.=" and addtime>='$int_starttime'";
    $infotitle=$starttime;
    }else{$infotitle='截止';}
    if($endtime!=""){
    $int_endtime =strtotime($endtime)+24*3600;;

    $sql.=" and addtime<'$int_endtime' ";
    $infotitle.='到'.$endtime;
    }else{$infotitle.='到'. date('Y-m-d H:i:s');}
    if($starttime=="" &&  $endtime==""){  $infotitle='最近7天'; $sql.=" and addtime>'$beforetime'";}
  //如果为统计所有房间,按照时间分组
    if($choice_roomid=='0'){$sql.="  GROUP BY addtime ";;  }
    
  $query=$db->query($sql);
while($row=$db->fetch_row($query)){
         $arr_history[$row['addtime']]=$row['num'];
		}

 foreach ($arr_history as $key => $value) {
$key=date("Y-m-d H:i:s",$key);
$tag.="'$key'".',';
$data.=$value.',';
} 
$tag=substr($tag, 0, -1);
$data=substr($data, 0, -1);

?>
<!DOCTYPE HTML>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../assets/css/bui-min.css" rel="stylesheet" type="text/css" />
<link href="../assets/css/page-min.css" rel="stylesheet" type="text/css" />
 <link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="../assets/css/nuoyun.console.css" rel="stylesheet" type="text/css" />
<link href="../assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
<!-- 下面的样式，仅是为了显示代码，而不应该在项目中使用-->
<link href="../assets/css/prettify.css" rel="stylesheet" type="text/css" />
<style type="text/css">
code { padding: 0px 4px; color: #d14; background-color: #f7f7f9; border: 1px solid #e1e1e8; }
.col-sm-4 {
    width: 31.333333%;
}
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
<div class="container"  style="width:95%;">
   <div class="sas-overviews-page"> <div class="row count-modules ng-isolate-scope" sas-loaddata="overviews|getEventsCount" model="monitorCount">
         
<form  class="form-horizontal" action="" method="get"> 
  <ul class="breadcrumb">
    <li class="active">
        房间： <select name="choice_roomid" id="choice_roomid" OnChange="choice_room(this.value)">  
           
                       <?=$room_list_li;?>  
                     </select>&nbsp;&nbsp;&nbsp;&nbsp;
   时间：
        <input type="text" name="starttime" id="starttime"  class="calendar" value="<?=$starttime?>"> 到
    <input type="text" name="endtime" id="endtime"  class="calendar" value="<?=$endtime?>"> 
      <button type="submit"  class="button ">查询</button> 
    &nbsp;&nbsp;</li>
   
  </ul>
  </form>

    <div id="main" style="width: 100%;height:400px;"></div>



</div>
<script type="text/javascript" src="../assets/js/jquery-1.8.1.min.js"></script> 
<script type="text/javascript" src="../assets/js/bui.js"></script> 
<script type="text/javascript" src="../assets/js/config.js"></script> 
<script src="../assets/js/echarts.min.js"></script>
<script src="../assets/js/roma.js"></script>
  <script type="text/javascript">
    BUI.use('bui/calendar',function(Calendar){
          var datepicker = new Calendar.DatePicker({
            trigger:'.calendar',
			dateMask : 'yyyy-mm-dd',
            autoRender : true
          });
        });

        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'),'roma');

        // 指定图表的配置项和数据
     var  option = {
    title: {
        text: '<?=$infotitle?>在线人数统计'
    },
    tooltip: {
        trigger: 'axis'
    },
    legend: {
        data:['在线人数']
    },
    grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    toolbox: {
        feature: {
            saveAsImage: {},
            dataView:{},
            magicType:{
                   type: ['line', 'bar']
            }
        }
    },
    xAxis: {
        type: 'category',
        boundaryGap: false,
        data: [<?=$tag?>]
    },
    yAxis: {
        type: 'value'
    },
    series: [
        {
            name:'在线人数',
            type:'line',
            stack: '总量',
            data:[<?=$data?>],
             markPoint: {
                data: [
                    {type: 'max', name: '最大值'}
                   
                ]
            }
        }
       
    ]
};


        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
 function choice_room(value){
    

   window.location.href="?choice_roomid="+value; 
}
  </script>

</body>
</html>
