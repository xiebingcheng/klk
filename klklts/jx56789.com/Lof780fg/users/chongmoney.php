<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
if(stripos(auth_group($_SESSION['login_gid']),'users_admin')===false)exit("没有权限！");
$operation=0;
$ts=explode(':',$global['config']['tserver']);
if($act=="moneyred_add"){
    $time=time();
    $caozuoren=$_SESSION['admincp'];
      $db->query("insert into {$tablepre}moneyrun_info(username,uid,moneyrun,beizhu,addtime,addip,caozuoren,type)values('$username','$uid','$addmoney','$beizhu','$time','$onlineip','$caozuoren',1)");
      $db->query("update {$tablepre}memberfields set moneyred=moneyred+$addmoney where uid='$uid'");
 //echo "<script>window.parent.dialog4.close();alert('充值成功！');window.parent.location.reload();</script>";
    $operation=1;
}
$userinfo=$db->fetch_row($db->query("select m.username,ms.moneyred from {$tablepre}members m,{$tablepre}memberfields ms  where m.uid=ms.uid and m.uid='{$uid}'")); 

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
td {padding: 0.5em 0.5em 0.5em 0em;}
.tableleft {text-align: right;}
</style>
<script src="/room/script/jquery.min.js"></script>
  <script type="text/javascript" src="/room/script/swfobject.js"></script>
  <script type="text/javascript" src="/room/script/web_socket.js"></script>
    <script>
   if (typeof console == "undefined") {    this.console = { log: function (msg) {  } };}
    WEB_SOCKET_SWF_LOCATION = "/room/script/WebSocketMain.swf";
    WEB_SOCKET_DEBUG = true;
    var ws, name, client_list={},timeid, reconnect=false;
   
var My={roomid:'<?=$cfg['config']['roomid']?>',money:'<?=$userinfo['moneyred']?>',tuid:'<?=$uid?>'}
var RoomInfo={TServer:'<?=$ts[0]?>',TSPort:'<?=$ts[1]?>'}


</script>
</head>
<body>
<div class="container" >
    <form action="chongmoney.php" method="post" enctype="application/x-www-form-urlencoded" id="regUser">
        <table >
            <tr>
                <td width="80" class="tableleft" style="width:70px;">充值用户：</td>
                <td><?= $userinfo['username'] ?></td>
            </tr>
              
            <tr>
                <td width="80" class="tableleft" style="width:70px;">当前金额：</td>
                <td><span style="color:red;"><?= $userinfo['moneyred'] ?></span>元</td>
            </tr>
            <tr>
                <td width="80" class="tableleft">充值金额：</td>
                <td><input name="addmoney" type="text" id="addmoney" style="width:150px;" /></td>
            </tr>
            <tr>
                <td width="80" class="tableleft">备注：</td>
                <td><input name="beizhu" type="text" id="beizhu" style="width:150px;" /></td>
            </tr>
        </table>
             
        <div style=" background: #FFF; width:100%;margin-top: 23px; ">
      
            <input type="button" id="reg"  class="button button-success" value="确定"/>
            <button type="button"  class="button" onclick="window.parent.dialog4.close()">关闭</button>
            <input type="hidden" name="uid" value="<?=$uid?>">
            <input type="hidden" name="username" value="<?=$userinfo['username']?>">
            <input type="hidden" name="act" value="moneyred_add">
        </div>
    </form>

</div>

<script type="text/javascript" src="../assets/js/bui.js"></script> 
<script type="text/javascript" src="../assets/js/config.js"></script> 
<script type="text/javascript" src="../../upload/swfupload/swfupload.js"></script> 
<script>
  $(document).ready(function() {
   $('#reg').click(function() {
        var c = /^[0-9]+(\.[0-9]+)?$/;
         if ($.trim($('#addmoney').val()) == "" || !c.test($('#addmoney').val())) {
                $('#addmoney').focus().css({
                    border: "1px solid red",
                    boxShadow: "0 0 2px red"
                });
                alert('请填写正确的充值金额！');
                return false;
            }
          if ($.trim($('#beizhu').val()) == "") {
                $('#beizhu').focus().css({
                    border: "1px solid red",
                    boxShadow: "0 0 2px red"
                });
                alert('请填写备注信息！');
                return false;
            }
          $('#regUser').submit();
        });
    });
      function WriteMessage(txt){
           var Msg;
	try{
		Msg=eval("("+txt+")");
	}catch(e){return;}
     
        }

function onConnect(t)
{
	
//var str='getonline=M='+My.roomid+'|'+My.dm;
  var str = '{"type":"editredbag","roomid":"'+My.roomid+'","tuid":"'+My.tuid+'","money":"'+My.money+'"}';           
ws.send(str);

	
}


function start(){
  
	ws=new WebSocket("wss://"+RoomInfo.TServer+":"+RoomInfo.TSPort);
	ws.onopen=onConnect;
	ws.onmessage=function(e){WriteMessage(e.data)};
	ws.onclose=function(){setTimeout('location.reload()',3000);};
	ws.onerror=function(){setTimeout('location.reload()',3000);};
}
 var operation=<?=$operation?>;
 if(operation==1){
start();
window.parent.dialog4.close();alert('充值成功！');window.parent.location.reload();
}
  


</script>
</body>
</html>
