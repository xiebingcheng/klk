 var rotate;
$("#rotateMain").click(function () {
 if(My.chatid.indexOf('x')>-1) {
        layer.alert('请先登录！', {
        title:'抽奖提示',
        icon: 6
        }, function(index) {
            layer.close(index);
            openWin(2,false,'room/minilogin.php',370,340);
            return;
        });
    }else{
rotate= layer.open({
        type: 2,
        shift :-1,
        title: false,
        area: ['900px', '565px'],
       
      shadeClose: true,
       closeBtn: false,
        content: ['/apps/rotate/index.php?rid='+My.rid]
    });
                    layer.style(rotate, {
   'box-shadow':'none',
   'background-color': 'transparent'
    
}); 
}
});
 var tanmuSelect=false;
$("#tanmu-select").click(function () { 
        if(My.chatid.indexOf('x')>-1){

layer.msg('游客不能开启弹幕', {icon: 6,anim: 5});
return;
        }
    if($("#tanmu-select").hasClass('layui-form-onswitch')){
		$("#tanmu-select").removeClass('layui-form-onswitch');
		tanmuSelect = false;	
	}
	else {
	       $("#tanmu-select").addClass('layui-form-onswitch');
		tanmuSelect = true;
                  layer.alert('发送一条弹幕，消费1积分', { closeBtn: 0,icon: 6,anim: 5});
	}
 
});
$(".zhan").live("click", function () {
    var id = $(this).attr("hdid");
$.ajax({
                url: "/apps/hd_zan.php",
                data: {id:id},
                 type: "POST",
                dataType: "JSON",
                success: function (rep) {
                    if (rep==1){
                var zan=$('a[hdid="' + id +'"] span').html();
                zan=parseInt(zan)+1;
                   $('a[hdid="' + id +'"] span').html(zan);
                    }else{
                        var xuanze='a[hdid="' + id +'"] span';
                            layer.tips('您已经点过赞了！', xuanze); 
                    }
                       
                }
            });
});

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

