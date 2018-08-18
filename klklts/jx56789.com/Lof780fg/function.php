<?php
if(!isset($_SESSION['admincp']))exit("<script>top.location.href='http://".$_SERVER["HTTP_HOST"]."/Lof780fg/login.php'</script>");
//判断是否为房间管理员登录
$login_roomid=$_SESSION['login_roomid'];
$room_sql= empty($login_roomid)?'':" and roomid='$login_roomid'";
function group_add($title,$sn,$ico,$ov){
	global $db,$tablepre;
	$db->query("insert into {$tablepre}auth_group(title,sn,ico,type,ov)values('$title','$sn','$ico',0,'$ov')");	
}
function group_del($id){
	global $db,$tablepre;
        $db->query("update {$tablepre}members set gid='1' where gid='$id'");
        $db->query("update {$tablepre}rebot_custom set gid='1' where gid='$id'");
	$db->query("delete from {$tablepre}auth_group where id='$id' and id not in (1,2,3)");
}
function group_edit($id,$title,$sn,$ico,$ov){
	global $db,$tablepre;
	$db->query("update {$tablepre}auth_group set title='$title',sn='$sn',ico='$ico',ov='$ov' where id='$id'");
}
function group_rules_edit($id,$rules){
	global $db,$tablepre;
	$db->query("update {$tablepre}auth_group set rules='$rules'  where id='$id'");
}
function user_del($ids){
	global $db,$tablepre;
	if($ids=="")return;
	$db->query("delete from {$tablepre}members where uid  in ($ids) and uid not in (0,1)");
	$db->query("delete from {$tablepre}memberfields where uid in ($ids) and uid not in (0,1)");
}
function guest_del($ids){
	global $db,$tablepre;
	if($ids=="")return;
	$db->query("delete from {$tablepre}guest where uid  in ($ids)");
	
}
function rebots_del($ids){
	global $db,$tablepre;
	if($ids=="")return;
	$db->query("delete from {$tablepre}rebot_custom where id  in ($ids)");
}
function room_del($ids){
	global $db,$tablepre;
	if($ids=="")return;
	$db->query("delete from {$tablepre}config where id='$ids'");
}
function user_edit($id,$realname,$password,$phone,$gid,$fuser,$tuser,$sn,$state,$nickname,$redbags,$onlinestart,$onlineend,$roomid){
	global $db,$tablepre,$login_roomid;
	if($password!="")$pwd=" ,password='".md5($password)."',";
	else $pwd=',';
	if(stripos(auth_group($_SESSION['login_gid']),'set_user_group')!==false)
	{
		$db->query("update {$tablepre}members set gid='$gid'  where uid='$id'");
	}
	
        
        if(empty($login_roomid))
	{
		$db->query("update {$tablepre}members set roomid='$roomid'  where uid='$id'");
	}
	$db->query("update {$tablepre}members set realname='$realname' $pwd phone='$phone',fuser='$fuser',tuser='$tuser',state='$state',redbags='$redbags' where uid='$id'");
	$db->query("update {$tablepre}memberfields set sn='$sn',nickname='$nickname',onlinestart='$onlinestart',onlineend='$onlineend' where uid='$id'");
}
function rebot_edit($id,$rebotname,$gid,$sex,$shour,$sminute,$ssecond,$xhour,$xminute,$xsecond,$week,$roomid){
	global $db,$tablepre;
	
	 $shangxian=$ssecond+$sminute*60+$shour*60*60;
         $xiaxian=$xsecond+$xminute*60+$xhour*60*60;
	$db->query("update {$tablepre}rebot_custom set rebotname='$rebotname',gid='$gid',sex='$sex',shangxian='$shangxian',xiaxian='$xiaxian',week='$week',roomid='$roomid'  where id='$id'");
}
function user_add($realname,$password,$phone,$roomid,$gid,$state,$username){
	global $db,$tablepre,$onlineip;
        $query=$db->query("select uid from {$tablepre}members where username='{$username}' limit 1");
		if($db->num_rows($query))exit("<script>alert('用户名已经被使用!换一个，如{$username}2015');location.href='?'</script>");
	if($password==""){$password='123456';}
        $pwd= md5($password);
        $regtime=gdate();
	if(isset($_COOKIE['tg'])){
		$tuser=userinfo($_COOKIE['tg'],'{username}');}else{
                   $tuser='system'; 
                }

    $db->query("insert into {$tablepre}members(username,password,sex,regdate,regip,lastvisit,lastactivity,gold,realname,gid,phone,tuser,state,roomid)	values('$username','$pwd','2','$regtime','$onlineip','$regtime','$regtime','0','$realname','$gid','$phone','$tuser','$state','$roomid')");
    $uid=$db->insert_id();
		$db->query("replace into {$tablepre}memberfields (uid,nickname)	values('$uid','$username')	");
}
function rotate_add($phone,$jiangpin,$roomid){
    global $db,$tablepre,$onlineip;
    $regtime=gdate();
     $db->query("insert into {$tablepre}rotate(phone,jiangpin,addtime,ip,status,roomid) values('$phone','$jiangpin','$regtime','$onlineip','1','$roomid')");
           
    
}
function   rooms_add($roomid,$title,$keyss,$dc,$logo,$bg,$ewm,$livetype,$yyfp,$livefp,$phonefp,$state,$logintc,$msgblock,$msglog,$msgaudit,$logintip,$loginguest,$viewkefu,$cover){
	global $db,$tablepre;
    $db->query("insert into {$tablepre}config(roomid,title,keyss,dc,logo,bg,ewm,livetype,yyfp,livefp,phonefp,state,logintc,msgblock,msglog,msgaudit,logintip,loginguest,viewkefu,cover)values('$roomid','$title','$keyss','$dc','$logo','$bg','$ewm','$livetype','$yyfp','$livefp','$phonefp','$state','$logintc','$msgblock','$msglog','$msgaudit','$logintip','$loginguest','$viewkefu','$cover')");
  
}
function rebot_add($rebotname,$gid,$sex,$shour,$sminute,$ssecond,$xhour,$xminute,$xsecond,$week,$roomid){
	global $db,$tablepre;
        $query=$db->query("select id from {$tablepre}rebot_custom where rebotname='{$rebotname}' limit 1");
		if($db->num_rows($query))exit("<script>alert('机器人名称已经被使用!换一个，如{$u}2016');location.href='?'</script>");
	
        $regtime=gdate();
        $shangxian=$ssecond+$sminute*60+$shour*60*60;
         $xiaxian=$xsecond+$xminute*60+$xhour*60*60;
       $db->query("insert into {$tablepre}rebot_custom(rebotname,gid,sex,shangxian,xiaxian,regtime,week,roomid) values('$rebotname','$gid','$sex','$shangxian','$xiaxian','$regtime','$week','$roomid')");

}
function config_edit($arr){
	global $db,$tablepre;
	foreach($arr as $key=>$v){
		$set[]="`$key`='$v'";
	}
	$sql="update {$tablepre}global_config set ".implode(",",$set)." where id=1";
	$db->query($sql);
}
function room_config_edit($arr,$id){
	global $db,$tablepre;
	foreach($arr as $key=>$v){
		$set[]="`$key`='$v'";
	}
	$sql="update {$tablepre}config set ".implode(",",$set)." where id='$id'";
	$db->query($sql);
}
function sysmsg_edit($state,$content,$fangshi,$jiange,$roomid){
	global $db,$tablepre;

         $db->query("replace into {$tablepre}sysmsg(state,content,fangshi,jiange,roomid)values('$state','$content','$fangshi','$jiange','$roomid')");
}
function ban_del($id){
	global $db,$tablepre;
	$db->query("delete from {$tablepre}ban where id='$id'");
}
function ban_delold(){
	global $db,$tablepre;
         $time=gdate();
	$db->query("delete from {$tablepre}ban where losttime<'$time'");
}
function ban_add($username,$ip,$sn,$losttime){
	global $db,$tablepre;
	$losttime=strtotime($losttime);
        $addtime=time();
        $author=$_SESSION['admincp'];
	$db->query("insert into {$tablepre}ban(username,ip,sn,losttime,addtime,author)values('$username','$ip','$sn','$losttime','$addtime','$author')");
}
function ban_list($num,$key,$tpl){
	global $db,$tablepre,$firstcount,$displaypg,$room_sql;
	$sql="select * from {$tablepre}ban where 1=1  $room_sql";
	if($key!="")$sql.=" and  (username like '%$key%' or ip like '%$key%')";
	
	$count=$db->num_rows($db->query($sql));
	pageft($count,$num,"");
	$sql.=" order by id desc";
	$sql.=" limit $firstcount,$displaypg";
	$query=$db->query($sql);
	return for_each($query,$tpl);
	

}
function notice_del($id){
	global $db,$tablepre;
	$db->query("delete from {$tablepre}notice where id='$id'");
}
function notice_add($title,$txt,$ov,$type,$contenttype,$content,$roomid){
	global $db,$tablepre;
        //删除数组中的空值
        foreach( $content as $k=>$v){   
          if(!$v)   
        unset( $content[$k] );   
     }   
        $lunboimg=serialize($content);
     
	$losttime=strtotime($losttime);
	$db->query("insert into {$tablepre}notice(title,txt,ov,`type`,content_type,lunboimg,`roomid`)values('$title','$txt','$ov','$type','$contenttype','$lunboimg',$roomid)");
}

