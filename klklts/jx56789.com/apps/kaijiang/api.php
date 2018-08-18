<?php

if(empty($_GET['code'])){
 $result['code']=0;
 $result['message']='非法请求';
  echo json_encode($result);
   exit;
}
$code=$_GET['code'];
$ch = curl_init();
if(strlen($code)>10){exit("Access Denied"); }
//设置选项，包括URL
curl_setopt($ch, CURLOPT_URL, "http://43.225.105.170:8099/cpapi?code=$code&format=json");
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_HEADER, 0);
curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (compatible; MSIE 5.01; Windows NT 5.0)');
curl_setopt($ch, CURLOPT_TIMEOUT, 15);
//执行并获取HTML文档内容
$output = curl_exec($ch);

//释放curl句柄
curl_close($ch);

$output= json_decode($output,true);
unset($output['remain']);
echo json_encode($output);
exit;

