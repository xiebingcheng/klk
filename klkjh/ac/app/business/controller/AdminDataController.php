<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2018 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 小夏 < 449134904@qq.com>
// +----------------------------------------------------------------------
namespace app\business\controller;

use think\Db;
use cmf\controller\AdminBaseController;
use think\Config;

class AdminDataController extends AdminBaseController
{
    /**
     * 开奖数据管理列表
     */
    public function index()
    {
    	$keywordComplex = [];
    	if (!empty($this->request->param('keyword'))) {
    		$keyword = $this->request->param('keyword');
    	
    		$keywordComplex['number'] = ['like', "%$keyword%"];
    	}
    	
    	if (empty($this->request->param('type'))) {
    		$type = 'ssccq';
    	}else{
    		$type = $this->request->param('type');
    	}
    	
    	$typeQuery = Db::name('type');
    	
    	$typeList = $typeQuery->order("list_order DESC")->select();
    	
        $dataQuery = Db::name('data_'.$type);

        $list = $dataQuery->whereOr($keywordComplex)->field('*')->order("number DESC")->paginate(10);
        
        // 获取分页显示
        $page = $list->render();
        $this->assign('type', $type);
        $this->assign('typeList', $typeList);
        $this->assign('list', $list);
        $this->assign('page', $page);
        // 渲染模板输出
        return $this->fetch();
    }
    
    /**
     * 添加开奖数据
     */
    public function add()
    {    
    	if (empty($this->request->param('type'))) {
    		$type = 'ssccq';
    	}else{
    		$type = $this->request->param('type');
    	}
    	
    	$typeInfo = Db::name('type')->where('name', $type)->find();
    	
    	$time = $this->request->param('time', '');
    	$time = str_replace('+', ' ', $time);
    	
    	if($typeInfo['id']==7){
    		$now = date('Y-m-d H:i:s', time());
    	}else{
    		$now = date('H:i:s', time());
    	}		
    	if($time > $now){
    		$this->error("官方还未开奖，请稍等！", '');
    	}
    	    	
    	$number = '';
    	if($typeInfo && $time){
    		$typeNumber = $this->getTypeNumber($typeInfo['id'], strtotime($time));
    		$number = isset($typeNumber['action_number']) ? $typeNumber['action_number'] : '';
    	}
    	    	
    	$this->assign('type', $type);
    	$this->assign('number', $number);
    	return $this->fetch();
    }
    
    /**
     * 开奖数据提交保存
     */
    public function addPost()
    {
    	if ($this->request->isPost()) {
            $result = $this->validate($this->request->param(), 'Data');
            if ($result !== true) {
                $this->error($result);
            } else {
            	$data = $this->request->param();
            	$type = $data['type'];
            	$dataInfo = Db::name('data_'.$type)->where('number', $data['number'])->find();
                if($dataInfo){
                	$this->error('该期号已开过奖');
                }
                unset($data['type']);
                $data['time'] = time();                
                Db::name('data_'.$type)->insert($data);
                $dataId = Db::name('data_'.$type)->getLastInsID();
                
                if($dataId > 0){
	                //调用开奖
	                Config::load(APP_PATH.'business.php');
	                $key = config('encrypt_key');
	                $url = config('kj_url'). '/data/kj';
	                $kj_data['key'] = $key;
	                $kj_data['table'] = $type;
	                $kj_data['number'] = $data['number'];
	                $kj_data['data'] = $data['data'];
	                $kj_data['time'] = date('Y-m-d H:i:s', $data['time']);
	                $this->httpPost($url, $kj_data);
                }
                
                $this->success("添加成功！", url('business/adminData/index'));
            }
        }
    }
    
    /**
     * 开奖数据删除
     */
    public function delete()
    {
    	$param = $this->request->param();
    	
    	if (isset($param['id'])) {
    		$id	= $this->request->param('id', 0, 'intval');
    		$type	= $this->request->param('type', 'ssccq');
    		Db::name('data_'.$type)->where(['id'=>$id])->delete();
    		$this->success("删除成功！", '');    
    	}
    }
    
    /**
     * 网络请求
     */
    public function httpPost($url, $data) {
    	$data_url = http_build_query($data);
    	$data_len = strlen($data_url);
    
    	return file_get_contents ($url, false, stream_context_create(array ('http'=>array ('method'=>'POST'
    		,'header'=>"Content-type: application/x-www-form-urlencoded"
    		,'content'=>$data_url
    	))));
    }
}