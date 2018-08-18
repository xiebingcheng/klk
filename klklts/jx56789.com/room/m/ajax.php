<?php
require_once '../../include/common.inc.php';
if($cfg['config']['loginguest']=='0')header('location:../../logging.php');

switch($act)
{
   case "getmsg":
       
       $query=$db->query("select * from {$tablepre}chatlog where rid='".$cfg['config']['id']."' and p='false' and state!='1' and `type`='0'  and id >'".$_SESSION['max_msg_id']."' order by id desc ");
       //获取最大ID

while($row=$db->fetch_row($query)){
	$row['msg']=str_replace(array('&amp;', '','&quot;', '&lt;', '&gt;'), array('&', "\'",'"', '<', '>'),$row['msg']);
	if($row[tuid]!="ALL"){
		$omsg="<div class='msg' id='{$row[msgid]}'><div class='msg_head'><img src='../../face/img.php?t=p1&u={$row[uid]}'><span class='u'>{$row[uname]}</span><span class='dui'>对</span><img src='../../face/img.php?t=p1&u={$row[tuid]}'><span class='u'>{$row[tname]}</span><span class='shuo'>说</span></div>
		 <div class='msg_content'>{$row[msg]}</div></div>".$omsg;
	}
	else{
		$omsg="<div class='msg_li'><div style='clear:both;'></div><div class='msg' id='{$row[msgid]}'><div class='msg_head'><img src='../../face/img.php?t=p1&u={$row[uid]}'><span class='u'> {$row[uname]}：</spa></div> <div class='msg_content'>{$row[msg]}</div></div></div>".$omsg;
	}
}
$query=$db->query("select max(id+0) max_id from {$tablepre}chatlog");
	$row=$db->fetch_row($query);

$_SESSION['max_msg_id']=$row['max_id'];
       echo $omsg;
       
       break;
    
}

?>
