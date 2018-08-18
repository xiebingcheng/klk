<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
if(stripos(auth_group($_SESSION['login_gid']),'robot_add')===false)exit(denied_pape());
if($act=="user_add"){
         if(is_array($week)){
               $week=implode(',',$week);  
                }
	rebot_add($rebotname,$gid,$sex,$shour,$sminute,$ssecond,$xhour,$xminute,$xsecond,$week,$roomid);
        echo "<script>window.parent.dialog2.close();alert('机器人添加成功！');window.parent.location.reload();</script>";
}
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
input,select{vertical-align:middle;}
.liw { width:160px; height:25px; line-height:25px;}
</style>
</head>
<body>
<div class="container" >
<?php
  //获取用户分组
$user_group_list=user_group_list('1','2,3,4,17');

?>
<form action="rebot_add.php" method="post" enctype="application/x-www-form-urlencoded" id="regUser">
  <ul class="breadcrumb">

<table class="table table-bordered table-hover definewidth m10">
			  <tr>
            <td width="80" class="tableleft" style="width:70px;">机器人名称：</td>
            <td><input name="rebotname" type="text" id="rebotname" style="width:350px;" placeholder="汉字、数字、字母组合" onkeyup="value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5]/g,'')" /></td>
          </tr>
	 <tr>
            <td width="80" class="tableleft">用 户 组：</td>
            <td><select name="gid" id="gid" >
	      <?=$user_group_list?>
            </select>&nbsp;</td>
          </tr>
          <tr>
            <td width="80" class="tableleft">房间：</td>
            <td><select name="roomid" id="roomid" >
	      <? echo room_list_li($default_roomid);?>
            </select>&nbsp;</td>
          </tr>
          <tr>
            <td width="80" class="tableleft">性别：</td>
            <td><label class="radio"><input name="sex" type="radio" value="1"  checked />男 </label>&nbsp;&nbsp;&nbsp;&nbsp;
