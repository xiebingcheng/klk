var ws;
var page_fire
function OnSocket(){
	ws=new WebSocket("wss://"+RoomInfo.TServer+":"+RoomInfo.TSPort);
	ws.onopen=onConnect;
	ws.onmessage=function(e){WriteMessage(e.data)};
	ws.onclose=function(){setTimeout('location.reload()',3000);};
	ws.onerror=function(){setTimeout('location.reload()',3000);};
}
function Datetime(tag)
{
	return new Date().toTimeString().split(' ')[tag];	
}
function showLeftTime()
{
var now=new Date();
var hours=now.getHours();
var minutes=now.getMinutes();
return hours+":"+minutes;
}

function MsgAutoScroll(){
	if($('#publicChat').find(".msg").length>100){$('#publicChat').find(".msg:first").remove();}
	 $('#publicChat').scrollTop($('#publicChat')[0].scrollHeight);
}
function getId(id) {
	return document.getElementById(id);
}
function CreateElm1(pObj,obj,className,id,ref){
	var elm = null;
	var elm=document.createElement(obj);
	if(!pObj)document.body.insertBefore(elm,ref);
	else pObj.insertBefore(elm,ref);
	if(id)elm.id = id;
	if(className)elm.className = className;
	return elm
}
function RemoveElm(pObj,id)
{
	$(id).html("");
	$(id).remove()
}
/* 打开私聊窗口
	u: 聊天的对象
	isProactive:用于判断是否是自己主动打开的窗口
*/
function openWhisperWindow(u, isProactive) {
	layer.open({
		className: 'layui-m-whisper',
		title: [
		      '私聊 <span class="closeBtn"></span>',
		      'background-color: #f8f8f8; color: #333; text-align: left; height: 38px; line-height: 38px;'
		],
		content: '',
	    shadeClose: false,
	    success: function(elem){
	    	/* 私聊列表(用户列表) */
	    	var _li = '';
	    	if (isProactive) { 
				_li = ' <li data-id="' + u.chatid +'" data-nick="' + u.nick + '" id="chat-item-user-'+ u.chatid +'">' + 
          					'<span><b class="chat-user-num" style="display:none">0</b>' + u.nick + '</span>' + 
      				  '</li>';
	    	}
 			
			var _tab = '<div class="chat-user-container" id="chat-user-container" style="display:block">' + 
					        '<div class="current-user-container" onclick="showUserList()">' + 
					            '<span id="current-chat-user"></span>' +
					            '<span class="fa fa-angle-down arrow-down"></span>' +
					        '</div>' +   
					        '<ul class="chat-user-list" style="display:none">'+ _li +'</ul>' +
				      	'</div>';
			/*底部发送消息区*/
			var _bottom = '<div id="whisperFooter" style="display: block;">' + 
							  	'<div class="more-function" id="uploadImgIcon"><img src="./images/images.png"></div>' + 
							  	'<div class="sendBtn fr" id="whisperSendBtn">发送</div>' + 
							  	'<div class="smile"> <img src="./images/smile.png" alt="表情" width="26px" height="26px"> </div>' + 
							  	'<div id="whisperEditor">' + 
							    	'<div class="messageEditor" id="whisperMessEditor" contenteditable="true"></div>' + 
						  		'</div>' + 
							'</div>' + 
							'<input id="whisperUploadImg" type="file" size="20" name="filedata" class="input" style="display:none" onchange="uploadAvatar(\'whisperUploadImg\', \'#whisperMessEditor\')">';
			/*表情区*/
			var _expression = '<div class="whisper-expression-layer" style="display: none;position: absolute;bottom: 38px;background: rgba(0,0,0,0.1); z-index: 999;">' + 
								  '<div class="expression" id="whisperExpr">' + 
									    '<table class="expr-tab expr-tab1">' + 
									    '</table>' +
								  	'</div>' +
								'</div>';
			$(_tab).insertBefore($('.layui-m-layercont'));
			$('.layui-m-whisper').append(_bottom);
			$('.layui-m-whisper').append(_expression);
			if (isProactive) {
				$('#current-chat-user').data('value', u.chatid);
				$('#current-chat-user').text(u.nick);
				var $usercontainer = $('<div id="user-container-' + u.chatid + '"></div>');
				$('.layui-m-layercont').append($usercontainer);
				/*历史记录*/
				$.ajax({
					type:'GET',
					dataType:'JSON',
					url:'/ajax.php?act=mymsgold&tuid='+u.chatid,
					success:function(data){
						$usercontainer.append(data.msg);
						$('.layui-m-layercont').scrollTop($('.layui-m-layercont')[0].scrollHeight);
					}
				});
			}
			currentFromChatId = $('#current-chat-user').data('value');

			/*事件操作*/
			/*弹框关闭按钮*/
	    	$('.layui-m-layerchild h3 .closeBtn').click(function(){
				layer.closeAll();
			});

	    	/*发送按钮*/
			$("#whisperSendBtn").click(function() {
				whisperMsgSend($('#current-chat-user').data('value'));
			});
			/*选择表情*/
			$('#whisperFooter .smile').click(function(e){
			    if (e.stopPropagation(), 0 == $("#whisperExpr").find(".expr-tab").find("tr").length) {
			        $("#whisperExpr").find(".expr-tab").append(commonExpression);
			        $(".whisper-expression-layer").show();
			        $("#whisperExpr").find(".expr-tab").find("img").click(function() {
			            var a = $(this).attr("src");
			            $("#whisperMessEditor").focus(),
			            document.execCommand("insertImage", null, a),
			            $(this).closest(".whisper-expression-layer").hide()
			        });
			    } else {
			    	$(".whisper-expression-layer").toggle();
        		}
			});
			/*上传图片*/
			$('#whisperFooter #uploadImgIcon').click(function(){
				$("#whisperUploadImg").click();
			});

			if (isProactive) {
				/*私聊列表点击事件*/
				$('#chat-item-user-' + u.chatid).click(function() {
					$('.chat-user-list').hide();
					var $chatdl = $('#user-container-' + $(this).data('id'));
					$chatdl.show();
					$chatdl.siblings().hide();
					$('.chat-user-list li[data-id=' + $(this).data('id') + '] span b').text(0);
					$('.chat-user-list li[data-id=' + $(this).data('id') + '] span b').css('display', 'none');	
					$('.layui-m-layercont').scrollTop($('.layui-m-layercont')[0].scrollHeight);
				});
			}
	    },
	    style: 'width: 350px;',
	});
}
ToUser=(function(){
	return {
		id:null,
		name:null,
		add:function(id,name) {
			$('#ToUser').html(name);
	        $('#ToUser').attr("data-id",id);
	        if(id!='ALL') {
				$('#apDiv2').css('display','block');
			}	
		},
		del:function(id) {
			this.add('ALL','大家');
            $('#apDiv2').css('display','none');              
		},
		set:function(id,name) { 
            if(!check_auth("msg_ptp"))return;
			if(id==My.chatid)return;
			this.id=id;
			this.name=name;
			this.add(id,name);			
		},
        init:function(id,name) { 
            this.id=id;
			this.name=name;
			this.add(id,name);			
		}        
	}
})();
UserList=(function(){
	var list=[];
    var onlinuser=0;
	list['ALL']={sex:2,chatid:'ALL',nick:'大家'}
	return {
		List:function() {return list},
		init:function() {
			list['ALL']={sex:2,chatid:'ALL',nick:'大家'}
        	var request_url='../../ajax.php?act=robotlist&rid='+My.rid+'&r='+RoomInfo.r+'&'+Math.random() * 10000;
			$.ajax({type: 'get',dataType:'text',url: request_url,
				success:function(data){
					WriteMessage2(data);
				}});
			},
		get:function(id) {return list[id];},
		add:function(id,u) { 
            onlinuser++;
			$('#OnlineUserNum').html(onlinuser);
			if($("#"+id).length >0)return;
			list[id]=u;
			if (u.color == 2 || u.color == 3) {
				/***************/
				var style="";
				var vip_ico="";
	            var r_color='';
	            var li_class=false;
	            var avatar = '/room/images/state0.png',
	            	title='游客',
	            	sn = '游客';
	            if (grouparr[u.color]) {
	            	avatar = grouparr[u.color].ico;
	            	title = grouparr[u.color].title;
	            	sn = grouparr[u.color].sn;
	            }
				vip_ico="<img src='"+avatar+"'  align='top'/ title='"+title+'-'+sn+"'>"; 
				var ref=getId("group_rebots");
				if(My.chatid==u.chatid) {
					ref=getId("group_my");
				} else {
					ref=getId("group_"+u.color);
				}
				if(My.qx == 1 && u.chatid.indexOf("x_r") >= 0 ) { 
					r_color = 'color="#ccccc9"'; 
					li_class = 'rebots';
				}
				var li = CreateElm1(ref,'li',li_class,id,null);
				var iscam = '<span class="vipico"><img src="/room/images/state'+u.state+'.png" border="0" class="state" id="state'+id+'"/>'+vip_ico+'</span>';
	           
	                li.innerHTML = '<a href="javascript:void(0)"><font style="color:#FFF">'
				 					+ iscam
	                        		+'<cite><img src="'+u.touxiang+'" border="0" class="head" id="head_'+id+'"/></cite>' 
	                        		+'<dt><font '+r_color+' id="cnick'+id+'">'+u.nick+'</font> &nbsp;<code>'+u.mood+'</code></dt>'
				 					+'<dl>'+u.mood+'</dl>'
	      		         			+'</font></a>';
	          
	            if(check_auth("msg_priv")) {
	            	if (u.color == My.color) {
	            		return;
	            	}
					li.onclick = function() {
						openWhisperWindow(u, true);
					}
	            } else {
	            	if (u.color == 2 || u.color == 17) {
						li.onclick = function() {
							openWhisperWindow(u, true);
						}
	            	}
	            }

				if(My.name == u.vip && My.color == '3') {
					UserList.addmyuser(u);
				}  
			}      
		},
		del:function(id,u){
            UserList.delmyuser(id);
			if(id==My.chatid)return;
			delete(list[id]);
			onlinuser--;
			$('#OnlineUserNum').html(onlinuser);
			RemoveElm(getId('OnLineUser'),getId(id));         
		},
        delmyuser:function(id){
			var u=UserList.get(id);
			if(u==undefined)return;
			if(My.color=='3'&&u.vip==My.name){
				$("#group_myuser").find("#myuser"+id).remove();
			}
		},
	    addmyuser:function(u){
	        var ref=getId("group_myuser");
			if($("#group_myuser").find("#myuser"+u.chatid).length>0){
				$("#group_myuser").find("#myuser"+u.chatid).remove();
			}
			var li=CreateElm1(ref,'li',false,'myuser'+u.chatid,null);
			var vip_ico="<img src='"+u.touxiang+"'  align='top'/ title='"+grouparr[u.color].title+'-'+grouparr[u.color].sn+"'>"; 
			var iscam='<span class="vipico">'+vip_ico+'</span>';
			
				li.innerHTML = '<a href="javascript:void(0)"><font style="color:#FFF">'
			 				 	+ iscam
			 					+'<cite><img src="'+u.touxiang+'" border="0" class="head"/></cite>'
	                            +'<dt><font id="cnick_'+u.chatid+'">'+u.nick+'</font> &nbsp;<code> </code></dt>'
			 					+'<dl> </dl>'
			 					+'</font></a>';
		
			if(u.color=='3' && My.color!='3') {
			 	$("#group_myuser").append("<div class='kfbtns'> <a class='btn1' ><i class='fa fa-comments'></i>在线私聊</a> <a href='http://wpa.qq.com/msgrd?v=3&amp;uin="+u.qq+"&amp;site=qq&amp;menu=yes' class='btn2' target='_blank'><i class='fa fa-qq'></i>QQ交谈</a> </div>"); 
	            $("#group_myuser").append('<h4 class="title MyKf">助理介绍</h4>');
	            $("#group_myuser").append('<div class="border-top MyKf" id="MyKfProfile">'+u.mood+'</div>')
	            $('.kfbtns').find('.btn1').click(function() { 
	            	if(u.chatid!=My.chatid||u.chatid.indexOf('x_r')<0) {
	            		POPChat.newtab(u);POPChat.showtab(u);
	            	}
	            	return false;
	            });
	            li.ondblclick=function(){if(u.chatid!=My.chatid||u.chatid.indexOf('x_r')<0){POPChat.newtab(u);POPChat.showtab(u);}} 			
	        } else {
	            li.oncontextmenu=function(){UserList.menu_kf(u);return false;}
				li.onclick=function(){ToUser.set(u.chatid,u.nick);/*openWin(2,false,'profiles.php?uid='+u.chatid,460,600);*/}
				li.ondblclick=function(){if(u.chatid!=My.chatid||u.chatid.indexOf('x_r')<0){POPChat.newtab(u);POPChat.showtab(u);}}   
	                                
	        }
			if(UserList.get(u.chatid)==undefined) { 
				$(li).find('a').addClass('gray');
			} else {
				$('#group_myuser').prepend($(li));
				$(li).find('dt').css("color","red");
			}
		}
	}
})();
function open_img(src){
	$('#video-hide').click();
	var $gallery = $("#gallery"), $galleryImg = $("#galleryImg");
    $galleryImg.attr("style", 'background-image:url(' + src + ')');
    $gallery.fadeIn(100);
    $gallery.on("click", function(){
    	//$('#video-show').click();
        $gallery.fadeOut(100);
    });

}
function MsgShow(str,type){
	
	$("#publicChat").append(str);
	$(".layim_chatsay img").unbind();
    $(document).delegate('.layim_chatsay img', 'click', function() {
    	if($(this).width()>=119||$(this).height()>=119) {
    		open_img($(this).attr('src'));
    	}
    });
	MsgAutoScroll();
}
function MsgSend(){
	var msgid=randStr()+randStr();
         if(RoomInfo.banspeak==1 && My.color != 2){ layer.open({content: '全体禁言中！' ,skin: 'msg',time: 2});return false;}
           if(My.banspeak==1){layer.open({content: '你被禁言了' ,skin: 'msg',time: 2});return false;}
        if(!check_auth("msg_send")){layer.open({content: '没有发言权限！' ,skin: 'msg',time: 2});return false;}
        var str=$("#messageEditor").html();
         //敏感词语审核
       var reg = new RegExp(msg_unallowable, "ig");
       var deviceType = '';
       var containKey = 0;
		if(reg.test(str)&&!check_auth("room_admin")) {
			containKey = 1;
	      	// str="<div class='msg'><div class='msg_head'><span class='time'>"+showLeftTime()+"</span><span class='u'> "+My.nick+"：</span></div> <div class='msg_content'>含敏感关键字，内容被屏蔽</div></div>";
	      	// MsgShow(str,1);
	       	// $("#messageEditor").html(""); 
	       	// return false;
	    }
	 str=encodeURIComponent($.trim(str.str_replace()));
	if(str=="") { 
		layer.open({content: '发言内容不能为空！' ,skin: 'msg',time: 2});
		return false;
	} else {
		if(barrage==true){
            if (My.redbags_num < 1) {
            	barrage = false;
		    	$('#barrageInfo').html('开启');
		    	$('.barrage .show').empty();
            	layer.open({content: '积分不足，弹幕关闭' ,skin: 'msg',time: 2});
            } else {
            	My.redbags_num=My.redbags_num-1;
            }
        }
		if(device.iphone()) {
			deviceType = 'ios';
		} else if(device.ios()) {
			deviceType = 'ios';
		} else if(device.ipad()) {
			deviceType = 'ios';
		}else if(device.mobile()) {
			deviceType = 'android';
	}
	}
			
	var wsstr = '{"type":"SendMsg","ToChatId":"ALL","IsPersonal":"false","Style":"font-size:13px;","tanmu":"' + barrage +'","Txt":"'+msgid+'_+_'+str+ '_+_'+containKey +'","device":"' + deviceType + '"}'; 
ws.send(wsstr);	
	PutMessage(My.rid,My.chatid,'ALL',My.nick,'大家','false','font-size:13px;',str,msgid,barrage,deviceType);
	$("#messageEditor").html("");
	//$("#messageEditor").focus();
}
function whisperMsgSend(toChatId) {
	var toUserInfo=UserList.get(toChatId);
        var deviceType = '';
	if(typeof(toUserInfo)=="undefined"||toUserInfo.chatid.indexOf('x_r')>-1) {
		alert('用户离线');
		return;
	}
    var str=$("#whisperMessEditor").html();
    str=encodeURIComponent($.trim(str.str_replace()));
	if(str=="") { 
		alert('发言内容不能为空！');
		return false;
	} else {
		if(device.iphone()) {
			deviceType = 'ios';
		} else if(device.ios()) {
			deviceType = 'ios';
		} else if(device.ipad()) {
			deviceType = 'ios';
		}else if(device.mobile()) {
			deviceType = 'android';
		}
	}
	var wsstr = '{"type":"SendMsg","ToChatId":"'+toUserInfo.chatid+'","IsPersonal":"true","Style":"font-size:13px;","tanmu":"false","Txt":"'+str+'","device":"' + deviceType + '"}'; 
	ws.send(wsstr);	
	PutMessage(My.rid,My.chatid,toUserInfo.chatid,My.nick,toUserInfo.nick,'true','font-size:13px;',str,'',false,deviceType);
	$("#whisperMessEditor").html("");
}
function randStr(){
	return (((1+Math.random())*0x10000)|0).toString(16).substring(1);
}
function PutMessage(rid,uid,tid,uname,tname,privacy,style,str,msgid,tanmu,deviceType){
	if(RoomInfo.Msglog=='0')return;
	var request_url='../../ajax.php?act=putmsg';
	if(tanmu=='' || tanmu==undefined){tanmu='false';}
	var postdata='msgid='+msgid+'&uname='+uname+'&tname='+tname+'&muid='+uid+'&rid='+rid+'&tid='+tid+'&privacy='+privacy+'&style='+style+'&msg='+str+'&tanmu='+tanmu+'&deviceType='+deviceType+'&'+Math.random() * 10000;
	
	$.ajax({type: 'POST',url:request_url,data:postdata});
}
function Mkick(adminid,rid,ktime,cause)
{
	$.ajax({type: 'get',dataType:'json',url: '../../ajax.php?act=kick&aid='+adminid+'&rid='+rid+'&ktime='+ktime+'&cause='+cause+'&u='+My.name+'&'+Math.random() * 10000,
			success:function(data){
				//alert(data);
				if(data.state=="yes"){
				location.href="../error.php?msg="+encodeURI('你被踢出！并禁止'+ktime+'分钟内登陆该房间！<br>原因是 '+cause+'');
				}
			}
	});
}
String.prototype.str_replace=function(t){
	var str=this;
	  str= str.replace(/<\/?(?!br|img|font|div|p|span|\/font|\/div|\/p|\/span)[^>]*>/ig,'').replace(/\r?\n/ig,' ').replace(/(&nbsp;)+/ig," ").replace(/(=M=)+/ig,"").replace(/(|)+/ig,"").replace(/(SendMsg)/ig,'');
	
    return str;
	};

