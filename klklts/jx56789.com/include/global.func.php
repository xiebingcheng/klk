<?php 
if(!defined('IS_NUOYUN')) {
	exit('Access Denied');
}
//get拦截规则
$getfilter = "\\<.+javascript:window\\[.{1}\\\\x|<.*=(&#\\d+?;?)+?>|<.*(data|src)=data:text\\/html.*>|\\b(alert\\(|confirm\\(|expression\\(|prompt\\(|benchmark\s*?\(.*\)|sleep\s*?\(.*\)|load_file\s*?\\()|<[a-z]+?\\b[^>]*?\\bon([a-z]{4,})\s*?=|^\\+\\/v(8|9)|\\b(and|or)\\b\\s*?([\\(\\)'\"\\d]+?=[\\(\\)'\"\\d]+?|[\\(\\)'\"a-zA-Z]+?=[\\(\\)'\"a-zA-Z]+?|>|<|\s+?[\\w]+?\\s+?\\bin\\b\\s*?\(|\\blike\\b\\s+?[\"'])|\\/\\*.*\\*\\/|<\\s*script\\b|\\bEXEC\\b|UNION.+?SELECT\s*(\(.+\)\s*|@{1,2}.+?\s*|\s+?.+?|(`|'|\").*?(`|'|\")\s*)|UPDATE\s*(\(.+\)\s*|@{1,2}.+?\s*|\s+?.+?|(`|'|\").*?(`|'|\")\s*)SET|INSERT\\s+INTO.+?VALUES|(SELECT|DELETE)@{0,2}(\\(.+\\)|\\s+?.+?\\s+?|(`|'|\").*?(`|'|\"))FROM(\\(.+\\)|\\s+?.+?|(`|'|\").*?(`|'|\"))|(CREATE|ALTER|DROP|TRUNCATE)\\s+(TABLE|DATABASE)|<(\/?meta.*?)>";
//post拦截规则
$postfilter = "<.*=(&#\\d+?;?)+?>|<.*data=data:text\\/html.*>|\\b(alert\\(|confirm\\(|expression\\(|prompt\\(|benchmark\s*?\(.*\)|sleep\s*?\(.*\)|load_file\s*?\\()|<[^>]*?\\b(onerror|onmousemove|onload|onmouseover)\\b|\\b(and|or)\\b\\s*?([\\(\\)'\"\\d]+?=[\\(\\)'\"\\d]+?|[\\(\\)'\"a-zA-Z]+?=[\\(\\)'\"a-zA-Z]+?|>|<|\s+?[\\w]+?\\s+?\\bin\\b\\s*?\(|\\blike\\b\\s+?[\"'])|\\/\\*.*\\*\\/|<\\s*script\\b|\\bEXEC\\b|UNION.+?SELECT\s*(\(.+\)\s*|@{1,2}.+?\s*|\s+?.+?|(`|'|\").*?(`|'|\")\s*)|UPDATE\s*(\(.+\)\s*|@{1,2}.+?\s*|\s+?.+?|(`|'|\").*?(`|'|\")\s*)SET|INSERT\\s+INTO.+?VALUES|(SELECT|DELETE)(\\(.+\\)|\\s+?.+?\\s+?|(`|'|\").*?(`|'|\"))FROM(\\(.+\\)|\\s+?.+?|(`|'|\").*?(`|'|\"))|(CREATE|ALTER|DROP|TRUNCATE)\\s+(TABLE|DATABASE)|<(\/?meta.*?)>";
//cookie拦截规则
$cookiefilter = "benchmark\s*?\(.*\)|sleep\s*?\(.*\)|load_file\s*?\\(|\\b(and|or)\\b\\s*?([\\(\\)'\"\\d]+?=[\\(\\)'\"\\d]+?|[\\(\\)'\"a-zA-Z]+?=[\\(\\)'\"a-zA-Z]+?|>|<|\s+?[\\w]+?\\s+?\\bin\\b\\s*?\(|\\blike\\b\\s+?[\"'])|\\/\\*.*\\*\\/|<\\s*script\\b|\\bEXEC\\b|UNION.+?SELECT\s*(\(.+\)\s*|@{1,2}.+?\s*|\s+?.+?|(`|'|\").*?(`|'|\")\s*)|UPDATE\s*(\(.+\)\s*|@{1,2}.+?\s*|\s+?.+?|(`|'|\").*?(`|'|\")\s*)SET|INSERT\\s+INTO.+?VALUES|(SELECT|DELETE)@{0,2}(\\(.+\\)|\\s+?.+?\\s+?|(`|'|\").*?(`|'|\"))FROM(\\(.+\\)|\\s+?.+?|(`|'|\").*?(`|'|\"))|(CREATE|ALTER|DROP|TRUNCATE)\\s+(TABLE|DATABASE)|<(\/?meta.*?)>";
function getrobot() {
	if(!defined('IS_ROBOT')) {
		$kw_spiders = 'Bot|Crawl|Spider|slurp|sohu-search|lycos|robozilla';
		$kw_browsers = 'MSIE|Netscape|Opera|Konqueror|Mozilla';
		if(preg_match("/($kw_browsers)/i", $_SERVER['HTTP_USER_AGENT'])) {
			define('IS_ROBOT', FALSE);
		} elseif(preg_match("/($kw_spiders)/i", $_SERVER['HTTP_USER_AGENT'])) {
			define('IS_ROBOT', TRUE);
		} else {
			define('IS_ROBOT', FALSE);
		}
	}
	return IS_ROBOT;
}
function daddslashes($string, $force = 0) {
	!defined('MAGIC_QUOTES_GPC') && define('MAGIC_QUOTES_GPC', get_magic_quotes_gpc());
	if(!MAGIC_QUOTES_GPC || $force) {
		if(is_array($string)) {
			foreach($string as $key => $val) { 
                                $val = htmlspecialchars($val);
				$string[$key] = daddslashes($val, $force);
			}
		} else { 
                    if(is_string($string)){
                        $string=trim($string);
                    } 
                    
			$string = addslashes($string);
                        $string = htmlspecialchars($string);
		}
	}
	return $string;
}
function keyED($txt,$encrypt_key) { 
$encrypt_key = md5($encrypt_key); 
$ctr=0; 
$tmp = ""; 
for ($i=0;$i<strlen($txt);$i++){ 
if ($ctr==strlen($encrypt_key)) $ctr=0; 
$tmp.= substr($txt,$i,1) ^ substr($encrypt_key,$ctr,1); 
$ctr++; 
} 
return $tmp; 
} 