function notice_edit($id,$title,$txt,$ov,$type,$contenttype,$content,$roomid){
	global $db,$tablepre;
           //删除数组中的空值
        foreach( $content as $k=>$v){   
          if(!$v)   
        unset( $content[$k] );   
     }   
        $lunboimg=serialize($content);
	$db->query("update {$tablepre}notice set title='$title',txt='$txt',ov='$ov',`type`='$type',content_type='$contenttype',lunboimg='$lunboimg',roomid='$roomid' where id='$id'");
}
function vote_add($title,$content,$roomid){
	global $db,$tablepre;
	$time=gdate();
	$db->query("insert into {$tablepre}vote(title,rid,addtime)values('$title','$roomid',$time)");
        $vid=$db->insert_id();
        foreach ($content as $value){ 
  $db->query("insert into {$tablepre}vote_content(vid,content,addtime)values('$vid','$value',$time)");
  } 
        
}
function kefu_add($qqtitle,$qqnum,$roomid){
	global $db,$tablepre;
	$time=gdate();
	$db->query("insert into {$tablepre}room_kefu(qqtitle,qqnum,roomid,addtime)values('$qqtitle','$qqnum','$roomid',$time)");
 
        
}
function log_list($num,$key,$tpl){
	global $db,$tablepre,$firstcount,$displaypg;
        $key=trim($key);
	$sql="select * from {$tablepre}msgs";
	if($key!="")$sql.=" where uid like '%$key%' or ip like '%$key%' or uname like '%$key%' or msg like '%$key%'";
	
	$count=$db->num_rows($db->query($sql));
	pageft($count,$num,"");
	$sql.=" order by id desc";
	$sql.=" limit $firstcount,$displaypg";
	$query=$db->query($sql);
	return for_each($query,$tpl);	

}
function chatlog_list($num,$key,$tpl){
	global $db,$tablepre,$firstcount,$displaypg;
	$sql="select * from {$tablepre}chatlog";
	if($key!="")$sql.=" where uid like '%$key%' or ip like '%$key%' or uname like '%$key%' or tname like '%$key%' or msg like '%$key%'";
	
	$count=$db->num_rows($db->query($sql));
	pageft($count,$num,"");
	$sql.=" order by id desc";
	$sql.=" limit $firstcount,$displaypg";
	$query=$db->query($sql);
	return for_each_chatlog($query,$tpl);	

}
function log_del($ids){
	global $db,$tablepre;
	if($ids=="")return;
	$db->query("delete from {$tablepre}msgs where id in ($ids)");
}
function chatlog_del($ids){
	global $db,$tablepre;
	if($ids=="")return;
	$db->query("delete from {$tablepre}chatlog where id in ($ids)");
}
function log_delhistory($value){
	global $db,$tablepre;
	if(empty($value)) return;
        $time=gdate();
        $time=$time-$value*24*3600;
	$db->query("delete from {$tablepre}msgs where mtime<'$time' and state<>'2' and state<>'3'  ");
}
function chatlog_delhistory($value){
	global $db,$tablepre;
	if(empty($value)) return;
        $login_roomid=$_SESSION['login_roomid'];
      $sql= empty($login_roomid)?'':" and rid='$login_roomid'";
      if($value!='all'){
        $time=gdate();
        $time=$time-$value*24*3600;
       
      $db->query("delete from {$tablepre}chatlog where mtime<'$time' and type<>'2' and type<>'3' $sql ");
      
      }else{
        $db->query("delete from {$tablepre}chatlog where type<>'2' and type<>'3' $sql ");  
      }
}
function hd_del($ids){
	global $db,$tablepre;
	if($ids=="")return;
	$db->query("delete from {$tablepre}apps_hd where id in ($ids)");
}
function app_hd_add($ktime,$ptime,$sp,$kcj,$lx,$cw,$zsj,$zyj,$username,$uname,$pcj,$sn,$roomid){
	global $db,$tablepre;
	$time=gdate();
	$ktime=strtotime($ktime);
	$ptime=!empty($ptime)?strtotime($ptime):'null';
	
	$db->query("insert into {$tablepre}apps_hd(ktime,ptime,sp,kcj,lx,cw,zsj,zyj,username,uname,pcj,sn,ttime,roomid)values('$ktime','$ptime','$sp','$kcj','$lx','$cw','$zsj','$zyj','$username','$uname','$pcj','$sn','$time','$roomid')");
}
function app_hd_edit($id,$ktime,$ptime,$sp,$kcj,$lx,$cw,$zsj,$zyj,$username,$uname,$pcj,$sn,$roomid){
	global $db,$tablepre;
	$ktime=strtotime($ktime);
	$ptime=!empty($ptime)?strtotime($ptime):'null';
	$db->query("update {$tablepre}apps_hd set ktime='$ktime',ptime='$ptime',sp='$sp',kcj='$kcj',lx='$lx',cw='$cw',zsj='$zsj',zyj='$zyj',username='$username',uname='$uname',pcj='$pcj',sn='$sn',roomid='$roomid' where id='$id'");
}
function app_hd_list($num,$choice_roomid,$key,$tpl){
	global $db,$tablepre,$firstcount,$displaypg;
	$sql="select * from {$tablepre}apps_hd where roomid='$choice_roomid'";
	if($key!="")$sql.=" and uname like '%$key%'";
	
	$count=$db->num_rows($db->query($sql));
	pageft($count,$num,"");
	$sql.=" order by id desc";
	$sql.=" limit $firstcount,$displaypg";
	$query=$db->query($sql);
		while($row=$db->fetch_row($query)){
		$t=$tpl;
		
		if(strpos($row[lx],'买')&&$row['pcj']!=""){
			$t=str_replace('{yld}',round($row['pcj']-$row['kcj'],2),$t);
		}
		else if(strpos($row[lx],'卖')&&$row['pcj']!=""){
			$t=str_replace('{yld}',round($row['kcj']-$row['pcj'],2),$t);
		}else{
			$t=str_replace('{yld}','',$t);
		}
		foreach($row as $k=>$value){
			$t=str_replace('{'.$k.'}',$value,$t);	
		}
		$str.=$t;
		
	}
	return $str;

}