function check_auth(auth){
	var auth_rules = grouparr[My.color].rules;
	if(auth_rules.indexOf(auth)>-1)return true;
	else false;
}
function remove_auth(auth){
	grouparr[My.color].rules=grouparr[My.color].rules.replace(auth,"");
}
function FormatMsg(Msg)
{
	var User=UserList.get(Msg.ChatId);
	var toUser=UserList.get(Msg.ToChatId);
	var date= Datetime(0);
	var IsPersonal='';
	if(typeof(User)=='undefined'){
        var request_url='../../ajax.php?act=getUser&userid='+Msg.ChatId;
	$.ajax({type: 'get',async:false,url:request_url,success:function(data){  User=eval("("+data+")");}});    
         }
        if(typeof(toUser)=='undefined'){toUser={sex:2,chatid:'ALL',nick:'大家'}}
	if(Msg.IsPersonal=='true' && toUser.chatid!='ALL') IsPersonal='[私]';
	var Txt=decodeURIComponent(Msg.Txt.str_replace());

	if(Txt.indexOf('C0MMAND')!=-1)
	{
		var command=Txt.split('_+_');
		switch(command[1])
		{
			case 'msgAudit':
			   $('#'+command[2]).show();
                                $('#bt_audit_'+command[2]).hide();
				MsgAutoScroll();
				
			break;
			case 'msgBlock':
				$('#'+command[2]).remove();
				MsgAutoScroll();
			
			break;
                        
                            case 'BanSpeak':
			RoomInfo.banspeak=command[2];
				if(RoomInfo.banspeak=='1'){$('#shutinfo').html('取消禁言'); $('#shutBtn').css('background-color', 'gainsboro')}else{$('#shutinfo').html('禁言');$('#shutBtn').css('background-color', 'white')}
			break;
                         case 'hongbaoinfo':
				var str='<div class="message-wrap"><div class="redbag-info1"><p style="color:#333;">'+command[4]+' 领取了 <span style="color:red;">'+command[2]+'</span> 的红包获得 <span style="color:red;">'+command[3]+'元</span></p></div><div class="clear"></div></div>';
			break;
                        case 'send_Msgblock':
				if(My.chatid==toUser.chatid){
				
                         $.ajax({
                        type: 'get',
                        dataType: 'json',
                        url: '../../ajax.php?act=ban_speak_user&ban_speak_status='+command[2]+'&userid=' + toUser.chatid,
                        success: function (data) {
                            //alert(data);
                            if (data.state == "success") { 
                                    if(command[2]=='1'){
                                My.banspeak=1;
					 layer.open({content: '你已被禁言！' ,skin: 'msg',time: 2});
                                }else if(command[2]=='0'){
                               My.banspeak=0;
                               layer.open({content: '系统取消对你的禁言' ,skin: 'msg',time: 2});
				}
                          
                            }
                        }
                    });
					
				}
			break;
			case 'rebotmsg':
                        case 'automsg':
				var msg={};
				msg.ChatId=command[2];
				msg.ToChatId=command[3];
				msg.IsPersonal='false';
				msg.Txt=command[5]+'_+_'+command[4];
				msg.Style=Msg.Style;
				MsgShow(FormatMsg(msg),0);
			break;		
			
			case 'kick':
				if(My.chatid==toUser.chatid){				
					Mkick(Msg.ChatId,My.roomid,command[2],command[3]);				
				}
			break;
		}
	}
	else
	{
		var msgid="", containKey;
	if(Txt.indexOf('_+_')>-1){
		var t=Txt.split('_+_');
		msgid= t[0];
		Txt=t[1];
		containKey = t[2];
	}
	var msgBlockBt="";
	if(RoomInfo.msgBlock=="1" || containKey == 1){
		if(check_auth('msg_block'))	
		msgBlockBt=" <p  class='checkMessage' onclick='bt_msgBlock(\""+msgid+"\")'>屏蔽消息</p>";
	}
	
	var msgAuditBt="";
	var msgAuditShow='';
	if(RoomInfo.msgAudit=="1" || containKey == 1){
		msgAuditShow='style="display:none"';
		
		if(check_auth('msg_audit')){
			msgAuditBt=" <p  class='checkMessage' onclick='bt_msgAudit(\""+msgid+"\",this)' id='bt_audit_"+msgid+"'>审核通过</p>";
			msgAuditShow="";
		}
		if(User.chatid==My.chatid)msgAuditShow="";
		
	}
        if( My.chatid==toUser.chatid ){toUser.nick='我';}
	var who=" notmine ";	
	if(User.color=='2'){
		who=" manage";
	}
	else if(User.color=='3'||User.color=='4'){
		who=" teacher";
	}
	if(Msg.Style=='Sendredbag') { 
		who=" redbag";
	} else if (Msg.Style=='appsend') {
		who=" appsend";
	} 
	var deviceType = Msg.device;	
	
		if(toUser.chatid != "ALL"){
			if( My.chatid == User.chatid ) { //手机端私聊
				str='<div style="clear:both; height:0px;"></div>' + 
					'<div class="msg layim_chateme" id="'+msgid+'">' + 
						'<div class="msg_content">' +
							'<div>' +
								'<font class="date">'+date+'</font>' +
								'<font class="u"  >'+User.nick+'</font>&nbsp;&nbsp;' +
								'<img src="'+User.touxiang+'" class="msg_group_ico" >' +
							'</div>' +
							'<div class="layim_chatsay">' +
								'<font  style="'+Msg.Style+';" >'+Txt+'</font>' +
							'</div>' +
						'</div>' +
					'</div>' +
					'<div style="clear:both; height:0px;"></div>';
			} else {
				if (Msg.IsPersonal == 'true' && My.chatid == Msg.ToChatId) { // 手机端系统管理员或客服跟用户私聊
				str='<div style="clear:both; height:0px;"></div><div class="msg layim_chatehe" id="'+msgid+'" '+msgAuditShow+'><div class="msg_head"><img src="'+User.touxiang+'" class="msg_group_ico" ></div><div class="msg_content"><div><font class="u"  >'+User.nick+'</font>&nbsp;&nbsp;<font class="date">'+date+'</font></div><div class="layim_chatsay"><font  style="'+Msg.Style+';" >'+Txt+'</font></div>'+msgBlockBt+msgAuditBt+'</div></div><div style="clear:both; height:0px;"></div>';
				} else { //仅仅是对谁说
					str='<div style="clear:both; height:0px;"></div><div class="msg'+who+'" id="'+msgid+'" '+msgAuditShow+'><div class="msg_head"><img src="'+User.touxiang+'" class="msg_group_ico" ></div><div class="msg_content"><div><font class="u"  >'+User.nick+'</font>&nbsp;&nbsp;<font class="dui">对</font> <font class="u" >'+toUser.nick+'</font> 说 <font class="date">'+date+'</font></div><div class="layim_chatsay"><font  style="'+Msg.Style+';" >'+Txt+'</font></div>'+msgBlockBt+msgAuditBt+'</div></div><div style="clear:both; height:0px;"></div>';
			}
			}
	    } else {
		str='<div style="clear:both; height:0px;"></div><div class="msg'+who+'" id="'+msgid+'" '+msgAuditShow+'><div class="msg_head"><img src="'+User.touxiang+'" class="msg_group_ico" ></div><div class="msg_content"><div><font class="u"  >'+User.nick+'</font>&nbsp;&nbsp;<font class="date">'+date+'</font>';
		if (deviceType != null && deviceType != '' && deviceType != 'computer') {
			var transDeviceType = '安卓手机';
			if (deviceType == 'ios') {
				transDeviceType = '苹果手机';
      }
			str += '<img src="/images/ny_' + deviceType + '_icon.png" title="' + transDeviceType + '">';
	}
		str += '</div><div class="layim_chatsay" ><font  style="'+Msg.Style+';" >'+Txt+'</font></div>'+msgBlockBt+msgAuditBt+'</div></div><div style="clear:both; height:0px;"></div>';
      }
	}
	return str;
	
}
function sysend_command(cmd,value){ 
    var Msg='';
   switch(cmd){
                                 case 'hongbaoinfo':
					Msg+='C0MMAND_+_'+cmd+'_+_'+value+'_+_'+My.nick;
					IsPersonal='false';
                                        var msgid=randStr()+randStr();
                                        var neirong=value.split('_+_');
                                        var str='<div class="message-wrap"><div class="redbag-info1"><p style="color:#333;">'+My.nick+' 领取了 <span style="color:red;">'+neirong[0]+'</span> 的红包获得 <span style="color:red;">'+neirong[1]+'元</span></p></div><div class="clear"></div></div>';
				  PutMessage(My.rid,My.chatid,'hongbao',My.nick,'ALL','false','padding:0px;',str,msgid);
                                break;
                          
				default:
					Msg+='C0MMAND_+_'+cmd+'_+_'+value;
					IsPersonal='false';
					//ToUser.id='ALL';
				break;
			}
			if(Msg!='')
			{	
				
				//var str='SendMsg=M='+touser+'|'+IsPersonal+'|'+Style+'|'+Msg;
                               var str = '{"type":"SendMsg","ToChatId":"ALL","IsPersonal":"'+IsPersonal+'","Style":"","device":"","tanmu":"false","Txt":"'+Msg+'"}'; 
				ws.send(str);
				
			} 
}
function WriteMessage(txt){
	//if(txt.indexOf('SendMsg')!=-1)
	

	var Msg;
	try{
		Msg=eval("("+txt+")");
	}catch(e){return;}
	if(Msg.stat!='OK')
	{
		if(Msg.stat=="MaxOnline"){
			document.body.innerHTML='<div  style="font-size:12px; text-align:center; top:100px; position:absolute;width:100%">O.O 对不起，服务端并发数已满！请您联系管理员对系统扩容升级！<br><br></div>';
			return;
			}
		return ;
	}
	switch(Msg.type)
	{
		case "Ulogin":
			var U=Msg.Ulogin;
			var vip_msg="到来";
			var date= Datetime(0);
			var str='<span class="info">欢迎：<font class="u" onclick="ToUser.set(\''+U.chatid+'\',\''+U.nick+'\')">'+U.nick+'</font>  <font class="date">'+date+'</font></span>';
			if(My.chatid!=U.chatid){
			UserList.add(U.chatid,U);
			}
			var type=0;
			if(U.chatid==My.chatid) type=2;
			//MsgShow(str,type);
			/*进入直播间提醒 start
			if ($('#whocomein div').length >= 4) {
				$('#whocomein div')[0].remove();
			}
			var $_div = $('<div class="fsl-come2">' + 
    				    	'<span>' + U.nick + ' </span>进入直播间' + 
						'</div>');
			$('#whocomein').prepend($_div);
			$_div.animateCss("bounceInLeft");
			setTimeout(function() {
                $_div.animateCss("bounceOutLeft", function() {
                    $_div.remove()
                });
        	}, 3e3);
        	进入直播间提醒 end*/
		break;
		case "UMsg":
			var str=FormatMsg(Msg.UMsg);
                        if(!str)return;
            if(Msg.UMsg.IsPersonal!='true') {
				MsgShow(str,1);
                if(Msg.UMsg.tanmu == 'true'){
                    str=Msg.UMsg.Txt.split('_+_');
                    // writeBarrage(decodeURIComponent(str[1]));
                    var maskW = $('#mvMask').width();
                    var maskH = $('#mvMask').height();

                    var div = $('<div>' + decodeURIComponent(str[1]) + '</div>');
                    div.find("img").each(function(){
		            	$(this).remove();
		          	});
		          	// div.prepend('<img src="/images/icon_qq.png">');
					$('#mvMask').append(div);
			        var height = Math.floor(Math.random()*(maskH-50));

			        div.css({'top':height,'width':div.width() + 16 + 2});
			        div.animate({right:maskW},6000,'linear',function(){
			            div.remove();
			        });   
                };
			}
			else {
				/*私聊*/
			    if(Msg.UMsg.ToChatId==My.chatid) {
			    	var User=UserList.get(Msg.UMsg.ChatId);
			    	var fromChatId = Msg.UMsg.ChatId;
			    	var currentFromChatId;
			    	/*判断弹框是否存在*/
                    if ($('.layui-m-whisper').length <=0) {
                    	openWhisperWindow(null, false);
                    }
			    	/*判断发送消息的是否是当前私聊的对象*/
			    	if (fromChatId != currentFromChatId) { /*发送消息的不是当前聊天对象*/
						var li = $('#chat-item-user-' + fromChatId);
						/*判断是否有该私聊的tab列表*/
 						if (li.length <= 0) { /*如果没有添加tab列表则添加聊天框和加载历史记录*/
							var defaultVal = 1;
							if ($('#current-chat-user').data('value') == undefined) {
								defaultVal = 0;
							}
							var _li = ' <li data-id="' + fromChatId +'" data-nick="' + User.nick + '" id="chat-item-user-'+ fromChatId+'">' + 
	                  						'<span><b class="chat-user-num" style="display:none">' + defaultVal + '</b>' + User.nick + '</span>' + 
	              						'</li>';
							$('ul.chat-user-list').append(_li);
							/*历史记录*/
							$.ajax({
								type:'GET',
								dataType:'JSON',
								url:'/ajax.php?act=mymsgold&tuid='+fromChatId,
								success:function(data){
									var $usercontainer = $('<div id="user-container-' + fromChatId + '"></div>');
									$('.layui-m-layercont').append($usercontainer);
									$usercontainer.append(data.msg);
									$('.layui-m-layercont').scrollTop($('.layui-m-layercont')[0].scrollHeight);
									if ($('#current-chat-user').data('value') != undefined) {
										$('.chat-user-list li[data-id=' + fromChatId + '] span b').css('display', 'inline');
										$('.chat-user-list li[data-id=' + fromChatId + '] span b').text(1);
									    $usercontainer.hide();
									} else {
										$('#current-chat-user').text(User.nick);
										$('#current-chat-user').data('value', fromChatId);
										currentFromChatId = fromChatId;
									}
								}
							});
						
							$('#chat-item-user-' + fromChatId).click(function() {
								currentFromChatId = $(this).data('id');
								$('#current-chat-user').text($(this).data('nick'));
								$('#current-chat-user').data('value', currentFromChatId);
								$('.chat-user-list').hide();

								var $chatdl = $('#user-container-' + currentFromChatId);

								$chatdl.show();
								$chatdl.siblings().hide();
								$('.chat-user-list li[data-id=' + $(this).data('id') + '] span b').text(0);
								$('.chat-user-list li[data-id=' + $(this).data('id') + '] span b').css('display', 'none');	
								$('.layui-m-layercont').scrollTop($('.layui-m-layercont')[0].scrollHeight);
							});
						} else {  /*私聊的tab已经存在直接添加消息*/
							/*如果不是当前聊天对象则添加消息记录条数提醒*/
							if (fromChatId != $('#current-chat-user').data('value')) {
								$('.chat-user-list li[data-id=' + fromChatId + '] span b').css('display', 'inline');
								var num = parseInt($('.chat-user-list li[data-id=' + fromChatId + '] span b').text());
								$('.chat-user-list li[data-id=' + fromChatId + '] span b').text( num + 1);
							}
							$('#user-container-' + fromChatId).append(str);
							$('#user-container-' + fromChatId + ' .checkMessage').remove();
							$('.layui-m-layercont').scrollTop($('.layui-m-layercont')[0].scrollHeight);	
						}
			    	} else { /*发送消息的是当前聊天的对象*/
			    		$('#user-container-' + currentFromChatId).append(str);
			    		$('#user-container-' + currentFromChatId + ' .checkMessage').remove();
			    		$('.layui-m-layercont').scrollTop($('.layui-m-layercont')[0].scrollHeight);	
			    	}
                } else if (Msg.UMsg.ChatId == My.chatid) { /*用户回复消息*/
					if ($('#user-container-' + Msg.UMsg.ToChatId).length >0) {
						$('#user-container-' + Msg.UMsg.ToChatId).append(str);	
						$('#user-container-' + Msg.UMsg.ToChatId + ' .checkMessage').remove();
						$('.layui-m-layercont').scrollTop($('.layui-m-layercont')[0].scrollHeight);
					}
			    }
            }
						
		break;
		case "UonlineUser":
			
			var onlineNum=Msg.roomListUser.length;
			for(i=0;i<onlineNum;i++)
			{
			var U=Msg.roomListUser[i]['client_name'];
			
			UserList.add(U.chatid,U);
			}
		break;
		case "Ulogout":
			var U=Msg.Ulogout;
			var date= Datetime(0);
			var str='<span class="info">用户：'+U.nick+'   离开！ <font class="date">'+date+'</font></span>';
			//MsgShow(str,0);
			UserList.del(U.chatid,U);
		break;
		case "SPing":
			//alert(Msg.SPing.time);
		break;
		case "Sysmsg":
			alert(Msg.Sysmsg.txt);
		break;
	}
	
}
function WriteMessage2(txt){
      var Msg;
	try{
		Msg=eval("("+txt+")");
	}catch(e){return;}
	
	switch(Msg.type)
	{
		
	
		case "UonlineUser":
			
			var onlineNum=Msg.roomListUser.length;
			for(i=0;i<onlineNum;i++)
			{
			var U=Msg.roomListUser[i];
			
			UserList.add(U.chatid,U);
			}
		break;
		case "Ulogout":
			var U=Msg.Ulogout;
			var date= Datetime(0);
			var str='<div style="height:22px; line-height:22px;">用户：<font class="u" onclick="ToUser.set(\''+U.chatid+'\',\''+U.nick+'\')">'+U.nick+'</font>   离开！ <font class="date">'+date+'</font></div>';
			//MsgShow(str,0);
			UserList.del(U.chatid,U);
		break;
		
	}
	
}
var pageii;
function OnInit(){
	OnSocket();
	Init();
	showLive();
	var headHeight = document.getElementById('#head_1').offsetHeight,
		footerHeight = $('#footer').height(),
		bodyH = document.body.offsetHeight;
	$("#sendBtn").click(function(){MsgSend();});
	$('#publicChat').height(bodyH - headHeight - footerHeight);
	$('#qqOnline .iframe-wrapper').height(bodyH - headHeight);
	$('#qqOnline .iframe-wrapper iframe').height(bodyH - headHeight);
	$('#register .iframe-wrapper').height(bodyH - headHeight);
	$('#register .iframe-wrapper iframe').height(bodyH - headHeight);
	$('#commonFrame .iframe-wrapper').height(bodyH - headHeight);
	$('#commonFrame .iframe-wrapper iframe').height(bodyH - headHeight);
	$('#adminContent').height(document.body.offsetHeight - headHeight);
        $(".qqchat").click(function(){
        pageii=layer.open({title: [
      '高级助理',
      'background-color: #FF4351; color:#fff;'
    ],type: 1,content: $("#qqchat_win").html() });
        });
       // MsgAutoScroll();
           //游客直播体验时间是否结束
        if(My.chatid.indexOf('x')>-1 && RoomInfo.tiyantime>0){
    access_time();
    setInterval("access_time()",1000*60*1);
   
    }
       if(RoomInfo.loginguest==0 && My.chatid.indexOf('x')>-1){
  layer.open({
    content: '请先登录',
    shadeClose: false,
      style: ' width: 300px; height: 130px;',
    btn: ['登录', '注册'],
    yes: function(index){
    window.location.href='../minilogin.php?rid='+My.rid
     
    },
     no: function(index){
    window.location.href='../minilogin.php?a=0&rid='+My.rid
     
    }
  });
    }
        getsysmsg();
    if(RoomInfo.autoplan==1){
	 setInterval(function() {
	    	getkaijiangApi('pk10');
	   }, 60000);
       }
    MsgAutoScroll();
    getTabMenu();
    $("nav").delegate('#tabMenu>li', 'click', function(){
        var d = $(this).index();
        var moreMenuShow = $('.reorder').length;
        // 0:聊天 | 1:在线管理 
        if (0 == d) {
        	$('#announcement').show();
        	$('.leftAside').show();
        	if(ISSHOWEGG) {
        		$('.pound-gold-egg').show();
        	}
        	$('.signin-container').show();

        	$(".publicChat,#footer").show();
        	$(".myCustomer,.kefuContent, #commonFrame,.adminContent").hide();
        } else {
        	$('#announcement').hide();
        	$('.leftAside').hide();
        	$('.pound-gold-egg').hide();
        	$('.signin-container').hide();
        }

        if (moreMenuShow != 0) {
        	if (d != 4) {
        		$(this).addClass("active").siblings().removeClass("active");
        		$('.more-menu li').removeClass('active');
        	} else if (4 == d) {
        		$('.more-menu').show();
        	}
        } else {
        	$(this).addClass("active").siblings().removeClass("active");
        }

        if (1 == d) {
			$(".adminContent, .kefuContent").show();
			$(".publicChat,#footer, #commonFrame").hide();
        } else if (0 != d && (moreMenuShow == 0 ||  4 != d)){
			var src = $(this).data('src');
			var target = $(this).data('win');
			if (target == 'LocalWin') {
				$('#commonFrame iframe').attr('src', src);
				$('#commonFrame').show();
				$(".publicChat,#footer, .kefuContent, .adminContent, .more-menu").hide();
			} else {
				window.location.href = src;
			}
        }
    });
	
	$('.more-menu').delegate('.menu-list>li','click',function() {
		var src = $(this).data('src');
		var target = $(this).data('win');
		if (target == 'LocalWin') {
			$('.reorder').addClass('active').siblings().removeClass('active');
			$(this).addClass('active').siblings().removeClass('active');
			$('#commonFrame iframe').attr('src', src);
			$('#commonFrame').show();
			$(".publicChat,#qqOnline,#footer, .kefuContent, #register, .adminContent, .more-menu").hide();
		} else {
			window.location.href = src;
		}
	});
    $(document).on('click', '#publicChat .more-message', function () {
        var page = parseInt($(this).attr('page'));
        if (!$(this).hasClass('no-more')) {
            ChatHistory(page + 1);
        }
    });
}
function getTabMenu() {
    // 从后台获取tabmenu
	  $.ajax({
	        type: 'GET',
	        dataType:'json',
	        url: '/ajax.php?act=mobileColumn',
	        success:function(data){
	        	var tabmenu = data;
			    if (tabmenu.length > 3) {
			    	$('#tabMenu li:nth-child(1)').addClass('spec1');
			    	var firstArr = tabmenu.slice(0, 2);
			    	$.each(firstArr, function(idx, item) {
			    		var _li = '<li data-src="' + item["url"] + '" data-win="' + item['target'] + '"><h2>' + item["title"] + '</h2></li>';
			    		$('#tabMenu').append(_li);
			    	});
			    	$('#tabMenu').append('<li class="reorder"><span class="fa fa-reorder"></span></li>');
			    	var secondArr = tabmenu.slice(2);
			    	$.each(secondArr, function(idx, item) {
			    		var _li = '<li class="menu-item" data-src="' + item["url"] + '" data-win="' + item['target'] + '">' + item["title"] + '</li>';
			    		$('.menu-list').append(_li);
			    	});
			    } else {
			    	if (tabmenu.length > 2) {
			    		$('#tabMenu li:nth-child(1)').addClass('spec3');
			    	} else {
			    		$('#tabMenu li:nth-child(1)').addClass('spec1');
			    	}
			    	
			    	$.each(tabmenu, function(idx, item) {
			    		var _li = '<li data-src="' + item["url"] + '" data-win="' + item['target'] + '"><h2>' + item["title"] + '</h2></li>';
			    		$('#tabMenu').append(_li);
			    	});
			    }
	        }
	    });
}
function onConnect()
{
	//setInterval("online('<?=$time?>')",10000);
              $.ajax({
                    type: 'POST',
                    dataType:'json',
                    url: '/ajax.php?act=createtoken',
                    // async: false, 
                    success:function(data){
                      if(data.token!=''){
                        var str = '{"type":"Login","roomid":"'+My.roomid+'","chatid":"'+My.chatid+'","nick":"'+My.nick+'","sex":"'+My.sex+'","touxiang":"'+My.touxiang+'","age":"'+My.age+'","qx":"'+My.qx+'","ip":"'+My.ip+'","vip":"'+My.vip+'","color":"'+My.color+'","cam":"'+My.cam+'","state":"'+My.state+'","mood":"'+My.mood+'","token":"'+data.token+'"}';
                        ws.send(str);   
                        }
                    }
                });
	
		
	if(typeof(UserList)!='undefined'){
		UserList.init();
	}
	
}
function icon3() {
    $("#icon3").click(function() {
        var a = $("head  title").text();
		
        postToWb(a)
    })
}
function icon2() {
    $("#icon2").click(function() {
        var a = $("head  title").text();
        postToXinLang(a)
    })
}
function icon4() {
    $("#icon4").click(function() {
        var a = $("head  title").text();
        postToQzone(a)
    })
}
function postToXinLang(a) {
    window.open("http://v.t.sina.com.cn/share/share.php?title=" + encodeURIComponent(a) + "&url=" + encodeURIComponent(location.href) + "&rcontent=", "_blank", "scrollbars=no,width=600,height=450,left=75,top=20,status=no,resizable=yes")
}
function postToQzone(a) {
    var b = encodeURI(a),
    c = encodeURI(a),
    d = encodeURI(document.location);
    return window.open("http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?title=" + b + "&url=" + d + "&summary=" + c),
    !1
}
function postToWb(a) {
    var b = encodeURI(a),
    c = encodeURI(document.location),
    d = encodeURI("appkey"),
    e = encodeURI(""),
    f = "",
    g = "http://v.t.qq.com/share/share.php?title=" + b + "&url=" + c + "&appkey=" + d + "&site=" + f + "&pic=" + e;
    window.open(g, "转播到腾讯微博", "width=700, height=680, top=0, left=0, toolbar=no, menubar=no, scrollbars=no, location=yes, resizable=no, status=no")
}
function showLive(){
	$("#video-win").html($("#video-win").html());
}
var intRegex = /^[0-9]+$/,
    floatRegex = /^[0-9]+(\.[0-9]+)?$/;
