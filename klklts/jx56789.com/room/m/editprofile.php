<?php
require_once '../../include/common.inc.php';
if(!isset($_SESSION['login_uid']) || $_SESSION['login_uid']=='0'  )header('location:../minilogin.php?rid='.$rid);
//获取登录用户的个人信息
$uid=$_SESSION['login_uid'];
$userinfo=$db->fetch_row($db->query("select m.*,ms.* from {$tablepre}members m,{$tablepre}memberfields ms  where m.uid=ms.uid and m.uid='{$uid}'")); 
 if(empty($userinfo['touxiang'])){$userinfo['touxiang']='/face/p1/null.jpg';}
?>
<!doctype html>
<html lang="zh-cn">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
		<title>编辑头像和昵称</title>
		<link rel="stylesheet" type="text/css" href="./css/index.min.css">
		<link rel="stylesheet" type="text/css" href="../skins/weui.css"/>
		<link rel="stylesheet" type="text/css" href="../skins/font-awesome.css">
	</head>
	<body style="background-color: white">
		<div class="edit-profile">
			<section>
				<div class="profile-avatar">
					<span>头像</span>
					<span class="profile-arrow"><i class="fa fa-angle-right"></i></span>
					<div class="profile-avatar-pic" onclick="$('#filedata').click()">
                    	<img src="<?=$userinfo['touxiang']?>"/>
					</div>
				</div>
				<div class="profile-nickname">
					<span>昵称</span>
					<span class="profile-arrow"><i class="fa fa-angle-right"></i></span>
					<div class="fr name-editable" contenteditable="true" id="profileNickname"><?=$userinfo['nickname']?></div>
				</div>
				<button class="weui-btn weui-btn_primary confirm-edit" id="confirm-btn">确认修改</button>
				<a class="weui-btn weui-btn_default confirm-edit btn-cancel" href="javascript:history.go(-1);">取消修改</a>
			</section>
			<input id="filedata" type="file" size="20" name="filedata" class="input" style="display:none" onchange="uploadAvatar('filedata')">
		</div>
		<script type="text/javascript" src="../script/jquery.min.js"></script>
		<script type="text/javascript" src="../script/ajaxfileupload.js"></script>
		<script type="text/javascript">
	        function uploadAvatar(ElementId) {
	          	//上传文件
		        $.ajaxFileUpload({
		            url:'/upload/upload_touxiang.php',//处理图片脚本
		            secureuri :false,
		            fileElementId :'filedata',//file控件id
		            dataType : 'json',
		            data: {type: ElementId },
                            
		            success : function (data, status){  
		                if(typeof(data.err) != 'undefined'){
		                    if(data.err != ''){
		                        alert(data.err);
		                    }else{
		                        $('.profile-avatar-pic img').attr('src', data.msg.url+'?number='+Math.random());
		                    }
		                }
		            },
		            error: function(data, status, e){
		                alert(e);
		            }
		    	});
	        }
	        $('#confirm-btn').click(function() {
	        	var nickname=$('#profileNickname').text();
	        	var touxiang=$('.profile-avatar-pic img').attr('src');
	            $.ajax({
	               	type:"POST",
	               	url:"/ajax.php?act=editUserInfo",
	               	data:{nickname:nickname,touxiang:touxiang},
	               	dataType: "json",
	              	success:function(data){ 
	                    if(data.state=='1'){
	                        alert('修改成功');
	                      	javascript:history.go(-1);   
	                    }            
	                }  
	             });
	        });
	     
		</script>
	</body>
</html>