function app_wt_edit($id,$q,$a,$quser,$auser,$zt){
	global $db,$tablepre;
	$db->query("update {$tablepre}apps_wt set q='$q',a='$a',quser='$quser',auser='$auser',zt='$zt'  where id='$id'");
}
function app_wt_add($q,$a,$quser,$auser,$zt){
	global $db,$tablepre;
	$qtime=gdate();
	$db->query("insert into {$tablepre}apps_wt(q,a,quser,auser,qtime,zt)values('$q','$a','$quser','$auser','$qtime','$zt')");
}
function wt_del($ids){
	global $db,$tablepre;
	if($ids=="")return;
	$db->query("delete from {$tablepre}apps_wt where id in ($ids)");
}
function app_wt_list($num,$key,$tpl){
	global $db,$tablepre,$firstcount,$displaypg;
	$sql="select * from {$tablepre}apps_wt";
	if($key!="")$sql.=" where q like '%$key%' or a like '%$key%' or quser like '%$key%'";
	
	$count=$db->num_rows($db->query($sql));
	pageft($count,$num,"");
	$sql.=" order by id desc";
	$sql.=" limit $firstcount,$displaypg";
	$query=$db->query($sql);
	return for_each($query,$tpl);	

}


function app_jyts_edit($id,$title,$txt,$user){
	global $db,$tablepre;
	$db->query("update {$tablepre}apps_jyts set title='$title',txt='$txt',`user`='$user' where id='$id'");
}
function app_jyts_add($title,$txt,$user){
	global $db,$tablepre;
	$atime=gdate();
	$db->query("insert into {$tablepre}apps_jyts(title,txt,`user`,atime)values('$title','$txt','$user','$atime')");
}
function app_jpkj_edit($id,$title,$txt,$user,$roomid){
	global $db,$tablepre;
	$db->query("update {$tablepre}apps_jpkj set title='$title',txt='$txt',`user`='$user',roomid='$roomid' where id='$id'");
}
function app_jpkj_add($title,$txt,$user,$roomid){
	global $db,$tablepre;
	$atime=gdate();
	$db->query("insert into {$tablepre}apps_jpkj(title,txt,`user`,atime,roomid)values('$title','$txt','$user','$atime','$roomid')");
}
function jpkj_del($ids){
	global $db,$tablepre;
	if($ids=="")return;
	$db->query("delete from {$tablepre}apps_jpkj where id in ($ids)");
}
function jyts_del($ids){
	global $db,$tablepre;
	if($ids=="")return;
	$db->query("delete from {$tablepre}apps_jyts where id in ($ids)");
}
function app_jyts_list($num,$key,$tpl){
	global $db,$tablepre,$firstcount,$displaypg;
	$sql="select * from {$tablepre}apps_jyts";
	if($key!="")$sql.=" where title like '%$key%' or txt like '%$key%' or `user` like '%$key%'";
	
	$count=$db->num_rows($db->query($sql));
	pageft($count,$num,"");
	$sql.=" order by id desc";
	$sql.=" limit $firstcount,$displaypg";
	$query=$db->query($sql);
	return for_each($query,$tpl);	

}