function Hongbao(hbid){
   
        if(My.chatid.indexOf('x')>-1){
            layer.alert('请登录后再来抢红包把！', {
    title:'红包提示',
    
  icon: 6},function(index){

  
  layer.close(index);
  openWin(2,false,'room/minilogin.php',370,340);
          return;
})
         
        }
        var json,hbid,json, mobile, mymoney, money1, success, fail, had;
        //  hbid  = $(this).attr("moneygiftid")
           $.post("/apps/redbag/index.php?act=GetMoneygift", {
        customerId: My.chatid,
        moneyGiftId: hbid
    },
    function(data) {
        data && (json = eval("(" + data + ")"),
          $("#successredbag,#meetredbag,#hadredbag,#lookredbag,#lookthisbag,#failredbag").remove(), 1 == json.status ? (mymoney = $.trim($("#MyMoney").val()), mymoney = Math.floor(100 * mymoney), money1 = $.trim(json.amount), money1 = Math.floor(100 * money1), mymoney = (mymoney + money1) / 100, $("#MyMoney").val(mymoney), success = '<div id="successredbag">', success += '<div class="redbagclose"></div>', success += "" != json.senderAvatar ? '<div class="img"><img src="' + json.senderAvatar + '" width="65" height="65"></div>': '<div class="img"><img src="../images/avatar/52/01.png" width="65" height="65"></div>', success += '<p style="margin-top:5px;font-size: 14px;color:#000;">' + json.senderName + "的红包</p>", success += '<p class="p1" style="margin-top:5px; font-size: 12px;color: #CCC;">' + json.moneygiftTitle + "</p>", success += '<div class="money bagred">' + json.amount + '<span style="color:#333;font-size: 14px;">元</span></div>', success += '<p class="baginformation">已领取' + json.robcount + "/" + json.allcount + "个，共" + json.realityMoney + "元</p>", success += '<div class="HBlist">', $.each(json.rows,
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
        }),SysSend.command('hongbaoinfo',json.senderName+'_+_'+json.amount)) : 0 == json.status ? (fail = '<div id="failredbag">', fail += '<div class="redbagclose"></div>', fail += "" != json.senderAvatar ? '<div class="img"><img src="' + json.senderAvatar + '" width="60" height="60"></div>': '<div class="img"><img src="../images/avatar/52/01.png" width="60" height="60"></div>', fail += '<p style="margin-top: 15px;">' + json.senderName + "</p>", fail += '<p class="memos">手慢了，红包派完了！</p>', fail += '<div class="lookthisbag">看看大家的手气>></div>', fail += "</div>", $("body").append(fail), center("#failredbag", !0), $(".lookthisbag").click(function() {
            thisbag(hbid)
        })) : (had = '<div id="hadredbag">', had += '<div class="redbagclose"></div>', had += "" != json.senderAvatar ? '<div class="img"><img src="' + json.senderAvatar + '" width="60" height="60"></div>': '<div class="img"><img src="../images/avatar/52/01.png" width="60" height="60"></div>', had += '<p style="margin-top: 15px;">' + json.senderName + "</p>", had += '<p class="memos mt10">您已经抢过这个红包了!</p>', had += '<div class="minebag cursor f14">看看大家的手气>></div>', had += "</div>", $("body").append(had), center("#hadredbag", !0), $(".minebag").click(function() {
            thisbag(hbid)
        }))
   ) })
    }
 $("body").on("click", ".redbagclose",
    function() {
        $(this).parent().remove()
    }),
  $(".hongBao").click(function() {
     var a = '<div id="hongBaoClick">';
        a += '<div class="bagbtn">',
        a += '<div class="sethongBao">发红包</div>',
        a += '<div class="lookmainbag">我的红包</div>',
        a += "</div>",
        a += '<div class="redbagclose"></div>',
        a += "</div>",
        $("body").append(a),
        center("#hongBaoClick", !0),
        $(".lookmainbag").click(function() {
            $("#hongBaoClick").remove(),
            minebag()
        }),
        $(".sethongBao").click(function() {
            var a, b, c;
            $("#hongBaoClick").remove(),
            a = '<div id="setEnvelope">',
            a += '<div class="redbagclose"></div>',
            a += '<div class="envelopeBody">',
            a += '<div class="mt10 pt10"><div class="registerNewconter" style="padding-right:60px;">金额：<input type="text" id="realmoney" name="realmoney" maxlength="4" value="请填写红包金额" title="请填写红包金额"> 元</div><p class="envelopetip" id="realmoneytip" style="margin-left:97px;"></p></div>',
            a += '<div class="mt10"><div class="registerNewconter" style="padding-right:60px;">个数：<input type="text" name="realnumber" id="realnumber" maxlength="3" value="请填写红包个数" title="请填写红包个数"> 个</div><p class="envelopetip" id="realnumbertip" style="margin-left:97px;"></p></div>',
            a += '<div class="mt10"><div class="registerNewconter" style="padding-right:79px;"><span>备注：</span><textarea name="envelopetext" id="envelopetext" maxlength="30">恭喜发财,大吉大利！</textarea></div></div>',
            a += '<div class="registerNewconter bagred" style="padding-right:0;"><p id="money" style="color: #fc4c4c;">￥0.00</p></div>',
            a += '<div class="registerNewconter" style="padding-right:0;"><p style="font-size:14px;color:#a0a0a0;">余额￥<span id="mymoney1">' + $("#MyMoney").val() + "</span>元</p></div>",
            a += '<div class="registerNewconter"><button class="btnEnvelope mt10" id="btnenvelope">发红包</button><button class="btnEnvelope mt10" id="btnenvelopeing">正在发..</button></div>',
            a += "</div>",
            a += "</div>",
            $("body").append(a),
            center("#setEnvelope", !0),
            $("#setEnvelope input").focus(function() {
                $(this).val() == $(this).attr("title") && ($(this).val(""))
            }),
            $("#setEnvelope input").blur(function() {
                "" == $(this).val() && $(this).val($(this).attr("title"))
            }),
            b = /^[0-9]*$/,
            c = /^[0-9]+(\.[0-9]+)?$/,
            $("#realmoney").blur(function() {
                var b, d, e, f, g, h, i, a = $.trim($("#realmoney").val());
                c.test(a) && "0" != a && "0.0" != a && "0.00" != a ? (a = Math.floor(100 * a),a<200?$("#realmoneytip").text("红包最低金额为2元"): (b = $.trim($("#MyMoney").val()), b = Math.floor(100 * b), b >= a ? (b -= a, a /= 100, b /= 100, a.toString().indexOf(".") < 0 && (a += ".00"), d = a.toString().split("."), e = parseInt(d[0], 10), f = d[1], 1 == f.length && (f += "0"), a = e + "." + f, b.toString().indexOf(".") < 0 && (b += ".00"), g = b.toString().split("."), h = parseInt(g[0], 10), i = g[1], 1 == i.length && (i += "0"), b = h + "." + i, $("#realmoney").val(a), $("#realmoneytip").text(""), $("#money").text("￥" + a), $("#mymoney1").text(b)) : (b /= 100, b.toString().indexOf(".") < 0 && (b += ".00"), d = b.toString().split("."), e = parseInt(d[0], 10), f = d[1], 1 == f.length && (f += "0"), b = e + "." + f, $("#realmoney").val(b), $("#realmoneytip").text("余额不足 最多" + b + "元"), $("#money").text("￥" + b), $("#mymoney1").text("0.00")))) : a != $("#realmoney").attr("title") && ("0" == a || "0.0" == a || "0.00" == a ? $("#realmoneytip").text("金额不能为0") : $("#realmoneytip").text("请填写正确的金额"))
            }),
            $("#realnumber").blur(function() {
                var a = $.trim($("#realnumber").val());
                b.test(a) && "0" != a ? (a = parseInt(a), a > 999 ? ($("#realnumbertip").text("红包数量最多999个"), $("#realnumber").val(999)) : ($("#realnumbertip").text(""), $("#realnumber").val(a))) : a != $("#realnumber").attr("title") && ("0" == a ? $("#realnumbertip").text("数量不能为0") : $("#realnumbertip").text("请填写正确的数量"))
            }),
            $("#btnenvelope").click(function() {
                $("#btnenvelope").hide(), $("#btnenvelopeing").show();
                var a, d, e, f,s;
                a = 0, 
                d = $.trim($("#realmoney").val()), 
                c.test(d) && "0" != d && "0.0" != d && "0.00" != d ?(s=$.trim($("#realmoney").val()),s = Math.floor(100 * s),s<200?($("#realmoneytip").text("红包最低金额为2元"),a++): $("#realmoneytip").text("")): (d != $("#realmoney").attr("title") && ("0" == d || "0.0" == d || "0.00" == d ? $("#realmoneytip").text("金额不能为0") : $("#realmoneytip").text("请填写正确的金额")), a++), 
                e = $.trim($("#realnumber").val()), 
                b.test(e) && "0" != e ? $("#realnumbertip").text("") : (e != $("#realnumber").attr("title") && ("0" == e ? $("#realnumbertip").text("数量不能为0") : $("#realnumbertip").text("请填写正确的数量")), a++),
                f = $.trim($("#envelopetext").val()), 
                0 == a ? (h = "checked" == $("#robotbag").attr("checked") ? !0 : !1, i = "-1" == $("#spoker>option:checked").val() ? "": $("#spoker>option:checked").text(), 
                $.post("/apps/redbag/index.php?act=SendMoneygift", {
                    amount: d,
                    num: e,
                    memos: f,
                    rid:My.rid
                },
                function(a) {
                    var b, c,neir,str,msgid;
                    "ok" == a.status ? (b = $("#mymoney1").text(), $("#MyMoney").val(b), $("#setEnvelope").remove(), c = '<div id="setEnvelopeOK"><p class="tipOK">红包发送成功!</p><div class="OK cursor">好的</div></div>', $("body").append(c), center("#setEnvelopeOK", !0), 
                    neir='<div class="content-detail" moneygiftid="'+a.id+'"><div class="redbag-top" title="'+a.beizhu+'" adminname="" isrobot="0" ><div class="fl"><img src="/images/hongbao.png" style="margin-top: 3px;"></div><div class="fl ml10" style="color:#fff;"><p style="font-weight:bold;margin-bottom:4px;color:#f30;font-size:14px;">'+a.beizhu+'</p>领取红包</div></div><div style="padding:3px 10px;">聊天室红包</div></div>',
                    msgid=randStr()+randStr(),
                    //str='SendMsg=M=ALL|false|padding: 0px;|'+msgid+'_+_'+encodeURIComponent(neir),
                    str = '{"type":"SendMsg","ToChatId":"ALL","IsPersonal":"false","Style":"Sendredbag","tanmu":"false","Txt":"'+msgid+'_+_'+encodeURIComponent(neir)+'"}',
                    ws.send(str),
                    PutMessage(My.rid,My.chatid,'Sendredbag',My.nick,'ALL','false','padding:0px;',neir,msgid),
                    $("#setEnvelopeOK .OK").click(function() {
                        $("#setEnvelopeOK").remove(),
                        setTimeout("$('#meetredbag').show();", 800)
                    })) : alert('发送失败');
                } ,"json")) : ($("#btnenvelope").show(), $("#btnenvelopeing").hide());
            })
        })
    })
    

    var thisbag,minebag;
  thisbag= function(moneyGiftId) { 
   $.post("/apps/redbag/index.php?act=GetMoneygiftList",{ 
       moneyGiftId: moneyGiftId },
   function (data){ 
       var json, success; data && (json = eval(" (" + data + ")"), $("#successredbag,#meetredbag,#hadredbag,#lookredbag,#lookthisbag,#failredbag ").remove(), success = '<div id="lookthisbag">', success += '<div class="redbagclose"></div>', success += "" != json.senderAvatar ? '<div class="img"><img src="' + json.senderAvatar + '" width="65" height="65"></div>' : '<div class="img"><img src="../images/avatar/52/01.png" width="65" height="65"></div>', success += '<p style="margin-top:5px;font-size:14px;color:#000;">' + json.senderName + "的红包</p>", success += '<p class="p1" style="margin-top:5px;font-size:12px;color:#CCC;">' + json.moneygiftTitle + "</p>", success += '<div class="money bagred">' + json.realityMoney + '<span style="color:#333;font-size:14px;">元</span></div>', success += '<p class="baginformation">已领取' + json.robcount + "/" + json.allcount + "个，共" + json.realityMoney + "元 </p>",
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
    lookredbag += " </div></div>", $("body").append(lookredbag), center("#lookredbag", !0),
    $("#lookredbag div.HBlist").scroll(function() {
        console.log($('.HBlist').scrollTop());
        if ($('.HBlist').scrollTop() > 1035) {
            console.log($('.HBlist').scrollTop());
        }
    })
    );
});
}

