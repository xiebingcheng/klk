<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
if(stripos(auth_group($_SESSION['login_gid']),'tongji_online')===false)exit(denied_pape());
$ts=explode(':',$global['config']['tserver']);
$userdata=array();
$usertag=array();
switch($type){
	case 'newuser':
	//用户组
$query=$db->query("select * from {$tablepre}auth_group order by ov desc");
while($row=$db->fetch_row($query)){

	$grouparr.="grouparr['{$row[id]}']=".json_encode($row).";\n";

}
	break;
}
if(!isset($choice_roomid)){
       if(empty($login_roomid)){
 $choice_roomid=$default_roomid;
    }else{
     $choice_roomid=$login_roomid;
    }
  }
$room_list_li=room_list_li($choice_roomid);
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
<script src="/room/script/jquery.min.js"></script>
  <script type="text/javascript" src="/room/script/swfobject.js"></script>
  <script type="text/javascript" src="/room/script/web_socket.js"></script>
  <script>
   if (typeof console == "undefined") {    this.console = { log: function (msg) {  } };}
    WEB_SOCKET_SWF_LOCATION = "/room/script/WebSocketMain.swf";
    WEB_SOCKET_DEBUG = true;
    var ws, name, client_list={},timeid, reconnect=false;
    var grouparr=new Array();
    <?=$grouparr?>
    var usertag ='';
    var userdata ='';
var My={roomid:'<?=$choice_roomid?>'}

var RoomInfo={TServer:'<?=$ts[0]?>',TSPort:'<?=$ts[1]?>'}

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
<div class="container"  style="width:800px;margin-left:100px;">
<form  class="form-horizontal" action="" method="get"> 
  <ul class="breadcrumb">
    <li class="active" >
   房间： <select name="moreselAge" id="addNew" OnChange="choice_room(this.value)">   
                       <?=$room_list_li;?>  
                     </select>
    </li>
  </ul>
  </form>

	
	<div class="row">
       <div style="margin-left:15px;text-decoration:none;"> <a href="javascript:location.reload();">[点击刷新]</a></div>   
        <div class="span24" id="canvas"></div>
      </div>
<table  class="table table-bordered table-hover definewidth m10" style="width:700px" id="userlist"
    <thead>
      <tr style="font-weight:bold" >
      <td width="80" align="center" bgcolor="#FFFFFF">用户ID</td>
      <td width="80" align="center" bgcolor="#FFFFFF">昵称</td>
        <td  width="80" align="center" bgcolor="#FFFFFF">用户组</td>
       
  </tr>
    </thead>
 </table>
</div>

<script type="text/javascript" src="../assets/js/bui.js"></script> 
<script type="text/javascript" src="../assets/js/config.js"></script> 
  <script type="text/javascript">
      function WriteMessage(txt){
           var Msg;
	try{
		Msg=eval("("+txt+")");
	}catch(e){return;}
      if(Msg.type=='ping')return;
         var list=[];
         var cid=[];
        var a=0;
        var usertext='在线用户';
        var userstr;
     var onlineNum=Msg.onlineuserlist.length;  
    if(onlineNum==0){usertext='当前直播间没有在线用户';}
     for(i=0;i<onlineNum;i++)
	{
      var U=Msg.onlineuserlist[i]['client_name'];
     if (cid[U.chatid]!=undefined)continue;
     cid[U.chatid]=0;
         if(list[U.color]== undefined){list[U.color]=0;}
           list[U.color]= list[U.color]+1;
      
    userstr+= "<tr><td>"+U.chatid+"</td><td>"+U.nick+"</td><td>"+grouparr[U.color].title+"</td></tr>";
      
		
			}
                        var arrdata =new Array();
                        var arrtag= new Array();
     var onlineNum2=list.length;    
   
       for(i=0;i<onlineNum2;i++)
	{
    if(list[i]!= undefined){
       arrdata.push(list[i]);
       arrtag.push(grouparr[i].title);  
    }
 }
  $("#userlist").append(userstr);
userdata=arrdata;
usertag=arrtag;
    BUI.use('bui/chart',function (Chart) {
  
        var chart = new Chart.Chart({
          render : '#canvas',
          width : 800,
          height : 400,
          title : {
            text : usertext,
             'font-size' : '21px',
            'fill':'#00a3d7'
          },
          subTitle : {
            text : '总人数('+onlineNum+')'
          },
          xAxis : {
            categories:usertag
                
          },
          yAxis : {
            title : {
              text : ''
            },
            min : 0
          },  
          tooltip : {
            shared : true
          },
          seriesOptions : {
              columnCfg : {
                  'color':'#00a3d7' 
              }
          },
          series: [ {
                  name: '在线统计',
         
            type : 'column',
                  data: userdata,
                   labels : { //显示的文本信息
              label : {
                rotate : 0,
                y : -10,
                'fill' : '#000',
                'text-anchor' : 'end',
                textShadow: '0 0 3px black',
                'font-size' : '15px'
              }
            }
 
              }]
              
        });
 
        chart.render();
    });
	}

function onConnect(t)
{
	

  var str = '{"type":"getonline","roomid":"'+My.roomid+'"}';           
ws.send(str);

	
}


function start(){
  
	ws=new WebSocket("wss://"+RoomInfo.TServer+":"+RoomInfo.TSPort);
	ws.onopen=onConnect;
	ws.onmessage=function(e){WriteMessage(e.data)};
	ws.onclose=function(){setTimeout('location.reload()',3000);};
	ws.onerror=function(){setTimeout('location.reload()',3000);};
}
start();
    BUI.use('bui/calendar',function(Calendar){
          var datepicker = new Calendar.DatePicker({
            trigger:'.calendar',
			dateMask : 'yyyy-mm',
            autoRender : true
          });
        });
    BUI.use('common/page');


function choice_room(value){
    
    if(value=='0') return;
   window.location.href="?type=newuser&choice_roomid="+value; 
}
  </script>

</body>
</html>