function app_scpl_edit($id,$title,$txt,$user,$dj){
	global $db,$tablepre;
	$db->query("update {$tablepre}apps_scpl set title='$title',txt='$txt',`user`='$user',dj='$dj' where id='$id'");
}
function app_scpl_add($title,$txt,$user,$jd){
	global $db,$tablepre;
	$atime=gdate();
	$db->query("insert into {$tablepre}apps_scpl(title,txt,`user`,atime,dj)values('$title','$txt','$user','$atime','$dj')");
}
function scpl_del($ids){
	global $db,$tablepre;
	if($ids=="")return;
	$db->query("delete from {$tablepre}apps_scpl where id in ($ids)");
}
function app_scpl_list($num,$key,$tpl){
	global $db,$tablepre,$firstcount,$displaypg;
	$sql="select * from {$tablepre}apps_scpl";
	if($key!="")$sql.=" where title like '%$key%' or txt like '%$key%' or `user` like '%$key%'";
	
	$count=$db->num_rows($db->query($sql));
	pageft($count,$num,"");
	$sql.=" order by id desc";
	$sql.=" limit $firstcount,$displaypg";
	$query=$db->query($sql);
	return for_each($query,$tpl);	

}



function app_files_edit($id,$title,$url,$user){
	global $db,$tablepre;
	$db->query("update {$tablepre}apps_files set title='$title',url='$url',`user`='$user' where id='$id'");
}
function app_files_add($title,$url,$user){
	global $db,$tablepre;
	$atime=gdate();
	$db->query("insert into {$tablepre}apps_files(title,url,`user`,atime)values('$title','$url','$user','$atime')");
}
function files_del($ids){
	global $db,$tablepre;
	if($ids=="")return;
	$db->query("delete from {$tablepre}apps_files where id in ($ids)");
}
function app_files_list($num,$key,$tpl){
	global $db,$tablepre,$firstcount,$displaypg;
	$sql="select * from {$tablepre}apps_files";
	if($key!="")$sql.=" where title like '%$key%'   or `user` like '%$key%'";
	
	$count=$db->num_rows($db->query($sql));
	pageft($count,$num,"");
	$sql.=" order by id desc";
	$sql.=" limit $firstcount,$displaypg";
	$query=$db->query($sql);
	return for_each($query,$tpl);	

}
function column_add($title,$url,$target,$status,$ov){
 	global $db,$tablepre;

      $db->query("insert into {$tablepre}mobile_column(title,url,target,status,ov)values('$title','$url','$target','$status','$ov')");
   
}
function column_edit($id,$title,$url,$target,$status,$ov){
 	global $db,$tablepre;
	$db->query("update {$tablepre}mobile_column set title='$title',url='$url',target='$target',status='$status',ov='$ov' where id='$id'");
   
}
function column_del($ids){
	global $db,$tablepre;
	if($ids=="")return;
	$db->query("delete from {$tablepre}mobile_column where id in ($ids) and id not in(1,2)");
}