$(function() {

$("#UI_Central").delegate(".content-detail", "click",
	function() {
		var b, c;
            
	b = $(this), c = b.attr("moneygiftid"),  $(this).unbind("click"),Hongbao(c)
	});
        	// var $giftTipsTmpl = $('#js-gift-tips-tmpl');
        $('#js-gift-panel').delegate('.gift', 'mouseover', function(event){
			var $this = $(this);
			var id = $this.data('id');

			var name = $this.data('name');
			var title = $this.data('title');
			var credit = $this.data('credit');
			var path = $(this).find('img').attr("src");
			
			var x = $this.offset().top - 45; 
			var y = $this.offset().left - 50; 
			var $giftTips ='<div class="MR-gift-tip" style="left:'+y+'px; top:'+x+'px; "><div class="tip-content"><img class="tip-img" src="'+path+'"><div class="gift-tip-con"><span class="gift-tip-name">'+name+'</span><span class="gift-tip-price">'+credit+'积分</span></div></div></div>';
                  
			$('body').append($giftTips);
			
		}).delegate('.gift', 'mouseout', function(event){
			$('.MR-gift-tip').remove();			
		}).delegate('.gift', 'click', function(event){
			event.preventDefault();
			var $this = $(this);
            $this.addClass('cur');
            $this.siblings().removeClass('cur');
			var id = $this.data('id');
			var name = $this.data('name');
			var credit = $this.data('credit');
			var path = $this.data('path');
            // $('#credit').html(credit);
            // $('#giftname').html(name);
            $('#giftdata').data('id', id);
            $('#giftdata').data('name', name);
            $('#giftdata').data('credit', credit);
            $('#giftdata').data('path', path);
			event.stopPropagation();
		});
			
    $('#sendgift').click(function() {
        var id = $('#giftdata').data('id') ? $('#giftdata').data('id') : $('#giftFirstZan').data('id');
        var name = $('#giftdata').data('name') ? $('#giftdata').data('name') : $('#giftFirstZan').data('name');
        var credit = $('#giftdata').data('credit') ? $('#giftdata').data('credit') : $('#giftFirstZan').data('credit');
        var path = $('#giftdata').data('path') ? $('#giftdata').data('path') : $('#giftFirstZan').data('path');
			if(id > 0){
			if(My.redbags_num=='0'){
            if(My.color=='0'){
                    layer.tips('请先登陆直播室获取积分！', '.sendgift');
                } else {
                    layer.tips('对不起，您没有足够的积分！', '.sendgift');
        }
		return false;
	}
        if(My.redbags_num<credit){
               layer.tips('对不起，您没有足够的积分赠送'+name, '.sendgift'); 
           return false;
        }
            getAnalysts(name,credit,path,id);
			}
		});

$('#ban_speak').click(function(){  
    if($(this).attr('checked')){  
     if(check_auth('room_admin')){
		SysSend.command('BanSpeak',1);
		$.ajax({type: 'get',url: '../ajax.php?act=ban_speak&ban_speak_status=1&rid='+My.rid});
	}
      
    }else{  
         if(check_auth('room_admin')){
		SysSend.command('BanSpeak',0);
		$.ajax({type: 'get',url: '../ajax.php?act=ban_speak&ban_speak_status=0&rid='+My.rid});
	}
    }  
}); 
})

