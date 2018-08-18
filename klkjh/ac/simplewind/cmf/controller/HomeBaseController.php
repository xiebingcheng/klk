<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2018 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +---------------------------------------------------------------------
// | Author: Dean <zxxjjforever@163.com>
// +----------------------------------------------------------------------
namespace cmf\controller;

use think\Db;
use app\admin\model\ThemeModel;
use think\View;
use think\Config;

class HomeBaseController extends BaseController
{
	public $time;
	public $types;
	
    public function _initialize()
    {
        // 监听home_init
        hook('home_init');
        parent::_initialize();
        $siteInfo = cmf_get_site_info();
        $rootPath = cmf_get_root();
        $module = request()->module();
        $controller = request()->controller();
        $action = request()->action();
        //调用开奖
        Config::load(APP_PATH.'business.php');
        $lhcConfig = config('lhc');
        View::share('lhc_config', $lhcConfig);
        View::share('site_info', $siteInfo);
        View::share('root_path', $rootPath);
        View::share('module', strtolower($module));
        View::share('controller', strtolower($controller));
        View::share('action', strtolower($action));
        View::share('is_login', cmf_is_user_login());
        $this->time=$this->request->server('REQUEST_TIME');
    }

    public function _initializeView()
    {
        $cmfThemePath    = config('cmf_theme_path');
        $cmfDefaultTheme = cmf_get_current_theme();

        $themePath = "{$cmfThemePath}{$cmfDefaultTheme}";

        $root = cmf_get_root();
        //使cdn设置生效
        $cdnSettings = cmf_get_option('cdn_settings');
        if (empty($cdnSettings['cdn_static_root'])) {
            $viewReplaceStr = [
                '__ROOT__'     => $root,
                '__TMPL__'     => "{$root}/{$themePath}",
                '__STATIC__'   => "{$root}/static",
                '__WEB_ROOT__' => $root
            ];
        } else {
            $cdnStaticRoot  = rtrim($cdnSettings['cdn_static_root'], '/');
            $viewReplaceStr = [
                '__ROOT__'     => $root,
                '__TMPL__'     => "{$cdnStaticRoot}/{$themePath}",
                '__STATIC__'   => "{$cdnStaticRoot}/static",
                '__WEB_ROOT__' => $cdnStaticRoot
            ];
        }

        $viewReplaceStr = array_merge(config('view_replace_str'), $viewReplaceStr);
        config('template.view_base', "{$themePath}/");
        config('view_replace_str', $viewReplaceStr);

        $themeErrorTmpl = "{$themePath}/error.html";
        if (file_exists_case($themeErrorTmpl)) {
            config('dispatch_error_tmpl', $themeErrorTmpl);
        }

        $themeSuccessTmpl = "{$themePath}/success.html";
        if (file_exists_case($themeSuccessTmpl)) {
            config('dispatch_success_tmpl', $themeSuccessTmpl);
        }


    }

    /**
     * 加载模板输出
     * @access protected
     * @param string $template 模板文件名
     * @param array $vars 模板输出变量
     * @param array $replace 模板替换
     * @param array $config 模板参数
     * @return mixed
     */
    protected function fetch($template = '', $vars = [], $replace = [], $config = [])
    {
        $template = $this->parseTemplate($template);
        $more     = $this->getThemeFileMore($template);
        $this->assign('theme_vars', $more['vars']);
        $this->assign('theme_widgets', $more['widgets']);
        return parent::fetch($template, $vars, $replace, $config);
    }

