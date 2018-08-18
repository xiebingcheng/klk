function codeIn(code, arr){
	return arr.indexOf(code)!=-1;
}

/**
 * 算法模型
 *　func(betData, kjData, betWeiShu)
 *
 * @params betData		投注号码
 * @params kjData		开奖号码
 * @params betWeiShu	投注位数，一般不用，在任选的时候用
 *
 * @return 				返回中奖注数，如果不中奖，则返回0
 *
 * @throw				遇到不明的可以抛出，抛出等于忽略，手工处理
 */
//时时彩

// 后二直选
exports.sscH2ZX=function(bet, kjData){
	return zx(bet, kjData.removeFromList(',', 1,2,3));
}

// 后三直选
exports.sscH3ZX=function(bet, kjData){
	return zx(bet, kjData.removeFromList(',',1,2));
}

// 后三组六
exports.sscH3Z6=function(bet, kjData){
	return z6(bet, kjData.removeFromList(',',1,2));
}

// 不定位五星
exports.sscBDW5X=function(bet, kjData){
	return bdw(bet, kjData);
}

// 个位定位胆
exports.sscDWGW=function(bet, kjData){
	return dwd(bet, kjData.removeFromList(',',1,2,3,4));
}

// 十位定位胆
exports.sscDWSW=function(bet, kjData){
	return dwd(bet, kjData.removeFromList(',',1,2,3,5));
}

// 百位定位胆
exports.sscDWBW=function(bet, kjData){
	return dwd(bet, kjData.removeFromList(',',1,2,4,5));
}

// 千位定位胆
exports.sscDWQW=function(bet, kjData){
	return dwd(bet, kjData.removeFromList(',',1,3,4,5));
}

// 万位定位胆
exports.sscDWWW=function(bet, kjData){
	return dwd(bet, kjData.removeFromList(',',2,3,4,5));
}

//北京PK10

//冠军
exports.pk10NO1=function(bet, kjData){
	return no(bet, kjData, 1);
}

//亚军
exports.pk10NO2=function(bet, kjData){
	return no(bet, kjData, 2);
}

//季军
exports.pk10NO3=function(bet, kjData){
	return no(bet, kjData, 3);
}

//四名
exports.pk10NO4=function(bet, kjData){
	return no(bet, kjData, 4);
}

//五名
exports.pk10NO5=function(bet, kjData){
	return no(bet, kjData, 5);
}

//六名
exports.pk10NO6=function(bet, kjData){
	return no(bet, kjData, 6);
}

//七名
exports.pk10NO7=function(bet, kjData){
	return no(bet, kjData, 7);
}

//八名
exports.pk10NO8=function(bet, kjData){
	return no(bet, kjData, 8);
}

//九名
exports.pk10NO9=function(bet, kjData){
	return no(bet, kjData, 9);
}

//十名
exports.pk10NO10=function(bet, kjData){
	return no(bet, kjData, 10);
}

//11选5

//第一球
exports.gd11x5Q1=function(bet, kjData){
	return dwd(bet, kjData.removeFromList(',',2,3,4,5));
}

//第二球
exports.gd11x5Q2=function(bet, kjData){
	return dwd(bet, kjData.removeFromList(',',1,3,4,5));
}

//第三球
exports.gd11x5Q3=function(bet, kjData){
	return dwd(bet, kjData.removeFromList(',',1,2,4,5));
}

//第四球
exports.gd11x5Q4=function(bet, kjData){
	return dwd(bet, kjData.removeFromList(',',1,2,3,5));
}

//第五球
exports.gd11x5Q5=function(bet, kjData){
	return dwd(bet, kjData.removeFromList(',',1,2,3,4));
}

//福彩3D

//独胆
exports.fc3dDD=function(bet, kjData){
	return bdw(bet, kjData);
}

//不定胆三星
exports.fc3dBDD3X=function(bet, kjData){
	return bdd(bet, kjData);
}

//排列3

//独胆
exports.pl3DD=function(bet, kjData){
	return bdw(bet, kjData);
}

//不定胆三星
exports.pl3BDD3X=function(bet, kjData){
	return bdd(bet, kjData);
}

//六合彩

//25码中特
exports.lhc25MZT=function(bet, kjData){
	return zm(bet, kjData.removeFromList(',',1,2,3,4,5,6));
}

//8肖中特
exports.lhc8XZT=function(bet, kjData){
	return zx2(bet, kjData.removeFromList(',',1,2,3,4,5,6));
}

//6尾中特
exports.lhc6WZT=function(bet, kjData){
	return zw(bet, kjData.removeFromList(',',1,2,3,4,5,6));
}