function pHolder(e) {
    $(e).html().length > 0 ? $(".p-holder").hide() : $(".p-holder").show()
}
function pHolderHide() {
    $(".p-holder").hide()
}
$(document).ready(function() {
    $('.js-main-meta-toggle').click(function() {
		var $this = $(this);
	    var _mLeft = parseInt($("#UI_Left").css("margin-left"));
        if( _mLeft < 0) {
            $this.find("i").removeClass("fa-angle-double-right");
		    $("#UI_Left").css("margin-left","2px");
            $('#UI_Central').width($('#UI_Central').width() - 212);
            // $('#UI_Right').width($('#UI_Right').width()-244);
             
            // $('#NoticeList').height($('#NoticeList').height() + 100);
            // $('.ck-slide').height($('#NoticeList').height());
		    // $('#OnLine_MV').height($('#OnLine_MV').height() - 100);
            // $('#mvMask').height($('#OnLine_MV').height() - 137);
		    $this.attr({"title": "点击隐藏左侧列表"});
        } else {
            $this.find("i").addClass("fa-angle-double-right");
		    $("#UI_Left").css("margin-left","-212px");
            $('#UI_Central').width($('#UI_Central').width() + 212);
            // $('#UI_Right').width($('#UI_Right').width()+244);	
            // $('#NoticeList').height($('#NoticeList').height() - 100);
            // $('.ck-slide').height($('#NoticeList').height());
	
            // $('#OnLine_MV').height($('#OnLine_MV').height() + 100);
            // $('#mvMask').height($('#OnLine_MV').height() + 100);
            $this.attr({"title": "点击显示左侧列表"});
        }
    });
    $('.btn_kaijiang').click(function() {
       $('#ppjianban').hide();
       $('#ppiframe').show();
       $('#pptouzhu').hide();
	   $('#pponlinetv').hide();
	   $('.NoticeList').show();
	   $('.btn_kaijiang').addClass("a");
	   $('.btn_ppjianban').removeClass("a");
	   $('.btn_pptouzhu').removeClass("a");
	   $('.btn_pponlinetv').removeClass("a");
    });
	$('.btn_ppjianban').click(function() {
       $('#ppjianban').show();
       $('#ppiframe').hide();
       $('#pptouzhu').hide();
	   $('#pponlinetv').hide();
	   $('.btn_kaijiang').removeClass("a");
	   $('.btn_ppjianban').addClass("a");
	   $('.btn_pptouzhu').removeClass("a");
	   $('.btn_pponlinetv').removeClass("a");
    });
	$('.btn_pptouzhu').click(function() {
      $('#ppjianban').hide();
       $('#ppiframe').hide();
       $('#pptouzhu').show();
	   $('#pponlinetv').hide();
	   $('.NoticeList').hide();
	   $('.btn_kaijiang').removeClass("a");
	   $('.btn_ppjianban').removeClass("a");
	   $('.btn_pptouzhu').addClass("a");
	   $('.btn_pponlinetv').removeClass("a");
    });
    $('.btn_pponlinetv').click(function() {
      $('#ppjianban').hide();
       $('#ppiframe').hide();
       $('#pptouzhu').hide();
	   $('#pponlinetv').show();
	   $('.NoticeList').show();
	   $('.btn_kaijiang').removeClass("a");
	   $('.btn_ppjianban').removeClass("a");
	   $('.btn_pptouzhu').removeClass("a");
	   $('.btn_pponlinetv').addClass("a");
    });
    $(document).on('click', '#MsgBox1 .more-message', function () {
        var page = parseInt($(this).attr('page'));
        if (!$(this).hasClass('no-more')) {
            ChatHistory(page + 1);
        }
    });
})
/* 
*----------------------------------
*文字及元素放大后还原 2017-04-14 LLC
*-----调用方法json格式
* LLCscale({
*   'obj': 对象，
*   ‘t’: 变化快慢，默认30s
*   ‘changValue’： 变化率，默认0.5，
*   'endValue': 结束状态，默认还原 1
    'maxValue': 最大值变化值，默认3
*   })
*-----兼容IE10+及其现代浏览器
*-----------------------------------
*/
function LLCscale(myJson)
{
    var obj = myJson.obj,
        t = myJson.t || 30,
        cValue = myJson.changValue || 0.5,
        eValue = myJson.endValue || 1,
        mValue = myJson.maxValue || 3,
        i = 1;
    var time = setInterval(function(){
        i += cValue;
        if(i>mValue)
        {
            var timer = setInterval(function()
            {
                i -= cValue;
                obj.style.transform = 'matrix('+i+', 0, 0,'+i+', 0, 0)';
                if( i< eValue ) 
                {
                    obj.style.transform = 'matrix('+eValue+', 0, 0,'+eValue+', 0, 0)';
                    clearInterval(time);
                    clearInterval(timer);
                }
            },t)
        };
        obj.style.transform = 'matrix('+i+', 0, 0,'+i+', 0, 0)';
    },t);
};
// 限制礼物弹框只能是4个
function limit(){
    if($('.fly_huang').length>4){$(".fly_huang").eq(0).remove()}
}
//当有多个礼物弹框的时候从上向下排列
function rank() {
    for (i = 0; i < $('.fly_huang').length; i++) {
        $('.fly_huang').eq(i).css('top', 92 + i * 80 + 'px');
    }
}
//礼物列表自适应----------------------------------------------------------------------
var ptListWrp = $('.jQ_ptLst');                 //列表容器
var valLstLiWth = $('.jQ_ptLst li').width()+2;  //图片宽度（图片可能包括边框样式等，取Li宽度参与可视图片计算避免误差）
var valImgLth = 1;                              //可见图数变量*
var valpLstMg = 0;                              //边距变量*
var pLstLesMg = 5;                              //临界间距
//列表滚动
var pLstRoLt = $('.jQ_plstRoLt');               //左滚动元素
var pLstRoRt = $('.jQ_plstRoRt');               //右滚动元素
var pLstImgLths = ptListWrp.find('img').length; //获取图片总数
var pLstImgLth =pLstImgLths
//宽度自适应方法
function fnAutoWth(){
    //重置滚动
    $('.jQ_ptLst ul').css({'marginLeft':'0'});
    pLstRoLt.hide();
    pLstRoRt.show();

    var pLstWrpWth = ptListWrp.width();                  //获取当前可视区域宽度
    valImgLth = Math.floor(pLstWrpWth / valLstLiWth);   ///当前可视图片数计算*
    //图片间距算法
    function fnpLstMg(){
        //间距 = 除去图片的宽度 /（图片数 + 1），并向上取整（避免小数误差）
        valpLstMg = Math.ceil((pLstWrpWth - valImgLth * valLstLiWth) / (valImgLth + 2));
    };
    //执行计算
    fnpLstMg();
    //间距临界值
    if(valpLstMg < pLstLesMg){
        valImgLth = valImgLth - 1;  //当间距达到临界值，图片数-1
        fnpLstMg();                 //重新计算间距
    };
    //可视图片数 >= 总图片数时，总图片数即可视图片数
    if(valImgLth >= pLstImgLth){
        valImgLth = pLstImgLth;
        fnpLstMg();                 //重新计算间距
        pLstRoRt.hide();
    };
    //设置间距
    ptListWrp.find('li').css('margin-left',valpLstMg);
};
//初始执行宽度自适应方法
fnAutoWth();

