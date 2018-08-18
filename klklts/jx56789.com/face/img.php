<?php
$u=$_GET['t'].'/'.$_GET['u'].".png";


if(file_exists($u))header("Location: $u");
else 
{	
	if($_GET['t']=='p1')
	//$u="rebot/".sprintf("%02d",rand(2,40)).".png";
        $u="p1/null.jpg";
	else
	$u="p2/null.gif";
	header("Location: $u");
}
?>