function verifyRedpackageNum() {
	var flag = true;
	var num = $.trim($('#redpackage-num').val());
	if (intRegex.test(num) && '0' != num) {
		num =  parseInt(num);
		if (num > 30) {
			$('#redpackage-num-tip').show();
			$('#redpackage-num-tip').text('红包数量最多是30个');
			$('#redpackage-num').val(30);
		}
	} else {
		if ('0' == num) {
			$('#redpackage-num-tip').show();
			$('#redpackage-num-tip').text('数量不能为0');
		} else {
			$('#redpackage-num-tip').show();
			$('#redpackage-num-tip').text('请填写正确的数量');	
		}
		flag = false;
	}
	return flag;
}
function verfifyRedpackageAmount() {
	var flag = true;
	var amount = $.trim($('#redpackage-amount').val());
	var realAmount, arrRealAmount, realInteger, realDecimal, sumAmount, arrSumAmount, sumInteger, sumDecimal;
	if (floatRegex.test(amount) && '0' != amount && '0.0' != amount && '0.00' != amount) {
		realAmount = $.trim($('#redpackage-amount').val());
		realAmount = Math.floor(realAmount * 100);
		if (realAmount < 200) {
			$('#redpackage-amount-tip').show();
			$('#redpackage-amount-tip').text('红包最低金额为2元');
			flag = false;
		} else {
			sumAmount = $.trim($("#MyMoney").val());
			sumAmount = Math.floor(100 * sumAmount);
			if (sumAmount < realAmount) {
				sumAmount /= 100;
				sumAmount.toString().indexOf(".") < 0 && (sumAmount += ".00");
	            arrSumAmount = sumAmount.toString().split(".");
	            sumInteger = parseInt(arrSumAmount[0], 10);
	            sumDecimal = arrSumAmount[1];
	            1 == sumDecimal.length && (sumDecimal += "0");
	            sumAmount = sumInteger + "." + sumDecimal;

				$('#redpackage-amount').val(sumAmount);
				$('#redpackage-amount-tip').show();
				$('#redpackage-amount-tip').text("余额不足 最多" + sumAmount + "元");
			} else {
	            realAmount /= 100;
	            realAmount.toString().indexOf(".") < 0 && (realAmount += ".00"), 
	            arrRealAmount = realAmount.toString().split("."), 
	            realInteger = parseInt(arrRealAmount[0], 10), 
	            realDecimal = arrRealAmount[1], 
	            1 == realDecimal.length && (realDecimal += "0"), 
	            realAmount = realInteger + "." + realDecimal, 
	            $('#redpackage-amount').val(realAmount);
			}
		}
	} else {
		if (('0' == amount || '0.0' == amount || '0.00' == amount)){
			$('#redpackage-amount-tip').text('金额不能为0');
		} else {
			$('#redpackage-amount-tip').text('请填写正确的金额');
		}
		$('#redpackage-amount-tip').show();
		flag = false;
	}
	return flag;
}
function Init(){
        var b = '<tr><td><img src="/room/face/pic/m/kx.gif" alt="狂笑" title="狂笑" width="28" height="28" /></td>';
        b += ' <td><img src="/room/face/pic/m/jx.gif" alt="贱笑" title="贱笑" width="28" height="28" /></td>',
        b += '<td><img src="/room/face/pic/m/tx.gif" alt="偷笑" title="偷笑" width="28" height="28" /></td>',
        b += '<td><img src="/room/face/pic/m/qx.gif" alt="窃笑" title="窃笑" width="28" height="28" /></td>',
        b += '<td><img src="/room/face/pic/m/ka.gif" alt="可爱" title="可爱" width="28" height="28" /></td>',
        b += '<td><img src="/room/face/pic/m/kiss.gif" alt="kiss" title="kiss" width="28" height="28" /></td>',
        b += '<td><img src="/room/face/pic/m/up.gif" alt="up" title="up" width="28" height="28" /></td>',
        b += '<td><img src="/room/face/pic/m/bq.gif" alt="抱歉" title="抱歉" width="28" height="28" /></td>',
        b += '<td><img src="/room/face/pic/m/bx.gif" alt="鼻血" title="鼻血" width="28" height="28" /></td></tr>',
        b += '<tr><td><img src="/room/face/pic/m/bs.gif" alt="鄙视" title="鄙视" width="28" height="28" /></td>',
        b += '<td><img src="/room/face/pic/m/dy.gif" alt="得意" title="得意" width="28" height="28" /></td>',
        b += '<td><img src="/room/face/pic/m/fd.gif" alt="发呆" title="发呆" width="28" height="28" /></td>',
        b += '<td><img src="/room/face/pic/m/gd.gif" alt="感动" title="感动" width="28" height="28" /></td>',
        b += '<td><img src="/room/face/pic/m/glian.gif" alt="鬼脸" title="鬼脸" width="28" height="28" /></td>',
        b += '<td><img src="/room/face/pic/m/hx.gif" alt="害羞" title="害羞" width="28" height="28" /></td>',
        b += '<td><img src="/room/face/pic/m/jxia.gif" alt="惊吓" title="惊吓" width="28" height="28" /></td>',
        b += '<td><img src="/room/face/pic/m/zong.gif" alt="囧" title="囧" width="28" height="28" /></td>',
        b += '<td><img src="/room/face/pic/m/kl.gif" alt="可怜" title="可怜" width="28" height="28" /></td></tr>',
        b += '<tr><td><img src="/room/face/pic/m/kle.gif" alt="困了" title="困了" width="28" height="28" /></td>',
        b += '<td><img src="/room/face/pic/m/ld.gif" alt="来电" title="来电" width="28" height="28" /></td>',
        b += '<td><img src="/room/face/pic/m/lh.gif" alt="流汗" title="流汗" width="28" height="28" /></td>',
        b += '<td><img src="/room/face/pic/m/qf.gif" alt="气愤" title="气愤" width="28" height="28" /></td>',
        b += '<td><img src="/room/face/pic/m/qs.gif" alt="潜水" title="潜水" width="28" height="28" /></td>',
        b += '<td><img src="/room/face/pic/m/qiang.gif" alt="强" title="强" width="28" height="28" /></td>',
        b += '<td><img src="/room/face/pic/m/sx.gif" alt="伤心" title="伤心" width="28" height="28" /></td>',
        b += '<td><img src="/room/face/pic/m/suai.gif" alt="衰" title="衰" width="28" height="28" /></td>',
        b += '<td><img src="/room/face/pic/m/sj.gif" alt="睡觉" title="睡觉" width="28" height="28" /></td></tr>',
        b += '<tr><td><img src="/room/face/pic/m/tz.gif" alt="陶醉" title="陶醉" width="28" height="28" /></td>',
        b += '<td><img src="/room/face/pic/m/wbk.gif" alt="挖鼻孔" title="挖鼻孔" width="28" height="28" /></td>',
        b += '<td><img src="/room/face/pic/m/wq.gif" alt="委屈" title="委屈" width="28" height="28" /></td>',
        b += '<td><img src="/room/face/pic/m/xf.gif" alt="兴奋" title="兴奋" width="28" height="28" /></td>',
        b += '<td><img src="/room/face/pic/m/yw.gif" alt="疑问" title="疑问" width="28" height="28" /></td>',
        b += '<td><img src="/room/face/pic/m/yuan.gif" alt="晕" title="晕" width="28" height="28" /></td>',
        b += '<td><img src="/room/face/pic/m/zj.gif" alt="再见" title="再见" width="28" height="28" /></td>',
        b += '<td><img src="/room/face/pic/m/zan.gif" alt="赞" title="赞" width="28" height="28" /></td>',
        b += '<td><img src="/room/face/pic/m/zb.gif" alt="装逼" title="装逼" width="28" height="28" /></td></tr>',
        b += '<tr><td><img src="/room/face/pic/m/bd.gif" alt="被电" title="被电" width="22" height="22" /></td>',
        b += '<td><img src="/room/face/pic/m/gl.gif" alt="给力" title="给力" width="22" height="22" /></td>',
        b += '<td><img src="/room/face/pic/m/hjd.gif" alt="好激动" title="好激动" width="22" height="22" /></td>',
        b += '<td><img src="/room/face/pic/m/jyl.gif" alt="加油啦" title="加油啦" width="22" height="22" /></td>',
        b += '<td><img src="/room/face/pic/m/jjdx.gif" alt="贱贱地笑" title="贱贱地笑" width="22" height="22" /></td>',
        b += '<td><img src="/room/face/pic/m/lll.gif" alt="啦啦啦" title="啦啦啦" width="22" height="22" /></td>',
        b += '<td><img src="/room/face/pic/m/lm.gif" alt="来嘛" title="来嘛" width="22" height="22" /></td>',
        b += '<td><img src="/room/face/pic/m/lx.gif" alt="流血" title="流血" width="22" height="22" /></td>',
        b += '<td><img src="/room/face/pic/m/lgze.gif" alt="路过这儿" title="路过这儿" width="22" height="22" /></td></tr>',
        b += '<tr><td><img src="/room/face/pic/m/qkn.gif" alt="切克闹" title="切克闹" width="22" height="22" /></td>',
        b += '<td><img src="/room/face/pic/m/qgz.gif" alt="求关注" title="求关注" width="22" height="22" /></td>',
        b += '<td><img src="/room/face/pic/m/tzuang.gif" alt="推撞" title="推撞" width="22" height="22" /></td>',
        b += '<td><img src="/room/face/pic/m/ww.gif" alt="威武" title="威武" width="22" height="22" /></td>',
        b += '<td><img src="/room/face/pic/m/wg.gif" alt="围观" title="围观" width="22" height="22" /></td>',
        b += '<td><img src="/room/face/pic/m/xhh.gif" alt="笑哈哈" title="笑哈哈" width="22" height="22" /></td>',
        b += '<td><img src="/room/face/pic/m/zc.gif" alt="招财" title="招财" width="22" height="22" /></td>',
        b += '<td><img src="/room/face/pic/m/zf.gif" alt="转发" title="转发" width="22" height="22" /></td>',
        b += '<td><img src="/room/face/pic/m/zz.gif" alt="转转" title="转转" width="22" height="22" /></td></tr>';
	commonExpression = b;
$("#video-flash").click(function(){showLive()});
$("body").click(function() { $(".setting-expression-layer").hide() });
$("#footer .smile img").click(function(a) {
    if (a.stopPropagation(), 0 == $("#expressions").find(".expr-tab").find("tr").length) {
        $("#expressions").find(".expr-tab").append(b),
        $(".setting-expression-layer").show();
        $("#expressions").find(".expr-tab").find("img").click(function() {
            var a = $(this).attr("src");
            $("#messageEditor").focus(),
            document.execCommand("insertImage", null, a),
            $(this).closest(".setting-expression-layer").hide()
        })
    } else $(".setting-expression-layer").toggle()
});
    $("#sharedBtn").click(function() {
        var a = '';
        a += "<ul>",
        a += '<li onclick="icon3()" id="icon3" class="weui-btn weui-btn_default share-item"><img src="images/tx.png" width="44px" height="44px">分享到腾讯微博</li>',
        a += '<li onclick="icon2()" id="icon2" class="weui-btn weui-btn_default share-item"><img src="images/sina.png" width="44px" height="44px">分享到新浪微博</li>',
        a += '<li onclick="icon4()" id="icon4" class="weui-btn weui-btn_default share-item"><img src="images/qz.png" width="44px" height="44px">分享到QQ空间</li>',
        a += '<li class="sharedClose weui-btn weui-btn_default">取消</li>',
        a += "</ul>",
        $("#shared").empty().append(a),
        $("#sharedWrap").show(),
        $("#shared").show(),
        $("#shared .sharedClose").click(function() {
            $("#shared, #sharedWrap").hide();
        })
    });
	$('.leftAside').click(function() {
		$("#sharedWrap, #redpackage").show();
		$('#redpackage-num').val('');
		$('#redpackage-amount').val('');
		$('.btn-confirm').show();
		$('.btn-sending').hide();
		$('#redpackage-num-tip').hide();
		$('#redpackage-amount-tip').hide();
		setInterval(function() {
			var redpackageNum = $('#redpackage-num').val(),
				redpackageAmount = $('#redpackage-amount').val(),
				hasClass = $('.btn-confirm').hasClass('weui-btn_disabled');
				if ($.trim(redpackageNum) != '' && $.trim(redpackageAmount) != '') {
					if (hasClass) {
						$('.btn-confirm').removeClass('weui-btn_disabled');
					}
				} else {
					if (!hasClass) {
						$('.btn-confirm').addClass('weui-btn_disabled');
					}
				}

		}, 1000);
	});
	$('#redpackage-num').blur(function() {
		verifyRedpackageNum();
	});
	$('#redpackage-amount').blur(function() {
		verfifyRedpackageAmount();
	});
	$('.btn-confirm').click(function(){
		var hasClass = $('.btn-confirm').hasClass('weui-btn_disabled');
		if (!hasClass) {
			$('.btn-sending').show();
			$('.btn-confirm').hide();
			var amount = $.trim($('#redpackage-amount').val()),
	        	num = $.trim($('#redpackage-num').val()),
	        	remarks = $('#redpackapge-remarks').val(),
	        	realAmount,flag = true;
	        if (remarks == '') {
	        	remarks = $('#redpackapge-remarks')[0].placeholder;
	        }
	        // 检查个数
	    	flag = verifyRedpackageNum();
	    	//检查金额
	    	flag = verfifyRedpackageAmount();

	        if (flag) {
			    $.post(
			    	"/apps/redbag/index.php?act=SendMoneygift", 
			    	{amount: amount, num: num, memos: remarks},  
			        function(res) {
			        	if (res == null) {
			        		layer.open({content: '登录后才能发送红包哦！' ,skin: 'msg',time: 2});
			        		$('.cancel-send-redpackage').click();
			        		return;
			        	}
                    	var sendRedPackageResTip,neir,str,msgid;
                    	var deviceType = '';
                 		if(device.iphone()) {
							deviceType = 'ios';
						} else if(device.ios()) {
							deviceType = 'ios';
						} else if(device.ipad()) {
							deviceType = 'ios';
						}else if(device.mobile()) {
							deviceType = 'android';
						}
						
                     	"ok" == res.status ? 
                     	(
                     		$('.cancel-send-redpackage').click(),
                     		$("#MyMoney").val($("#MyMoney").val() - amount),
                     		sendRedPackageResTip = '<div id="setEnvelopeOK"><p class="tipOK">红包发送成功!</p><div class="OK cursor">好的</div></div>', 
                     		$("body").append(sendRedPackageResTip), 
                     		center("#setEnvelopeOK", !0), 
                    		neir =
                    			'<div class="content-detail" moneygiftid="'+res.id+'">' + 
                    				'<div class="redbag-top" title="'+res.beizhu+'" adminname="" isrobot="0" >' + 
                    					'<div class="fl"><img src="/images/hongbao.png" style="margin-top: 3px;"></div>' + 
                    					'<div class="fl ml10" style="color:#fff;">' + 
                    						'<p style="font-weight:bold;margin-bottom:4px;color:#f30;font-size:14px;">'+res.beizhu+'</p>' + 
                    						'领取红包' + 
                    					'</div>' + 
                    				'</div>' + 
                    				'<div style="padding:3px 10px;">直播室红包</div>' + 
                    			'</div>',
		                   	msgid=randStr()+randStr(),
		                   	str = '{"type":"SendMsg","ToChatId":"ALL","IsPersonal":"false","Style":"Sendredbag","tanmu":"false","Txt":"'+msgid+'_+_'+encodeURIComponent(neir)+'","device":"' + deviceType + '"}',
		                   	ws.send(str),
		                	PutMessage(My.rid,My.chatid,'Sendredbag',My.nick,'ALL','false','padding:0px;',neir,msgid,'false',deviceType),
		                    $("#setEnvelopeOK .OK").click(function() {
		                        $("#setEnvelopeOK").remove(),
		                        setTimeout("$('#meetredbag').show();", 800)
		                    })
                    	) : alert('发送失败');
			        }, 
			        "json");
	        } else {
				$('.btn-sending').hide();
				$('.btn-confirm').show();
	        }
		}
	});
	$('.cancel-send-redpackage').click(function() {
		$('#sharedWrap, #redpackage').hide();
 		$('#redpackage-amount').val('');
 		$('#redpackage-num').val('');
 		$('#redpackapge-remarks').val('');
	})
	$('.change-content').click(function() {
		var tmp = $('.change-content').text();
		if (tmp == '改为普通红包') {
			$('.change-content').text('改为拼手气红包');
			$('#fixed-amount-tip').show();
		} else {
			$('.change-content').text('改为普通红包');
			$('#fixed-amount-tip').hide();
		}
	});
    $('.more-function').click(function() {
    	$('.more-function-container').show();
    	var h = $('.more-function-container').height();
    	$('#footer').css('bottom', h);
    	$('.setting-expression-layer .expression').css('bottom', h);
    });
    $(document).bind("click",function(e){
        if($(e.target).closest("#moreFunction").length == 0) {
	    	$('.more-function-container').hide();
	    	$('#footer').css('bottom', 0);
	    	$('.setting-expression-layer .expression').css('bottom', 0);
		}
		if($(e.target).closest(".user-info-container").length == 0) {
			$('.account-info-box').hide();
		}
		if($(e.target).closest(".reorder").length == 0) {
			$('.more-menu').hide();
		}
    });

    $('#shutBtn').click(function(){  
	    if($('#shutinfo').html()=='禁言'){  
	     	if(check_auth('room_admin')){
				sysend_command('BanSpeak',1);
				$.ajax({type: 'get',url: '../../ajax.php?act=ban_speak&ban_speak_status=1&rid='+My.rid});
			}
	    }else{  
	        if(check_auth('room_admin')){
				sysend_command('BanSpeak',0);
				$.ajax({type: 'get',url: '../../ajax.php?act=ban_speak&ban_speak_status=0&rid='+My.rid});
			}
	    }  
	}); 

    $('#barrageBtn').click(function(){  
	    if($('#barrageInfo').html()=='关闭'){ 
	    	barrage = false;
	    	$('#barrageInfo').html('开启');
	    	$('#barrageBtn').css('background-color', 'white');
	    	$('.barrage .show').empty();
	    } else { 
	    	barrage = true;
	    	$('#barrageInfo').html('关闭');
	    	$('#barrageBtn').css('background-color', 'gainsboro');
	    	layer.open({content: '发送一条弹幕，消费1积分' ,skin: 'msg',time: 2});
		}
	});
	/*显示编辑用户信息/退出的导航菜单*/
	$('.login-info .user-info-container').click(function() {
		$('.account-info-box').show();
	})
	/*砸金蛋*/
	 var goldEgg;
	 var poundGoldEggOldTime, poundGoldEggNewTime;

	$(".pound-gold-egg").click(function () {
	    if(My.chatid.indexOf('x')>-1) {
			layer.open({
			    content: '请登录后再来砸礼品吧！'
			    ,btn: ['确定']
			    ,yes: function(index) {
		            layer.close(index);
		            window.location.href='../minilogin.php?rid='+My.rid;
		            return;
	        	}
			});
	    } else {
	        $('.egg-code-container').show();
	    }
	});
	$('.egg-code-container .colseLogin').click(function() {
	    $(this).parent().parent().hide();
	});
	$('.egg-code-container #submitCode').click(function() {
	    var code = $('#codeInput').val();
	    $.ajax({
	         url: "/apps/poundgoldegg/poundgoldegg.php?act=codecheck",  
	         type: "POST",
	         data:{luckcode:code,rid:My.rid},
	         error: function(error){
	            console.log(error);  
	             alert('Error loading XML document');  
	         },  
	         success: function(data){ 
	            if(data=='success'){
	                goldEgg= layer.open({
	                        type: 1,
	                        anim: 'up',
	                        content: '<iframe src="/apps/poundgoldegg/index.php?code='+code+'&rid='+My.rid+'width="300px" height="468px" style="border:none"></iframe>',
	                        style: "box-shadow:none;background-color: transparent"
	                    });
	                $('.egg-code-container').hide();
	            }else if(data=='nohave'){
	                alert("抽奖码不正确");
	            }else if(data=='isuse'){
	                alert("抽奖码已被使用");
	            }
	         }
	     });
	});

	$(".signin-container").click(function () {
	    if(My.chatid.indexOf('x')>-1) {
			layer.open({
			    content: '请登录后再来签到吧！'
			    ,btn: ['确定']
			    ,yes: function(index) {
		            layer.close(index);
		            window.location.href='../minilogin.php?rid='+My.rid;
		            return;
	        	}
			});
	    } else {
	    	// window.location.href='/apps/signin/signin.php?rid='+My.rid;
			layer.open({
                type: 1,
                anim: 'up',
                content: '<iframe src="/apps/signin/signin.php?rid='+My.rid+'&isMobile=true" width="350px" height="468px" style="border:none"></iframe>',
                style: "box-shadow:none;background-color: transparent"
            });
	    }
	});
} 

