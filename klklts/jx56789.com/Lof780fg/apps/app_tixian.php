<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
if(stripos(auth_group($_SESSION['login_gid']),'tixian_list')===false)exit("没有权限！");
function tixian_del($ids){
    global $db,$tablepre;
       if($ids=="")return;
	$db->query("delete from {$tablepre}money_tixian where id  in ($ids)");
}
$operation=0;

switch($act){
	case "tixian_del":
	   if(is_array($id)){
                  tixian_del(implode(',',$id));  
                }
		else{
                    
                   tixian_del($id); 
                }
		header("location:?");
	break;
        case "paijiang":
	   global $db,$tablepre;
            $db->query("update {$tablepre}rotate set status=1 where id='$jid'");
            exit('1');
	break;
    case "tixian":
       if(stripos(auth_group($_SESSION['login_gid']),'tixian_handle')===false)exit("没有权限！"); 
       $db->query("update {$tablepre}money_tixian set status=1,beizhu='$beizhu' where id='$id'");
          $caozuoren=$_SESSION['admincp'];
          $beizhu='交易流水号：'.$beizhu;
          $time=time();
      $db->query("insert into {$tablepre}moneyrun_info(username,uid,moneyrun,beizhu,addtime,addip,caozuoren,type)values('$username','$uid','$getmoney','$beizhu','$time','$onlineip','$caozuoren',-1)");
         $operation=1;
      
        break;
         case "bohui":
            
       if(stripos(auth_group($_SESSION['login_gid']),'tixian_handle')===false)exit("没有权限！"); 
       $db->query("update {$tablepre}money_tixian set status=2,beizhu='$beizhu' where id='$id'");
          $caozuoren=$_SESSION['admincp'];
           $db->query("update {$tablepre}memberfields set moneyred=moneyred+$getmoney where uid='$uid'");
        $operation=1;
      
        break;
}

if(!isset($choice_roomid)){
       if(empty($login_roomid)){
 $choice_roomid=0;

    }else{
     $choice_roomid=$login_roomid;

    }
  }

$room_list_li = room_list_li_each($choice_roomid);