function app_manage_edit($id,$title,$url,$ico,$w,$h,$target,$position,$s,$ov){
	global $db,$tablepre;
	$db->query("update {$tablepre}apps_manage set title='$title',url='$url',ico='$ico',w='$w',h='$h',target='$target',position='$position',s='$s',ov='$ov' where id='$id'");
}
function app_manage_add($title,$url,$ico,$w,$h,$target,$position,$s,$ov){
	global $db,$tablepre;
	$atime=gdate();
	$db->query("insert into {$tablepre}apps_manage(title,url,ico,w,h,target,position,s,ov)values('$title','$url','$ico','$w','$h','$target','$position','$s','$ov')");
}
function manage_del($ids){
	global $db,$tablepre;
	if($ids=="")return;
	$db->query("delete from {$tablepre}apps_manage where id in ($ids) and id not in(1,2,3,4,5,6)");
}
function app_manage_list($num,$key,$tpl){
	global $db,$tablepre,$firstcount,$displaypg;
	$sql="select * from {$tablepre}apps_manage";
	if($key!="")$sql.=" where title like '%$key%'";
	
	$count=$db->num_rows($db->query($sql));
	pageft($count,$num,"");
	$sql.=" order by s,ov desc,id desc";
	$sql.=" limit $firstcount,$displaypg";
	$query=$db->query($sql);
	return for_each($query,$tpl);	

}
function get_user_group($ids){
       global $db,$tablepre;
    $connect=(isset($ids) && $ids!='all')?" where id not in $ids":'';
    $sql="select id,title from {$tablepre}auth_group".$connect." order by id desc";
    $query=$db->query($sql);
while($row=$db->fetch_row($query)){
	$group.='<option value="'.$row[id].'">'.$row[title].'</option>';
}
    return $group;
}

