<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2018 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 老猫 <thinkcmf@126.com>
// +----------------------------------------------------------------------
namespace app\business\controller;

use cmf\controller\AdminBaseController;
use app\business\model\LhcPostModel;
use app\business\service\LhcPostService;
use app\business\model\LhcCategoryModel;
use think\Db;

class AdminLhcArticleController extends AdminBaseController
{
    /**
     * 六合彩文章列表
     */
    public function index()
    {
        $param = $this->request->param();

        $categoryId = $this->request->param('category', 0, 'intval');

        $lhcPostService = new LhcPostService();
        $data        = $lhcPostService->adminLhcArticleList($param);

        $data->appends($param);

        $lhcCategoryModel = new LhcCategoryModel();
        $categoryTree        = $lhcCategoryModel->adminLhcCategoryTree($categoryId);

        $this->assign('start_time', isset($param['start_time']) ? $param['start_time'] : '');
        $this->assign('end_time', isset($param['end_time']) ? $param['end_time'] : '');
        $this->assign('number', isset($param['number']) ? $param['number'] : '');
        $this->assign('keyword', isset($param['keyword']) ? $param['keyword'] : '');
        $this->assign('articles', $data->items());
        $this->assign('category_tree', $categoryTree);
        $this->assign('category', $categoryId);
        $this->assign('page', $data->render());
        
        return $this->fetch();
    }

    /**
     * 添加六合彩文章     
     */
    public function add()
    {
    	$time = Db::name('lhc_time')->field('*')->where('type=7 and action_time >="'. date('Y-m-d H:i:s', time()).'"')->order("action_number ASC")->find();
    	
    	$lhcCategoryModel = new LhcCategoryModel();
    	$categoryTree        = $lhcCategoryModel->adminLhcCategoryTree();    	
    	
    	$this->assign('number', $time['action_number']);
    	$this->assign('category_tree', $categoryTree);
        return $this->fetch();
    }

    /**
     * 添加六合彩文章提交
     */
    public function addPost()
    {
        if ($this->request->isPost()) {
            $data   = $this->request->param();
            $result = $this->validate($data, 'LhcArticle');
            if ($result !== true) {
                $this->error($result);
            }
            $lhcPostModel = new LhcPostModel();
            $result = $lhcPostModel->addLhcArticle($data);
            if ($result === false) {
            	$this->error('保存失败!');
        	}
        	$this->success('保存成功!', url('business/adminLhcArticle/index'));
        }
    }

    /**
     * 编辑文章
     * @adminMenu(
     *     'name'   => '编辑文章',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '编辑文章',
     *     'param'  => ''
     * )
     */
    public function edit()
    {
        $id = $this->request->param('id', 0, 'intval');	
        
        $time = Db::name('lhc_time')->field('*')->where('type=7 and action_time >="'. date('Y-m-d H:i:s', time()).'"')->order("action_number ASC")->find();
        
        $lhcPostModel = new LhcPostModel();
        
        $post = $lhcPostModel->where('id', $id)->find()->toArray();
        $post['post_content']=$lhcPostModel->getPostContentAttr($post['post_content']);
       
        $lhcCategoryModel = new LhcCategoryModel();
        $categoryTree  = $lhcCategoryModel->adminLhcCategoryTree($post['category_id']);
        
        $this->assign($post);
        $this->assign('number', $time['action_number']);
        $this->assign('category_tree', $categoryTree);
        return $this->fetch();
    }

    /**
     * 编辑六合彩文章提交
     */
    public function editPost()
    {
        if ($this->request->isPost()) {
            $data   = $this->request->param();           
            $result = $this->validate($data, 'LhcArticle');
            if ($result !== true) {
                $this->error($result);
            }
            $lhcPostModel = new lhcPostModel();
            $result = $lhcPostModel->editLhcArticle($data);

            if ($result === false) {
            	$this->error('保存失败!');
        	}
        	$this->success('保存成功!', url('AdminLhcArticle/index'));
        }
    }

    /**
     * 六合彩文章删除
     */
    public function delete()
    {
        $param           = $this->request->param();
        $lhcPostModel = new LhcPostModel();

        if (isset($param['id'])) {
            $id           = $this->request->param('id', 0, 'intval');
            $result       = $lhcPostModel->where(['id' => $id])->find();
            $resultPortal = $lhcPostModel
                ->where(['id' => $id])
                ->update(['delete_time' => time()]);            
            $this->success("删除成功！", '');
        }

        if (isset($param['ids'])) {
            $ids     = $this->request->param('ids/a');
            $result  = $lhcPostModel->where(['id' => ['in', $ids]])->update(['delete_time' => time()]);
            if ($result) {                
                $this->success("删除成功！", '');
            }
        }
    }

    /**
     * 六合彩文章发布
     */
    public function publish()
    {
        $param           = $this->request->param();
        $lhcPostModel = new LhcPostModel();

        if (isset($param['ids']) && isset($param["yes"])) {
            $ids = $this->request->param('ids/a');

            $lhcPostModel->where(['id' => ['in', $ids]])->update(['post_status' => 1, 'published_time' => time()]);

            $this->success("发布成功！", '');
        }

        if (isset($param['ids']) && isset($param["no"])) {
            $ids = $this->request->param('ids/a');

            $lhcPostModel->where(['id' => ['in', $ids]])->update(['post_status' => 0]);

            $this->success("取消发布成功！", '');
        }
    }
    
    /**
     * 六合彩文章排序
     */
    public function listOrder()
    {
        parent::listOrders(Db::name('lhc_post'));
        $this->success("排序更新成功！", '');
    }
}