?>
<!DOCTYPE HTML>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
<link href="../assets/css/bui-min.css" rel="stylesheet" type="text/css" />
<link href="../assets/css/page-min.css" rel="stylesheet" type="text/css" />
<!-- 下面的样式，仅是为了显示代码，而不应该在项目中使用-->
<link href="../assets/css/prettify.css" rel="stylesheet" type="text/css" />
<style type="text/css">
code { padding: 0px 4px; color: #d14; background-color: #f7f7f9; border: 1px solid #e1e1e8; }
.paijiang { margin-right: 5px; }
</style>

</head>
<body>
<div class="container"  style="width:1000px;">
  
<form  class="form-horizontal" action="" method="get"> 
  <ul class="breadcrumb">
   <li class="active"><span style="color: #F90">房间：</span> <select name="choiceroom" id="choiceroom" OnChange="choice_room(this.value)">   
                       <?=$room_list_li;?>  
                     </select> &nbsp;&nbsp;&nbsp;&nbsp;关键字：
      <input type="text" name="skey" id="rolename"class="abc input-default" placeholder="用户名或提现户名">
     

      &nbsp;&nbsp;
      <input type="hidden" name="choice_roomid" value="<?=$choice_roomid?>" >
      <button type="submit"  class="button ">查询</button>
  
      <button type="button"  class="button  button-danger"  onClick="if(confirm('确定删除？'))$('#hd_list').submit()">删除所选</button>
 </li>
   
  </ul>
  </form>
   <form action="" method="POST" enctype="application/x-www-form-urlencoded"  class="form-horizontal" id="hd_list">
	<input type="hidden" name="act" value="tixian_del">
  <table  class="table table-bordered table-hover definewidth m10">
    <thead>
      <tr style="font-weight:bold" >
        <td width="20" align="center" bgcolor="#FFFFFF">ID</td>
        <td width="19" align="center" bgcolor="#FFFFFF"><input type="checkbox" onClick="$('.ids').attr('checked',this.checked); "></td>
        <td width="80" align="center" bgcolor="#FFFFFF">用户名</td>
        <td width="70" align="center" bgcolor="#FFFFFF">提现类型</td>
        <td  width="100" align="center" bgcolor="#FFFFFF">提现户名</td>
        <td width="120" align="center" bgcolor="#FFFFFF">帐号</td>
	<td width="80" align="center" bgcolor="#FFFFFF">提现金额</td>
        <td width="160" align="center" bgcolor="#FFFFFF">申请时间</td>
        <td width="160" align="center" bgcolor="#FFFFFF">房间</td>
        <td width="60" align="center" bgcolor="#FFFFFF">状态</td>
        <td width="120" align="center" bgcolor="#FFFFFF">操作</td>
      </tr>
    </thead>
<?php
$roomsql=$choice_roomid==0?'':" roomid=$choice_roomid  and";
$sql="select *  from {$tablepre}money_tixian where $roomsql 1=1  ";
$skey=trim($skey);
if($skey!=""){
	$sql.=" and (username like '%$skey%' or getname like '%$skey%')";
}


$sql.=" order by addtime desc";


global $firstcount,$displaypg;
           $num=20;
	$count=$db->num_rows($db->query($sql));
	pageft($count,$num,"");
	$sql.=" limit $firstcount,$displaypg";
	$query=$db->query($sql);
        while($row=$db->fetch_row($query)){
     
       ?>
    <tr>
      <td bgcolor="#FFFFFF" align="center"><?=$row['id']?></td>
	  <td align="center" bgcolor="#FFFFFF"><input type="checkbox" class="ids" name="id[]" value="<?=$row['id']?>"></td>
 <td align="center" bgcolor="#FFFFFF"><?=$row['username']?>&nbsp;</td>
	  <td align="center" bgcolor="#FFFFFF"><? if($row['type']==1){echo '支付宝';}else{ echo '银行卡';}?>&nbsp;</td>
          <td align="center" bgcolor="#FFFFFF"><?=$row['getname']?>&nbsp;</td>
          <td align="center" bgcolor="#FFFFFF"><?=$row['bankcard']?>&nbsp;</td>
          <td align="center" bgcolor="#FFFFFF"><?=$row['getmoney']?>&nbsp;</td>
            <td align="center" bgcolor="#FFFFFF"><?=date('Y-m-d H:i:s',$row['addtime'])?>&nbsp;</td>
            <td align="center" bgcolor="#FFFFFF"><?=$row['roomid']?>&nbsp;</td>
     <td align="center" bgcolor="#FFFFFF" jid="<?=$row['id']?>"><? if($row['status']==1){echo '<font color="#090" title="交易流水号:'.$row['beizhu'].'">已处理</font>';}elseif($row['status']==2){ echo '<font color="#46b8da" title="驳回理由:'.$row['beizhu'].'">已驳回</font>';}else{ echo '<font color="red">未处理</font>';}?></td>
      <td align="center" bgcolor="#FFFFFF">
     <?if($row['status']==0){?> <div  class="button button-mini button-info paijiang" onclick="tixian(<?=$row['id']?>,<?=$row['uid']?>,<?=$row['getmoney']?>,'<?=$row['username']?>');"  >处理提现</div><div  class="button button-mini button-danger paijiang " onclick="bohui(<?=$row['id']?>,<?=$row['uid']?>,<?=$row['getmoney']?>,'<?=$row['username']?>');"  >驳&nbsp;回</div> <?}?>
     </td>
    </tr>

<? }?>

  </table>
    </form> 
    <ul class="breadcrumb">
    <li class="active"><?=$pagenav?>
    </li>
  </ul>
</div>
<script type="text/javascript" src="../assets/js/jquery-1.8.1.min.js"></script> 
<script type="text/javascript" src="../assets/layer/layer.js"></script>
<script type="text/javascript" src="../assets/js/bui.js"></script> 
<script type="text/javascript" src="../assets/js/config.js"></script> 

<script>
    BUI.use('bui/overlay',function(Overlay){
          dialog5 = new Overlay.Dialog({
            title:'提现处理',
            width:350,
            height:300,
            buttons:[],
            bodyContent:''
          });
});
 function tixian(id,uid,getmoney,username) {  
     var a='';
     a+=' <form action="?act=tixian" method="POST" enctype="application/x-www-form-urlencoded"  class="form-horizontal" id="tixian_form"><input type="hidden" name="id" value="'+id+'"><input type="hidden" name="uid" value="'+uid+'"><input type="hidden" name="getmoney" value="'+getmoney+'"><input type="hidden" name="username" value="'+username+'">',
       a += '<div style="padding: 20px 0 0 30px;"><div class="registerNewconter" style="padding-right:55px;">提现金额：<font color="red">'+getmoney+'</font>元</div></div>',
            a += '<div style="padding: 20px 0 0 30px;"><div class="registerNewconter" style="padding-right:55px;">备注：<input type="text" id="beizhu" name="beizhu" maxlength="30" style="width: 153px;"></div><p class="envelopetip" id="realusernametip" style="margin-left:97px;"></p></div>',
            a += '<div  style="text-align: center;margin-top:20px;" ><button class="button button-mini button-info" id="btnenvelope" >确定提现</button></div></form>';
          
    var title = '提现处理';
     var index = layer.open({
            type: 1,
            title: title,
            area: ['400px', '200px'],
            content: a
        
        });
      // layer.full(index);


}
 function bohui(id,uid,getmoney,username) {  
     var a='';
     a+=' <form action="?act=bohui" method="POST" enctype="application/x-www-form-urlencoded"  class="form-horizontal" id="tixian_form"><input type="hidden" name="id" value="'+id+'"><input type="hidden" name="uid" value="'+uid+'"><input type="hidden" name="getmoney" value="'+getmoney+'"><input type="hidden" name="username" value="'+username+'">',
          a += '<div style="padding: 20px 0 0 30px;"><div class="registerNewconter" style="padding-right:55px;">驳回理由：<input type="text" id="beizhu" name="beizhu" maxlength="50" style="width: 153px;"></div><p class="envelopetip" id="realusernametip" style="margin-left:97px;"></p></div>',
            a += '<div  style="text-align: center;margin-top:20px;" ><button class="button button-mini button-info" id="btnenvelope" >确定驳回</button></div></form>';
          
    var title = '驳回处理';
     var index = layer.open({
            type: 1,
            title: title,
            area: ['400px', '200px'],
            content: a
        
        });
      // layer.full(index);


}
    var operation=<?=$operation?>;
    if(operation==1){
layer.alert('已成功处理提现申请', {
    title:'提示',
     shift: 1,
  icon: 1,
time:1000
})}
function choice_room(value){
 window.location.href="?choice_roomid="+value; 
}
  </script>
</body>
</html>