//1尾平特
exports.lhc1WPT=function(bet, kjData){
	return ptzw(bet, kjData.removeFromList(',',7));
}

//1肖平特
exports.lhc1XPT=function(bet, kjData){
	return ptzx(bet, kjData.removeFromList(',',7));
}

/**
 * 笛卡尔乘积算法
 *
 * @params 一个可变参数，原则上每个都是数组，但如果数组只有一个值是直接用这个值
 *
 * useage:
 * console.log(DescartesAlgorithm(2, [4,5], [6,0],[7,8,9]));
 */
function DescartesAlgorithm(){
	var i,j,a=[],b=[],c=[];
	if(arguments.length==1){
		if(!Array.isArray(arguments[0])){
			return [arguments[0]];
		}else{
			return arguments[0];
		}
	}
	
	if(arguments.length>2){
		for(i=0;i<arguments.length-1;i++) a[i]=arguments[i];
		b=arguments[i];
		
		return arguments.callee(arguments.callee.apply(null, a), b);
	}

	if(Array.isArray(arguments[0])){
		a=arguments[0];
	}else{
		a=[arguments[0]];
	}
	if(Array.isArray(arguments[1])){
		b=arguments[1];
	}else{
		b=[arguments[1]];
	}

	for(i=0; i<a.length; i++){
		for(j=0; j<b.length; j++){
			if(Array.isArray(a[i])){
				c.push(a[i].concat(b[j]));
			}else{
				c.push([a[i],b[j]]);
			}
		}
	}
	
	return c;
}

/**
 * 组合算法
 *
 * @params Array arr		备选数组
 * @params Int num
 *
 * @return Array			组合
 *
 * useage:  combine([1,2,3,4,5,6,7,8,9], 3);
 */
function combine(arr, num) {
	var r = [];
	(function f(t, a, n) {
		if (n == 0) return r.push(t);
		for (var i = 0, l = a.length; i <= l - n; i++) {
			f(t.concat(a[i]), a.slice(i + 1), n - 1);
		}
	})([], arr, num);
	return r;
}

/**
 * 排列算法
 */
function permutation(arr, num){
	var r=[];
	(function f(t,a,n){
		if (n==0) return r.push(t);
		for (var i=0,l=a.length; i<l; i++){
			f(t.concat(a[i]), a.slice(0,i).concat(a.slice(i+1)), n-1);
		}
	})([],arr,num);
	return r;
}

//}}}

//判断一个字符串在另一个字符串中出现了几次
function countInstances(mainStr, subStr){
	var count = 0;
	var offset = 0;
	do{
		offset = mainStr.indexOf(subStr, offset);
		if(offset != -1){
			count++;
            offset += subStr.length;
		}
	}while(offset != -1)
	return count;
}

//时时彩组选之出现次数部分
function sscZXIN(arr, kj, count){
	var countI,flag=true;
	if(!Array.isArray(arr)) arr=arr.split('');
	for(var i=0;i<arr.length;i++){
		countI=countInstances(kj, arr[i]);
		if(parseInt(countI)!=parseInt(count)) flag=false;
	}
	return flag;
}	
 
//检查字符串重复
function checkRepeatData(str){
	var temp = "," + str + ",";
	var reg = /([^,]+)(?=.*\1,)/g;  
	var result = [];
	var exsits = {};
	var flag = false;
	while(reg.exec(temp)){
		var c = RegExp.$1;
		if(!exsits[c]){
			exsits[c] = true;
			var count = temp.split("," + c + ",").length - 1;
			if(count>0){
				flag=true;
			}
		}
	}
	return  flag;
}

/**
* @params bet		投注列表：12367-04569
* @params kj		开奖数据：1,2
*
* @return 			返回中奖注数
*/
function zx(bet, kj){	
	var sum=0;
	bet=bet.split('-');
	kj=kj.split(',');
	if(bet.length!=kj.length){
		return 0;
	}
	for (var i = 0; i < bet.length; i++){
		if(bet[i].indexOf(kj[i])!=-1) sum++;
	}
	if(bet.length==sum){
		return 1;
	}
	return 0;
}

/**
* @params bet		投注列表：1
* @params kj		开奖数据：1,2,3,4,5
*
* @return 			返回中奖注数
*/
function bdw(bet, kj){	
	if(kj.indexOf(bet)!=-1) return 1;
	return 0;
}

/**
* @params bet		投注列表：1,2,3,4,5
* @params kj		开奖数据：1
*
* @return 			返回中奖注数
*/
function dwd(bet, kj){	
	if(bet.indexOf(kj)!=-1) return 1;
	return 0;
}

