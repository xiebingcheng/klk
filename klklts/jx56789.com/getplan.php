<?php
require_once './include/common.inc.php';
if(!isset($_SESSION['login_uid']))exit("Access Denied");
$filename='plan.txt';
if (!file_exists($filename)) 
{ 
$file = fopen($filename, "w") or die("Unable to create file!");
} 

$change_time = filectime($filename);                   //获取文件的最后incode时间
$last_time = filemtime($filename);                     //获取文件的最后修改时间
$new_time = time();
$plan='';
if($new_time-$last_time<=60){
$plan = file_get_contents($filename);

$plan = mb_convert_encoding($plan, 'utf-8', 'gbk');
 $plan = str_replace("\r\n","<br />",$plan);

}
if(!empty($plan)){ 
    $query=$db->query("select * from {$tablepre}chatlog where style='$last_time' ");
    if($db->num_rows($query)<=0){	
    $sql="insert into {$tablepre}chatlog(rid,uid,tuid,uname,tname,p,style,msg,mtime,ugid,msgid,ip,state,type,device)
				  values('$rid','plan','ALL','计划员','大家','false','$last_time','$plan',".gdate().",'4','','$onlineip','0','0','')";
$db->query($sql);	
                }
}
echo $plan;
exit;
    ?>