function encrypt($txt,$key){ 
srand((double)microtime()*1000000); 
$encrypt_key = md5(rand(0,32000)); 
$ctr=0; 
$tmp = ""; 
for ($i=0;$i<strlen($txt);$i++){ 
if ($ctr==strlen($encrypt_key)) $ctr=0; 
$bbb=substr($encrypt_key,$ctr,1) . 
(substr($txt,$i,1) ^ substr($encrypt_key,$ctr,1)); 
$tmp.= $bbb; 
$ctr++; 
} 
return base64_encode(keyED($tmp,$key)); 
} 

function decrypt($txt,$key){ 
$txt=base64_decode($txt); 
$txt = keyED($txt,$key); 
$tmp = ""; 
for ($i=0;$i<strlen($txt);$i++){ 
$md5 = substr($txt,$i,1); 
$i++; 
$tmp.= (substr($txt,$i,1) ^ $md5); 
} 
return $tmp; 
}
function connectkey(){
	global $tserver_key;
	return encrypt($_SERVER['HTTP_HOST'],$tserver_key);
}
function dhtmlspecialchars($string) {
	if(is_array($string)) {
		foreach($string as $key => $val) {
			$string[$key] = dhtmlspecialchars($val);
		}
	} else {
		$string = preg_replace('/&amp;((#(\d{3,5}|x[a-fA-F0-9]{4}));)/', '&\\1',
		//$string = preg_replace('/&amp;((#(\d{3,5}|x[a-fA-F0-9]{4})|[a-zA-Z][a-z0-9]{2,5});)/', '&\\1',
		str_replace(array('&','"', '<', '>'), array('&amp;','&quot;', '&lt;', '&gt;'), $string));
	}
	return $string;
}
function tohtml($str){
	return str_replace(array('&amp;','&quot;', '&lt;', '&gt;'), array('&', '"', '<', '>'),$str);
}
function showstars($totalol) {
	global $upgrade;
	$starthreshold=4;
	$onlinetime_total=round($totalol / 60/60, 2);
	$num=@ceil(($onlinetime_total + 1) / $upgrade);
	
	//$num--;
	if($onlinetime_total>24)
	{
		$d=floor($onlinetime_total/24);
		$onlinetime_total=$onlinetime_total-$d*24;
		$d.="天 ";
	}
	$str='';
	$sumlevel = 0;
		for($i = 3; $i > 0; $i--) {
			$numlevel = intval($num / pow($starthreshold, ($i - 1)));
			$num = ($num % pow($starthreshold, ($i - 1)));
		$sumlevel += $numlevel;
			}
	$alt = 'title="等级: '.$sumlevel.' (在线:'.round($totalol / 60/60, 2).'小时)"';
	$str="<img src=\"./images/ranklist/level_{$sumlevel}.png\" {$alt}/>";
	
	return $str;
}
function onlinetime($second){
    $day = floor($second/(3600*24));
        $second = $second%(3600*24);
        $hour = floor($second/3600);
        $second = $second%3600;
        $minute = floor($second/60);
       
        $day!=0 && $result.=$day.'天';
        $hour!=0 && $result.=$hour.'小时';
        $result.=$minute.'分';
   return $result;
}
function gdate(){
	global $timeoffset;
	return time()+$timeoffset;
}
function isemail($email) {
	return strlen($email) > 6 && preg_match("/^[\w\-\.]+@[\w\-\.]+(\.\w+)+$/", $email);
}
#分页函数
#$totle总条数,$displaypg limit条数,$url可以为空
#使用:
/**********************************************************
$count=$db->sqlnum($db->query($sql));
pageft($count,15,"");
$re=$db->query($sql." limit $firstcount,$displaypg");
#想必不用多说了!

#echo $pagenav //为"共0页 首页 上一页 下一页 尾页共0条,0页"
***********************************************************/
if(!function_exists(pageft)){ 
function pageft($totle,$displaypg=20,$url){
	global $firstcount,$_GET,$db,$pagenav,$_SERVER;
	$GLOBALS["displaypg"]=$displaypg;
	if(isset($_GET['page']))
	{
	$page=  intval($db->fhtml($_GET['page']));
	if($page<=1){$up=1;$firstcount=0;$down=2;$page=1;}
	else {$down=$page+1;$firstcount=($page-1)*$displaypg;$up=$page-1;}
	
	}
	else {$up=1;$down=2;$firstcount=0;$page=1;}
	$count=ceil($totle/$displaypg);
	if($down>$count)$down=$count;
	
	if($url==''){ $url=$_SERVER["REQUEST_URI"];}
	$parse_url=parse_url($url);
        parse_str($parse_url["query"],$arrquery);
        unset($arrquery['page']);
        unset($arrquery['act']); //删除url中的act参数，避免翻页执行php中act对应的方法
       foreach($arrquery as $k=>$v){ $urlquery.=$k."=".$v.'&'; } 
       $urlquery=substr($urlquery, 0, -1);
	$url=$parse_url["path"]."?".$urlquery; 
    $pagenav="<span class='page'>第{$page}/{$count}页</span> <a class='page' href='{$url}'>首页</a> <a class='page' href='{$url}&page={$up}'>上一页</a> <a class='page' href='{$url}&page={$down}'>下一页</a> <a class='page' href='{$url}&page={$count}'>尾页</a>";
	$pagenav.=" <span class='page'>共{$totle}条</span>　 <span class='pagesel'>去&nbsp;";
	$pagenav.="<input id='ToPage' type='text' size='3' class='ToPage' style='width: 38px;height: 22px;line-height: 22px; padding: 0px;'>&nbsp;页</span>";
        $pagenav.='&nbsp;<input type="button" value="确定" class="button button-mini button-info"  onclick="toPage(\''.$url.'\')">';

}
}
//房间列表 房间分类$cid 显示房间数$num 列表模板$tpl   显示分页标签$displaypg
function roomlist($cid,$t,$num,$tpl,$skey=""){
	global $db,$tablepre,$firstcount,$displaypg;
	$sql="select * from {$tablepre}room where 1=1";
	if($cid!=0)$sql.=" and cid='$cid'";
	if($t!=0) $sql.=" and t='$t'";
	if($skey!="")$sql.=" and name like '%$skey%'";
	$count=$db->num_rows($db->query($sql));
	pageft($count,$num,"");
	$sql.=" order by cid,`order` limit $firstcount,$displaypg";
	$query=$db->query($sql);
	
	return for_each($query,$tpl);
}