//动态变化宽度时执行方法
$(window).resize(function(){
    fnAutoWth();    //宽度自适应方法
});
//滚动方法
function fnPlstArr($this){
    var pLstRoWrp = ptListWrp.find('ul');
    var ptLstCssMg = parseInt(pLstRoWrp.css('margin-left'));                    //获取当前已滚动宽度
    var ptLstImgMg = parseInt(pLstRoWrp.find('li:first').css('margin-left'));   //获取当前图片间距
    //向右滚动
    if($this.hasClass('jQ_plstRoRt')){
        //当点击右箭头时，列表向左滚动。需滚动的宽度 = 当前图片间距 + 图片宽度（取Li宽度）
        pLstRoWrp.not(':animated').animate({marginLeft: ptLstCssMg - (ptLstImgMg + valLstLiWth)},200,function(){
            //回调函数判断滚动之后的箭头状态
            var ptLstCurMg = parseInt(pLstRoWrp.css('margin-left'));                //获取当前已滚动宽度
            var ptLstRoWth = (pLstImgLth - valImgLth) * (ptLstImgMg + valLstLiWth);//计算非可视区域宽度
            //当已滚动宽度 = 非可视区宽度，即已滚动至最后一图
            if(ptLstCurMg + ptLstRoWth == 0){
                $this.hide();   //隐藏右箭头
            };
            pLstRoLt.show();    //一旦向右滚动，左箭头即显示
        });
    };
    //向左滚动
    if($this.hasClass('jQ_plstRoLt')){
        pLstRoWrp.not(':animated').animate({marginLeft: ptLstCssMg + (ptLstImgMg + valLstLiWth)},200,function(){
            //回调函数判断滚动之后的箭头状态
            var ptLstCurMg = parseInt(pLstRoWrp.css('margin-left'));                    //获取当前已滚动宽度
            var ptLstRoWth = (pLstImgLth - valImgLth - 1) * (ptLstImgMg + valLstLiWth);//计算非可视区域宽度
            //当已滚动宽度 = 0，即已滚动至最前一图
            if(ptLstCurMg == 0){
                $this.hide();   //隐藏左箭头
            };
            pLstRoRt.show();    //一旦向左滚动，右箭头即显示
        });
    };
};
//滚动事件绑定
$('.jQ_plstRoLt, .jQ_plstRoRt').click(function(){
    fnPlstArr($(this));
})

