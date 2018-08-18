<?php
require_once '../../include/common.inc.php';
switch ($act) {
  case "getgift";
    if (isset($_SESSION['login_uid']) && $_SESSION['login_uid']!='0' ) {
      $uid=$_SESSION['login_uid'];
      $db->query("update {$tablepre}luckcode set isuse=1,userid='$uid' where luckcode='$luckcode'");
      
      $giftarr=array();
      $query = $db->query("select id,giftname,v,giftimg from {$tablepre}gift_goods where getmethod='2' ");
     while($row=$db->fetch_row($query)){
       $giftarr[]=$row;  
         
     }
     $resultgift=get_rand1($giftarr);
     $time=time();
     $jiangpin=$resultgift['giftname'];
      $db->query("insert into {$tablepre}rotate(jiangpin,addtime,ip,uid,getmethod,roomid)values('$jiangpin','$time','$onlineip','$uid',2,'$rid')");
      exit(json_encode($resultgift));
    } else {
        echo 'false';
    }
    break;
  case "codecheck":           
    $query = $db->query("select isuse from {$tablepre}luckcode where luckcode='{$luckcode}' and getmethod=2  limit 1");
    if ($db->num_rows($query)) { 
      $info = $db->fetch_row($query);
      if ($info['isuse'] == '0') {
        exit('success');  
      } else {
        exit('isuse');  
      }
    } else {
      exit('nohave');
    }
    break;
}
?>