//显示用户信息 用户id $uid
function userinfo($uid,$tpl){
	global $db,$tablepre;
	$query=$db->query("select m.*,ms.*
						  from {$tablepre}members m,{$tablepre}memberfields ms
						  where m.uid=ms.uid and m.uid='{$uid}'
						  ");
	
	return for_each($query,$tpl);
}
//通过用户ID获取用户信息
function get_userinfo_byuid($uid){
   global $db,$tablepre;
    $userinfo=$db->fetch_row($db->query("select m.*,ms.* from {$tablepre}members m,{$tablepre}memberfields ms where m.uid=ms.uid and m.uid='{$uid}' ")); 
   return $userinfo;
}
function userlist($num,$sql,$tpl){
	global $db,$tablepre,$firstcount,$displaypg;
	$count=$db->num_rows($db->query($sql));
	pageft($count,$num,"");
	$sql.=" limit $firstcount,$displaypg";
	$query=$db->query($sql);
	return for_each2($query,$tpl);
	
}
function rebotlist($num,$sql,$tpl){
	global $db,$tablepre,$firstcount,$displaypg;
	$count=$db->num_rows($db->query($sql));
	pageft($count,$num,"");
	$sql.=" limit $firstcount,$displaypg";
	$query=$db->query($sql);
	return for_each_rebot($query,$tpl);
	
}
//获取发红包信息
function redbaglist($num,$sql,$tpl){
	global $db,$tablepre,$firstcount,$displaypg;
	$count=$db->num_rows($db->query($sql));
	pageft($count,$num,"");
	$sql.=" limit $firstcount,$displaypg";
	$query=$db->query($sql);
	return for_each_redbag($query,$tpl);
	
}
//最新活跃会员
function onlineuser($num,$timestamp,$tpl,$skey="",$goldorder="lastactivity",$sex=""){
	global $db,$tablepre,$firstcount,$displaypg;
	$time=gdate();
	$sql="select uid from {$tablepre}members where uid!=0";
	if($timestamp!=0)$sql.=" and lastactivity+$timestamp>$time";
	if($skey!="")$sql.=" and (username like '%$skey%' or fuser like '%$skey%' or tuser like '%$skey%' or uid in(select uid from {$tablepre}memberfields where  nickname like '%$skey%'))";
	if($sex!="")$sql.=" and sex='$sex'";
	$count=$db->num_rows($db->query($sql));
	pageft($count,$num,"");
	if($goldorder=='1')$goldorder="gold";
        if($goldorder!="0")
        $sql.=" order by `{$goldorder}` desc ";
        $sql.=" limit $firstcount,$displaypg";
	$query=$db->query($sql);
	while($row=$db->fetch_row($query)){
			$t=$tpl;
			$t=userinfo($row['uid'],$t);
			$str.=$t;
		}
	return $str;
}

function rand_color(){       
    for($a=0;$a<6;$a++){    //采用#FFFFFF方法，       
        $d .= dechex(rand(0,15));//累加随机的数据--dechex()将十进制改为十六进制       
    }       
    return '#'.$d;       
}



function for_each_chatlog($query,$tpl){
	global $db,$tablepre;
	while($row=$db->fetch_row($query)){
		$t=$tpl;
		$row['msg']=html_entity_decode($row['msg']);
		foreach($row as $key=>$value){
			$t=str_replace('{'.$key.'}',$value,$t);	
		}
	$str.=$t;
	}
	return $str;
}
function for_each_notice($query,$tpl){
	global $db,$tablepre;
	while($row=$db->fetch_row($query)){
		$t=$tpl;
		
		if($row['type']=='1'){
			$row['type']='开启';
		}else{
                    
                    $row['type']='关闭';
                }
		
		foreach($row as $key=>$value){
			$t=str_replace('{'.$key.'}',$value,$t);	
		}
	$str.=$t;
	}
	return $str;
}
function for_each($query,$tpl){
	global $db,$tablepre;
	while($row=$db->fetch_row($query)){
		$t=$tpl;
		$row['txt']=$db->totxt($row['txt']);
		if($row['color']=='')$row['color']=rand_color();
		$row['_sex']=$row['sex'];
		$sex=array("女","男","保密");
		$row['sex']=$sex[$row['sex']];
		$row['showstars']=showstars($row['onlinetime']);
		$row['nowtime']=gdate();
		$row['dateline1']=date("Y-m-d H:i:s",$row['dateline']);
		$row['vip_level']="0";
		if($row['vip_expire']!='0'){
			$tmp=explode('-',$row['vip_expire']);
			if((int)$tmp[1]>gdate())$row['vip_level']=$tmp[0];
		}
		foreach($row as $key=>$value){
			$t=str_replace('{'.$key.'}',$value,$t);	
		}
	$str.=$t;
	}
	return $str;
}
function for_each2($query,$tpl){
	global $db,$tablepre;
	while($row=$db->fetch_row($query)){
		$t=$tpl;
		$row['txt']=$db->totxt($row['txt']);
		if($row['color']=='')$row['color']=rand_color();
                if($row['roomid']=='0')$row['roomid']='';
		$row['_sex']=$row['sex'];
		$sex=array("女","男","保密");
		$row['sex']=$sex[$row['sex']];
                $state=array("否","是");
                $row['state']=$state[$row['state']];
		if($row['tag']=='1'){
			if($row['m_uid']==$_SESSION['login_uid'] or $row['fuid']==$_SESSION['login_uid'])
				{
					$row['txt'].="<font style='color:#CCC'> [仅我俩能看]</font>";				
				}
			else $row['txt']="<font style='color:#CCC'>不公开的留言 [仅Ta俩能看]</font>";
		}
		$row['showstars']=showstars($row['onlinetime']);
                $row['onlinetime']= onlinetime($row['onlinetime']);
		$row['nowtime']=gdate();
		$row['dateline1']=date("Y-m-d H:i:s",$row['dateline']);
		$row['vip_level']="0";
		if($row['vip_expire']!='0'){
			$tmp=explode('-',$row['vip_expire']);
			if((int)$tmp[1]>gdate())$row['vip_level']=$tmp[0];
		}
                //如果是管理员，去除删除按钮
                if($row['uid']==1){
                   $t=str_replace('<input type="checkbox" class="ids" name="id[]" value="{uid}">','',$t);	 
                    $t=str_replace('<button type="button" class="button button-mini button-danger" onclick="if(confirm(\'确定删除用户？\'))location.href=\'?act=user_del&id={uid}\'" ><i class="x-icon x-icon-small icon-trash icon-white"></i>删除</button>','',$t);
                }
		foreach($row as $key=>$value){
			$t=str_replace('{'.$key.'}',$value,$t);	
		}
	$str.=$t;
	}
	return $str;
}
function for_each_rebot($query,$tpl){
	global $db,$tablepre;
	while($row=$db->fetch_row($query)){
		$t=$tpl;
               $row['_sex']=$row['sex'];
		$sex=array("女","男","保密");
		$row['sex']=$sex[$row['sex']];
                $state=array("否","是");
                $row['ico']='<img src="'.$row['ico'].'" width="30px" />';

		
		foreach($row as $key=>$value){
			$t=str_replace('{'.$key.'}',$value,$t);	
		}
	$str.=$t;
	}
	return $str;
}
function for_each_redbag($query,$tpl){
	global $db,$tablepre;
	while($row=$db->fetch_row($query)){
		$t=$tpl;
		$row['username']=$tuser=userinfo($row['uid'],'{username}');
		$row['nickname']=$tuser=userinfo($row['uid'],'{nickname}');
              $row['teacher']=$tuser=userinfo($row['juid'],'{nickname}');
		foreach($row as $key=>$value){
			$t=str_replace('{'.$key.'}',$value,$t);	
		}
	$str.=$t;
	}
	return $str;
}
function roomadmin($uid)
{
	global $db,$tablepre;	
	if($db->num_rows($db->query("select uid from {$tablepre}members where uid='$uid' and priv='1'"))>0){
		$query=$db->query("select id from {$tablepre}room");
		$i=0;
		while($row=$db->fetch_row($query)){
			$t[$i++]=$row[0];
			}
			return $t;
	}
	
	$query=$db->query("select rids from {$tablepre}roomadmin where uid='$uid' limit 1");
	while($row=$db->fetch_row($query))
	{
		return explode(',',$row['rids']);
	}
	return array();
}
function isonline($uid)
{	
	global $db,$tablepre;
	$time=gdate();
	$isonline=false;
	$str="离线";
	$query=$db->query("select * from {$tablepre}members where lastactivity>$time-70 and uid='$uid'");
	if($db->num_rows($query)>0){$isonline=true;$str="在线";}
	
	$query=$db->query("select a.* from {$tablepre}room a,{$tablepre}memberonlines b where a.id=b.rid and b.uid='$uid'");
	
	while($row=$db->fetch_row($query))
	{
		if($isonline){$str="聊天中";$str.='(<a href="javascript:void(0);" onclick=\'window.open("./room/?id='.$row['id'].'","room","width="+screen.availWidth+",height="+screen.availHeight)\'>'.$row['name'].'</a>)';}
		
	}
	return $str;
}
function reonline()
{
	global $db,$tablepre,$u_id;
	$time=gdate();
	if(!isset($_SESSION['onlines_state']['time']))
	{
		$_SESSION['onlines_state']['time']=$time;
		$db->query("update {$tablepre}members set lastactivity=$time where uid='$u_id'");
	}
	$query_row=$db->fetch_row($db->query("select lastactivity from {$tablepre}members where uid='$u_id'"));
	$_time=(int)($time-$query_row['lastactivity']);
	
	$db->query("delete from {$tablepre}memberonlines where lastactivity<$time-600");
	$db->query("update {$tablepre}members set lastactivity='$time' where uid='$u_id'");
}
function gusetLogin(){
  global $db,$tablepre,$onlineip,$cfg,$rid,$request;
      $regtime=gdate();
      $fuser='';
   if(isset($_SESSION['tg'])){ 
    $userinfo=get_userinfo_byuid($_SESSION['tg']);
    if($userinfo['gid']==3){
         $fuser=$tuser=$userinfo['username'];
    }else{$tuser=$userinfo['username'];}
             
     }else{ 
         $tg=$request->cookie('tg');
         if(isset($tg)){
		$userinfo=get_userinfo_byuid($tg);
                  if($userinfo['gid']==3){
         $fuser=$tuser=$userinfo['username'];
    }else{$tuser=$userinfo['username'];}
                }else{
                   $tuser='system'; 
                }
           }
           $md5=$request->cookie('md5');
       if(!isset($md5) ||  strlen($md5)<6 ){
         
            $md5=date('m').strtoupper(substr(md5(microtime()),0,6));
            $guestuid='x'.$md5;
        $guestname='游客'.$md5;
            setcookie("md5", $md5, gdate()+315360000);
            //判断用户归属是否为空，为空则查询客服在线表，随机分配一个在线客服
       if($fuser==''){  
         $query=$db->query("select username from {$tablepre}kefuonlines where rid='$rid'");
       $kefulist=array();
while($row=$db->fetch_row($query)){
	$kefulist[]=$row['username'];
}   
 if(!empty($kefulist)){
 $key= array_rand($kefulist);

       $fuser=$kefulist[$key];}}
     $db->query("insert into {$tablepre}guest(guestuid,username,regdate,regip,lastvisit,lastactivity,fuser,tuser,roomid)	values('$guestuid','$guestname','$regtime','$onlineip','$regtime','$regtime','$fuser','$tuser','$rid')");
      
        }
	else{
            $md5=$request->cookie('md5');
            $guestuid='x'.$md5;
        $guestname='游客'.$md5;
        }
   
   $guestinfo=$db->fetch_row($db->query("select * from {$tablepre}guest where guestuid='$guestuid' limit 0,1 "));      
if($guestinfo==''){
      $db->query("insert into {$tablepre}guest(guestuid,username,regdate,regip,lastvisit,lastactivity,fuser,tuser,roomid)	values('$guestuid','$guestname','$regtime','$onlineip','$regtime','$regtime','$fuser','$tuser','$rid')");
      $guestinfo['guestuid']=$guestuid;
       $guestinfo['username']=$guestname;
       $guestinfo['fuser']=$fuser;
       $guestinfo['tuser']=$tuser;
       $guestinfo['banspeak']=0;
    
}
	$_SESSION['login_uid']=0;
	$_SESSION['login_guest_uid']=$guestinfo['guestuid'];
	$_SESSION['login_nick']=$guestinfo['username'];
	$_SESSION['login_sex']=0;
        $_SESSION['guest_fuser']=$guestinfo['fuser'];
         $_SESSION['guest_tuser']=$guestinfo['tuser'];
         $_SESSION['guest_banspeak']=$guestinfo['banspeak'];
        setcookie("guest_fuser", $guestinfo['fuser'], gdate()+315360000);
        
}
function user_login($u,$p,$roomid){
	global $db,$tablepre,$onlineip,$cfg,$global;
	
	$query=$db->query("select * from {$tablepre}members where username='$u' and password='".md5($p)."'");
	while($row=$db->fetch_row($query)){ 
           
		if($global['config']['regaudit']=='1'&&$row['state']=='0')
		return "用户未审核,暂不能登录！";
		
		$_SESSION['login_uid']=$row['uid'];
		$_SESSION['login_user']=$row['username'];
		$_SESSION['login_nick']=$row['username'];
		$_SESSION['login_gid']=$row['gid'];
		$_SESSION['login_sex']=$row['sex'];
		$time=gdate();
		$_SESSION['onlines_state']['time']=$time;
		$db->query("update {$tablepre}members set lastvisit=lastactivity,regip='$onlineip' where uid={$row[uid]}");
		$db->query("update {$tablepre}members set lastactivity=$time where uid={$row[uid]}");
		$db->query("update {$tablepre}memberfields set logins=logins+1 where uid={$row[uid]}");
		$db->query("insert into  {$tablepre}msgs(rid,ugid,uid,uname,tuid,tname,mtime,ip,msg,`type`,roomid)
	values('{$cfg[config][roomid]}','{$row[gid]}','{$row[uid]}','{$row[username]}','{$cfg[config][defvideo]}','{$cfg[config][defvideonick]}','".gdate()."','{$onlineip}','用户登陆','1','{$roomid}')
		");
		return true;
	}
	return "用户名或密码错误！";
}

function qquser_login($openid){
	global $db,$tablepre,$onlineip,$cfg,$global;
	
	$query=$db->query("select * from {$tablepre}members where  openid='$openid'");
	while($row=$db->fetch_row($query)){
		if($global['config']['regaudit']=='1'&&$row['state']=='0')
		return "用户未审核！";
		
		$_SESSION['login_uid']=$row['uid'];
		$_SESSION['login_user']=$row['username'];
		$_SESSION['login_nick']=$row['username'];
		$_SESSION['login_gid']=$row['gid'];
		$_SESSION['login_sex']=$row['sex'];
		$time=gdate();
		$_SESSION['onlines_state']['time']=$time;
		$db->query("update {$tablepre}members set lastvisit=lastactivity,regip='$onlineip' where uid={$row[uid]}");
		$db->query("update {$tablepre}members set lastactivity=$time where uid={$row[uid]}");
		$db->query("update {$tablepre}memberfields set logins=logins+1 where uid={$row[uid]}");
		$db->query("insert into  {$tablepre}msgs(rid,ugid,uid,uname,tuid,tname,mtime,ip,msg,`type`)
	values('{$cfg[config][roomid]}','{$row[gid]}','{$row[uid]}','{$row[username]}','{$cfg[config][defvideo]}','{$cfg[config][defvideonick]}','".gdate()."','{$onlineip}','QQ登陆','1')
		");
		return true;
	}
	return "用户名或密码错误！";
}
function weixin_login($openid){
	global $db,$tablepre,$onlineip,$cfg,$global;
	
	$query=$db->query("select * from {$tablepre}members where  openid='$openid' and usertype='3'");
	while($row=$db->fetch_row($query)){
		if($global['config']['regaudit']=='1'&&$row['state']=='0')
		return "用户未审核！";
		
		$_SESSION['login_uid']=$row['uid'];
		$_SESSION['login_user']=$row['username'];
		$_SESSION['login_nick']=$row['username'];
		$_SESSION['login_gid']=$row['gid'];
		$_SESSION['login_sex']=$row['sex'];
		$time=gdate();
		$_SESSION['onlines_state']['time']=$time;
		$db->query("update {$tablepre}members set lastvisit=lastactivity,regip='$onlineip' where uid={$row[uid]}");
		$db->query("update {$tablepre}members set lastactivity=$time where uid={$row[uid]}");
		$db->query("update {$tablepre}memberfields set logins=logins+1 where uid={$row[uid]}");
		$db->query("insert into  {$tablepre}msgs(rid,ugid,uid,uname,tuid,tname,mtime,ip,msg,`type`)
	values('{$cfg[config][roomid]}','{$row[gid]}','{$row[uid]}','{$row[username]}','{$cfg[config][defvideo]}','{$cfg[config][defvideonick]}','".gdate()."','{$onlineip}','微信登陆','1')
		");
		return true;
	}
	return "用户名或密码错误！";
}
function group_info($gid){
	global $db,$tablepre;
	$sql="select * from {$tablepre}auth_group where id ='$gid' limit 1";
	$query=$db->query($sql);
	while($row=$db->fetch_row($query)){
		return $row;
	}
	return NULL;
}
function auth_group($gid){
	global $db,$tablepre;
	$sql="select rules from {$tablepre}auth_group where id ='$gid' limit 1";
	$query=$db->query($sql);
	while($row=$db->fetch_row($query)){
		return $row[rules];
	}
	return NULL;
}
function check_auth($auth){
	$auth_rules=auth_group($_SESSION['login_gid']);
	if(stripos($auth_rules,$auth)!==false)return true;
	return false;
}
function check_user_auth($uid,$auth){
	$auth_rules=auth_group(userinfo($uid,'{gid}'));
	if(stripos($auth_rules,$auth)!==false)return true;
	return false;
}
/**
 *  参数拆分
 */
function webscan_arr_foreach($arr) {
  static $str;
  static $keystr;
  if (!is_array($arr)) {
    return $arr;
  }
  foreach ($arr as $key => $val ) {
    $keystr=$keystr.$key;
    if (is_array($val)) {

      webscan_arr_foreach($val);
    } else {

      $str[] = $val.$keystr;
    }
  }
  return implode($str);
}
/**
 *  攻击检查拦截webscan_StopAttack($key,$value,$postfilter,"POST");
 */
function webscan_StopAttack($StrFiltKey,$StrFiltValue,$ArrFiltReq) {
  $StrFiltValue=webscan_arr_foreach($StrFiltValue);
  if (preg_match("/".$ArrFiltReq."/is",$StrFiltValue)==1){

    exit(webscan_pape());
  }
  if (preg_match("/".$ArrFiltReq."/is",$StrFiltKey)==1){

    exit(webscan_pape());
  }

}
/**
 *  变量检查拦截param_webscan_StopAttack($value,$postfilter,"POST");
 */
function param_webscan_StopAttack($StrFiltValue,$ArrFiltReq) {
  $StrFiltValue=webscan_arr_foreach($StrFiltValue);
  if (preg_match("/".$ArrFiltReq."/is",$StrFiltValue)==1){

      return true;
  }

  return false;
}
/**
 *  防护提示页
 */
function webscan_pape(){
  $pape=<<<HTML
  <html>
  <body style="margin:0; padding:0">
  <center><iframe width="100%" align="center" height="870" frameborder="0" scrolling="no" src="/room/stopattack.html"></iframe></center>
  </body>
  </html>
HTML;
  echo $pape;
}
/**
 *  没有权限提示页
 */
function denied_pape(){
  $pape=<<<HTML
  <html>
  <body style="margin:0; padding:0">
  <center><iframe width="100%" align="center" height="870" frameborder="0" scrolling="no" src="/room/nopermission.html"></iframe></center>
  </body>
  </html>
HTML;
  echo $pape;
}
function system_open_time($sysstart,$sysend,$rid){
    $time=mktime(0,0,0,date('m'),date('d'),date('Y'));
    $time=time()-$time;
    //系统开启时间转为为时分
     if($sysstart>60*60){
     $shour=floor($sysstart/(60*60));
 }else{$shour=0;}
 $yu=$sysstart-$shour*60*60;
  if($yu>=60){
     $sminute=floor($yu/60);
 }else{
     $sminute=0;
 }
   //关闭时间转化为时分
     if($sysend>60*60){
     $xhour=floor($sysend/(60*60));
 }else{$xhour=0;}
 $yu=$sysend-$xhour*60*60;
  if($yu>=60){
     $xminute=floor($yu/60);
 }else{
     $xminute=0;
 }

    if($sysend>=$sysstart){
        if($sysstart<=$time &&  $sysend>=$time){ return ;}else{
            exit("<script>location.href='/room/error.php?rid=".$rid."&msg=当前时间房间不能访问！开启时间为:".$shour."时".$sminute."分 至 ".$xhour."时".$xminute."分'</script>");exit();
        }
    }else{
         if(($sysstart<=$time &&  $sysend<=$time)|| ($sysstart>=$time &&  $sysend>=$time) ){ return ;}else{
           exit("<script>location.href='/room/error.php?rid=".$rid."&msg=当前时间房间不能访问！开启时间为:".$shour."时".$sminute."分 至 ".$xhour."时".$xminute."分'</script>");exit();
        }
        
    }
    
}
 ////根据ip获得访客所在地地名
	function Get_Ip_From($ip=''){
		if(empty($ip)){
			$ip = self::Getip();    
		}
   		$ip_json=@file_get_contents("http://ip.taobao.com/service/getIpInfo.php?ip=".$ip);//根据taobao ip
   		$ip_arr=json_decode(stripslashes($ip_json),1);
   		if($ip_arr['code']==0)
   		{
   			return $ip_arr;
   		}
   		else
   		{
   			return false;
   		}
   		
	} 
        //随机生成字符串
       function str_rand($len)
     {
       $chars='ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz';
        $string=time();
        for(;$len>=1;$len--)
        {
            $position=rand()%strlen($chars);
            $position2=rand()%strlen($string);
            $string=substr_replace($string,substr($chars,$position,1),$position2,0);
        }
        return $string;
         
     }  
     
      /* 
 * 通过概率获取礼物
 */ 
function get_rand1($proArr) {   
    $result = array();
    foreach ($proArr as $key => $val) { 
        $arr[$key] = $val['v']; 
    } 
    // 概率数组的总概率  
    $proSum = array_sum($arr);        
    asort($arr);
    // 概率数组循环   
    foreach ($arr as $k => $v) {   
        $randNum = mt_rand(1, $proSum);   
        if ($randNum <= $v) {   
            $result = $proArr[$k];   
            break;   
        } else {   
            $proSum -= $v;   
        }         
    }     
    return $result;   
}  
         /** 
 * 生成缩略图函数（支持图片格式：gif、jpeg、png和bmp） 
 * @author ruxing.li 
 * @param  string $src      源图片路径 
 * @param  int    $width    缩略图宽度（只指定高度时进行等比缩放） 
 * @param  int    $width    缩略图高度（只指定宽度时进行等比缩放） 
 * @param  string $filename 保存路径（不指定时直接输出到浏览器） 
 * @return bool 
 */  
function mkThumbnail($src, $width = null, $height = null, $filename = null) {  
    if (!isset($width) && !isset($height))  
        return false;  
    if (isset($width) && $width <= 0)  
        return false;  
    if (isset($height) && $height <= 0)  
        return false;  
  
    $size = getimagesize($src);  
    if (!$size)  
        return false;  
  
    list($src_w, $src_h, $src_type) = $size;  
    $src_mime = $size['mime'];  
    switch($src_type) {  
        case 1 :  
            $img_type = 'gif';  
            break;  
        case 2 :  
            $img_type = 'jpeg';  
            break;  
        case 3 :  
            $img_type = 'png';  
            break;  
        case 15 :  
            $img_type = 'wbmp';  
            break;  
        default :  
            return false;  
    }  
  
    if (!isset($width))  
        $width = $src_w * ($height / $src_h);  
    if (!isset($height))  
        $height = $src_h * ($width / $src_w);  
  
    $imagecreatefunc = 'imagecreatefrom' . $img_type;  
    $src_img = $imagecreatefunc($src);  
    $dest_img = imagecreate($width, $height);  
    imagecopyresampled($dest_img, $src_img, 0, 0, 0, 0, $width, $height, $src_w, $src_h);  
  
    $imagefunc = 'image' . $img_type;  
    if ($filename) {  
        $imagefunc($dest_img, $filename);  
    } else {  
        header('Content-Type: ' . $src_mime);  
        $imagefunc($dest_img);  
    }  
    imagedestroy($src_img);  
    imagedestroy($dest_img);  
    return true;  
}  
 

?>