function showsyssmg(txt){
	//alert(txt);
	var date= Datetime(0);

	var s='<div style="clear:both;"></div><div class="msg system-msg" ><div class="msg_head"><img src="/images/sys.png"></div><div class="msg_content"><div><font class="u"  >系统消息</font>   <font class="date">&nbsp;&nbsp;'+date+'</font></div> <div class="layim_chatsay"><font style="color:#fff">'+txt+'</font></div></div></div><div style="clear:both;"></div>';
	//var  s='<div style="clear:both;"></div><div class="lts_right3"><span class="time">'+date+'</span><img src="/images/sys.png" class="RoomUserRole"><a class="name" style="color:#FFF68F;" href="javascript:void(0)" >系统消息</a><span class="to_m" style="color:rgb(255, 0, 0); font-size:15pt;font-family: KaiTi_GB2312;font-weight:bold;">'+txt+'</span></div>';
	
	MsgShow(s,0);
}
function showplan(txt){
	//alert(txt);
	var date= Datetime(0);

	var s='<div style="clear:both;"></div><div class="msg teacher" ><div class="msg_head"><img src="/face/p1/null.jpg"></div><div class="msg_content"><div><font class="u"  >机器人</font>   <font class="date">&nbsp;&nbsp;'+date+'</font></div> <div class="layim_chatsay"><font style="color:#fff">'+txt+'</font></div></div></div><div style="clear:both;"></div>';
	
	MsgShow(s,0);
}
function getsysmsg(){
  
	$.getJSON("../../ajax.php?act=getsysmsg","rid="+My.rid,
	function(data){
        
		if(data.state=='1'){
			data.sysmsg_id=0;
			timer_fun=function(){
				if(data.info.length<1)return;
				if(data.fangshi=="1"){
                                    data.sysmsg_id=Math.ceil(Math.random()*(data.info.length-1));
					
				}else{
					if(data.sysmsg_id>=data.info.length){data.sysmsg_id=0;}
				
				}
				showsyssmg(data.info[data.sysmsg_id++]);
			}
			timer_fun();
                        if(data.fangshi!='3'){
			setInterval('timer_fun()',data.jiange*1000);
                        }
		}
	});
}
function getkaijiangApi(apiname) {
    $.ajax({
        type: 'get',
        dataType:'html',
        url: '/getplan.php?rid='+My.rid,
        success:function(data){
              if(data!=''){
            showplan(data);
            }	
          }
      }); 
}
function getmsg(){
   $.ajax({type: 'get',dataType:'text',url: 'ajax.php?act=getmsg',
				success:function(data){
                                 
					$("#publicChat").append(data);
	MsgAutoScroll();
				}}); 
    
    
}


