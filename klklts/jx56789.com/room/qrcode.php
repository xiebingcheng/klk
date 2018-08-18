<?php
error_reporting(E_ERROR);
require_once '../include/phpqrcode.php';
$url = urldecode($_GET["data"]);
QRcode::png($url,false,0,4.8,2);
