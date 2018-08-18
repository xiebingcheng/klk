<?php
require_once '../include/common.inc.php';
$u=$_GET['t'].'/'.$_GET['u'].".gif";
$uid=$_GET['u'];

if(file_exists($u))header("Location: $u");
else 
{	
    $query=$db->query("select uid,touxiang from {$tablepre}members where uid='{$uid}' and openid is not null limit 1");

if($db->num_rows($query)){
    
$userinfo=$db->fetch_row($query);
$touxiang=$userinfo['touxiang'];
    header("Location: $touxiang");
    
}else{
    
	if($_GET['t']=='p1')
	//$u="rebot/".sprintf("%02d",rand(2,40)).".png";
        $u="p1/null.jpg";
	else
	$u="p2/null.gif";
	header("Location: $u");
}
}
?>