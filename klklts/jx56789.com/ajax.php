<?php
require_once './include/common.inc.php';
if(!isset($_SESSION['login_uid']))exit("Access Denied");
$uid=(int)$uid;
$id=(int)$id;
switch($act)
{
		case "setdefvideosrc";
                    if(check_auth('def_videosrc')){
			$db->query("update {$tablepre}config set defvideo='$vid',defvideonick='$nick' where roomid='$rid'");
                    }
		break;
                case "setdefvideoover";
                    if(check_auth('def_videosrc')){
			$db->query("update {$tablepre}config set defvideo='',defvideonick='' where roomid='$rid'");
                    }
		break;
		//私聊聊天记录
		case "mymsgold":
                    if($_SESSION['login_uid']=='0'){
                      $uid=$_SESSION['login_guest_uid'];
                    }else{
			$uid=$_SESSION['login_uid'];
                         }
			$query=$db->query("select *  from {$tablepre}chatlog where (uid='$uid' and tuid='$tuid')or(uid='$tuid' and tuid='$uid') and type='4' order by id desc limit 0,50");
			while($row=$db->fetch_row($query)){
				$str1='
				<li class="layim_chate[me]"><div class="layim_chatuser"><span class="layim_chattime">[date]</span><span class="layim_chatname">[uname]</span><img src="/face/img.php?t=p1&u=[uid]"></div><div class="layim_chatsay"><font>[msg]</font><em class="layim_zero"></em></div></li>
				';
				$str2='
				<li class="layim_chate[me]"><div class="layim_chatuser"><img src="/face/img.php?t=p1&u=[uid]"><span class="layim_chatname">[uname]</span><span class="layim_chattime">[date]</span></div><div class="layim_chatsay"><font>[msg]</font><em class="layim_zero"></em></div></li>
				';
				if($row['uid']==$uid)
					$str=str_replace("[me]","me",$str1);
				else 
					$str=str_replace("[me]","he",$str2);
				$str=str_replace("[uid]",$row['uid'],$str);
				$str=str_replace("[uname]",$row['uname'],$str);
				$str=str_replace("[msg]",tohtml($row['msg']),$str);
				$str=str_replace("[date]",date("Y-m-d H:i:s",$row['mtime']),$str);
				$msgold=$str.$msgold;
			}
			$data['realname']=userinfo($tuid,'{realname}');
			$data['tuid']=$tuid;
			$data['msg']=$msgold;
			exit(json_encode($data));
		break;
		//屏蔽消息
		case "msgblock":
			$db->query("update {$tablepre}chatlog set state='$s' where msgid='$msgid'");
			exit();
		break;
            //自动广播
            case "getsysmsg":
              
			$query=$db->query("select * from  {$tablepre}sysmsg where roomid='$rid'");
                        $row=$db->fetch_row($query);
                      $row['content']=html_entity_decode($row['content']);
                        $arr = explode("\n",$row[content]);
                       $data['info']=$arr;
                       $data['state']=$row[state];
                       $data['fangshi']=$row[fangshi];
                       $data['jiange']=$row[jiange];
			exit(json_encode($data));
		break;
            //确定我的客服
                 case "remyfuser":
			$uid=$_SESSION['login_uid'];
			$tuser=userinfo($fuserid,'{username}');
                        if($uid!=0){
			$db->query("update {$tablepre}members set fuser='$tuser' where (fuser='' or fuser is null) and uid='$uid'");
                        }else{
                          $guestuid=  $_SESSION['login_guest_uid'];
                      $db->query("update {$tablepre}guest set fuser='$tuser' where (fuser='' or fuser is null)  and guestuid='$guestuid'");
                         
                        }
                        
                        break;
		//我的客服
		case "getmylist":
			//exit(print_r($_GET));
			$data['state']='false';
			$uid=$_SESSION['login_uid'];
                        if($uid!=0){
			$userinfo=$db->fetch_row($db->query("select m.*,ms.* from {$tablepre}members m,{$tablepre}memberfields ms  where m.uid=ms.uid and m.uid='{$uid}'")); 
                        }else{
                             $guestuid=  $_SESSION['login_guest_uid'];
                    $userinfo=$db->fetch_row($db->query("select * from {$tablepre}guest where  guestuid='$guestuid' ")); 
                   }
                        $i=0;
                        
			if($userinfo['gid']!='3'){
                       
				if($userinfo['fuser']=="")$userinfo['fuser']=$cfg['config']['defkf'];
                                if($userinfo['fuser']!=''){
			$query=$db->query("select m.*,ms.* from {$tablepre}members m left join {$tablepre}memberfields ms
							  on m.uid=ms.uid   where m.username ='$userinfo[fuser]'");
			while($row=$db->fetch_row($query)){
				$tmp['uid']=$row['uid'];
				$tmp['chatid']=$row['uid'];
				$tmp['nick']=$row['nickname'];
				$tmp['phone']=$row['phone'];
					$tmp['qq']=$row['realname'];
                               if(empty($row['touxiang'])){
                                   $tmp['touxiang']='/face/p1/null.jpg';
                                }else{
                                  $tmp['touxiang']=$row['touxiang']; 
                               }
				$tmp['color']=$row['gid'];
					$tmp['mood']=$row['mood'];
                                        $tmp['cam']=$row['face'];
				$data['row'][$i++]=$tmp;
					$data['state']='true';
			}
                                }
			}else{
			$query=$db->query("select m.*,ms.* from {$tablepre}members m left join {$tablepre}memberfields ms
							  on m.uid=ms.uid   where m.fuser='{$user}' and m.username!='{$user}' order by m.uid desc");
			while($row=$db->fetch_row($query)){
				$tmp['uid']=$row['uid'];
				$tmp['chatid']=$row['uid'];
				$tmp['nick']=$row['nickname'];
				$tmp['phone']=$row['phone'];
					$tmp['qq']=$row['realname'];
                                          if(empty($row['touxiang'])){
                                   $tmp['touxiang']='/face/p1/null.jpg';
                                }else{
                                  $tmp['touxiang']=$row['touxiang']; 
                               }
				$tmp['color']=$row['gid'];
                                 $tmp['cam']=$row['face'];
				$data['row'][$i++]=$tmp;
					$data['state']='true';
			}
			}
			
			exit(json_encode($data));
		break;
		case "getrlist":
		
		//机器人列表
		//$rid:房间ID $r:20|50 20-50随机数 机器人个数
		$r=explode("|",$r);
		$r_max=mt_rand($r[0],$r[1]);
              if($r_max<=0)exit("");
		$time=time();
		$query=$db->query("select * from {$tablepre}rebots where rid='$rid' and losttime>{$time}");
		if($db->num_rows($query)<=0){		
			$query=$db->query("select * from {$tablepre}rebots where id='1'");
			$row=$db->fetch_row($query);
			$rebots_arr=explode("\r\n",$row['rebots']);
			shuffle($rebots_arr);
			$roomListUserJsonStr=array("type"=>"UonlineUser","stat"=>"OK");
			$roomListUser=array();
			$roomUser=array("roomid"=>$_SERVER['HTTP_HOST'].".".$rid,"chatid"=>"","ip"=>"0.0.0.0","qx"=>"0","cam"=>"","vip"=>"0","age"=>"-","sex"=>"","mood"=>"","state"=>"0","nick"=>"","color"=>"1");		
			$count=count($rebots_arr);
		
			for($i=0;$i<$count;$i++){
				if(trim($rebots_arr[$i])=="")continue;
				$roomUser['chatid']='x_r'.$i;
				$roomUser['sex']=rand(0,2);
				$roomUser['cam']=0;
				$roomUser['nick']=$rebots_arr[$i];
				$roomListUser[$i]=$roomUser;
			
				if($i>=$r_max)break;
			}
			$roomListUserJsonStr['roomListUser']=$roomListUser;
			$data=base64_encode(json_encode($roomListUserJsonStr));
			//机器人列表20分钟一换
			$losttime=time()+20*60;
			$db->query("delete from {$tablepre}rebots where rid='$rid'");
			$db->query("insert into {$tablepre}rebots(rid,rebots,losttime)values('$rid','$data','$losttime')");
		}
		else{
			//获取有效列表
			$row=$db->fetch_row($query);
			$data=$row['rebots'];
		}
		
		exit(base64_decode($data));
	break;
        case "robotlist":
		
		//获取自定义机器人列表
                     if($r<=0)exit("");
                     $weeks=array("Monday" => "1", "Tuesday" => "2", "Wednesday" => "3", "Thursday" => "4", "Friday" => "5", "Saturday" => "6", "Sunday" => "7");
                     $week=$weeks[date('l')];
		$time=mktime(0,0,0,date('m'),date('d'),date('Y'));
                 $time=time()-$time;
		$query=$db->query("select r.*,g.ov from {$tablepre}rebot_custom r,{$tablepre}auth_group g where r.gid=g.id and r.roomid='{$rid}'   and r.week like '%{$week}%'  and  ((r.shangxian<=r.xiaxian and  r.shangxian<={$time} and r.xiaxian>={$time}) or ( r.shangxian>r.xiaxian and ((r.shangxian<={$time} and r.xiaxian<={$time}) or (r.shangxian>={$time} and r.xiaxian>={$time})  ))) order by r.id DESC,g.ov DESC,r.shangxian desc");

                 if($db->num_rows($query)>0){	
                     $roomListUserJsonStr=array("type"=>"UonlineUser","stat"=>"OK");
			$roomListUser=array();
			$roomUser=array("roomid"=>$_SERVER['HTTP_HOST'].".".$rid,"chatid"=>"","ip"=>"0.0.0.0","qx"=>"0","cam"=>"","vip"=>"0","age"=>"-","sex"=>"","mood"=>"","state"=>"0");		
		$i=0;
                      while($row=$db->fetch_row($query)){
                          $i++;
                          $roomUser['chatid']='x_r'.$row['id'];
				$roomUser['sex']=$row['sex'];
				$roomUser['cam']=0;
                                $roomUser['touxiang']='/face/p1/null.jpg';
				$roomUser['nick']=$row['rebotname'];
                                $roomUser['color']=$row['gid'];
				$roomListUser[]=$roomUser;
                                if($i>=$r)break;
                      }

			$roomListUserJsonStr['roomListUser']=$roomListUser;
			$data=base64_encode(json_encode($roomListUserJsonStr));
	       	}
		else{
			exit("");
		}
		
		exit(base64_decode($data));
	break;
	case "putmsg":
            if(isset($_SESSION['login_uid'])){ 
                //获取post提交的消息
                $msg=$request->post('msg');
                $privacy=$request->post('privacy');
                //判断是否为空
                if(empty($msg)){return;} 
                //判断消息里面是否含有屏蔽关键词
               // if(preg_match("/{$global['config']['msgban']}/is", $msg) && $privacy!='true' &&  !$_SESSION['room_admin']){exit('-1');}
                  $msg=preg_replace("/<(\/?meta.*?)>/si","",$msg); //过滤meta标签 
                  //判断上次消息是否一样
                 if( isset($_SESSION['last_msg_content']) && $msg==$_SESSION['last_msg_content'] && !$_SESSION['room_admin']){
                    exit('-1');    
                   
                  }
                   //判断上次消息发言间隔
                 if( isset($_SESSION['last_msg_time']) && time()-$_SESSION['last_msg_time']<1 && !$_SESSION['room_admin']){
                    exit('-1');    
                   
                  }
                 $type=$state=0;
		if($cfg['config']['msgaudit']=='1'){
			$state=1;	
		}
		if($msgtip=="2"){
                    if(!check_auth('room_admin')){  return;}
                       $type='2';
                  }
		if($msgtip=="3"){
                    if(!check_auth('room_admin')){  return;}
                       $type='3';
                  }
                  //判断是否为私聊
                 $type=($privacy=='true')?4:$type;
                 //判断是否为机器人发言
                $pos = strpos($muid,'x_r');
                if ($pos === false) {$ugid=$_SESSION[login_gid];} else {$ugid=$privacy;$privacy='false';}

	$sql="insert into {$tablepre}chatlog(rid,uid,tuid,uname,tname,p,style,msg,mtime,ugid,msgid,ip,state,type,device)
				  values('$rid','$muid','$tid','$uname','$tname','$privacy','$style','$msg',".gdate().",'$ugid','$msgid','$onlineip','$state','$type','$deviceType')";
	  	$db->query($sql);
                $_SESSION['last_msg_content']=$msg;
                $_SESSION['last_msg_time']=time();
                if($tanmu=='true'){
                  $uid=$_SESSION['login_uid'];  
                  $db->query("update {$tablepre}members set redbags=redbags-1 where uid='$uid'");   
                }
            }
	break;
	case "regcheck":
                        $result=array(); 
			$guestexp = '^Guest|'.$global['config']['regban'];
                      
			if(preg_match("/\s+|{$guestexp}/is", $username)){
                        $result['code']=-1;
                        
                        }else{
			if($db->num_rows($db->query("select * from {$tablepre}members where username='$username' "))>0){
                        
                            $result['code']=0;
                            
                        }else{
                      
                             $result['code']=1;
                       
                        }
                        
                        }
                         exit(json_encode($result));
	break;
	case "setvideo":
		$uid=$_SESSION['login_uid'];
		if(check_auth('room_admin')){
		$db->query("update {$tablepre}config set defvideo='{$vid}' where id='{$def_cfg}'");
		}
	break;
	case "userstate":
		if(isset($_SESSION['login_uid']))
		{
			$userstate['state']="login";
			$id=$_SESSION['login_uid'];
			$query=$db->query("select m.uid,m.sex,m.onlinetime,m.gold,ms.nickname,ms.mood,ms.city,ms.bday
						  from {$tablepre}members m,{$tablepre}memberfields ms
						  where m.uid=ms.uid and m.uid='{$id}'
						  ");
  			$row=$db->fetch_row($query);
			$userinfo['id']	 =$row['uid'];
			$userinfo['nick']=$row['nickname'];
			$userinfo['sn']=$row['mood'];
			$userinfo['rank']=showstars($row['onlinetime']);
			$userinfo['gold']=$goldname.':'.$row['gold'];
			$userstate['info']=$userinfo;
			
		}
		else
		{
			$userstate['state']="logout";
		}
		$data=json_encode($userstate);
		exit($data);
	break;
	case "userinfo":
		$query=$db->query("select m.*,ms.*
						  from {$tablepre}members m,{$tablepre}memberfields ms
						  where m.uid=ms.uid and m.uid='{$id}'
						  ");
  		$row=$db->fetch_row($query);
		$row['password']='';
		$data=json_encode($row);
		exit($data);
	break;
	
	

	
	case "kick":
            
           if(!isset($_SESSION['login_uid'])){exit('false');}
           $aid=$_SESSION['login_uid'];
		if(check_user_auth($aid,'user_kick')){
			$losttime=$ktime*60+gdate();
                        $author=$_SESSION['login_user'];
                        $u=userinfo($tuid,'{username}');
                        $addtime=gdate();
			$db->query("insert into {$tablepre}ban(username,ip,losttime,sn,addtime,author,roomid)values('$u','$ip','$losttime','$cause','$addtime','$author','$rid')");
			$state['state']='yes';
			$data=json_encode($state);
			exit($data);
		}
		
	break;
	case "online":
		if(!isset($_SESSION['login_uid'])){
		$state['state']='logout';
                }else
		{
			if($_SESSION['login_uid']==0){$state['state']='ok';$data=json_encode($state);exit($data);}
			if(!empty($rst)){
				$time=gdate();
				$u_id=$_SESSION['login_uid'];
				$query_row=$db->fetch_row($db->query("select lastactivity from {$tablepre}members where uid='$u_id'"));
				$_time=(int)($time-$query_row['lastactivity']);
				
				$db->query("update {$tablepre}members set lastactivity='$time',onlinetime=onlinetime+$_time where uid='$u_id'");
				$state['state']='ok';
				
			}
			else
			{
				//reonline();
				$state['state']='ok';
			}
			
		}
		$data=json_encode($state);
		exit($data);
		
	break;
        case "kefuonline":
            
            if($_SESSION['login_gid']=='3'){
                $time=gdate();
                $u_id=$_SESSION['login_uid'];
               $username= $_SESSION['login_user'];
                $db->query("replace into {$tablepre}kefuonlines(uid,username,rid,lastactivity,ip,rst)values('$u_id','$username','$rid','$time','$onlineip','$rst')");
              $db->query("delete from {$tablepre}kefuonlines where lastactivity<$time-300");  
            }
		
	break;
        //获取分析师
         case "getAnalysts":
            
           if(isset($_SESSION['login_uid'])){
         $sql="select m.uid,m.username,ms.nickname  from {$tablepre}members m,{$tablepre}memberfields ms  where m.uid=ms.uid and m.uid!=0 and (m.roomid='$rid' or m.roomid='') and m.gid=4";
         $query=$db->query($sql);
         $analystslist=array();
         while($row=$db->fetch_row($query)){
                 $analystslist[]=$row;
                    }
                    exit(json_encode($analystslist));
            }
		
	break;
        //取消在线获取积分20171231
		//QQ2397577130
		/*
         case "addredbag":
            
           if(isset($_SESSION['login_uid']) && $_SESSION['login_uid']!='0' ){
               $u_id=$_SESSION['login_uid'];
       $db->query("update {$tablepre}members set redbags=redbags+5,onlinetime=onlinetime+600 where uid='$u_id'");
       exit('1');
            }
		
	break;
        */
           //发红包
         case "SendRedBagNew":
            $result=array();
           if(isset($_SESSION['login_uid']) && $_SESSION['login_uid']!='0' ){
            
                $u_id=$_SESSION['login_uid'];
                $query=$db->query("select redbags from {$tablepre}members where uid='$u_id'");
  		$row=$db->fetch_row($query);
                if($row['redbags']>=$credit){
                       $time=gdate();
               $u_nickname=userinfo($u_id,'{nickname}');
               $js_nickname=userinfo($jid,'{nickname}');
          $db->query("update {$tablepre}members set redbags=redbags-$credit where uid='$u_id'");
          $db->query("insert into {$tablepre}redbag(rid,uid,juid,giftname,credit,sendtime)values('$rid','$u_id','$jid','$giftname','$credit','$time')");
         $redbagcount=$db->num_rows($db->query("select id from {$tablepre}redbag where rid='$rid'"));
          $db->query("update {$tablepre}config set redbags='$redbagcount' where roomid='$rid'");
          $result['state']='ok';
          $result['num']=$redbagcount;
          $result['msg']=$u_nickname.'送给'.$js_nickname.'老师'.$giftname;
                }else{
                    $result['state']='no';
                }
                echo json_encode($result);
                exit;
            }
		
	break;
        
        
        //全体禁言
        case "ban_speak":
             if(check_auth('room_admin')){
                $db->query("update {$tablepre}config set banspeak='$ban_speak_status'  where roomid='$rid'"); 
             }
             
            break;
            
            //禁言某个用户
        case "ban_speak_user":
            
             if(isset($_SESSION['login_uid'])){ 
                  $pos=strpos($userid, 'x');
                
           if($pos!==false){
              $db->query("update {$tablepre}guest set banspeak='$ban_speak_status'  where guestuid='$userid'"); 
              $_SESSION['guest_banspeak']=$ban_speak_status;
             }else{ 
              
            $db->query("update {$tablepre}members set banspeak='$ban_speak_status'  where uid='$userid'"); 
             }
           $result['state']='success';
           exit(json_encode($result));
             }
             
            break;
            
               //获取用户信息
         case "getUser":
           
           if(isset($_SESSION['login_uid'])){ 
               $row=array();
           $pos=strpos($userid, 'x');
          
           $pos2=strpos($userid, 'x_r');
           if($pos!==false){
               if($pos2!==false){ 
                  $userid2=substr($userid,3);
                 $sql="select rebotname,gid,sex from {$tablepre}rebot_custom  where id='$userid2'";  
                
          $row=$db->fetch_row($db->query($sql)); 
         $row['chatid']=$row['$userid'];
          $row['nick']=$row['rebotname'];
          $row['color']=$row['gid'];
             $row['touxiang']='/face/p1/null.jpg';        
               }else{ 
                $row['nick'] ='游客'.substr($userid,1);
                $row['sex']='2';
                 $row['chatid']=$userid;
                  $row['color']='0';
                   $row['touxiang']='/face/p1/null.jpg'; 
                  }
               
           }else{
         $sql="select m.uid,ms.nickname,m.sex,m.gid,m.touxiang  from {$tablepre}members m,{$tablepre}memberfields ms  where m.uid=ms.uid and m.uid='$userid'";
         $query=$db->query($sql);
          $row=$db->fetch_row($query); 
         $row['chatid']=$row['uid'];
          $row['nick']=$row['nickname'];
          $row['color']=$row['gid'];
          $row['touxiang']=empty($row['touxiang'])?'/face/p1/null.jpg':$row['touxiang'];
         }
         
          
                    exit(json_encode($row));
            }
		
	break;
            //时长排行榜
        case "DurationRank":
                if(isset($_SESSION['login_uid'])){ 
                   $sql="select m.uid,m.username,m.onlinetime,ms.nickname  from {$tablepre}members m,{$tablepre}memberfields ms  where m.uid=ms.uid order by m.onlinetime desc limit 0,15";
         $query=$db->query($sql);
         $analystslist=array();
         while($row=$db->fetch_row($query)){ 
             $row['onlinetime']= onlinetime($row['onlinetime']);
                 $analystslist[]=$row;
                    }
                    exit(json_encode($analystslist));    
                    
                    
                }
             
            break;
                           //贡献排行榜
        case "DevoteRank":
                if(isset($_SESSION['login_uid'])){  
                    switch ($type) {
                case 'week':
                    $begintime=mktime(0,0,0,date('m'),date('d')-date('w')+1,date('Y'));
                    $pianduan="and r.sendtime>$begintime";
                    break;
                case 'mon':
                   $begintime=mktime(0,0,0,date('m'),1,date('Y'));
                    $pianduan="and r.sendtime>$begintime";
                    break;
                case 'all':
                 
                    $pianduan='';
                    break;
                default:
                    $pianduan='';
            }
            $sql="select m.nickname,m.uid,sum(r.credit) as num   from {$tablepre}redbag r,{$tablepre}memberfields m  where r.uid=m.uid and r.rid='$roomid' {$pianduan} GROUP BY r.uid  ORDER BY num desc limit 0,15";
         $query=$db->query($sql);
         $analystslist=array();
         while($row=$db->fetch_row($query)){
          
                 $analystslist[]=$row;
}
                    exit(json_encode($analystslist));    

                    
                }
             
            break;
                  //分享榜
        case "ShareRank":
                if(isset($_SESSION['login_uid'])){ 
                     $sql="select tuser,count(*) as num  from {$tablepre}members   where tuser!='system'  and tuser!='' group by  tuser  ORDER BY num desc limit 0,15";
         $query=$db->query($sql);
         $analystslist=array();
         while($row=$db->fetch_row($query)){ 
             $tuser=$row['tuser'];
       $userinfo=$db->fetch_row($db->query("select m.uid,ms.nickname   from {$tablepre}members m,{$tablepre}memberfields ms  where m.uid=ms.uid and m.username='$tuser'"));
            $row['uid']=  $userinfo['uid'];
             $row['nickname']=  $userinfo['nickname'];
                 $analystslist[]=$row;
                    }
                    exit(json_encode($analystslist));    
                    
                    
                }
             
            break;
              //获取视频列表
         case "getVideolist":
            
           if(isset($_SESSION['login_uid'])){
         $sql="select id,videoname,cover,livetype,localurl,weburl from {$tablepre}video  where roomid='$rid' order by id desc";
         $query=$db->query($sql);
         $videolist=array();
         while($row=$db->fetch_row($query)){ 
     
         $row['videourl']=$row['livetype']=='1'?$row['localurl']:$row['weburl'];
              $row['videourl']=html_entity_decode($row['videourl']);
              unset($row['localurl']);
                unset($row['weburl']);
                 $videolist[]=$row;
}

                    
                    exit(json_encode($videolist));
            }
		
	break;
                 //获取直播视频
         case "getVideolive":
            
           if(isset($_SESSION['login_uid'])){ 
            
     // $videolive=($cfg['config']['livetype']==1)?$cfg['config']['yyfp']:$cfg['config']['livefp'];
           $videolive=$cfg['config']['yyfp'];    
                    exit(html_entity_decode($videolive));
            }
		
	break;
                     //生成抽奖码
         case "getLuckCode":
            
           if(isset($_SESSION['login_uid'])){ 
            
            $LuckCode=str_rand(5);
            $time=time();
             $db->query("insert into {$tablepre}luckcode(luckcode,getmethod,createtime)values('$LuckCode','$getmethod','$time')"); 
           $result['luckcode']=$LuckCode;
           exit(json_encode($result));
            }
		
	break;
                    //批量生成抽奖码
         case "createLuckCode":
            
           if(isset($_SESSION['login_uid'])){
          $num=empty($num)?1:$num;
             $time=time(); 
           
            for ($i = 1; $i <= $num; $i++) {
              $LuckCode=str_rand(5);
              $db->query("insert into {$tablepre}luckcode(luckcode,getmethod,createtime)values('$LuckCode','$getmethod','$time')"); 
              $luckcodelist.=$LuckCode."\n";
            }

           
           $result=$luckcodelist;
           exit($result);
            }
		
	break;
                       //今天是否签到
        case "isSign":
                if(isset($_SESSION['login_uid']) && $_SESSION['login_uid']!='0'){ 
                    $uid=$_SESSION['login_uid'];
          $sql="select * from {$tablepre}sign where userid='$uid' and FROM_UNIXTIME(last_sign_time,'%Y%m%d')=date_sub(curdate(),interval 0 day)";
         $query=$db->query($sql);
            
          if($db->num_rows($query)>0){
              $state='true';
          }else{
             $state='false'; 
          }
             exit($state);       
            
            }
		
	break;
                            //签到
        case "SignIn":
                if(isset($_SESSION['login_uid']) && $_SESSION['login_uid']!='0'){ 
                    $uid=$_SESSION['login_uid'];
             $time=time(); 
                    $result=array();
                //判断是今天签到过
          $sql="select * from {$tablepre}sign where userid='$uid' and FROM_UNIXTIME(last_sign_time,'%Y%m%d')=date_sub(curdate(),interval 0 day)";
         $query=$db->query($sql);
            
          if($db->num_rows($query)>0){
                 $result['credit']='';
              $result['persist']=''; 
              $result['state']='false';    
              exit(json_encode($result));
          }
                    //判断签到表中是否有该用户
                    $query=$db->query("select last_sign_time,lx_sign from {$tablepre}sign where userid='$uid' ");
                    $row=$db->fetch_row($query);
                     if($db->num_rows($query)>0){ 
                         //如果存在就更新
                      
                      $yes_begintime=mktime(0,0,0,date('m'),date('d')-1,date('Y'));//昨天开始时间
                   
                        if(($row['last_sign_time']-$yes_begintime)>0){
                           $persist=$row['lx_sign']+1;
                   $db->query("update {$tablepre}sign set last_sign_time=$time,lx_sign=0 where userid='$uid'"); 
                            
                        }else{
                            //如果签到间隔大于一天
                          $persist=1;
                        $db->query("update {$tablepre}sign set last_sign_time=$time,lx_sign=0 where userid='$uid'");
                        }
                
             }else{ 
              //如果没有插入
              $persist=1;
              $db->query("insert into {$tablepre}sign(userid,last_sign_time,lx_sign,roomid)values('$uid','$time',0,'$rid')");
            }
         //插入签到信息
          $db->query("insert into {$tablepre}sign_info(userid,addtime,roomid)values('$uid','$time','$rid')");
          //更新积分
          $credit=$persist*$sign_index_credit;
         $db->query("update {$tablepre}members set redbags=redbags+$credit where uid='$uid'");
               $result['credit']=$credit;
              $result['persist']=$persist; //连续签到次数
              $result['state']='true';    
              exit(json_encode($result));
                }
		
	break;
    //修改用户信息
    case "editUserInfo":
            
           if(isset($_SESSION['login_uid']) && $_SESSION['login_uid']!='0' ){
            $uid = $_SESSION['login_uid'];

            $db->query("update {$tablepre}memberfields set nickname='$nickname' where uid='$uid'");
            $db->query("update {$tablepre}members set  touxiang='$touxiang' where uid='$uid'");
            $result['state'] = '1';
        }else{ $result['state']='0';}
		echo json_encode($result);
        exit;
	break;
        case "check_auth":
            
           if (!isset($_SESSION['login_uid'])) {
            exit('false');
        }
        if (check_auth($app)) {
            $state['state'] = 'yes';
        } else {
            $state['state'] = 'no';
        }
        $data = json_encode($state);
        exit($data);

        break;
        //获取socket token
         case "createtoken":
            
           if(isset($_SESSION['login_uid'])){ 
            $uid=$_SESSION['login_uid']!='0'?$_SESSION['login_uid']:$_SESSION['login_guest_uid'];
            $nickname=$_SESSION['login_nick'];
            $sign = md5($socket_key . $onlineip.$uid);  
            $result['token']=$sign;
           exit(json_encode($result));
            }
		
	break;
                  //获取手机端栏目
         case "mobileColumn":
            
      
         $sql="select * from {$tablepre}mobile_column  where status='1' order by ov desc";
         $query=$db->query($sql);
         $columnlist=array();
         while($row=$db->fetch_row($query)){ 
             if($row['id']==1){
              $domain=$_SERVER['SERVER_NAME'];
          $domain_bind=$db->fetch_row($db->query("select *  from {$tablepre}domain_bind where domain='{$domain}'")); 
          $row['url']= empty($domain_bind)?$row['url']:$domain_bind['url'];    
                 
             }
            $columnlist[]=$row;
           }
        exit(json_encode($columnlist));
          
		
	break;
         //获取消息历史记录
         case "message":
            //获取post提交的消息
                $Index= intval($request->post('Index'));
                $PageSize=intval($request->post('PageSize')); 
                $result['success']=false;
       if($Index<=1){$firstcount=0;}else{
           $firstcount=($Index-1)*$PageSize;
           
       }
	      
      $query=$db->query("select c.*,m.touxiang from {$tablepre}chatlog c,{$tablepre}members m where c.uid=m.uid  and c.rid='".$rid."' and c.p='false' and c.state!='1' and c.type='0' order by c.mtime desc,c.id desc limit $firstcount,$PageSize ");

while($row=$db->fetch_row($query)){
     if(empty($row['touxiang'])){$row['touxiang']='/face/p1/null.jpg';}
	$row['msg']=html_entity_decode($row['msg']);
	$row['msg']=strip_tags($row['msg'],'<div><p><img><span><br>');
        $who=" notmine ";
        if($row['ugid']==2){$who=" manage";}else if($row['ugid']==3 || $row['ugid']==4){$who=" teacher";}
        if($row['tuid']=="Sendredbag"){$who=" redbag";}
        if($row['style']=="appsend"){$who=" appsend";}
	if($row['tuid']!="ALL" && $row['tuid']!="Sendredbag" ){ 
            if($row['tuid']=="hongbao"){
                $omsg=$row['msg'].$omsg;
                
            }else{
		$omsg="<div style='clear:both;'></div><div class='msg{$who}'  id='{$row[msgid]}'><div class='msg_head'><img src='".$row['touxiang']."' class='msg_group_ico' ></div><div class='msg_content'><div><font class='u'  onclick='ToUser.set(\"{$row[uid]}\",\"{$row[uname]}\")'>{$row[uname]}</font> &nbsp;&nbsp;  <font class='dui'>对</font> <font class='u' onclick='ToUser.set(\"{$row[tuid]}\",\"{$row[tname]}\")'>{$row[tname]}</font> 说 <font class='date'>".date('Y-m-d H:i:s',$row[mtime])."</font></div><div class='layim_chatsay'><font>{$row[msg]}</font></div></div></div><div style='clear:both;'></div>".$omsg;
            }
	}
	else{
  	$first="<div style='clear:both;'></div><div class='msg{$who}' id='{$row[msgid]}'><div class='msg_head'><img src='".$row['touxiang']."' class='msg_group_ico' ></div><div class='msg_content'><div><font class='u'  onclick='ToUser.set(\"{$row[uid]}\",\"{$row[uname]}\")'>{$row[uname]}</font>&nbsp;&nbsp; <font class='date'>".date('Y-m-d H:i:s',$row[mtime])."</font>";

    $deviceType = $row[device];
    $middle = '';
    if ($deviceType != null && $deviceType != '' && $deviceType != 'computer') {
      $transDeviceType = '安卓手机';
      if ($deviceType == 'ios') {
        $transDeviceType = '苹果手机';
      }
      $middle = '<img src="/images/ny_'.$deviceType.'_icon.png" title="'. $transDeviceType.'">';
    }
    $omsg = $first.$middle."</div><div class='layim_chatsay'><font>{$row[msg]}</font></div></div></div><div style='clear:both;'></div>".$omsg;
    }
     $result['success']=true;
}
                $result['content']=$omsg;
                $result['Index']=$Index+1;
        exit(json_encode($result));
          
		
	break;
}

?>
