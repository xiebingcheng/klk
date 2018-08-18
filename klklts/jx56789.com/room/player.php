<?php
require_once '../include/common.inc.php';
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content=" initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <title> zhibo</title>

 </head>
	<style>
	html{
		width: 100%;
		height: 100%;
	}
	body{
		width: 100%;
		height: 100%;
	}
	

*{ margin:0px;}
.gd{ color:#FFF; height:36px; line-height:36px; background:#000; position:absolute; bottom:0px; left:0px; z-index:100px; width:300px; font-size:12px; right:200px;}
</style>

 <body>


<?php
switch($type){
	case "pc":
            if($cfg['config']['livetype']==1){
             	exit(tohtml($cfg['config']['yyfp']));   
            }else{
		exit(tohtml($cfg['config']['livefp']));
            }
	
	break;	
	case "m":
		exit(tohtml($cfg['config']['phonefp']));
	break;
}
?>
</body>
</html>