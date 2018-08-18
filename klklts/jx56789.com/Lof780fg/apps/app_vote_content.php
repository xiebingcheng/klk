<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
if(stripos(auth_group($_SESSION['login_gid']),'apps_vote')===false)exit("没有权限！");
$vote=$db->fetch_row($db->query("select title from {$tablepre}vote  where id=$vid ")); 
$sum=0;
$query=$db->query("select * from {$tablepre}vote_content  where vid={$vid} order by id ");
while($row=$db->fetch_row($query)){ 
    $voteinfo=$db->fetch_row($db->query("select count(*) sum from {$tablepre}vote_info  where vote_conid={$row['id']} "));
	if($om!=date('Ym',gdate()))$vote_none=" style='display:none'";
	$list.="
		<li id='t{$row[id]}'></a>
		<p class='v_name'><i class='percent'></i>{$row['content']}</p>
		<p class='percent_container'><span class='percent_line'></span></p>
		<p class='v_text' ><span>投票数：<i class='count'>{$voteinfo[sum]}</i></span></p></li>
	";
	$vote_none="";
	$sum=$sum+$voteinfo['sum'];
}

?>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<script type="text/javascript" src="../assets/js/jquery-1.8.1.min.js"></script> 

<style>
*{margin:0;padding:0;}
html{height:100%; }
body{background:#fff;font-family:microsoft yahei,Helvetica,arial,sans-serif;font-size:14px;color:#888;}
.grap{width:673px;margin:0 auto;}
.grap .h1{text-align:center;color: #09C;  font-size: 27px;margin-top: 10px;}
li i{font-style:normal;}
.grap .h1 i{font-size:14px;font-style:normal;font-weight:normal;margin-left:10px;color:#E8C2C6;}
.vote{clear:both;    padding: 0 25px 25px 25px;}
.vote li{height:88px; padding-top:15px;border-bottom:1px solid #ddd;list-style-type:none;width: 622px;}
.vote li a{float:right;width:100px; height:100px;display:block;font-size:0px;overflow:hidden;text-indent:-50px;}
.vote li p{float:left;width:620px;    border-radius: 2px;}
.v_name{height:20px;line-height:20px;font-size:15px;color:#333;}
.v_name i{float:right;padding-right:10px;font-style:normal;color: #09C;}
.percent_container{height:28px;background:#eee;position:relative;margin-top:4px;}
.percent_line{position:absolute;left:0;top:0;height:28px;background:#09C;display:block;    border-radius: 2px;}
.w33{width:33%;}
.w20{width:20%;}
.w10{width:10%;}
.v_text{height:27px;line-height:27px;}
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