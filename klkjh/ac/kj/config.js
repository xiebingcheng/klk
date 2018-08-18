// 彩票开奖配置
exports.cp=[
            
	{
		title:'重庆时时彩',
		source:'360彩票网',
		name:'cqssc',
		enable:true,
		timer:'cqssc',

		/*option:{
			host:"api.kaijiangtong.com",
			timeout:50000,
			path: '/lottery/?name=cqssc&format=json&num=1&uid=765661&token=cc5970ea5c0f02a253711e2bd35aa9b875d1a665',
			headers:{
				"User-Agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/22.0.1271.64 Safari/537.11"
			}
		},
		parse:function(str){
			try{
				return getFromCAIPIAOKONG(str,1);
			}catch(err){
				//throw('重庆时时彩解析数据不正确');
			}
		}*/
		option:{
			host:"c.apiplus.net",
			timeout:50000,
			port:'80',
			path: '/newly.do?token=tbe7c022a89cca8f5k&code=cqssc&format=json&rows=1',
			headers:{
				"User-Agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/22.0.1271.64 Safari/537.11"
			}
		},
		parse:function(str){
			try{
				return getFromOPENCAI(str,1);
			}catch(err){
				//throw('重庆时时彩解析数据不正确');
			}
		}
	},////////////		
	
	//{{{
	{
		title:'福彩3D',
		source:'福乐博娱乐平台',
		name:'fc3d',
		enable:true,
		timer:'fc3d',		
		
		option:{
			host:"cp.360.cn",
			timeout:50000,
			port:'443',
			path: '/sd/',
			headers:{
				"User-Agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/22.0.1271.64 Safari/537.11"
			}
		},
		parse:function(str){
			try{
				return getFrom3603D(str,4);
			}catch(err){
				//throw('江西时时彩解析数据不正确');
			}
		}
	},
	
	{
		title:'排列3',
		source:'福乐博娱乐平台',
		name:'pai3',
		enable:true,
		timer:'pai3',		
		
		option:{
			host:"www.500wan.com",
			timeout:50000,
			port:'80',
			path: '/static/info/kaijiang/xml/pls/list10.xml',
			headers:{
				"User-Agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/25.0.1271.64 Safari/537.11"
			}
		},
		
		parse:function(str){
			try{
				str=str.substr(0,300);
				var m;	 
				var reg=/<row expect="(\d+?)" opencode="([\d\,]+?)" opentime="([\d\:\- ]+?)"/;
				if(m=str.match(reg)){
					return {
						table:'pl3',
						type:5,
						time:m[3],
						number:20+m[1],
						data:m[2]
					};
				}
			}catch(err){
				throw('排3解析数据不正确');
			}
		}
	},
	//}}}	
	
	{
		title:'广东11选5',
		source:'福乐博娱乐平台',
		name:'gd11x5',
		enable:true,
		timer:'gd11x5',		

		option:{
			host:"cp.360.cn",
			timeout:50000,
			port:'443',
			path: '/gd11/',
			headers:{
				"User-Agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/22.0.1271.64 Safari/537.11"
			}
		},
		parse:function(str){
			try{
				return getFrom360CP(str,3);
			}catch(err){
				//throw('广东11选5解析数据不正确');
			}
		}
	},////
	
	//{{{
	{
		title:'北京PK10',
		source:'福乐博娱乐平台',
		name:'bjpk10',
		enable:true,
		timer:'bjpk10',

		/*option:{
			host:"api.kaijiangtong.com",
			timeout:50000,
			path: '/lottery/?name=bjpks&format=json&num=1&uid=765661&token=cc5970ea5c0f02a253711e2bd35aa9b875d1a665',
			headers:{
				"User-Agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/29.0.1271.64 Safari/537.11"
			}
		},
		
		parse:function(str){
			try{
				return getFromPK10(str,2);
			}catch(err){
				throw('解析数据不正确');
			}
		}*/
		option:{
			host:"c.apiplus.net",
			timeout:50000,
			port:'80',
			path: '/newly.do?token=tbe7c022a89cca8f5k&code=bjpk10&format=json&rows=1',
			headers:{
				"User-Agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/22.0.1271.64 Safari/537.11"
			}
		},
		parse:function(str){
			try{
				return getFromOPENCAI(str,18);
			}catch(err){
				//throw('重庆时时彩解析数据不正确');
			}
		}
	},//(((	
	
	{
		title:'香港六合彩',
		source:'360彩票网',
		name:'lhc',
		enable:true,
		timer:'lhc',

		option:{
			host:"api.kaijiangtong.com",
			timeout:50000,
			port:'80',
			path: '/lottery/?name=xglhc&format=json&num=1&uid=765661&token=cc5970ea5c0f02a253711e2bd35aa9b875d1a665',
			headers:{
				"User-Agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/22.0.1271.64 Safari/537.11"
			}
		},
		parse:function(str){
			try{
				return getFromCAIPIAOKONG(str,7);
			}catch(err){
				//throw('重庆时时彩解析数据不正确');
			}
		}
		/*option:{
			host:"c.apiplus.net",
			timeout:50000,
			path: '/newly.do?token=t0db6436865a97a01k&code=hk6&format=json&rows=1',
			headers:{
				"User-Agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/22.0.1271.64 Safari/537.11"
			}
		},
		parse:function(str){
			try{
				return getFromOPENCAI(str,34);
			}catch(err){
				//throw('重庆时时彩解析数据不正确');
			}
		}*/
	},
];