//红包
function center(a, b) {
     b &&
    function(a) {
        var b = $(a),
        c = ($(window).width() - b.outerWidth()) / 2;
        b.css({
            left: c
        })
    } (a),
    function(a) {
        var e, f, b = $(a),
        c = b.outerHeight(),
        d = $(window).height();
        c > d ? (b.css("top", "0px"), e = 0) : (f = (d - c) / 2, b.css("top", f + "px"), e = f)
    } (a)
}
//设置cookies
function setCookie(name,value)
{
    var Days = 30;
    var exp = new Date();
    exp.setTime(exp.getTime() + Days*24*60*60*1000);
    document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();

}
function bt_msgBlock(id){
		sysend_command('msgBlock',id);
                 $.ajax({type: 'get',url: '../../ajax.php?act=msgblock&s=1&msgid='+id});
}
function bt_msgAudit(id,a){
		sysend_command('msgAudit',id);
		$(a).hide();
                $.ajax({type: 'get',url: '../../ajax.php?act=msgblock&s=0&msgid='+id});
}
//读取cookies
function getCookie(name)
{
    var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
 
    if(arr=document.cookie.match(reg))
 
        return (arr[2]);
    else
        return null;
}
function access_time(){	
    var first_access_time=  getCookie("first_access_time");
    var time_now =new Date().getTime();
    time_now=parseInt(time_now/1000);
    if((time_now-first_access_time)>(RoomInfo.tiyantime*60)){ 
  
        $('#video-win').html('<table width="100%" height="100%" cellpadding="0" cellspacing="0" border="0"><tbody><tr><td align="center"><img src="/room/images/xm.png"></td></tr></tbody></table>');
    }
}
function Hongbao(hbid){
   
        if(My.chatid.indexOf('x')>-1){
            window.location.href="../../room/minilogin.php"; 
         // openWin(2,false,'room/minilogin.php',390,310);
          return;
        }
        var json,hbid,json, mobile, mymoney, money1, success, fail, had;
        //  hbid  = $(this).attr("moneygiftid")
           $.post("/apps/redbag/index.php?act=GetMoneygift", {
        customerId: My.chatid,
        moneyGiftId: hbid
    },
    function(data) {
        data && (json = eval("(" + data + ")"),
          $("#successredbag,#meetredbag,#hadredbag,#lookredbag,#lookthisbag,#failredbag").remove(), 1 == json.status ? (mymoney = $.trim($("#MyMoney").val()), mymoney = Math.floor(100 * mymoney), money1 = $.trim(json.amount), money1 = Math.floor(100 * money1), mymoney = (mymoney + money1) / 100, $("#MyMoney").val(mymoney), success = '<div id="successredbag">', success += '<div class="redbagclose"></div>', success += "" != json.senderAvatar ? '<div class="img"><img src="' + json.senderAvatar + '" width="65" height="65"></div>': '<div class="img"><img src="../images/avatar/52/01.png" width="65" height="65"></div>', success += '<p style="margin-top:5px;font-size: 14px;color:#000;">' + json.senderName + "的红包</p>", success += '<p class="p1" style="margin-top:5px; font-size: 12px;color: #CCC;height:19px;">' + json.moneygiftTitle + "</p>", success += '<div class="money bagred">' + json.amount + '<span style="color:#333;font-size: 14px;">元</span></div>', success += '<p class="baginformation">已领取' + json.robcount + "/" + json.allcount + "个，共" + json.realityMoney + "元</p>", success += '<div class="HBlist">', $.each(json.rows,
        function(a, b) {
            success += '<div class="list-info">',
            success += null != b.senderAvatar ? '<div class="user-img"><img src="' + b.senderAvatar + '" width="35" height="35"></div>': '<div class="user-img"><img src="../images/avatar/52/01.png" width="35" height="35"></div>',
            success += '<div class="list-right">',
            success += '<div class="list-right-top">',
            success += '<div class="user-name fl f14">' + b.nickname + "</div>",
            success += '<div class="user-money fr f14">' + b.getmoney + "元</div></div>",
            success += '<div class="user-time">' + b.addtime + "</div>",
            success += "</div></div>"
        }), success += "</div>", success += '<div class="minebag1 cursor">查看我的红包>></div>', success += "</div>", $("body").append(success), center("#successredbag", !0), $(".minebag1").click(function() {
            minebag()
        }),sysend_command('hongbaoinfo',json.senderName+'_+_'+json.amount)) : 0 == json.status ? (fail = '<div id="failredbag">', fail += '<div class="redbagclose"></div>', fail += "" != json.senderAvatar ? '<div class="img"><img src="' + json.senderAvatar + '" width="60" height="60"></div>': '<div class="img"><img src="../images/avatar/52/01.png" width="60" height="60"></div>', fail += '<p style="margin-top: 15px;">' + json.senderName + "</p>", fail += '<p class="memos">手慢了，红包派完了！</p>', fail += '<div class="lookthisbag">看看大家的手气>></div>', fail += "</div>", $("body").append(fail), center("#failredbag", !0), $(".lookthisbag").click(function() {
            thisbag(hbid)
        })) : (had = '<div id="hadredbag">', had += '<div class="redbagclose"></div>', had += "" != json.senderAvatar ? '<div class="img"><img src="' + json.senderAvatar + '" width="60" height="60"></div>': '<div class="img"><img src="../images/avatar/52/01.png" width="60" height="60"></div>', had += '<p style="margin-top: 15px;">' + json.senderName + "</p>", had += '<p class="memos mt10">您已经抢过这个红包了!</p>', had += '<div class="minebag cursor f14">看看大家的手气>></div>', had += "</div>", $("body").append(had), center("#hadredbag", !0), $(".minebag").click(function() {
            thisbag(hbid)
        }))
   ) })
    }
   
    var thisbag,minebag;
  thisbag= function(moneyGiftId) { 
   $.post("/apps/redbag/index.php?act=GetMoneygiftList",{ 
       moneyGiftId: moneyGiftId },
   function (data){ 
       var json, success; data && (json = eval(" (" + data + ")"), $("#successredbag,#meetredbag,#hadredbag,#lookredbag,#lookthisbag,#failredbag ").remove(), success = '<div id="lookthisbag">', success += '<div class="redbagclose"></div>', success += "" != json.senderAvatar ? '<div class="img"><img src="' + json.senderAvatar + '" width="65" height="65"></div>' : '<div class="img"><img src="../images/avatar/52/01.png" width="65" height="65"></div>', success += '<p style="margin-top:5px;font-size:14px;color:#000;">' + json.senderName + "的红包</p>", success += '<p class="p1" style="margin-top:5px;font-size:12px;color:#CCC; height:19px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;">' + json.moneygiftTitle + "</p>", success += '<div class="money bagred">' + json.realityMoney + '<span style="color:#333;font-size:14px;">元</span></div>', success += '<p class="baginformation">已领取' + json.robcount + "/" + json.allcount + "个，共" + json.realityMoney + "元 </p>",
        success += '<div class="HBlist">', $.each(json.rows, function (a, b) { success += '<div class="list-info">', 
        success += null != b.senderAvatar ? '<div class="user-img"><img src="' + b.senderAvatar + '" width="35" height="35"></div> ' : ' < div class = "user-img" > <img src = "../images/avatar/52/01.png" width = "35" height = "35"></div>', 
        success += '<div class="list-right">', success += '<div class="list-right-top">', 
        success += '<div class="user-name fl f14">' + b.nickname + "</div>", 
        success += '<div class="user-money fr f14">' + b.getmoney + "元 </div></div> ", 
        success += '<div class="user-time">' + b.addtime + " </div>", 
        success += "</div></div>" }), 
    success += "</div>", 
    success += '<div class="minebag1 cursor">查看我的红包>></div>', 
    success += " </div>", $("body").append(success), 
    center("#lookthisbag", !0), $(".minebag1").click(function () { minebag() })) }) }
