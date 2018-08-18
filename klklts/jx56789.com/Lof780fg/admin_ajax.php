<?php
require_once '../include/common.inc.php';
if(!isset($_SESSION['admincp']))exit("Access Denied");
$uid=(int)$uid;
$id=(int)$id;
switch($act)
{
	
	case "roomidcheck":
	if($db->num_rows($db->query("select * from {$tablepre}config where roomid='$roomid' "))>0){exit('1');}else {exit('0');}
	break;
	
}

?>