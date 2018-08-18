<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
if(stripos(auth_group($_SESSION['login_gid']),'users_admin')===false)exit(denied_pape());
$dateinfo=$_POST['dateinfo'];

switch ($dateinfo) {
    case 0:
        //全部
      $begintime='';
        $endtime='';
        $filename='all';
        break;
    case 1:
        //本日
       $begintime=mktime(0,0,0,date('m'),date('d'),date('Y'));;
        $endtime=mktime(0,0,0,date('m'),date('d')+1,date('Y'))-1;;
        $filename=date("Y-m-d");
        break;
    case 2:
        //昨日
       $begintime=mktime(0,0,0,date('m'),date('d')-1,date('Y'));
       $endtime=mktime(0,0,0,date('m'),date('d'),date('Y'))-1;
        $filename=date("Y-m-d",$begintime);
        break;
     case 3:
         //本周
      $begintime=mktime(0,0,0,date('m'),date('d')-date('w')+1,date('Y'));
      $endtime=mktime(23,59,59,date('m'),date('d')-date('w')+7,date('Y'));
        $filename=date("Y-m-d",$begintime).'到'.date("Y-m-d",$endtime);
        break;
     case 4:
         //本月
     $begintime=mktime(0,0,0,date('m'),1,date('Y'));
      $endtime=mktime(23,59,59,date('m'),date('t'),date('Y'));
      $filename=date("Y-m-d",$begintime).'到'.date("Y-m-d",$endtime);
        break;
     case 5:
         //本年
       $begintime=mktime(0,0,0,1,1,date('Y'));
       $endtime=mktime(23,59,59,12,31,date('Y'));
      $filename=date("Y-m-d",$begintime).'到'.date("Y-m-d",$endtime);
        break;
}
 





$query=$db->query("select * from {$tablepre}auth_group order by id desc");

$arrgroup=array();
while($row=$db->fetch_row($query)){
	$arrgroup[$row['id']]=iconv('utf-8', 'gbk', $row['title']);
	}

        
	$sql="select m.*,ms.*  from {$tablepre}members m,{$tablepre}memberfields ms  where m.uid=ms.uid and m.uid!=0";
	if($begintime!="" && $endtime!="" ){
	$sql.=" and  m.regdate>='$begintime' and m.regdate<='$endtime' ";
}
        
        $query=$db->query($sql);
      
	if($db->num_rows($query)==0){
          echo '你选择的日期无数据!&nbsp;&nbsp;<a href="javascript:history.go(-1)">点击返回</a> ';
           exit;
      }
      
  header("Cache-Control:must-revalidate, post-check=0, pre-check=0");
header("Content-Type:application/force-download");
header("Content-Type:application/vnd.ms-execl");
header("Content-Type:application/download");
header('Content-Disposition:attachment;filename="'.$filename.'.xls"');
	echo iconv('utf-8', 'gbk', '用户ID')."\t".iconv('utf-8', 'gbk', '用户名')."\t".iconv('utf-8', 'gbk', '昵称')."\t".iconv('utf-8', 'gbk', '手机号')."\t".iconv('utf-8', 'gbk', 'QQ号')."\t".iconv('utf-8', 'gbk', '用户组')."\t".iconv('utf-8', 'gbk', '用户归属')."\t".iconv('utf-8', 'gbk', '推广人')."\t".iconv('utf-8', 'gbk', '注册时间')."\t".iconv('utf-8', 'gbk', '最近登录')."\t\n";;
	while($row=$db->fetch_row($query)){
        foreach ($row as $i => $v) {
    // CSV的Excel支持GBK编码，一定要转换，否则乱码
        $row[$i] = iconv('utf-8', 'gbk', $v);
}
  
	//$row['dateline1']=date("Y-m-d H:i:s",$row['dateline']);
          echo $row['uid']."\t".$row['username']."\t".$row['nickname']."\t".$row['phone']."\t".$row['realname']."\t".$arrgroup[$row['gid']]."\t".$row['fuser']."\t".$row['tuser']."\t".date("Y-m-d H:i:s",$row['regdate'])."\t".date("Y-m-d H:i:s",$row['lastactivity'])."\t\n";;
		
	}