//礼物列表自适应----------------------------------------------------------------------
//签到弹框
var signinLayer;
$('#signin').click(function() {
     if(My.chatid.indexOf('x')>-1) {
        layer.alert('请先登录！', {
        title:'签到提示',
        icon: 6
        }, function(index) {
            layer.close(index);
            openWin(2,false,'room/minilogin.php',370,340);
            return;
        });
    }else{
    signinLayer = layer.open({
        type: 2,
        title: false,
        skin: 'layer-ext-nuoyun',
        shadeClose: true,
        shift : 5,
        shade: false,
        area: ['502px', '503px'],
        content: 'apps/signin/signin.php?rid='+My.rid
    });
    layer.style(signinLayer, {
      'box-shadow':'none',
      'background-color': 'transparent',
      'border': '0'
    }); 
}
})
/*点播 start*/

  $.ajax({
    type: 'get',
    url: 'ajax.php?act=getVideolist&rid='+My.rid,
    dataType: 'json',
    success : function(data) {
 
      $.each(data, function(idx, item) {
        var _li = '<li data-type="1" data-url=""  data-videourl="' + item.videourl + '" data-livetype="' + item.livetype + '">' +
                    '<div class="pic">' + 
                      '<img src="' + item.cover + '" class="fl">' +
                    '</div>' + 
                    '<div class="broContie">' +  item.videoname + '</div>' + 
                  '</li>';
        $('.broadcastCon ul').append(_li);
      });
      $('.broadcastCon li').click(function() {
        $('.broadcastMain').hide(); 
        if($('.btn-bet i').hasClass('fa-video-camera')) {
            $('.btn-bet').click();
        }
       var videourl=$(this).attr('data-videourl');
       if($(this).attr('data-livetype')=='1'){videourl='<video autoplay="true" controls="controls" src="upload/video/'+videourl+'" style="width:100%;height:100%" id="nuoyunvideo"></video>'}
       $('#OnLine_MV').css('background', 'black');
    $('#OnLine_MV').html(videourl);
    $('.btn-return-video').show();
      });
    }
  });
