<?php
error_reporting(0);
session_start();
define('IS_NUOYUN', TRUE);
define('NUOYUN_ROOT', substr(dirname(__FILE__), 0, -7));
define('MAGIC_QUOTES_GPC', get_magic_quotes_gpc());

if (isset($_REQUEST['GLOBALS']) || isset($_FILES['GLOBALS'])) {
	exit('Request tainting attempted.');
}
require_once NUOYUN_ROOT . './include/Request.php';
//初始化request
$request = Request::instance();
require_once NUOYUN_ROOT.'./include/global.func.php';


    $pos = strpos($_SERVER['PHP_SELF'],'zz_admin');
foreach(array('_COOKIE', '_POST', '_GET') as $_request) {
     foreach($$_request as $_key => $_value) {
    if ($pos === false) {
            if($_request=='_POST'){
             webscan_StopAttack($_key,$_value,$postfilter);}
             if($_request=='_GET'){
             webscan_StopAttack($_key,$_value,$getfilter);}
             if($_request=='_COOKIE'){
             webscan_StopAttack($_key,$_value,$cookiefilter);}
             }
		$_key{0} != '_' && $$_key = daddslashes($_value);
	}
}
if (!MAGIC_QUOTES_GPC && $_FILES && $pos === false){
	$_FILES = daddslashes($_FILES);
}
require_once NUOYUN_ROOT.'./config.inc.php';
if(getenv('HTTP_CLIENT_IP') && strcasecmp(getenv('HTTP_CLIENT_IP'), 'unknown')) {
	$onlineip = getenv('HTTP_CLIENT_IP');
} elseif(getenv('HTTP_X_FORWARDED_FOR') && strcasecmp(getenv('HTTP_X_FORWARDED_FOR'), 'unknown')) {
	$onlineip = getenv('HTTP_X_FORWARDED_FOR');
} elseif(getenv('REMOTE_ADDR') && strcasecmp(getenv('REMOTE_ADDR'), 'unknown')) {
	$onlineip = getenv('REMOTE_ADDR');
} elseif(isset($_SERVER['REMOTE_ADDR']) && $_SERVER['REMOTE_ADDR'] && strcasecmp($_SERVER['REMOTE_ADDR'], 'unknown')) {
	$onlineip = $_SERVER['REMOTE_ADDR'];
}
if(isset($_SESSION['login_uid']))$u_id=$_SESSION['login_uid'];
preg_match("/[\d\.]{7,15}/", $onlineip, $onlineipmatches);
$onlineip = $onlineipmatches[0] ? $onlineipmatches[0] : '0.0.0.0';
unset($onlineipmatches);
require_once NUOYUN_ROOT.'./include/db_mysql.class.php';
$db = new dbstuff;
$db->connect($dbhost, $dbuser, $dbpw, $dbname);
$dbuser = $dbpw = $dbname = NULL;
header('Content-Type: text/html; charset='.$charset);

if(empty($rid) && !isset($_SESSION['roomid'])){

     $rid=$default_roomid;  
 }else{
     if(empty($rid)){
         
         $rid=$_SESSION['roomid'];
     }
     
 }
    if($rid=='allmsg'){
     $rid=$default_roomid;    
  }
  $_SESSION['roomid']=$rid; 
$rid=intval($rid);
 setcookie("roomid", $rid, gdate()+315360000);
//全局设置


$cfg['config']=$db->fetch_row($db->query("select * from {$tablepre}config where roomid='$rid'"));
if(empty($cfg['config'])){header("Location: /room/inputroom"); }

//推广用户id
if(isset($t)){setcookie("tg", $t, gdate()+315360000);$_SESSION['tg']=$t; }
?>