<label class="radio"><input name="sex" type="radio" value="0" />女</label></td>
          </tr>
          <tr>
            <td width="80" class="tableleft">上线时间：</td>
            <td>
                <input type="checkbox" name="week[]" value="1" checked="checked"/>星期一&nbsp;
                <input type="checkbox" name="week[]" value="2" checked="checked"/>星期二&nbsp;
                <input type="checkbox" name="week[]" value="3" checked="checked" />星期三&nbsp;
                <input type="checkbox" name="week[]" value="4" checked="checked"/>星期四&nbsp;
                <input type="checkbox" name="week[]" value="5" checked="checked"/>星期五&nbsp;
                <input type="checkbox" name="week[]" value="6" checked="checked" />星期六&nbsp;
                <input type="checkbox" name="week[]" value="7" checked="checked" />星期日
                    <br/>
                    <br/>
                <select name="shour" id="shour" style="width:70px;" ><option value="0" selected >0</option><option value="1" >1</option><option value="2" >2</option><option value="3" >3</option><option value="4" >4</option><option value="5" >5</option><option value="6" >6</option><option value="7" >7</option><option value="8" >8</option><option value="9" >9</option><option value="10" >10</option><option value="11" >11</option><option value="12" >12</option><option value="13" >13</option><option value="14" >14</option><option value="15" >15</option><option value="16" >16</option><option value="17" >17</option><option value="18" >18</option><option value="19" >19</option><option value="20" >20</option><option value="21" >21</option><option value="22" >22</option><option value="23" >23</option></select>&nbsp;<label class="control-label">时</label>
                 <select name="sminute" id="sminute" style="width:70px;" ><option value="0" selected>0</option><option value="1" >1</option><option value="2" >2</option><option value="3" >3</option><option value="4" >4</option><option value="5" >5</option><option value="6" >6</option><option value="7" >7</option><option value="8" >8</option><option value="9" >9</option><option value="10" >10</option><option value="11" >11</option><option value="12" >12</option><option value="13" >13</option><option value="14" >14</option><option value="15" >15</option><option value="16" >16</option><option value="17" >17</option><option value="18" >18</option><option value="19" >19</option><option value="20" >20</option><option value="21" >21</option><option value="22" >22</option><option value="23" >23</option><option value="24" >24</option><option value="25" >25</option><option value="26" >26</option><option value="27" >27</option><option value="28" >28</option><option value="29" >29</option><option value="30" >30</option><option value="31" >31</option><option value="32" >32</option><option value="33" >33</option><option value="34" >34</option><option value="35" >35</option><option value="36" >36</option><option value="37" >37</option><option value="38" >38</option><option value="39" >39</option><option value="40" >40</option><option value="41" >41</option><option value="42" >42</option><option value="43" >43</option><option value="44" >44</option><option value="45" >45</option><option value="46" >46</option><option value="47" >47</option><option value="48" >48</option><option value="49" >49</option><option value="50" >50</option><option value="51" >51</option><option value="52" >52</option><option value="53" >53</option><option value="54" >54</option><option value="55" >55</option><option value="56" >56</option><option value="57" >57</option><option value="58" >58</option><option value="59" >59</option></select>&nbsp;<label class="control-label">分</label>
               <select name="ssecond" id="ssecond" style="width:70px;" ><option value="0" selected>0</option><option value="1" >1</option><option value="2" >2</option><option value="3" >3</option><option value="4" >4</option><option value="5" >5</option><option value="6" >6</option><option value="7" >7</option><option value="8" >8</option><option value="9" >9</option><option value="10" >10</option><option value="11" >11</option><option value="12" >12</option><option value="13" >13</option><option value="14" >14</option><option value="15" >15</option><option value="16" >16</option><option value="17" >17</option><option value="18" >18</option><option value="19" >19</option><option value="20" >20</option><option value="21" >21</option><option value="22" >22</option><option value="23" >23</option><option value="24" >24</option><option value="25" >25</option><option value="26" >26</option><option value="27" >27</option><option value="28" >28</option><option value="29" >29</option><option value="30" >30</option><option value="31" >31</option><option value="32" >32</option><option value="33" >33</option><option value="34" >34</option><option value="35" >35</option><option value="36" >36</option><option value="37" >37</option><option value="38" >38</option><option value="39" >39</option><option value="40" >40</option><option value="41" >41</option><option value="42" >42</option><option value="43" >43</option><option value="44" >44</option><option value="45" >45</option><option value="46" >46</option><option value="47" >47</option><option value="48" >48</option><option value="49" >49</option><option value="50" >50</option><option value="51" >51</option><option value="52" >52</option><option value="53" >53</option><option value="54" >54</option><option value="55" >55</option><option value="56" >56</option><option value="57" >57</option><option value="58" >58</option><option value="59" >59</option></select>&nbsp;<label class="control-label">秒</label>
              </td>
          </tr>
          <tr>
            <td width="80" class="tableleft">下线时间：</td>
          <td>
                <select name="xhour" id="xhour" style="width:70px;" ><option value="0">0</option><option value="1" >1</option><option value="2" >2</option><option value="3" >3</option><option value="4" >4</option><option value="5" >5</option><option value="6" >6</option><option value="7" >7</option><option value="8" >8</option><option value="9" >9</option><option value="10" >10</option><option value="11" >11</option><option value="12" >12</option><option value="13" >13</option><option value="14" >14</option><option value="15" >15</option><option value="16" >16</option><option value="17" >17</option><option value="18" >18</option><option value="19" >19</option><option value="20" >20</option><option value="21" >21</option><option value="22" >22</option><option value="23" selected >23</option></select>&nbsp;<label class="control-label">时</label>
                 <select name="xminute" id="xminute" style="width:70px;" ><option value="0" selected>0</option><option value="1" >1</option><option value="2" >2</option><option value="3" >3</option><option value="4" >4</option><option value="5" >5</option><option value="6" >6</option><option value="7" >7</option><option value="8" >8</option><option value="9" >9</option><option value="10" >10</option><option value="11" >11</option><option value="12" >12</option><option value="13" >13</option><option value="14" >14</option><option value="15" >15</option><option value="16" >16</option><option value="17" >17</option><option value="18" >18</option><option value="19" >19</option><option value="20" >20</option><option value="21" >21</option><option value="22" >22</option><option value="23" >23</option><option value="24" >24</option><option value="25" >25</option><option value="26" >26</option><option value="27" >27</option><option value="28" >28</option><option value="29" >29</option><option value="30" >30</option><option value="31" >31</option><option value="32" >32</option><option value="33" >33</option><option value="34" >34</option><option value="35" >35</option><option value="36" >36</option><option value="37" >37</option><option value="38" >38</option><option value="39" >39</option><option value="40" >40</option><option value="41" >41</option><option value="42" >42</option><option value="43" >43</option><option value="44" >44</option><option value="45" >45</option><option value="46" >46</option><option value="47" >47</option><option value="48" >48</option><option value="49" >49</option><option value="50" >50</option><option value="51" >51</option><option value="52" >52</option><option value="53" >53</option><option value="54" >54</option><option value="55" >55</option><option value="56" >56</option><option value="57" >57</option><option value="58" >58</option><option value="59" selected >59</option></select>&nbsp;<label class="control-label">分</label>
               <select name="xsecond" id="xsecond" style="width:70px;" ><option value="0" selected>0</option><option value="1" >1</option><option value="2" >2</option><option value="3" >3</option><option value="4" >4</option><option value="5" >5</option><option value="6" >6</option><option value="7" >7</option><option value="8" >8</option><option value="9" >9</option><option value="10" >10</option><option value="11" >11</option><option value="12" >12</option><option value="13" >13</option><option value="14" >14</option><option value="15" >15</option><option value="16" >16</option><option value="17" >17</option><option value="18" >18</option><option value="19" >19</option><option value="20" >20</option><option value="21" >21</option><option value="22" >22</option><option value="23" >23</option><option value="24" >24</option><option value="25" >25</option><option value="26" >26</option><option value="27" >27</option><option value="28" >28</option><option value="29" >29</option><option value="30" >30</option><option value="31" >31</option><option value="32" >32</option><option value="33" >33</option><option value="34" >34</option><option value="35" >35</option><option value="36" >36</option><option value="37" >37</option><option value="38" >38</option><option value="39" >39</option><option value="40" >40</option><option value="41" >41</option><option value="42" >42</option><option value="43" >43</option><option value="44" >44</option><option value="45" >45</option><option value="46" >46</option><option value="47" >47</option><option value="48" >48</option><option value="49" >49</option><option value="50" >50</option><option value="51" >51</option><option value="52" >52</option><option value="53" >53</option><option value="54" >54</option><option value="55" >55</option><option value="56" >56</option><option value="57" >57</option><option value="58" >58</option><option value="59" selected >59</option></select>&nbsp;<label class="control-label">秒</label>
              </td>
          </tr>
          </table>

  </ul>
  <div style=" background: #FFF; width:100%; ">

     <input type="button" id="reg"  class="button button-success" value="确定"/>
    <button type="button"  class="button" onclick="window.parent.dialog2.close()">关闭</button>
    <input type="hidden" name="act" value="user_add">
</div>
  </form>
</div>
<script type="text/javascript" src="../assets/js/jquery-1.8.1.min.js"></script> 
<script type="text/javascript" src="../assets/js/bui.js"></script> 
<script type="text/javascript" src="../assets/js/config.js"></script> 
<script type="text/javascript" src="../../upload/swfupload/swfupload.js"></script> 
<script>
$(document).ready(function() {
$('#reg').click(function() {

		if ($.trim($('#rebotname').val()) == "") {
			$('#rebotname').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
		alert('名称不能为空！');
			return false;
		}
           var flag = false ; 
              $("[name='week[]']").each(function(){
             if($(this).attr("checked")){
            flag = true ;
             }
        });
             if(!flag){
                    alert("一周至少选择一天上线！");
                    return false ;
                }
          $('#regUser').submit();
	});
	});
</script>
</body>
</html>
