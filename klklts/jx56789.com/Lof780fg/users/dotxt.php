<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
if(stripos(auth_group($_SESSION['login_gid']),'robot_add')===false)exit(denied_pape());
if($_GET['act']=="upload"){
  require_once '../inc/fileupload.class.php';
    $up = new FileUpload;
    //设置属性(上传的位置， 大小， 类型， 名是是否要随机生成)
    $up -> set("path", "../upload/");
    $up -> set("maxsize", 2000000);
    $up -> set("allowtype", array("txt"));
    $up -> set("israndname", true);
  
    //使用对象中的upload方法， 就可以上传文件， 方法需要传一个上传表单的名子 pic, 如果成功返回true, 失败返回false
    if($up ->upload("dotxt")) {
    
        //获取上传后文件名
      $filedir =substr(dirname(__FILE__), 0, -6) . '/upload/' . $up->getFileName();
               $fe=file($filedir);
           foreach($fe as $item){
                  $item=trim(mb_convert_encoding($item, "UTF-8", "GBK"));
               if(!empty($item)){
                    $query=$db->query("select id from {$tablepre}rebot_custom where rebotname='{$item}' limit 1");
		if($db->num_rows($query)) continue;
                $regtime=gdate();
               $db->query("insert into {$tablepre}rebot_custom(rebotname,gid,sex,shangxian,xiaxian,regtime,roomid)	values('$item','1','1','0','86399','$regtime','$roomid')");      
               }
                
                }
            unlink($filedir);    
 echo "<script>window.parent.dialog3.close();alert('机器人导入成功！');window.parent.location.reload();</script>";
 
    } else {
         //获取上传失败以后的错误提示
 
  $result= "<script>window.parent.dialog3.close();alert(\"".$up->getErrorMsg()."\");</script>";
 echo $result;
 

    }
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

.file {
    position: relative;
    display: inline-block;
    background: #D0EEFF;
    border: 1px solid #99D3F5;
    border-radius: 4px;
    padding: 4px 12px;
    overflow: hidden;
    color: #1E88C7;
    text-decoration: none;
    text-indent: 0;
    line-height: 20px;
}
.file input {
    position: absolute;
    font-size: 100px;
    right: 0;
    top: 0;
    opacity: 0;
}
.file:hover {
    background: #AADFFD;
    border-color: #78C3F3;
    color: #004974;
    text-decoration: none;
}
 input.textbox{
        float:left;
        padding:5px;
        color:#999;
        height:19px;
        line-height:19px;
        border:1px #ccc solid;
        width:200px;
        margin-right:4px;
    }
    .breadcrumb li{  display: block;margin-bottom: 15px;}
</style>
</head>
<body>
<div class="container" >
    <form action="?act=upload" method="post" enctype="multipart/form-data" >
      <ul class="breadcrumb">
<li>直播间：<select name="roomid" id="roomid" > <? echo room_list_li($default_roomid);?> </select></li>
            <li>
    <input type="hidden" name="MAX_FILE_SIZE" value="1000000" />
  
<a href="javascript:;" class="file">选择文件
    <input type="file" name="dotxt" id="uploadBtn">
</a>
  <input type="text" id="uploadFile" class="textbox"  />
</li>
<li><span class="auxiliary-text" style="color:red;">(提示:上传txt格式的文件文件,一行一个机器人名称)</span></li>

  </ul>
   
      <div style=" background: #FFF; width:100%; ">

     <input type="submit" id="reg"  class="button button-success" value="导入"/>
    <button type="button"  class="button" onclick="window.parent.dialog3.close()">关闭</button>
    &nbsp;&nbsp;
</div>
</form>
   
</div>
<script>
document.getElementById("uploadBtn").onchange = function () {
    document.getElementById("uploadFile").value = this.value;
};
</script>

</body>
</html>
