$(function() {
	//初始化数据及监听事件
	pubmethod.initAdata();
	//初始化数据
	method.indexLoad(boxId, lotCode);
	ifishad = true; //判断是否是刷新页
	tools.loadDate(); //初始化时间控件
	//弹出播放视频
	$("#startVideo").on("click", function() {
		startVideo();
		$("iframe")[0].contentWindow.ifopen = true;
		$("iframe")[0].contentWindow.sscAnimateEnd(createData());
	});
	//关闭视频
	$("#videobox .closevideo").on("click", function() {
		$(".content").animate({
			"top": "-150%"
		}, 200, function() {
			$("#videobox").css({
				"z-index": "-1",
				"position": "fixed"
			});
		});
		$("iframe")[0].contentWindow.videoTools.sounds.soundsT.stop("bgsound");
		$("iframe")[0].contentWindow.videoTools.clearInterval();
		$("iframe")[0].contentWindow.ifopen = false;
	});
	method.loadOther(""); //加载列表及其他数据
	setTimeout(function() {
		config.ifFirstLoad = true;
	}, 4000);
});
(function() {
	var supportOrientation = (typeof window.orientation === 'number' &&
		typeof window.onorientationchange === 'object');
	var init = function() {
		var htmlNode = document.body.parentNode,
			orientation;
		var updateOrientation = function() {
			if(supportOrientation) {
				orientation = window.orientation; //得到屏幕旋转参数
				if(($("#videobox").find(".content").css("top") == "0px")) {
					startVideo();
				}
			}
		};
		if(supportOrientation) {
			window.addEventListener('orientationchange', updateOrientation, false);
		} else {
			//监听resize事件
			window.addEventListener('resize', updateOrientation, false);
		}
		updateOrientation();
	};
	window.addEventListener('DOMContentLoaded', init, false);
})();

function startVideo() {
	//启动动画
	$("#videobox").animate({
		"z-index": "19999"
	}, 10, function() {
		$(".content").animate({
			"top": "0"
		}, 300, function() {
			var H = $("iframe").contents().find(".bodybg").height();
			isfirthload = false;
			$(".content").animate({
				"height": H + 35
			}, 100);
		});
	});
}

//判断是否是刷新页
var ifishad = false;
//加载其他数据
//入口加载数据
var method = {};
//加载其他数据
method.loadOther = function(date) {
	//处理所选日期不为当日时不加载列表数据
	if(date == "") {
		if(!tools.ifOnDay()) {
			return;
		}
	}
	method.listData(date); //重新请求list数据
}
//入口加载数据
method.indexLoad = function(id) {
	var nextIssue = $(id).find(".nextIssue").val();
	var id = "#" + $(id).attr("id");
	headMethod.loadHeadData(nextIssue, id); //页面启动时加载数据第一次加载不传参
}
//请求list数据
method.listData = function(date) {
	var date = $('#date').val();
	if(!date){
		var day = new Date();
		day.setTime(day.getTime());
		var date = day.getFullYear()+"-" + (day.getMonth()+1) + "-" + day.getDate();
	}
	var rows = $('#rows').attr('data-text');
	if(!rows){
		var rows = 10;
	}
	$.ajax({
		url: config.publicUrl + '/LotteryPlan/getSscPlanList.do',
		type: "GET",
		data: {
			"lotCode": lotCode,
			'rows':rows,
			'date':date
		},
		beforeSend: function() {
			if(!ifishad) {
				$("#numlist").html("<span class='loading'>努力加载中...</span>");
			}
		},
		success: function(data) {
			method.createHtmlList(data);
			//关闭加载动画
			animate.loadingList("body", false);
		},
		error: function(data) {
			if(config.ifdebug) {
				console.log("data error");
			}
		}
	});
	$.ajax({
		url: config.publicUrl + '/KillNum/getSscKillNumList.do',
		type: "GET",
		data: {
			"lotCode": lotCode,
			'rows':rows,
			'date':date
		},
		beforeSend: function() {
			if(!ifishad) {
				$("#numlist").html("<span class='loading'>努力加载中...</span>");
			}
		},
		success: function(data) {
			var checkNum = $("li.lichecked").attr("data-text");
			method.createHtmlList1(data, checkNum);
			$('.numbtn li').click(function(){
				if($(this).hasClass("lichecked")){
					return false;
				}
				$('.numbtn li').removeClass('lichecked');
				$(this).addClass('lichecked');
				var checkNum = $("li.lichecked").attr("data-text");
				method.createHtmlList1(data, checkNum);
			});			
		},
		error: function(data) {
			if(config.ifdebug) {
				console.log("data error");
			}
		}
	});
}