minebag = function () {
$.post("/apps/redbag/index.php?act=GetUsertMoneygift", function(data){var json,lookredbag;data&&(json=eval("(" + data + ")"), 
    $("#successredbag,#meetredbag,#hadredbag,#lookredbag,#lookthisbag,#failredbag ").remove(), 
    lookredbag = '<div id="lookredbag">', 
    lookredbag += '<div class="redbagclose"></div>', 
    lookredbag += "" != json.avatar ? '<div class="img"><img src="' + json.avatar + '"width="65" height="65"></div>' : '<div class="img"><img src="../images/avatar/52/01.png" width="65" height="65"></div>', 
    lookredbag += '<p style="margin-top:10px;font-size: 14px;color:#000">' + json.nickName + '共收到<span style="color:red;">' + json.allcount + "</span>个红包</p>", 
    lookredbag += '<div class="money bagred">' + json.allmoney + '<span style="color:#333;font-size:14px;">元</span></div>', 
    lookredbag += '<div class="HBlist">', null!=json.rows ? $.each(json.rows, function (a, b) { lookredbag += '<div class="list-info">', 
        lookredbag += null != json.avatar ? '<div class="user-img"><img src="' + json.avatar+ '" width="35" height="35"></div>' : '<div class="user-img"><img src="../images/avatar/52/01.png" width="35" height="35"></div>', 
        lookredbag += '<div class="list-right">', lookredbag += '<div class="list-right-top">', 
        lookredbag += '<div class="user-name fl f14">' + b.nickname + " </div>", 
        lookredbag += '<div class="user-money fr f14">' + b.getmoney + "元</div></div>", 
        lookredbag += '<div class="user-time">' +  b.addtime + "</div>", 
        lookredbag += " </div></div> " }):'', 
    lookredbag += " </div></div>", $("body").append(lookredbag), center("#lookredbag", !0)) }) }
