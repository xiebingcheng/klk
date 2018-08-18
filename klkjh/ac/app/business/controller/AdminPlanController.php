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
use think\Db;

/**
 * Class AdminUserActionController
 * @package app\user\controller
 */
class AdminPlanController extends AdminBaseController
{

    /**
     * 计划管理
     */
    public function index()
    {
        $keywordComplex = [];
    	if (!empty($this->request->param('keyword'))) {
    		$keyword = $this->request->param('keyword');
    	
    		$keywordComplex['plan_number'] = ['like', "%$keyword%"];
    	}
    	
    	if (empty($this->request->param('type'))) {
    		$type = 'ssccq';
    	}else{
    		$type = $this->request->param('type');
    	}
    	
    	$typeQuery = Db::name('type');
    	
    	$typeList = $typeQuery->order("list_order DESC")->select();
    	
        $planQuery = Db::name('plan_'.$type);

        $list = $planQuery->whereOr($keywordComplex)->field('a.*,b.name as play_name')->alias('a')->join('__PLAYED__ b', 'a.played_id = b.id')->order("number DESC")->paginate(10);
        
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
     * 编辑页面
     */
    public function edit()
    {
        $id     = $this->request->param('id', 0, 'intval');       
        
        if (empty($this->request->param('type'))) {
        	$type = 'ssccq';
        }else{
        	$type = $this->request->param('type');
        }
        
        $plan = Db::name('plan_'. $type)->field('a.*,b.name as play_name')->alias('a')->join('__PLAYED__ b', 'a.played_id = b.id')->where('a.id', $id)->find();
        
        $this->assign('type', $type);
        $this->assign('plan', $plan);       
        return $this->fetch();
    }

    /**
     * 编辑页面提交
     */
    public function editPost()
    {
        $id = $this->request->param('id', 0, 'intval');
        
        if (empty($this->request->param('type'))) {
        	$type = 'ssccq';
        }else{
        	$type = $this->request->param('type');
        }

        $data = $this->request->param();

        Db::name('plan_'. $type)->where('id', $id)
            ->strict(false)
            ->field('number,data,kj_data,flag')
            ->update($data);

        $this->success('保存成功！');
    }
}
