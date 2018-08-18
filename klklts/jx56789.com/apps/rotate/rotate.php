<?php
require_once '../../include/common.inc.php';
switch ($act) {
    case "ismobile";


        if (isset($_SESSION['login_uid'])  && $_SESSION['login_uid']!='0' ) {
            $time = gdate();
            $rands = mt_rand(1, 100);
           $uid=$_SESSION['login_uid'];
           
             switch($rands){
			case ($rands>=30 && $rands<45):
				$jiangpin_id=1;
				break;
			case $rands<30:
				$jiangpin_id=2;
				break;
			case ($rands>=45 && $rands<50):
				$jiangpin_id=3;
				break;
			case ($rands>=50 && $rands<60):
				$jiangpin_id=1;
				break;
			case ($rands>=60 && $rands<63):
				$jiangpin_id=5;
				break;
			case ($rands>=63 && $rands<70):
				$jiangpin_id=6;
				break;
			case ($rands>=70 && $rands<75):
				$jiangpin_id=7;
				break;
			case ($rands>=75 && $rands<80):
				$jiangpin_id=8;
				break;
			case ($rands>=80 && $rands<82):
				$jiangpin_id=9;
				break;
			case ($rands>=82 && $rands<90):
				$jiangpin_id=10;
				break;
			case $rands==91:
				$jiangpin_id=11;
				break;
			case ($rands>=92 && $rands<95):
				$jiangpin_id=6;
				break;
                        case $rands==96:
				$jiangpin_id=10;
				break;
			default:
				$jiangpin_id=14;
				break;
		}
                
            $jiangpin='';
            switch($jiangpin_id){
			case 1:
				$jiangpin='抽中了话费10元';
				break;
			case 2:
				$jiangpin='';
				break;
			case 3:
				$jiangpin='抽中了赠金200';
				break;
			case 4:
				$jiangpin='抽中了赠金5000';
				break;
			case 5:
				$jiangpin='抽中了话费20元';
				break;
			case 6:
				$jiangpin='';
				break;
			case 7:
				$jiangpin='抽中了赠金500';
				break;
			case 8:
				$jiangpin='';
				break;
			case 9:
				$jiangpin='抽中了话费5元';
				break;
			case 10:
				$jiangpin='';
				break;
			case 11:
				$jiangpin='抽中了赠金1000';
				break;
			case 12:
				$jiangpin='抽中了iPhone7';
				break;
                        case 13:
				$jiangpin='抽中了iPad平板';
				break;
			case 14:
				$jiangpin='';
				break;
		}
                $db->query("update {$tablepre}luckcode set isuse=1,userid='$uid' where luckcode='$luckcode'");
            $db->query("insert into {$tablepre}rotate(jiangpin,addtime,ip,uid,getmethod,roomid)values('$jiangpin','$time','$onlineip','$uid',1,'$rid')");
           
            echo intval($jiangpin_id);
        } else {
            echo 'noMobile';
        }
        break;

    case "addmobile":
                        
        $query = $db->query("select isuse from {$tablepre}luckcode where luckcode='{$luckcode}' and getmethod=1  limit 1");
        if ($db->num_rows($query)) { 
            $info=$db->fetch_row($query);
         
            if($info['isuse']=='0'){
              exit('success');  
            }else{
              exit('isuse');  
            }
            
        } else {

            exit('nohave');
        }

        break;
}
?>