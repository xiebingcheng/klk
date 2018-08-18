<?php
session_start();
//如果浏览器显示“图像XXX因其本身有错无法显示”，可尽量去掉文中空格
//先成生背景，再把生成的验证码放上去
$img_height=50;//先定义图片的长、宽
$img_width=23;
$authnum='';
//生产验证码字符
$ychar="0,1,2,3,4,5,6,7,8,9";
$list=explode(",",$ychar);
for($i=0;$i<4;$i++){
    $randnum=rand(0,9);
    $authnum.=$list[$randnum];
}
//把验证码字符保存到session
$_SESSION["vcode"] = $authnum;


$aimg = imagecreate($img_height,$img_width);    //生成图片
imagecolorallocate($aimg, 255,255,255);            //图片底色，ImageColorAllocate第1次定义颜色PHP就认为是底色了
$black = imagecolorallocate($aimg, 0,0,0);        //定义需要的黑色




//为了区别于背景，这里的颜色不超过200，上面的不小于200
for ($i=0;$i<strlen($authnum);$i++){
    imagestring($aimg, 5,($i+1)*8,4, $authnum[$i],imagecolorallocate($aimg,mt_rand(0,100),mt_rand(0,150),mt_rand(0,200)));
}
imagerectangle($aimg,0,0,$img_height-1,$img_width-1,$black);//画一个矩形
header("Content-type: image/PNG");
imagepng($aimg);                    //生成png格式
imagedestroy($aimg);
?> 