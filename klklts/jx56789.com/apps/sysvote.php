<?php
require_once '../include/common.inc.php';
require_once NUOYUN_ROOT.'./include/json.php';
$json=new JSON_obj;
$vuid=$_SESSION['login_uid'];
$m=date('Ym',gdate());
if(!isset($om))$om=$m;
if($act=="add"){
	if($vuid<1){
		$data["status"]=0;
		$data["msg"]="请先登录，再来投票吧";
		exit($json->encode($data));	
	} 
        //admin管理员可以无限制点赞
        if($vuid!=1){
	if($db->num_rows($db->query("select * from {$tablepre}vote_info where uid='$vuid' and vid='$vid'"))>0){
		$data["status"]=2;
		$data["msg"]="你已经投过票了！";
		exit($json->encode($data));	
	}
        }
	$db->query("insert into {$tablepre}vote_info(uid,vid,vote_conid,addtime)values('$vuid','$vid','$vote_conid',".gdate().")");
	$data["status"]=1;
	$data["msg"]="";
	exit($json->encode($data));	
}

$vote=$db->fetch_row($db->query("select * from {$tablepre}vote  where rid=$rid order by addtime desc limit 0,1")); 
if(!empty($vote)){
$query=$db->query("select * from {$tablepre}vote_content  where vid={$vote['id']} order by id ");
while($row=$db->fetch_row($query)){ 
    $voteinfo=$db->fetch_row($db->query("select count(*) sum from {$tablepre}vote_info  where vote_conid={$row['id']} "));
	if($om!=date('Ym',gdate()))$vote_none=" style='display:none'";
	$list.="
		<li id='t{$row[id]}'><a href='javascript:vote({$vote[id]},{$row[id]})' {$vote_none}></a>
		<p class='v_name'><i class='percent'></i>{$row['content']}</p>
		<p class='percent_container'><span class='percent_line'></span></p>
		<p class='v_text' ><span>投票数：<i class='count'>{$voteinfo[sum]}</i></span></p></li>
	";
	$vote_none="";
	$sum=$sum+$voteinfo['sum'];
}
}else{
    $list='<div style="text-align: center;font-size: 17px;color:#B20000;">暂无投票！</div>';
}
?>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no"/>
<meta name="keyword" content=""/>
<title><?=$vote['title']?></title>
<script type="text/javascript" src="../room/script/jquery.min.js"></script>

<style>
*{margin:0;padding:0;}
html{height:100%; }
body{background:#fff;font-family:microsoft yahei,Helvetica,arial,sans-serif;font-size:14px;color:#888;}
.grap{width:800px;margin:0 auto;}
.grap .h1{text-align:center;color:#ff0;font-size:32px;background:url(img/tbg.gif) center no-repeat;}
li i{font-style:normal;}
.grap .h1 i{font-size:14px;font-style:normal;font-weight:normal;margin-left:10px;color:#E8C2C6;}
.vote{clear:both;padding:25px;border:2px solid #B20000;border-radius:15px;}
.vote li{height:115px; padding-top:15px;border-bottom:1px solid #ddd;list-style-type:none;}
.vote li a{float:right;width:100px; height:100px;display:block;background:url(img/vote.gif) no-repeat;font-size:0px;overflow:hidden;text-indent:-50px;}
.vote li a:hover{background:url(img/voon2.png) no-repeat;}
.vote li a.voted{background:url(img/voted.gif) no-repeat;}
.vote li p{float:left;width:620px;    border-radius: 2px;}
.v_name{height:35px;line-height:35px;font-size:18px;color:#333;}
.v_name i{float:right;padding-right:10px;font-style:normal;color:#B20000;}
.percent_container{height:28px;background:#eee;position:relative;margin-top:8px;}
.percent_line{position:absolute;left:0;top:0;height:28px;background:#B20000;display:block;    border-radius: 2px;}
.w33{width:33%;}
.w20{width:20%;}
.w10{width:10%;}
.v_text{margin-top:8px;height:27px;line-height:27px;}
.v_text span{margin-right:25px;}
.malertbox{border:#ccc 1px solid\9;}
</style>

</head>

<script>
var sum = <?=$sum?>;
$(function(){

	calpercent();

	
});
function calpercent(){
		$('ul li').each(function(){
			var count = parseInt($(this).find('.count').text());
			var percent= sum ? Math.round(count/sum*10000)/100: 0;
			percent = percent+'%';
			$(this).find('.percent').html(percent);
			//$(this).find('.percent_line').css('width',percent);
                        $(this).find('.percent_line').animate({

			width:percent

		},1000);
		
		});
}
function vote(vid,vote_conid){ 
    var author=<?=$vuid?>;
		$.post('?act=add',{'vid':vid,'vote_conid':vote_conid},function(data){
			if( data.status == 1){
				var num = $('#t'+vote_conid).find('.count').text();
				num = parseInt(num);
				$('#t'+vote_conid).find('.count').text( num+1);
                                if(author!=1){
				$('#t'+vote_conid).find('a').addClass('voted').attr('href','javascript:void(0)');}

				num = $('#t'+vote_conid).find('.amount').text();
				num = parseInt(num);
				$('#t'+vote_conid).find('.amount').text( num+1);
				sum+=1;
				calpercent();
			}else if(data.status==2){
			
                                top.layer.msg("你已经投过票了",{icon: 5,shift: 6,time:1000});
			}else{
		
                        top.layer.msg(data.msg,{icon: 5,shift: 6,time:1000})
			}
		},'json');
}

</script>
<body>
<div class="grap">
<div class="h1"><?=$vote['title']?></div>
<div class="vote">
<ul id='vote'>


<?=$list?>

</ul>




</div>
</div>


</body>
</html>