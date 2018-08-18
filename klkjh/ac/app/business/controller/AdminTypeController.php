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
use app\business\model\TypeModel;
use think\Db;

class AdminTypeController extends AdminBaseController
{

    /**
     * 彩种管理列表
     */
    public function index()
    {
    	$keywordComplex = [];
    	if (!empty($this->request->param('keyword'))) {
    		$keyword = $this->request->param('keyword');
    	
    		$keywordComplex['title'] = ['like', "%$keyword%"];
    	}
    	
        $typeQuery = Db::name('type');

        $list = $typeQuery->whereOr($keywordComplex)->field('id,name,title,info,data_ftime,status,list_order')->order("list_order DESC")->paginate(10);
        // 获取分页显示
        $page = $list->render();
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
        $type = Db::name('type')->where('id', $id)->find();
        $this->assign($type);

        return $this->fetch();
    }

    /**
     * 编辑页面提交
     */
    public function editPost()
    {
        $id = $this->request->param('id', 0, 'intval');

        $data = $this->request->param();

        Db::name('type')->where('id', $id)
            ->strict(false)
            ->field('info,icon,status,data_ftime,list_order')
            ->update($data);

        $this->success('保存成功！');
    }
    
    /**
     * 彩种排序
     */
    public function listOrder()
    {
    	$typeModel = new  TypeModel();
    	parent::listOrders($typeModel);
    	$this->success("排序更新成功！");
    }
    
    /**
     * 彩种显示隐藏
     */
    public function toggle()
    {
    	$data      = $this->request->param();
    	$typeModel = new TypeModel();
    
    	if (isset($data['ids']) && !empty($data["display"])) {
    		$ids = $this->request->param('ids/a');
    		$typeModel->where(['id' => ['in', $ids]])->update(['status' => 1]);
    		$this->success("更新成功！");
    	}
    
    	if (isset($data['ids']) && !empty($data["hide"])) {
    		$ids = $this->request->param('ids/a');
    		$typeModel->where(['id' => ['in', $ids]])->update(['status' => 0]);
    		$this->success("更新成功！");
    	}
    }
}