/**
* @params bet		投注列表：1,2,3
* @params kj		开奖数据：1,2,3,4,5
*
* @return 			返回中奖注数
*/
function bdd(bet, kj){	
	bet=bet.split(',');
	for (var i = 0; i < bet.length; i++){
		if(kj.indexOf(bet[i])!=-1) return 1;
	}	
	return 0;
}

/**
* @params bet		投注列表：1
* @params kj		开奖数据：01,02,03,04,05,06,07,08,09,10
* @params no		名次
*
* @return 			返回中奖注数
*/
function no(bet, kj, no){	
	kj=kj.split(',');
	val=kj[no-1];
	if(bet.indexOf(val)!=-1){
		return 1;
	}else{
		return 0;
	}
}

/**
* @params bet		投注列表：1,2,3,4,5,6,7,8,9
* @params kj		开奖数据：5,6,1,3,4
*
* @return 			返回中奖注数
*/
function z6(bet, kj){
	var sum=0;
	// 豹子不算中奖
	if(kj.match(/^(\d),\1,\1/)) return 0;
	//对子不算中奖
	if(checkRepeatData(kj)) return 0;	
	kj=kj.split(',');
	for (var i = 0; i < kj.length; i++){
		if(bet.indexOf(kj[i])!=-1) sum++;
	}
	if(kj.length==sum){
		return 1;
	}else{
		return 0;
	}
}

/**
* @params m		号码：01,02,03,04,05,06
*
* @return 		返回生肖
*/
function m2x(ma){
	if(ma=='01' || ma=='13' || ma=='25' || ma=='37' || ma=='49'){
		return '狗';
	}else if(ma=='02' || ma=='14' || ma=='26' || ma=='38'){
		return '鸡';
	}else if(ma=='03' || ma=='15' || ma=='27' || ma=='39'){
		return '猴';
	}else if(ma=='04' || ma=='16' || ma=='28' || ma=='40'){
		return '羊';
	}else if(ma=='05' || ma=='17' || ma=='29' || ma=='41'){
		return '马';
	}else if(ma=='06' || ma=='18' || ma=='30' || ma=='42'){
		return '蛇';
	}else if(ma=='07' || ma=='19' || ma=='31' || ma=='43'){
		return '龙';
	}else if(ma=='08' || ma=='20' || ma=='32' || ma=='44'){
		return '兔';
	}else if(ma=='09' || ma=='21' || ma=='33' || ma=='45'){
		return '虎';
	}else if(ma=='10' || ma=='22' || ma=='34' || ma=='46'){
		return '牛';
	}else if(ma=='11' || ma=='23' || ma=='35' || ma=='47'){
		return '鼠';
	}else if(ma=='12' || ma=='24' || ma=='36' || ma=='48'){
		return '猪';
	}
}

/**
* @params bet		投注列表：01,02,03,04,05,06
* @params kj		开奖数据：06
*
* @return 			返回中奖注数
*/
function zm(bet, kj){	
	if(bet.indexOf(kj)!=-1) return 1;
	return 0;
}

/**
* @params bet		投注列表：狗,鸡,羊,马,兔,牛,鼠,猪
* @params kj		开奖数据：06
*
* @return 			返回中奖注数
*/
function zx2(bet, kj){	
	kj=m2x(kj);
	if(bet.indexOf(kj)!=-1) return 1;
	return 0;
}

/**
* @params bet		投注列表：3尾,4尾,5尾,6尾,7尾,9尾
* @params kj		开奖数据：06
*
* @return 			返回中奖注数
*/
function zw(bet, kj){	
	weishu=parseInt(kj)%10;
	if(bet.indexOf(weishu)!=-1) return 1;
	return 0;
}

/**
* @params bet		投注列表：3尾,4尾,5尾,6尾,7尾,9尾
* @params kj		开奖数据：06,07,08,09,10,11
*
* @return 			返回中奖注数
*/
function ptzw(bet, kj){	
	bet=bet.replace(new RegExp("尾","g"),'');
	kj=kj.split(',');
	var w='';
	for (var i = 0; i < kj.length; i++){
		w=parseInt(kj[i])%10;
		if(bet.indexOf(w)!=-1){			
			return 1;
			break;
		}
	}
	return 0;
}

/**
* @params bet		投注列表：狗,鸡,羊,马,兔,牛,鼠,猪
* @params kj		开奖数据：06,07,08,09,10,11
*
* @return 			返回中奖注数
*/
function ptzx(bet, kj){	
	kj=kj.split(',');
	var x='';
	for (var i = 0; i < kj.length; i++){	
		x=m2x(kj[i]);
		if(bet.indexOf(x)!=-1){			
			return 1;
			break;
		}
	}
	return 0;
}