// 出错时等待 15
exports.errorSleepTime=15;

// 重启时间间隔，以小时为单位，0为不重启
//exports.restartTime=0.4;
exports.restartTime=0.4;

exports.submit={
	host:'localhost',
	path:'/wj51admin.php/dataSource/kj'
}

exports.dbinfo={
	host:'127.0.0.1',
	user:'root',
	password:'',
	database:'baoma'
}

global.log=function(log){
	var date=new Date();
	console.log('['+date.toDateString() +' '+ date.toLocaleTimeString()+'] '+log)
}
function GetRandomNum(Min,Max)
{   
	var Range = Max - Min;   
	var Rand = Math.random();   
	return(Min + Math.round(Rand * Range));   
} 
function getFromXJFLCPWeb(str, type){
	str=str.substr(str.indexOf('<td><a href="javascript:detatilssc'), 300).replace(/[\r\n]+/g,'');
         
	var reg=/(\d{10}).+(\d{2}\:\d{2}).+<p>([\d ]{9})<\/p>/,
	match=str.match(reg);
	
	if(!match) throw new Error('数据不正确');
	//console.log('期号：%s，开奖时间：%s，开奖数据：%s', match[1], match[2], match[3]);
	
	try{
		var data={
			type:type,
			time:match[1].replace(/^(\d{4})(\d{2})(\d{2})\d{2}/, '$1-$2-$3 ')+match[2],
			number:match[1].replace(/^(\d{8})(\d{2})$/, '$1-$2'),
			data:match[3].split(' ').join(',')
		};
		//console.log(data);
		if(data.number && typeof(data.number) != "undefined") return data;
	}catch(err){
		throw('解析数据失败');
	}
}

function getFrom360CP(str, type){

	str=str.substr(str.indexOf('<em class="red" id="open_issue">'),380);
	//console.log(str);
	var reg=/[\s\S]*?(\d+)<\/em>[\s\S].*?<ul id="open_code_list">((?:[\s\S]*?<li class=".*?">\d+<\/li>){3,5})[\s\S]*?<\/ul>/,
	match=str.match(reg);
	var myDate = new Date();
	var year = myDate.getFullYear();       //年   
    var month = myDate.getMonth() + 1;     //月   
    var day = myDate.getDate();            //日
	if(month < 10) month="0"+month;
	if(day < 10) day="0"+day;
	var mytime=year + "-" + month + "-" + day + " " +myDate.toLocaleTimeString();
	//console.log(match);
	if(match.length>1){
		if(match[1].length==6) match[1]='2018'+match[1].replace(/(\d{4})(\d{2})/,'$1-0$2');
		if(match[1].length==7) match[1]='2018'+match[1].replace(/(\d{4})(\d{3})/,'$1-$2');
		if(match[1].length==8) match[1]='20'+match[1].replace(/(\d{6})(\d{2})/,'$1-0$2');
		if(match[1].length==9) match[1]='20'+match[1].replace(/(\d{6})(\d{2})/,'$1-$2');
		if(match[1].length==10) match[1]=match[1].replace(/(\d{8})(\d{2})/,'$1-0$2');
		var mynumber=match[1].replace(/(\d{8})(\d{3})/,'$1-$2').replace("-","");
		if(type==3){
			_table = 'syxwgd';
		}
		
		try{
			var data={
				table:_table,
				type:type,
				time:mytime,
				number:mynumber
			}
			
			reg=/<li class=".*?">(\d+)<\/li>/g;
			data.data=match[2].match(reg).map(function(v){
				var reg=/<li class=".*?">(\d+)<\/li>/;
				return v.match(reg)[1];
			}).join(',');
			
			//console.log(data);
			if(data.number && typeof(data.number) != "undefined") return data;
		}catch(err){
			throw('解析数据失败');
		}
	}
}