$(function() {

$("#publicChat").delegate(".content-detail", "click",
	function() {
		var b, c;
            
	b = $(this), c = b.attr("moneygiftid"),  $(this).unbind("click"),Hongbao(c)
	})

})
function hideErrorTip(type) {
	$('#redpackage-' + type + '-tip').hide();
}
function uploadAvatar(ElementId, editor) {
  //上传文件
  $.ajaxFileUpload({
      url:'/upload/upload.php',//处理图片脚本
      secureuri :false,
      fileElementId : ElementId,//file控件id
      dataType : 'json',
      data: {type: ElementId },

      success : function (data, status){  
          if(typeof(data.err) != 'undefined'){
              if(data.err != ''){
                  alert(data.err);
              }else{
                var _img = '<img src="' + data.msg.url + '"class="chat-pic"/>';
                $(editor).append(_img);
              }
          }
      },
      error: function(data, status, e){
          alert(e);
      }
});
}
/*私聊窗口用户列表*/
function showUserList() {
	$('.chat-user-list').toggle();
}
/*余额提现*/
function withdraw(uid){ 
	var a;
 	a = '<div id="setEnvelope">',
    a += '<div class="redbagclose"></div>',
    a += '<div class="envelopeBody">',
    a += '<div class="mt10"><p class="envelopetip" id="realusernametip" style="margin-left:97px;"></p></div>',
    a += '<div class="mt10"><div class="registerNewconter" style="padding-right:55px;"><input type="text" name="bankcard" id="bankcard" maxlength="22" value="输入平台账户,如无留空" title="输入平台账户,如无留空"> </div><p class="envelopetip" id="realbankcardtip" style="margin-left:97px;"></p></div>',
    a += '<div class="mt10"><div class="registerNewconter" style="padding-right:55px;"><input type="text" name="realmoney" id="realmoney" maxlength="6" value="输入提现金额（最低不少于100元）" title="输入提现金额（最低不少于100元）"> </div><p class="envelopetip" id="realmoneytip" style="margin-left:97px;"></p></div>',
    a += '<div class="registerNewconter" style="padding-right:0;"><p style="font-size:14px;color:#fc4c4c;">可提现总额￥<span id="mymoney1">' + $("#MyMoney",parent.document).val() + "</span>元</p></div>",
    a += '<div class="registerNewconter"><button class="btnEnvelope mt10" id="btnenvelope">确定</button><button class="btnEnvelope mt10" id="btnenvelopeing">正在提交..</button></div>',
    a += "</div>",
    a += "</div>";
    $("body").append(a),
    center("#setEnvelope", !0);
    $("#setEnvelope input").focus(function() {
        $(this).val() == $(this).attr("title") && ($(this).val(""))
    });
    $("#setEnvelope input").blur(function() {
        "" == $(this).val() && $(this).val($(this).attr("title"))
    });
    $("body").on("click", "#btnenvelope",function() {  
        var mymoney = $("#MyMoney",parent.document).val();
 
        var a, d, e, f,g,m,k,y;
        e = new RegExp("^([\u4E00-\uFA29]|[\uE7C7-\uE7F3]){2,6}$"); 
        g = new RegExp("^([a-zA-Z]|[0-9]|@|[.]){5,25}$");
        k = /^[0-9]+(\.[0-9]+)?$/;
        a = 0;


        //验证支付宝或者银行卡账户
        f = $.trim($("#bankcard").val());
        if (g.test(f)) {
        	$("#realbankcardtip").text("");
        } else {
        	f != $("#bankcard").attr("title") && $("#realbankcardtip").text("请填写正确的银行卡或支付宝账户");
        	a++;
        }

        //验证提取的金额
        m = $.trim($("#realmoney").val());
        if (k.test(m) && "0" != m && "0.0" != m && "0.00" != m) {
			m = Math.floor(100 * m);
			m < 10000 ? ($("#realmoneytip").text("提现金额最低不少于100元"),a++) : $("#realmoneytip").text("");
			y=$("#MyMoney",parent.document).val();
			y = Math.floor(100 * y);
			if (m > y) {
				$("#realmoney").val($("#MyMoney",parent.document).val());
				$("#realmoneytip").text("余额不足 最多提现" + $("#MyMoney",parent.document).val() + "元");
				a++;
			}
        } else {
	        m != $("#realmoney").attr("title") && ("0" == m || "0.0" == m || "0.00" == m ? $("#realmoneytip").text("金额不能为0") : $("#realmoneytip").text("请填写正确的金额")), a++;
	    }
        if (0 == a) {
        	$('#btnenvelopeing').show();
        	$('#btnenvelope').hide();
	       	m=$("#realmoney").val();
       		$.post("/room/UserCenter/tixian.php?act=GetMoney", {
		         
		            bankcard: f,
		            getmoney: m,
		            rid: My.rid
	        	}, function(a) {
		            if (a.status == 'ok') {
		            	mymoney = Math.floor(100 * mymoney),
		            	a.tixian = Math.floor(100 * a.tixian),
		            	mymoney = mymoney-a.tixian,
		            	mymoney /= 100,
		            	mymoney.toString().indexOf(".") < 0 && (mymoney += ".00"),
		            	$("#mymoney2").text(mymoney),
		            	$("#realmoney").val(mymoney), 
		            	$("#MyMoney",parent.document).val(mymoney);
		            	$("#realmoney").val();
		            	$("#setEnvelope").remove();
		            	alert(a.msg);
		            } else {
		            	alert('余额不足');
		            }
	        	}, "json");
        }
   });
}
/*添加动画样式*/
$.fn.extend({
    animateCss: function(e, t) {
        var i = "webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend";
        return this.addClass("animated " + e).one(i, function() {
            $(this).removeClass("animated " + e),
            "function" == typeof t && t()
        }),
        this
    }
})
//历史消息
function ChatHistory(Index) {
    var PageSize = 20;
    $.ajax({
        url: "/ajax.php?act=message",
        data: {Index:Index, PageSize: PageSize},
        type: "POST",
        dataType: "JSON",
        success: function (result) {
            if (result.success) {
                $('#publicChat .more-message').parent().remove();
                var _moreMess = '<div class="history-hr-wrap"><a class="history-hr-text more-message" page="' + Index + '">查看更多消息</a></div>';
                $('#publicChat').prepend(result.content);
                $('#publicChat').prepend(_moreMess);
            } else {
                $('#publicChat .more-message').addClass('no-more');
                $('#publicChat .more-message').html('没有更多消息');
            }
        }
    });
};