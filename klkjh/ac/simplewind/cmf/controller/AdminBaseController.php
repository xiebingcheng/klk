<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2018 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +---------------------------------------------------------------------
// | Author: 小夏 < 449134904@qq.com>
// +----------------------------------------------------------------------
namespace cmf\controller;

use think\Db;

class AdminBaseController extends BaseController
{
	public $time;
	public $types;
	
    public function _initialize()
    {
        // 监听admin_init
        hook('admin_init');
        parent::_initialize();
        $session_admin_id = session('ADMIN_ID');
        if (!empty($session_admin_id)) {
            $user = Db::name('user')->where(['id' => $session_admin_id])->find();

            if (!$this->checkAccess($session_admin_id)) {
                $this->error("您没有访问权限！");
            }
            $this->assign("admin", $user);
        } else {
            if ($this->request->isPost()) {
                $this->error("您还没有登录！", url("admin/public/login"));
            } else {
                header("Location:" . url("admin/public/login"));
                exit();
            }
        }
    }

    public function _initializeView()
    {
        $cmfAdminThemePath    = config('cmf_admin_theme_path');
        $cmfAdminDefaultTheme = cmf_get_current_admin_theme();

        $themePath = "{$cmfAdminThemePath}{$cmfAdminDefaultTheme}";

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
        config('template.view_base', "$themePath/");
        config('view_replace_str', $viewReplaceStr);
    }

    /**
     * 初始化后台菜单
     */
    public function initMenu()
    {
    }

    /**
     *  检查后台用户访问权限
     * @param int $userId 后台用户id
     * @return boolean 检查通过返回true
     */
    private function checkAccess($userId)
    {
        // 如果用户id是1，则无需判断
        if ($userId == 1) {
            return true;
        }

        $module     = $this->request->module();
        $controller = $this->request->controller();
        $action     = $this->request->action();
        $rule       = $module . $controller . $action;

        $notRequire = ["adminIndexindex", "adminMainindex"];
        if (!in_array($rule, $notRequire)) {
            return cmf_auth_check($userId);
        } else {
            return true;
        }
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
	
    /**
     * 读取将要开奖期号
     * @params $type		彩种ID
     * @params $time		时间，如果没有，当默认当前时间
     */
    public function getTypeNumber($type, $time){
    	$type=intval($type);
    	if(!$time) return array();
    	
    	if($type==7){ //六合彩
    		$atime=date('Y-m-d H:i:s', $time);
    		$atimedb=Db::name('lhc_time');
    	}else{
    		$atime=date('H:i:s', $time);
    		$atimedb=Db::name('time');
    	}
    	$return = $atimedb->field('action_number, action_time')->where('type='.$type. ' and action_time = "'. $atime .'"')->find();

    	$types=$this->getTypes();

    	if(isset($types[$type]) && ($fun=$types[$type]['get_number_func']) && method_exists($this, $fun)){
    		$this->$fun($return['action_number'], $return['action_time'], $time);
    	}
    	return $return;
    } 
}