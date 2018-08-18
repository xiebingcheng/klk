<?php
require_once '../../include/common.inc.php';
if(!isset($_SESSION['login_uid']) && $_SESSION['login_uid']=='0' )exit("Access Denied");


if($act=="GetMoney"){
    $uid=$_SESSION['login_uid'];
    $getmoney= $request->post('getmoney');
   if ( $uid!='0' && $getmoney>0  ) {
            $time = time();
            
            $getname=$username;
            $username=$_SESSION['login_user'];
             $user=$db->fetch_row($db->query("select moneyred  from  {$tablepre}memberfields   where uid='$uid' "));
       if($user['moneyred']>=$getmoney){
             $db->query("insert into {$tablepre}money_tixian(uid,username,type,getname,bankcard,getmoney,addtime,addip,status,roomid)values('$uid','$username','$type','$getname','$bankcard','$getmoney','$time','$onlineip',0,'$rid')");
              $db->query("update {$tablepre}memberfields set moneyred=moneyred-$getmoney where uid='$uid'");
         $data['status']='ok';
         $data['msg']='成功提交提现申请！';
         $data['tixian']=$getmoney;
       }else{
           $data['status']='no';
       }
            echo json_encode($data);
        } 

 //echo "<script>window.parent.dialog4.close();alert('充值成功！');window.parent.location.reload();</script>";
   
}
//$userinfo=$db->fetch_row($db->query("select m.username,ms.moneyred from {$tablepre}members m,{$tablepre}memberfields ms  where m.uid=ms.uid and m.uid='{$uid}'")); 

?>