/*点播 end*/
function returnVideo() { 
       $.ajax({
    type: 'get',
    url: 'ajax.php?act=getVideolive&rid='+My.rid,
    dataType: 'html',
    success : function(data) { 
    $('#OnLine_MV').css('background', 'none');
    $('#OnLine_MV').html(data);
     $('.btn-return-video').hide();
    }
  });
}
/*砸金蛋*/
 var goldEgg;
 var poundGoldEggOldTime, poundGoldEggNewTime;

$("#goldEgg").click(function () {
    if(My.chatid.indexOf('x')>-1) {
        layer.alert('请登录后再来砸礼品吧！', {
        title:'砸金蛋提示',
        icon: 6
        }, function(index) {
            layer.close(index);
            openWin(2,false,'room/minilogin.php',370,340);
            return;
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
                        type: 2,
                        shift :-1,
                        title: false,
                        area: ['800px', '639px'],
                        shadeClose: true,
                        closeBtn: true,
                        content: ['/apps/poundgoldegg/index.php?code='+code+'&rid='+My.rid]
                    });
                layer.style(goldEgg, {
                   'box-shadow':'none',
                   'background-color': 'transparent' 
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
//历史消息
function ChatHistory(Index) {
    var PageSize = 20;
    $.ajax({
        url: "../ajax.php?act=message",
        data: {Index:Index, PageSize: PageSize},
        type: "POST",
        dataType: "JSON",
        success: function (result) {
            if (result.success) {
                $('#MsgBox1 .more-message').parent().remove();
                var _moreMess = '<div class="view-more-records"><a class="more-message" page="' + Index + '">查看更多消息</a></div>';
                $('#MsgBox1').prepend(result.content);
                $('#MsgBox1').prepend(_moreMess);
            } else {
                $('#MsgBox1 .more-message').addClass('no-more');
                $('#MsgBox1 .more-message').html('没有更多消息');
            }
        }
    });
};