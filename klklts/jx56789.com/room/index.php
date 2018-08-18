<?php
require_once '../include/common.inc.php';
if(!isset($_SESSION['login_uid'])||$_SESSION['login_uid']==0){header("location:/");exit();}
else{header("location:/");}
?>