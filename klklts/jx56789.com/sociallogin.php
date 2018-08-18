<?php
if($_GET['act']=='login'){ 

$redirect_uri='http://'.$_SERVER['SERVER_NAME'].'/sociallogin.php';
$redirect_uri= urlencode($redirect_uri);
  $login_url='https://open.weixin.qq.com/connect/qrconnect?appid=wx894a4a50413f46d5&redirect_uri='.$redirect_uri.'&response_type=code&scope=snsapi_login&state='.$_GET['rid'].'#wechat_redirect'; 
       header("Location:$login_url"); 
     
}
 include('./include/class_weixin_adv.php');
$weixin=new class_weixin_adv("wx894a4a50413f46d5", "ed4ebdfa989763ffe9f0a932626ebf29");
          if (isset($_GET['code'])){
              $url="https://api.weixin.qq.com/sns/oauth2/access_token?appid=wx894a4a50413f46d5&secret=ed4ebdfa989763ffe9f0a932626ebf29&code=".$_GET['code']."&grant_type=authorization_code";
              $res = $weixin->https_request($url);
              $res=json_decode($res, true);
         
            
              //刷新access_token有效期
           //   $refresh_url="https://api.weixin.qq.com/sns/oauth2/refresh_token?appid=wx894a4a50413f46d5&grant_type=refresh_token&refresh_token=".$res['refresh_token'];
             //  $res2 = $weixin->https_request($refresh_url);
             // $res2=json_decode($res2, true);
             
              $row=$weixin->get_user_info($res['access_token'],$res['openid']);
            
              if ($row['openid']) {
                 //这里写上逻辑,存入cookie,数据库等操作
             require_once './include/common.inc.php';

$query=$db->query("select uid from {$tablepre}members where openid='{$_SESSION["openid"]}' and usertype=3");
if($db->num_rows($query)){
    $msg=weixin_login($row["openid"]);
		if($msg===true){
			setcookie("username", $arr["nickname"], gdate()+315360000);
                        
			header("location:/".$state);
		}	else{echo "<script>alert('".$msg."');window.close();</script>";}
    
    
}else{

$regtime=gdate();
   $touxiang=substr($row["headimgurl"], 0, -1).'46';
		$p=md5('weixinlogin');
                $u=$row["nickname"];
                $openid=$row["openid"];
		if(isset($_COOKIE['tg'])){
		$tuser=userinfo($_COOKIE['tg'],'{username}');}else{
                   $tuser='system'; 
                }
                $fuser=$_SESSION['guest_fuser'];
		if($global['config']['regaudit']=='1')$state='0';
		else $state='1';
                $db->query("insert into {$tablepre}members(username,password,sex,regdate,regip,lastvisit,lastactivity,gold,realname,gid,phone,fuser,tuser,state,openid,touxiang,usertype) values('$u','$p','2','$regtime','$onlineip','$regtime','$regtime','0','','1','$phone','$fuser','$tuser','$state','$openid','$touxiang','3')");
               $uid=$db->insert_id();
		$db->query("replace into {$tablepre}memberfields (uid,nickname)	values('$uid','$u')	");
		
		
		$db->query("insert into  {$tablepre}msgs(rid,ugid,uid,uname,tuid,tname,mtime,ip,msg,type)
	values('{$rid}','1','{$uid}','{$u}','{$cfg[config][defvideo]}','{$cfg[config][defvideonick]}','".gdate()."','{$onlineip}','微信登录注册','2')
		");
		
		 $msg=weixin_login($row["openid"]);
		if($msg===true){
			setcookie("username", $u, gdate()+315360000);
                      
			header("location:/".$state);
                    
		}
		else{echo "<script>alert('".$msg."');window.close();</script>";}


}
      
              }else{
              
              }
          }else{
              echo "NO CODE";
          }
        
    