    /**
     * 自动定位模板文件
     * @access private
     * @param string $template 模板文件规则
     * @return string
     */
    private function parseTemplate($template)
    {
        // 分析模板文件规则
        $request = $this->request;
        // 获取视图根目录
        if (strpos($template, '@')) {
            // 跨模块调用
            list($module, $template) = explode('@', $template);
        }

        $viewBase = config('template.view_base');

        if ($viewBase) {
            // 基础视图目录
            $module = isset($module) ? $module : $request->module();
            $path   = $viewBase . ($module ? $module . DS : '');
        } else {
            $path = isset($module) ? APP_PATH . $module . DS . 'view' . DS : config('template.view_path');
        }

        $depr = config('template.view_depr');
        if (0 !== strpos($template, '/')) {
            $template   = str_replace(['/', ':'], $depr, $template);
            $controller = cmf_parse_name($request->controller());
            if ($controller) {
                if ('' == $template) {
                    // 如果模板文件名为空 按照默认规则定位
                    $template = str_replace('.', DS, $controller) . $depr . $request->action();
                } elseif (false === strpos($template, $depr)) {
                    $template = str_replace('.', DS, $controller) . $depr . $template;
                }
            }
        } else {
            $template = str_replace(['/', ':'], $depr, substr($template, 1));
        }
        return $path . ltrim($template, '/') . '.' . ltrim(config('template.view_suffix'), '.');
    }

    /**
     * 获取模板文件变量
     * @param string $file
     * @param string $theme
     * @return array
     */
    private function getThemeFileMore($file, $theme = "")
    {

        //TODO 增加缓存
        $theme = empty($theme) ? cmf_get_current_theme() : $theme;

        // 调试模式下自动更新模板
        if (APP_DEBUG) {
            $themeModel = new ThemeModel();
            $themeModel->updateTheme($theme);
        }

        $themePath = config('cmf_theme_path');
        $file      = str_replace('\\', '/', $file);
        $file      = str_replace('//', '/', $file);
        $file      = str_replace(['.html', '.php', $themePath . $theme . "/"], '', $file);

        $files = Db::name('theme_file')->field('more')->where(['theme' => $theme])->where(function ($query) use ($file) {
            $query->where(['is_public' => 1])->whereOr(['file' => $file]);
        })->select();

        $vars    = [];
        $widgets = [];
        foreach ($files as $file) {
            $oldMore = json_decode($file['more'], true);
            if (!empty($oldMore['vars'])) {
                foreach ($oldMore['vars'] as $varName => $var) {
                    $vars[$varName] = $var['value'];
                }
            }

            if (!empty($oldMore['widgets'])) {
                foreach ($oldMore['widgets'] as $widgetName => $widget) {

                    $widgetVars = [];
                    if (!empty($widget['vars'])) {
                        foreach ($widget['vars'] as $varName => $var) {
                            $widgetVars[$varName] = $var['value'];
                        }
                    }

                    $widget['vars']       = $widgetVars;
                    $widgets[$widgetName] = $widget;
                }
            }
        }

        return ['vars' => $vars, 'widgets' => $widgets];
    }

    public function checkUserLogin()
    {
        $userId = cmf_get_current_user_id();
        if (empty($userId)) {
            if ($this->request->isAjax()) {
                $this->error("您尚未登录", cmf_url("user/Login/index"));
            } else {
                $this->redirect(cmf_url("user/Login/index"));
            }
        }
    }
    
    public function getTypes(){
    	if($this->types) return $this->types;
    	$types = cache('cmf_types');
    	if($types) return $types;
    	$types=Db::name('type')->where('status=1')->order('list_order DESC')->select()->toArray();
    	$typeArr=array();
    	foreach ($types as $type){
    		$typeArr[$type['id']] = $type;
    	}
    	cache('cmf_types', $typeArr);
    	return $this->types=$typeArr;
    }
    
    private function setTimeNumber(&$actionTime, &$time=null){  
    	if(!$time) $time= $this->time;
    	$actionTime=date('Y-m-d ', $time).$actionTime;
    }
    
    public function noHdCQSSC(&$actionNumber, &$actionTime, $time=null){
    	$this->setTimeNumber($actionTime, $time);
    	if($actionNumber==0||$actionNumber==120){
    		$actionNumber=date('Ymd120', $time - 24*3600);
    		$actionTime=date('Y-m-d 00:00', $time);
    	}else{
    		$actionNumber=date('Ymd', $time).substr(1000+$actionNumber,1);
    	}
    }
    
