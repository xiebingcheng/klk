<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2018 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: Powerless < wzxaini9@gmail.com>
// +----------------------------------------------------------------------

namespace app\business\controller;

use cmf\controller\AdminBaseController;
use app\business\model\TimeModel;
use app\business\model\LhcTimeModel;
use think\Db;

/**
 * Class AdminUserActionController
 * @package app\user\controller
 */
class AdminTimeController extends AdminBaseController
{

    /**
     * 时间管理
     */
    public function index()
    {
    	if (empty($this->request->param('type'))) {
    		$type = '1';
    	}else{
    		$type = $this->request->param('type');
    	}
    	
    	$typeQuery = Db::name('type');
    	
    	$typeInfo = Db::name('type')->where('id', $type)->find();    
    	
    	$typeList = $typeQuery->order("list_order DESC")->select();
    	
    	if($type==7){
    		$now = date('Y-m-d H:i:s', time());
    		$timeQuery = Db::name('lhc_time');
    		$list = $timeQuery->field('*')->where('type', $type)->order("action_number DESC")->paginate(10);
    	}else{
    		$now = date('H:i:s', time());
    		$timeQuery = Db::name('time');
    		$list = $timeQuery->field('*')->where('type', $type)->order("action_number ASC")->paginate(10);
    	} 
        // 获取分页显示
        $page = $list->render();
        $this->assign('now', $now);
        $this->assign('type', $type);
        $this->assign('typeInfo', $typeInfo);
        $this->assign('typeList', $typeList);
        $this->assign('list', $list);
        $this->assign('page', $page);
        // 渲染模板输出
        return $this->fetch();
    }

    /**
     * 彩种时间
     */
    public function actionTime()
    {
    	$timeModel = new  TimeModel();
    	parent::actionTimes($timeModel);
    	$this->success("开奖时间更新成功！");
    }
    
    /**
     * 六合彩时间
     */
    public function actionLhcTime()
    {
    	$lhcTimeModel = new  LhcTimeModel();
    	parent::actionTimes($lhcTimeModel);
    	$this->success("开奖时间更新成功！");
    }
    
    /**
     * 添加开奖时间
     */
    public function add()
    {
    	if (empty($this->request->param('type'))) {
    		$type = 'ssccq';
    	}else{
    		$type = $this->request->param('type');
    	}
    	$this->assign('type', $type);
    	return $this->fetch();
    }
    
    /**
     * 开奖时间提交保存
     */
    public function addPost()
    {
    	if ($this->request->isPost()) {
    		$result = $this->validate($this->request->param(), 'Time');
    		if ($result !== true) {
    			$this->error($result);
    		} else {
    			$data = $this->request->param();
    			$type = $data['type'];
    			if($type!=7){
    				$this->error('该彩种无法添加时间');
    			}
    			Db::name('lhc_time')->insert($data);
    			$this->success("添加成功！", url('business/adminTime/index', array('type'=>$type)));
    		}
    	}
    }
    
    /**
     * 删除六合彩时间
     */
    public function delete()
    {
    	$param = $this->request->param();
    	$lhcTimeModel = new  LhcTimeModel();
    
    	if (isset($param['id'])) {
    		$id = $this->request->param('id', 0, 'intval');
    		$lhcTimeModel->where(['id' => $id])->delete();
    		if ($result) {
    			$this->success("删除成功！", '');
    		}    		
    	}    
    	if (isset($param['ids'])) {
    		$ids     = $this->request->param('ids/a');
    		$result  = $lhcTimeModel->where(['id' => ['in', $ids]])->delete();
    		if ($result) {
    			$this->success("删除成功！", '');
    		}
    	}
    }
}