method.createHtmlList = function(jsondata) {
	var data = null;
	if(typeof jsondata != "object") {
		data = JSON.parse(jsondata);
	} else {
		data = JSON.stringify(jsondata);
		data = JSON.parse(data);
	}
	if(data.result.businessCode == 0) {
		data = data.result.data;
		//1：为开奖号码TAB添加数据---start
		$("#plan_list").empty();
		$(data).each(function(i) {
			var divhtml = "";
			divhtml += '<div class="listline bortop001">';
			divhtml += '<div class="leftspan leftspanw">';
			divhtml += '<span class="boxflex">';
			var drawTime = this.preDrawTime;
			drawTime = drawTime.substring((drawTime.length) - 8, (drawTime.length) - 3);
			divhtml += '<span class="graytime">' + drawTime + '</span>';
			divhtml += '<span class="graytime">' + tools.subStr(this.preDrawIssue) + '</span>';
			divhtml += '</span>';
			divhtml += '</div>';
			divhtml += '<div class="rightspan">';
			divhtml += '<div class="rightdiv padl0">';
			divhtml += '<ul id="" class="pk10li planA listli"><li>';
			var preDrawCode = this.planA.split(",");
			var Codes = this.preDrawCode.split(",");
			var Code = Codes[0];
			var plan = new Array();
			$(preDrawCode).each(function(index) {
				if(i==0 && this.countTime > 0){
					plan.push(this);
				}else{
					if(preDrawCode[index] == Code){
						plan.push('<span style="color:red;font-weight:bold;display:inline">'+this+'(中)</span>');
					}else{
						plan.push(this);
					}
				}
			});
			divhtml += plan.join(',')+'</li>';
			if(this.profitA>0){
				divhtml += '<li style="color:red;float:right;font-weight:bold;">'+this.profitA+'</li>';
			}else{
				divhtml += '<li style="color:green;float:right;font-weight:bold;">'+this.profitA+'</li>';
			}
			divhtml += '<li style="float:right;font-weight:bold;margin-right:0.05rem;">'+this.lotteryCostAllA+'</li>';
			divhtml += '<li style="float:right;font-weight:bold;margin-right:0.05rem;">'+this.lotteryCostA+'</li>';
			divhtml += '</ul>';
			divhtml += '<ul id="" class="pk10li planB listli displaynone"><li>';
			var preDrawCode = this.planB.split(",");
			var plan = new Array();
			$(preDrawCode).each(function(index) {
				if(i==0 && this.countTime > 0){
					plan.push(this);
				}else{
					if(preDrawCode[index] == Code){
						plan.push('<span style="color:red;font-weight:bold;display:inline">'+this+'(中)</span>');
					}else{
						plan.push(this);
					}
				}
			});
			divhtml += plan.join(',')+'</li>';

			if(this.profitB>0){
				divhtml += '<li style="color:red;float:right;font-weight:bold;">'+this.profitB+'</li>';
			}else{
				divhtml += '<li style="color:green;float:right;width:0.3rem;font-weight:bold;">'+this.profitB+'</li>';
			}
			divhtml += '<li style="float:right;font-weight:bold;margin-right:0.05rem;">'+this.lotteryCostAllB+'</li>';
			divhtml += '<li style="float:right;font-weight:bold;margin-right:0.05rem;">'+this.lotteryCostB+'</li>';
			divhtml += '</ul>';
			divhtml += '<ul id="" class="pk10li planC listli displaynone"><li>';
			var preDrawCode = this.planC.split(",");
			var plan = new Array();
			$(preDrawCode).each(function(index) {
				if(i==0 && this.countTime > 0){
					plan.push(this);
				}else{
					if(preDrawCode[index] == Code){
						plan.push('<span style="color:red;font-weight:bold;display:inline">'+this+'(中)</span>');
					}else{
						plan.push(this);
					}
				}
			});
			divhtml += plan.join(',')+'</li>';
			if(this.profitC>0){
				divhtml += '<li style="color:red;float:right;font-weight:bold;">'+this.profitC+'</li>';
			}else{
				divhtml += '<li style="color:green;float:right;font-weight:bold;">'+this.profitC+'</li>';
			}
			divhtml += '<li style="float:right;font-weight:bold;margin-right:0.05rem;">'+this.lotteryCostAllC+'</li>';
			divhtml += '<li style="float:right;font-weight:bold;margin-right:0.05rem;">'+this.lotteryCostC+'</li>';
			divhtml += '</ul>';

			divhtml += '</div>';
			divhtml += '</div>';
			divhtml += '</div>';
			$("#plan_list").append(divhtml);
		});
	} else {
		console.log("数据请求失败！");
	}
}