function getFrom3603D(str, type){

	str=str.substr(str.indexOf('<div class="mod-aside mod-aside-t2"'),600).replace(/[\r\n]+/g,'');
	var reg=/[\s\S].*?<b>(\d+)<\/b>[\s\S].*?<ul class="ball-list">((<li class=".*?">\d+<\/li>){3})<\/ul>[\s\S].*?/,
	match=str.match(reg);
	var myDate = new Date();
	var year = myDate.getFullYear();       //年   
    var month = myDate.getMonth() + 1;     //月   
    var day = myDate.getDate();            //日
	if(month < 10) month="0"+month;
	if(day < 10) day="0"+day;
	var mytime=year + "-" + month + "-" + day + " " +myDate.toLocaleTimeString();
	//console.log(match);
	if(match.length>1){
		var mynumber=match[1];		
		try{
			var data={
				table:'fc3d',
				type:type,
				time:mytime,
				number:mynumber
			}
			
			reg=/<li class=".*?">(\d+)<\/li>/g;
			data.data=match[2].match(reg).map(function(v){
				var reg=/<li class=".*?">(\d+)<\/li>/;
				return v.match(reg)[1];
			}).join(',');			
			//console.log(data);
			if(data.number && typeof(data.number) != "undefined") return data;
		}catch(err){
			throw('解析数据失败');
		}
	}
}

function getFromPK10(str, type){

	str=str.substr(str.indexOf('<div class="lott_cont">'),350).replace(/[\r\n]+/g,'');
    //console.log(str);
	var reg=/<tr class=".*?">[\s\S]*?<td>(\d+)<\/td>[\s\S]*?<td>(.*)<\/td>[\s\S]*?<td>([\d\:\- ]+?)<\/td>[\s\S]*?<\/tr>/,
	match=str.match(reg);
	if(!match) throw new Error('数据不正确');
	//console.log(match);
	try{
		var data={
			table:'pk10bj',
			type:type,
			time:match[3],
			number:match[1],
			data:match[2]
		};
		//console.log(data);
		if(data.number && typeof(data.number) != "undefined") return data;
	}catch(err){
		throw('解析数据失败');
	}
	
}

function getFromCAIPIAOKONG(str, type){
	var reg=/{"(.*)":{"number":"(.*)","dateline"[\s\S].*?}}/,
	match=str.match(reg);
	if(!match) throw new Error('数据不正确');	
	//console.log(match);	
	var myDate = new Date();
	var year = myDate.getFullYear();       //年   
    var month = myDate.getMonth() + 1;     //月   
    var day = myDate.getDate();            //日
	if(month < 10) month="0"+month;
	if(day < 10) day="0"+day;
	var mytime=year + "-" + month + "-" + day + " " +myDate.toLocaleTimeString();
	var _number = match[1];
	if(type == 1){
		_table = 'ssccq';
	}else if(type == 2){
		_table = 'pk10bj';
	}else if(type == 7){
		_table = 'lhc';
	}
	try{
		var data={
			table:_table,
			type:type,
			time:mytime,
			number:_number,
			data:match[2]
		};
		//console.log(data);
		if(data.number && typeof(data.number) != "undefined") return data;
	}catch(err){
		throw('解析数据失败');
	}	
}

function getFromOPENCAI(str, type){
	var reg=/{[\s\S].*?,"data":\[{"expect":"(.*)","opencode":"(.*)","opentime":[\s\S].*?}\]}/,
	match=str.match(reg);
	if(!match) throw new Error('数据不正确');
	
	var myDate = new Date();
	var year = myDate.getFullYear();       //年   
    var month = myDate.getMonth() + 1;     //月   
    var day = myDate.getDate();            //日
	if(month < 10) month="0"+month;
	if(day < 10) day="0"+day;
	var mytime=year + "-" + month + "-" + day + " " +myDate.toLocaleTimeString();
	var _number = match[1];
	var _data = match[2];
	if(type == 1){
		_table = 'ssccq';
	}
	if(type == 18){
		_table = 'pk10bj';
	}	
	try{
		var data={
			table:_table,
			type:type,
			time:mytime,
			number:_number,
			data:_data
		};
		console.log(data);
		if(data.number && typeof(data.number) != "undefined") return data;
	}catch(err){
		throw('解析数据失败');
	}	
}