function app_course_edit($id,$weekid,$coursetime,$teacher,$paixu,$roomid){
	global $db,$tablepre;
        $weekarray=array("1" => "星期一", "2" => "星期二", "3" => "星期三","4" => "星期四", "5" => "星期五", "6" => "星期六", "7" => "星期日");
        $week=$weekarray[$weekid];
	$db->query("update {$tablepre}course set week='$week',weekid='$weekid',coursetime='$coursetime',teacher='$teacher',paixu='$paixu',rid='$roomid'  where id='$id'");
}
function app_course_add($weekid,$coursetime,$teacher,$paixu,$roomid){
	global $db,$tablepre;
	$weekarray=array("1" => "星期一", "2" => "星期二", "3" => "星期三","4" => "星期四", "5" => "星期五", "6" => "星期六", "7" => "星期日");
         $week=$weekarray[$weekid];
	$db->query("insert into {$tablepre}course(week,weekid,coursetime,teacher,paixu,rid)values('$week','$weekid','$coursetime','$teacher','$paixu','$roomid')");
}
function course_del($id){
	global $db,$tablepre;
	if($id=="")return;
	$db->query("delete from {$tablepre}course where id in ($id) ");
}
function video_del($id){
	global $db,$tablepre;
	if($id=="")return;
	$db->query("delete from {$tablepre}video where id in ($id) ");
}
function video_edit($id,$roomid,$videoname,$cover,$videodes,$livetype,$url){
	global $db,$tablepre;
     $column=$livetype=='1'?'localurl':'weburl';
	$db->query("update {$tablepre}video set roomid='$roomid',videoname='$videoname',cover='$cover',videodes='$videodes',$column='$url' where id='$id'");
}
     /**
     * 获取用户分组
     * @param int $groupid
     * @param string  $nogid
     * @return mixed
     */
function user_group_list($groupid,$notgid){
    global $db,$tablepre;
    if(!empty($notgid) || $notgid=='0'){$sql='where id not in ('.$notgid.')';}else{$sql='';}

  $query=$db->query("select * from {$tablepre}auth_group {$sql} order by id desc");
while($row=$db->fetch_row($query)){
    if($row['id']==$groupid){$selected='selected';}else{$selected='';}
	$user_group_list.='<option value="'.$row['id'].'"'.$selected.'>'.$row['title'].'</option>';
}
 return $user_group_list;   
}
    /**
     * 获取用户组名称
     * @param int $gid 用户组ID
     * @return mixed
     */