method.createHtmlList1 = function(data,checkNum) {
	if(typeof(data) == "string") {
		data = JSON.parse(data);
	}
	if(data.result.data == "" || data.result.data == []) {
		return;
	}
	var contentHtml = "",
		resHtml = "";
	$("#plan_list1").empty();
	$('#plan_list_percent').empty();
	$.each(data.result.data.list, function(j, k) {
		var cla_col = [],
			xaArr = [],
			textArr = [],
			bgarr = [];
		var arr = k[checkNum + "Num"];
		for(var i = 0; i < arr.length; i++) {
			if((i + 1) % 2 == 0) {
				if(arr[i] == 0) {
					cla_col.push("");
					bgarr.push("");
					textArr.push("(--)")
				} else if(arr[i] == 1) {
					cla_col.push("color:red;");
					textArr.push("(对)");
				} else {
					cla_col.push("color:green;");
					textArr.push("(错)");
				}
			} else {
				xaArr.push(arr[i])
			}
		}
		if(k.preDrawCode == "") {
			var fragmentHtml = "等待开奖";
		} else {
			var numCode = k.preDrawCode.split(",");
			var fragmentHtml = "<ul class='num_ul'>" +
				"<li class='pk10_" + numCode[0] * 1 + "'></li>" +
				"<li class='pk10_" + numCode[1] * 1 + "'></li>" +
				"<li class='pk10_" + numCode[2] * 1 + "'></li>" +
				"<li class='pk10_" + numCode[3] * 1 + "'></li>" +
				"<li class='pk10_" + numCode[4] * 1 + "'></li>" +
				"<li class='pk10_" + numCode[5] * 1 + "'></li>" +
				"<li class='pk10_" + numCode[6] * 1 + "'></li>" +
				"<li class='pk10_" + numCode[7] * 1 + "'></li>" +
				"<li class='pk10_" + numCode[8] * 1 + "'></li>" +
				"<li class='pk10_" + numCode[9] * 1 + "'></li>" +
				"</ul>"
			}
			contentHtml += '<div class="linebox" style="border-bottom:1px solid #d7d7d7;">' +
				'<div class="leftspan" style="width:0.5rem;text-align:center"><span>' + tools.subStr(k.preDrawIssue) + '</span></div>' +
				'<div class="leftspan">' +
				'<div class="rightdiv" id="rightdiv" style="padding-left:0;">' +
				'<span style="' + cla_col[0] + '">杀:' + xaArr[0] + textArr[0] +'</span>'+
				'<span style="' + cla_col[1] + '">杀:' + xaArr[1] + textArr[1] +'</span>'+
				'<span style="' + cla_col[2] + '">杀:' + xaArr[2] + textArr[2] +'</span>'+
				'<span style="' + cla_col[3] + '">杀:' + xaArr[3] + textArr[3] +'</span>'+
				'<span style="' + cla_col[4] + '">杀:' + xaArr[4] + textArr[3] +'</span>'+
				'</div></div></div>';
		});
		$("#plan_list1").append(contentHtml);
		var resarr = data.result.data[checkNum + "KillRight"];
		var resarr2 = data.result.data[checkNum + "Percent"];
		resHtml = '<ul class="list_footer list_footerTil"><li>成绩统计</li><li>杀对次数</li><li>成功概率</li></ul>';
		resHtml += '<ul class="list_footer remover_foot"><li>忆离笙</li><li>' + resarr[0] + '</li><li>' + resarr2[0] + '</li></ul>' +
		'<ul class="list_footer remover_foot"><li>值半钱</li><li>' + resarr[1] + '</li><li>' + resarr2[1] + '</li></ul>' +
		'<ul class="list_footer remover_foot"><li>楼满风</li><li>' + resarr[2] + '</li><li>' + resarr2[2] + '</li></ul>' +
		'<ul class="list_footer remover_foot"><li>沐雪柔</li><li>' + resarr[3] + '</li><li>' + resarr2[3] + '</li></ul>' +
		'<ul class="list_footer remover_foot"><li>寒千落</li><li>' + resarr[4] + '</li><li>' + resarr2[4] + '</li></ul>';
		$("#plan_list_percent").append(resHtml);
		
}
//筛选号码大小单双
method.selectedBS = function(obj, ifload) {
	var id = $(obj).attr("id");
	$(obj).siblings(".spanchecked").html($(obj).siblings(".spanchecked").html().replace("计划", ""));
	$(obj).siblings().removeClass("spanchecked");
	$(obj).prepend("计划");
	if(!ifload) {
		$(obj).addClass("spanchecked");
	}
	if(id == "xshm") {
		$(".planA").show();
		$(".planB").hide();
		$(".planC").hide();
	} else if(id == "xsdx") {
		$(".planA").hide();
		$(".planB").show();
		$(".planC").hide();
	}else if(id=="xsds"){
		$(".planA").hide();
		$(".planB").hide();
		$(".planC").show();
	}
}