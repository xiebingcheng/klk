<?php 
require_once("../comm/config.php");

function qq_callback()
{
    //debug
    //print_r($_REQUEST);
    //print_r($_SESSION);

    if($_REQUEST['state'] == $_SESSION['state']) //csrf
    {
        $token_url = "https://graph.qq.com/oauth2.0/token?grant_type=authorization_code&"
            . "client_id=" . $_SESSION["appid"]. "&redirect_uri=" . urlencode($_SESSION["callback"])
            . "&client_secret=" . $_SESSION["appkey"]. "&code=" . $_REQUEST["code"];

        $response = file_get_contents($token_url);
        if (strpos($response, "callback") !== false)
        {
            $lpos = strpos($response, "(");
            $rpos = strrpos($response, ")");
            $response  = substr($response, $lpos + 1, $rpos - $lpos -1);
            $msg = json_decode($response);
            if (isset($msg->error))
            {
                echo "<h3>error:</h3>" . $msg->error;
                echo "<h3>msg  :</h3>" . $msg->error_description;
                exit;
            }
        }

        $params = array();
        parse_str($response, $params);

        //debug
        //print_r($params);

        //set access token to session
        $_SESSION["access_token"] = $params["access_token"];

    }
    else 
    {
        echo("The state does not match. You may be a victim of CSRF.");
    }
}

function get_openid()
{
    $graph_url = "https://graph.qq.com/oauth2.0/me?access_token=" 
        . $_SESSION['access_token'];

    $str  = file_get_contents($graph_url);
    if (strpos($str, "callback") !== false)
    {
        $lpos = strpos($str, "(");
        $rpos = strrpos($str, ")");
        $str  = substr($str, $lpos + 1, $rpos - $lpos -1);
    }

    $user = json_decode($str);
    if (isset($user->error))
    {
        echo "<h3>error:</h3>" . $user->error;
        echo "<h3>msg  :</h3>" . $user->error_description;
        exit;
    }

    //debug
    //echo("Hello " . $user->openid);

    //set openid to session
    $_SESSION["openid"] = $user->openid;
}

//QQ登录成功后的回调地址,主要保存access token
qq_callback();

//获取用户标示id
get_openid();


function get_user_info()
{
    $get_user_info = "https://graph.qq.com/user/get_user_info?"
        . "access_token=" . $_SESSION['access_token']
        . "&oauth_consumer_key=" . $_SESSION["appid"]
        . "&openid=" . $_SESSION["openid"]
        . "&format=json";

    $info = file_get_contents($get_user_info);
    $arr = json_decode($info, true);

    return $arr;
}

//获取用户基本资料
$arr = get_user_info();


require_once '../../include/common.inc.php';

$query=$db->query("select uid from {$tablepre}members where openid='{$_SESSION["openid"]}' limit 1");
if($db->num_rows($query)){
    $msg=qquser_login($_SESSION["openid"]);
		if($msg===true){
			setcookie("username", $arr["nickname"], gdate()+315360000);
                        
			header("location:../../room");
		}
    
    
}else{

$regtime=gdate();
   $touxiang=$arr['figureurl_qq_2'];
		$p=md5('123456789');
                $u=$arr["nickname"];
                $openid=$_SESSION["openid"];
		$tuser=userinfo($_COOKIE['tg'],'{username}');
		if($global['config']['regaudit']=='1')$state='0';
		else $state='1';
$db->query("insert into {$tablepre}members(username,password,sex,email,regdate,regip,lastvisit,lastactivity,gold,realname,gid,phone,tuser,state,openid,touxiang) values('$u','$p','2','$email','$regtime','$onlineip','$regtime','$regtime','0','1234567','1','$phone','$tuser','$state','$openid','$touxiang')");
		$uid=$db->insert_id();
		$db->query("replace into {$tablepre}memberfields (uid,nickname)	values('$uid','$u')	");
		
		
		$db->query("insert into  {$tablepre}msgs(rid,ugid,uid,uname,tuid,tname,mtime,ip,msg,type)
	values('{$rid}','1','{$uid}','{$u}','{$cfg[config][defvideo]}','{$cfg[config][defvideonick]}','".gdate()."','{$onlineip}','用户QQ注册','2')
		");
		
		 $msg=qquser_login($_SESSION["openid"]);
		if($msg===true){
			setcookie("username", $u, gdate()+315360000);
                      
			header("location:../../room");
                    
		}
		else{ $echo= "<script>layer.alert('QQ登录成功！$msg',{ icon: 1});</script>";}


}


  
?>