    public function noHd(&$actionNumber, &$actionTime, $time=null){
    	$this->setTimeNumber($actionTime, $time);
    	$actionNumber=date('Ymd', $time).substr(100+$actionNumber,1);
    }
    
    public function noxHd(&$actionNumber, &$actionTime, $time=null){
    	$this->setTimeNumber($actionTime, $time);
    	if($actionNumber>=84){
    		$time-=24*3600;
    	}    
    	$actionNumber=date('Ymd', $time).substr(100+$actionNumber,1);
    }
    
    public function no0Hd(&$actionNumber, &$actionTime, $time=null){
    	$this->setTimeNumber($actionTime, $time);
    	$actionNumber=date('Ymd', $time).substr(1000+$actionNumber,1);
    }
    
    public function no00Hd(&$actionNumber, &$actionTime, $time=null){
    	$this->setTimeNumber($actionTime, $time);
    	$actionNumber=date('Ymd', $time).substr(10000+$actionNumber,1);
    }
    
    public function pai3(&$actionNumber, &$actionTime, $time=null){
    	$this->setTimeNumber($actionTime, $time);
    	$actionNumber=date('Yz', $time);
    	$actionNumber=substr($actionNumber,0,4).substr(substr($actionNumber,4)+1001-7,1);
    }
    
    public function BJpk10(&$actionNumber, &$actionTime, $time=null){
    	$this->setTimeNumber($actionTime, $time);
    	$actionNumber = 179*(strtotime(date('Y-m-d', $time))-strtotime('2007-11-18'))/3600/24+$actionNumber-34-179*21;
    }
    
    public function no6Hd(&$actionNumber, &$actionTime, $time=null){
    	//if(!$time) $time=$this->time;
    	//$actionNumber=substr(date('Yz', $time),0,4).substr(1000+$actionNumber,1);
    }
    
    //获取延迟时间
    public function getTypeFtime($type){
    	$type=intval($type);
    	$fTime=0;
    	if($type){
    		$typeInfo=Db::name('type')->field("data_ftime")->where(["id" => $type])->find();
    		$fTime=$typeInfo['data_ftime'];
    	}
    	if(!$fTime) $fTime=0;
    	return intval($fTime);
    }
    
    /**
     * 读取将要开奖期号
     * @params $type		彩种ID
     * @params $time		时间，如果没有，当默认当前时间
     */
    public function getTypeNumber($type, $time=null){  
    	$type=intval($type);
    	if($time===null) $time=$this->time;
    	$kjTime=$this->getTypeFtime($type);    
    	
    	if($type==7){ //六合彩
    		$atime=date('Y-m-d H:i:s', $time+$kjTime);
    		$atimedb=Db::name('lhc_time');
    	}else{
    		$atime=date('H:i:s', $time+$kjTime);
    		$atimedb=Db::name('time');
    	}	
    	$return = $atimedb->field('action_number, action_time')->where('type='.$type. ' and action_time > "'. $atime .'"')->order('action_time ASC')->find();

    	if(!$return){    		
    		$return = $atimedb->field('action_number, action_time')->where('type='.$type)->order('action_time ASC')->find();
    		$time=$time+24*3600;
    	}
    	    	
    	$types=$this->getTypes();
    	if(isset($types[$type]) && ($fun=$types[$type]['get_number_func']) && method_exists($this, $fun)){
    		$this->$fun($return['action_number'], $return['action_time'], $time);
    	}    
    	return $return;
    }
    
