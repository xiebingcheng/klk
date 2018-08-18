requirejs(["jquery", "alerttoshow"], function($) {
	isCanGetNext = true;
	//投注信息
    $(function() {
    	if(typeof isLoadTimer!="undefined" && isLoadTimer !=null && isLoadTimer){
    		timer();
    	}        	
    	if(typeof isLoadDataList!="undefined" && isLoadDataList !=null && isLoadDataList){
    		ajaxDatas();
    	}
    });	
    
    function timeHtml(time_str) {
    	var time = time_str - 0;
    	var time_obj = { h: "00", m: "00", s: "00" };
    	if (time > 0) {
    		var h = parseInt(time / 3600);
    		var m = parseInt((time - h * 3600) / 60);
    		var s = time - h * 3600 - m * 60;

    		function munChange(num) {
    			return (num == 0) ? "00" : ((num >= 10) ? num : ("0" + num));
    		}
    		time_obj.h = munChange(h);
    		time_obj.m = munChange(m);
    		time_obj.s = munChange(s);
    	}
    	return time_obj.h + ':' + time_obj.m + ':' + time_obj.s;
	}
	
    function timer() {
    	var dealTimer = function() {
    		//返回：需要被查询的彩票的id
    		var getLotteryIdStr = function() {
	    		//*遍历所有彩票，涮选出 符合 查询条件的 gameIdStr （需要被查询的彩票的id）  */
	    		var lotteryIdStr = ""; //即将用来查询的参数：gameIdStr ，（即：需要跟新的彩票的id的集合）
	    		for (var p in lottery.obj) {
	    			var time_str = $("#lot" + p).data("time") - 1;
	    			$("#lot" + p).data("time", time_str);
	                $("#lot" + p + " .time-txt").html(timeHtml(time_str)); // 修改 倒计时的 html内容
	                $("#lot" + p).data("opentime", $("#lot" + p).data("opentime") - 1);
	                var currentTime = new Date().getTime(); //当前时间
	                //当 （关盘时间小于等于0 ），调用接口
	                if ($("#lot" + p).data("time") <= 0) {
	                	//当前id对应的彩票正在 处于上一个ajax请求中，还未结束时，无须重新查询； 当前时间距离最新一次查询的时间间隔相差大于60秒;要满足这2种条件； ||
	                    if ($("#lot" + p).data("ajax") != "true" && ((currentTime - $("#lot" + p).data("lasttimer")) / 1000 >= 1)) {
	                    	lotteryIdStr += p + ",";
	                        $("#lot" + p).data("ajax", "true"); // true，表示 ajax 正在进行。
	                    }
	                }
	                // 或者 （ 开奖时间小于等于0并且；开奖号码为空；上一个ajax请求已结束）,要满足这3种条件；
	                if ($("#lot" + p).data("opentime") <= 0 && $("#lot" + p).data("opendata") == "" && $("#lot" + p).data("ajax") != "true") {
	                	//时间小于 -50 但 距离上次查询 大于60秒的间隔 ，
	                    if (((currentTime - $("#lot" + p).data("lasttimer")) / 1000 >= 1)){
	                    	lotteryIdStr += p + ",";
	                    	$("#lot" + p).data("ajax", "true"); // true，表示 ajax 正在进行。
	                    }
	                }
	    		}
	    		if(lotteryIdStr != ''){
	    			lotteryIdStr = lotteryIdStr.substr(0, lotteryIdStr.length - 1);
	    		}	    		 
                return lotteryIdStr;
    		};
    		
    		try {
    			var lotteryIdStr = getLotteryIdStr();
    			//如果没有满足条件的id则不执行ajax，不浪费ajax请求，（满足条件的id指的是， 倒计时为0的id）
    			if (lotteryIdStr.length == 0) {
    				return;
    			}    			
    			if (!isCanGetNext) {
    	            return;
    	        }
    			isCanGetNext = false;    			
    			$.ajax({
    				 url: '/public/index.php/mobile/ajax/getLotterys',
    		         type: 'GET',
    		         dataType: 'json',
    		         data: {'ids':lotteryIdStr},
    		         timeout: 30000,
    		         success: function(data) {
    		            var result=data.result;            	
    		            if (result.itemCount > 0) {
    		            	for (var j = 0; j < result.itemCount; j++) {
    		                	var id = result.items[j].id;
    		                    var icon = result.items[j].icon;                       
    		                    var title = result.items[j].title;
    		                    var lastNumber = result.items[j].last_number; //上期期数                       
    		                    var time = result.items[j].diff_time; //关盘剩余秒数
    		                    var openTime = result.items[j].open_time; //关盘剩余秒数
    		                    var openData = result.items[j].last_data; //开奖号码                        
    		                    $("#lot" + id +' .number').html('第 '+ lastNumber +' 期');
    				            var html='';
    				            if (openData && openData.split(",").length > 0) {
    					            var arr = openData.split(",");
    						    	for (var q = 0; q < arr.length; q++) {
    						            if (arr[q] =='+') {
    						            	html += arr[q];
    						            }else if(arr[q] !=''){
    						            	html += '<span class="n'+arr[q]+'">'+arr[q]+'</span>';
    						            }
    						        }
    						    	if(id==7){
    						    		html += '<div class="clearfix"></div>';
    						    		for (var q = 0; q < arr.length; q++) {
        						            if (arr[q] =='+') {
        						            	html += arr[q];
        						            }else if(arr[q] !=''){
        						            	html += '<span>'+lhcConfig[arr[q]]+'</span>';
        						            }
        						        }
    						    	}
    					    	}else{
    					    		html += '<p class="opening">正在开奖...</p>';
    					    	}
    				            $("#lot" + id +' .cp-number').html(html);    							
    							$("#lot" + id).data("last-number", lastNumber);
    		                    $("#lot" + id).data("time", time);
    		                    $("#lot" + id).data("opendata", openData);
    		                    if(openData != ''){
   		                    		$("#lot" + id).data("opentime", openTime);    		                    
   		                    		if(typeof isLoadDataList!="undefined" && isLoadDataList !=null && isLoadDataList){
   		                    			window.location.reload();
   		                    		}
   		                    		if(typeof isLoadPlanList!="undefined" && isLoadPlanList !=null && isLoadPlanList){
   		                    			window.location.reload();
   		                    		}
    		                    }
    		                    $("#lot" + id).data("lasttimer", new Date().getTime()); // 记录当前彩票的最后一次 ajax 查询的时间，用于后面计算时间间隔。
    		                    $("#lot" + id).data("ajax", "false"); // false，表示 ajax已经结束。
    		            	}    		            	
    		            }  
    		            isCanGetNext = true;
    		         },
    		         error:function(e){
    		        	 console.log(e);
    		         }
    			 });
    		} catch (e){
    			
    		}
    	};
    	setInterval(dealTimer, 1000);
	}
    
    function ajaxDatas() {
        var pages = Math.ceil(total / pageSize);
        if (pages > 1) {
        	var flag =  false;
        	var status = true;
            $(window).bind("scroll",function(){
                if ($(document).scrollTop() + $(window).height() >= $(document).height() && flag == false) {
                	var _page = $('#art-list').data('page');
                	if (_page > pages) {
                		$('.tips').html('');                    	
                        flag = true;
                        return;
                    }
                	$('.tips').html('正在加载中...'); 
                    if(!status)return;
                    status=false;
                    try {
                    	$.ajax({
               				url: '/public/index.php/mobile/ajax/getDatas',
               		        type: 'GET',
               		        dataType: 'json',
               		        data:{"id":id,"date":date,"page":_page},
               		        timeout: 30000,
               		        success: function(data){
               		        	status=true;
               		        	result=data.result;            	
               		        	if (result.itemCount > 0) {
               		        		$('#art-list').data('page', parseInt(_page) + 1);
               		        		var html = "";
               		        		for (var j = 0; j < result.itemCount; j++) {
               		                    var number = result.items[j].number;     
               		                    html += '<div class="list-item">';
               		                    html += '<div class="cp-time">第'+ number +'期：</div>'; 
               		                    html += '<div class="cp-number">';
	               		                if (result.items[j].data_data.itemCount > 0) {		            	
	               			            	for (var k = 0; k < result.items[j].data_data.itemCount; k++) {
	               			            		if (result.items[j].data_data.items[k]=='+') {
	        						            	html += result.items[j].data_data.items[k];
	        						            }else if(result.items[j].data_data.items[k]!=''){
	        						            	html += '<span class="n'+result.items[j].data_data.items[k]+'">'+result.items[j].data_data.items[k]+'</span>';
	        						            }
	               			            	}
	               			            	if(id==7){
	        						    		html += '<br />';
	        						    		for (var k = 0; k < result.items[j].data_data.itemCount; k++) {
		               			            		if (result.items[j].data_data.items[k]=='+') {
		        						            	html += result.items[j].data_data.items[k];
		        						            }else if(result.items[j].data_data.items[k]!=''){
		        						            	html += '<span>'+lhcConfig[result.items[j].data_data.items[k]]+'</span>';
		        						            }
		               			            	}
	        						    	}
	               			            }
               		                    html += '</div>';
               		                    html += '<div class="clearfix"></div>';
               		                    html += '</div>';
               		            	}  
               		        		$('#art-list').append(html);
               		        		$('.tips').html('');
               		            }               		        	
               		        },
               		        error:function(e){
               		        	console.log(e);
               		        }
                        });
                    }catch (e){
                    	
                    }                    
                }else{
                    flag = false;
                }
            })
        }else{
        	$('.tips').html('');
            flag = true;
            return;
        }
    }
});