function getGroupName_byGid($gid){
    global $db,$tablepre;
 

$userinfo=$db->fetch_row($db->query("select title from {$tablepre}auth_group where id='$gid' "));

 return $userinfo['title'];   
}
function room_list_li($roomid){
    global $db,$tablepre,$login_roomid;
    if(!empty($login_roomid)){
        $query=$db->query("select * from {$tablepre}config where roomid='$login_roomid'");   
     
    }else{
    $query=$db->query("select * from {$tablepre}config");

    }
while($row=$db->fetch_row($query)){
    if($row['roomid']==$roomid){$selected='selected';}else{$selected='';}
	$room_list_li.='<option value="'.$row['roomid'].'"'.$selected.'>'.$row['title'].'</option>';
}
 return $room_list_li;   
}
function room_list_li_each($roomid){
    global $db,$tablepre,$login_roomid;
   if(!empty($login_roomid)){ 
     
        $query=$db->query("select * from {$tablepre}config where roomid='$login_roomid'");   
     
    }else{
    $query=$db->query("select * from {$tablepre}config");
$room_list_li='<option value="0">全部</option>';
    }
    
while($row=$db->fetch_row($query)){
    if($row['roomid']==$roomid){$selected='selected';}else{$selected='';}
	$room_list_li.='<option value="'.$row['roomid'].'"'.$selected.'>'.$row['title'].'</option>';
}
 return $room_list_li;   
}
function   video_add($roomid,$videoname,$cover,$videodes,$livetype,$localurl,$weburl){
	global $db,$tablepre,$onlineip;
        $addtime=gdate();
          $username=$_SESSION['admincp'];
    //if(!empty($localurl)){$localurl='<video autoplay="true" controls="controls" src="'.$localurl.'" style="width:100%;" id="nuoyunvideo"></video>';}
    $db->query("insert into {$tablepre}video(roomid,username,videoname,cover,videodes,livetype,localurl,weburl,vaddtime,vaddip)values('$roomid','$username','$videoname','$cover','$videodes','$livetype','$localurl','$weburl','$addtime','$onlineip')");
  
}
function kefu_edit($id,$qqtitle,$qqnum,$roomid){
	global $db,$tablepre;
	$db->query("update {$tablepre}room_kefu set qqtitle='$qqtitle',qqnum='$qqnum',roomid='$roomid' where id='$id'");
}
function   prize_add($giftname,$v,$giftimg,$getmethod){
	global $db,$tablepre;
        $createtime=gdate();
        $db->query("insert into {$tablepre}gift_goods(giftname,v,giftimg,getmethod,createtime)values('$giftname','$v','$giftimg','$getmethod','$createtime')");
  
}
function prize_del($id){
	global $db,$tablepre;
	$db->query("delete from {$tablepre}gift_goods where id='$id'");
}
function prize_edit($id,$giftname,$giftimg,$v){
	global $db,$tablepre;
	$db->query("update {$tablepre}gift_goods set giftname='$giftname',v='$v',giftimg='$giftimg' where id='$id'");
}
function banuser_del($uid){
	global $db,$tablepre;
	$db->query("update {$tablepre}members set banspeak=0  where uid='$uid'");
}
function banguest_del($uid){
	global $db,$tablepre;
	$db->query("update {$tablepre}guest set banspeak=0  where guestuid='$uid'");
}
function   plan_bind_add($domain,$url,$beizhu){
	global $db,$tablepre;
        $createtime=gdate();
        $db->query("insert into {$tablepre}domain_bind(domain,url,beizhu,createtime)values('$domain','$url','$beizhu','$createtime')");
  
}
function plan_bind_del($id){
	global $db,$tablepre;
	if($id=="")return;
	$db->query("delete from {$tablepre}domain_bind where id in ($id) ");
}
function plan_bind_edit($id,$domain,$url,$beizhu){
	global $db,$tablepre;
	$db->query("update {$tablepre}domain_bind set domain='$domain',url='$url',beizhu='$beizhu' where id='$id'");
}
function   ip_blacklist_add($ip,$beizhu){
	global $db,$tablepre;
        $createtime=gdate();
        $db->query("insert into {$tablepre}ip_blacklist(ip,beizhu,createtime)values('$ip','$beizhu','$createtime')");
  
}
function ip_blacklist_del($id){
	global $db,$tablepre;
	if($id=="")return;
	$db->query("delete from {$tablepre}ip_blacklist where id in ($id) ");
}
?>