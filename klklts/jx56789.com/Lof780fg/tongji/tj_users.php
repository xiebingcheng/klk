<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
$rid_sql= empty($login_roomid)?'':" and rid='$login_roomid'";
$arr_true=array();
$arr_true_guest=array();
   $sql="SELECT FROM_UNIXTIME(regdate,'%Y-%m-%d' ) ymd,count(*) zong FROM {$tablepre}members";
   $sql_guest="SELECT FROM_UNIXTIME(regdate,'%Y-%m-%d' ) ymd,count(distinct regip) zong FROM {$tablepre}guest";
		if($ym!=""){
                    $sql.=" where FROM_UNIXTIME(regdate,'%Y-%m')='$ym'";
                    $sql_guest.=" where FROM_UNIXTIME(regdate,'%Y-%m')='$ym'";
                $month=$ym;
                 $c1['title']=$ym."月用户统计";
                
                }elseif(empty($ym)){
                   $yms=date("Y-m");
                    $sql.=" where FROM_UNIXTIME(regdate,'%Y-%m')='$yms'";
                    $sql_guest.=" where FROM_UNIXTIME(regdate,'%Y-%m')='$yms'";
                     $month=$yms;
                    $c1['title']=$yms."月用户统计";
                
                }
		$query=$db->query($sql." $room_sql GROUP BY FROM_UNIXTIME(regdate,'%Y-%m-%d' ) ");
	while($row=$db->fetch_row($query)){
               $arr_true[$row['ymd']]=$row['zong'];
		}
                $query=$db->query($sql_guest." $room_sql GROUP BY FROM_UNIXTIME(regdate,'%Y-%m-%d' ) ");
	while($row=$db->fetch_row($query)){
               $arr_true_guest[$row['ymd']]=$row['zong'];
		}
$month=strtotime($month);
$t=date('t',$month);
$arr_eday=array();
$ymd=date('Y-m-d',strtotime("+1 day",$month));
for($i=0;$i<$t;$i++){
  $NewDay = !$i ? date('Y-m-d',strtotime("+0 day",$month)): date('Y-m-d',strtotime("+1 day",$month));
  $month = strtotime($NewDay);   
 $arr_eday[$NewDay]='0';
}
$arr_he=array_merge($arr_eday,$arr_true);
$arr_he_guest=array_merge($arr_eday,$arr_true_guest);
foreach ($arr_he as $key => $value) {
$c1['tag'].="'$key'".',';
$c1['data'].=$value.',';
$sum+=$value;
} 
$c1['tag']=substr($c1['tag'], 0, -1);
$c1['data']=substr($c1['data'], 0, -1);
foreach ($arr_he_guest as $key => $value) {

$c2['data'].=$value.',';
$sum_guest+=$value;
} 
$c2['data']=substr($c2['data'], 0, -1);

//获得今日发言条数
 $today=date("Y-m-d");
$sql="select count(*) sum from {$tablepre}chatlog where FROM_UNIXTIME(mtime,'%Y-%m-%d') = '$today' $rid_sql";
$sum_chat=$db->fetch_row($db->query($sql));
//获得当天新增会员
$sql="select count(*) sum from {$tablepre}members where FROM_UNIXTIME(regdate,'%Y-%m-%d') = '$today' $room_sql";
$today_sum_member=$db->fetch_row($db->query($sql));
//获得当天新增游客
$sql="select count(distinct regip) sum from {$tablepre}guest where FROM_UNIXTIME(regdate,'%Y-%m-%d') = '$today' $room_sql";
$today_sum_guest=$db->fetch_row($db->query($sql));
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
<div class="container"  style="width:100%;">
   <div class="sas-overviews-page"> <div class="row count-modules ng-isolate-scope" sas-loaddata="overviews|getEventsCount" model="monitorCount">
           <div class="col-sm-4"><div class="count-module events-count"><div class="count-module-icon"></div><span>今日发言数</span> <a><strong class="ng-binding"><?=$sum_chat['sum']?></strong><sub>条</sub></a></div></div>
           <div class="col-sm-4"><div class="count-module"><div class="count-module-icon"></div><span>今日新增会员</span> <a><strong class="ng-binding"><?=$today_sum_member['sum']?></strong><sub>个</sub></a></div></div>
           <div class="col-sm-4"><div class="count-module vul-count"><div class="count-module-icon"><i class="icon-drds"></i></div><span>今日新增游客</span> <a><strong class="ng-binding"><?=$today_sum_guest['sum']?></strong><sub>个</sub></a></div></div></div></div>
<form  class="form-horizontal" action="" method="get"> 
  <ul class="breadcrumb">
    <li class="active">
    <input type="hidden" name="type" value="<?=$type?>">
    按统计月份：
      <input type="text" name="ym" id="ym"  class="calendar" value="<?=$ym?>"> 
      &nbsp;&nbsp;
      <button type="submit"  class="button ">查询</button> 
    &nbsp;&nbsp;</li>
   
  </ul>
  </form>

	

    <div id="main" style="width: 98%;height:500px;"></div>

</div>
<script type="text/javascript" src="../assets/js/jquery-1.8.1.min.js"></script> 
<script type="text/javascript" src="../assets/js/bui.js"></script> 
<script type="text/javascript" src="../assets/js/config.js"></script> 
<script src="../assets/js/echarts.min.js"></script>
  <script type="text/javascript">
    BUI.use('bui/calendar',function(Calendar){
          var datepicker = new Calendar.DatePicker({
            trigger:'.calendar',
			dateMask : 'yyyy-mm',
            autoRender : true
          });
        });
      // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'),'roma');
var colors = [ '#d14a61','#5793f3','#675bba' ];
        // 指定图表的配置项和数据
     var  option = { 
         color: colors,
    title: {
        text: '<?=$c1['title']?>',
        subtext:'会员总数（<?=$sum?>）游客总数（<?=$sum_guest?>）',
        x: 'center',
        textStyle:{
            color:'#09c'
        },
         subtextStyle:{
            color:'#000'
        }
    },
    tooltip: {
        trigger: 'axis'
    },
    legend: {
        data:['新增会员','新增游客'],
 x: 'left',
textStyle:{
    color:'#000'
}
    },
    grid: {
        left: '0%',
        right: '0%',
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
        data: [<?=$c1['tag']?>]
    },
    yAxis: {
        type: 'value'
    },
    series: [
        {
            name:'新增会员',
            type:'line',
            stack: '总量',
            label: {
                normal: {
                    show: true,
                    position: 'top'
                }
            },
            data:[<?=$c1['data']?>]
        },
          {
            name:'新增游客',
            type:'line',
            stack: '总量',
             label: {
                normal: {
                    show: true,
                    position: 'top'
                }
            },
            data:[<?=$c2['data']?>]
        }
       
    ]
};


        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
  </script>

</body>
</html>