    /**
     * 读取上一期开奖期号
     * @params $type		彩种ID
     * @params $time		时间，如果没有，当默认当前时间
     */
    public function getTypeLastNumber($type, $time=null){
    	$type=intval($type);
    	if($time===null) $time=$this->time;
    	$kjTime=$this->getTypeFtime($type);
    	
    	if($type==7){ //六合彩    
    		$atime=date('Y-m-d H:i:s', $time+$kjTime);
    		$atimedb=Db::name('lhc_time');
    	}else{ 
    		$atime=date('H:i:s', $time+$kjTime);
    		$atimedb=Db::name('time');
    	}
    	
    	$return = $atimedb->field('action_number, action_time')->where('type='.$type. ' and action_time <= "'. $atime .'"')->order('action_time DESC')->find();
    
    	if(!$return){
    		$return = $atimedb->field('action_number, action_time')->where('type='.$type)->order('action_number DESC')->find();
    		$time=$time-24*3600;
    	}
    	
    	//六合彩
    	if($type==7){
    		$time = strtotime($return['action_time']);
    	}
    
    	$types=$this->getTypes();
    	if(($fun=$types[$type]['get_number_func']) && method_exists($this, $fun)){
    		$this->$fun($return['action_number'], $return['action_time'], $time);
    	}
    	return $return;
    }
    
    /**
     * 获取随机数
     * @params $weishu 位数
     * @params $type 彩种类型
     */
    public function getRandNumber($type=1,$weishu=1,$numberType=1){
    	if($type==1 || $type==4 || $type==5){
    		$data=['0'=>'0','1'=>'1','2'=>'2','3'=>'3','4'=>'4','5'=>'5','6'=>'6','7'=>'7','8'=>'8','9'=>'9'];
    	}elseif($type==2){
    		$data=['01'=>'01','02'=>'02','03'=>'03','04'=>'04','05'=>'05','06'=>'06','07'=>'07','08'=>'08','09'=>'09','10'=>'10'];
    	}elseif($type==3){
    		$data=['01'=>'01','02'=>'02','03'=>'03','04'=>'04','05'=>'05','06'=>'06','07'=>'07','08'=>'08','09'=>'09','10'=>'10','11'=>'11'];
    	}elseif($type==7){
    		//数字类型
    		if($numberType==1){
    			$data=['01'=>'01','02'=>'02','03'=>'03','04'=>'04','05'=>'05','06'=>'06','07'=>'07','08'=>'08','09'=>'09','10'=>'10','11'=>'11','12'=>'12','13'=>'13','14'=>'14','15'=>'15','16'=>'16','17'=>'17','18'=>'18','19'=>'19','20'=>'20','21'=>'21','22'=>'22','23'=>'23','24'=>'24','25'=>'25','26'=>'26','27'=>'27','28'=>'28','29'=>'29','30'=>'30','31'=>'31','32'=>'32','33'=>'33','34'=>'34','35'=>'35','36'=>'36','37'=>'37','38'=>'38','39'=>'39','40'=>'40','41'=>'41','42'=>'42','43'=>'43','44'=>'44','45'=>'45','46'=>'46','47'=>'47','48'=>'48','49'=>'49'];
    		//生肖
    		}elseif($numberType==2){
    			$data=['狗'=>'狗','鸡'=>'鸡','猴'=>'猴','羊'=>'羊','马'=>'马','蛇'=>'蛇','龙'=>'龙','兔'=>'兔','虎'=>'虎','牛'=>'牛','鼠'=>'鼠','猪'=>'猪'];
    		//尾码
    		}elseif($numberType==3){
    			$data=['0尾'=>'0尾','1尾'=>'1尾','2尾'=>'2尾','3尾'=>'3尾','4尾'=>'4尾','5尾'=>'5尾','6尾'=>'6尾','7尾'=>'7尾','8尾'=>'8尾','9尾'=>'9尾'];
    		}
    	}    	    	
		$data=array_rand($data, $weishu);   
		if(is_array($data)){
			$number=implode(',', $data);
		}else{
			$number=$data;
		}    	
    	return $number;
    }
}