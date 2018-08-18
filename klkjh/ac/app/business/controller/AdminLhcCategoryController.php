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

use app\admin\model\RouteModel;
use cmf\controller\AdminBaseController;
use app\business\model\LhcCategoryModel;
use think\Db;
use app\admin\model\ThemeModel;


class AdminLhcCategoryController extends AdminBaseController
{
    /**
     * 六合彩分类列表
     */
    public function index()
    {
        $lhcCategoryModel = new LhcCategoryModel();
        $categoryTree = $lhcCategoryModel->adminLhcCategoryTableTree();

        $this->assign('category_tree', $categoryTree);
        return $this->fetch();
    }

    /**
     * 添加六合彩分类
     */
    public function add()
    {
        return $this->fetch();
    }

    /**
     * 添加六合彩分类提交
     */
    public function addPost()
    {
        $lhcCategoryModel = new LhcCategoryModel();

        $data = $this->request->param();

        $result = $this->validate($data, 'LhcCategory');

        if ($result !== true) {
            $this->error($result);
        }

        $result = $lhcCategoryModel->addLhcCategory($data);

        if ($result === false) {
            $this->error('添加失败!');
        }

        $this->success('添加成功!', url('AdminLhcCategory/index'));

    }

    /**
     * 编辑六合彩分类
     */
    public function edit()
    {
        $id = $this->request->param('id', 0, 'intval');
        if ($id > 0) {
            $category = LhcCategoryModel::get($id)->toArray();
            $this->assign($category);   
            return $this->fetch();
        } else {
            $this->error('操作错误!');
        }
    }

    /**
     * 编辑六合彩分类提交
     */
    public function editPost()
    {
        $data = $this->request->param();

        $result = $this->validate($data, 'LhcCategory');

        if ($result !== true) {
            $this->error($result);
        }

        $lhcCategoryModel = new LhcCategoryModel();

        $result = $lhcCategoryModel->editLhcCategory($data);

        if ($result === false) {
            $this->error('保存失败!');
        }
        $this->success('保存成功!', url('AdminLhcCategory/index'));
    }    
    
    /**
     * 六合彩分类排序
     * @adminMenu(
     *     'name'   => '文章分类排序',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '文章分类排序',
     *     'param'  => ''
     * )
     */
    public function listOrder()
    {
        parent::listOrders(Db::name('lhc_category'));
        $this->success("排序更新成功！", '');
    }

    /**
     * 删除六合彩分类
     */
    public function delete()
    {
        $lhcCategoryModel = new LhcCategoryModel();
        $id = $this->request->param('id');
        //获取删除的内容
        $findCategory = $lhcCategoryModel->where('id', $id)->find();

        if (empty($findCategory)) {
            $this->error('分类不存在!');
        }

        $categoryPostCount = Db::name('lhc_post')->where('category_id', $id)->count();

        if ($categoryPostCount > 0) {
            $this->error('此分类有文章无法删除!');
        }
        
        $result = $lhcCategoryModel
            ->where('id', $id)
            ->update(['delete_time' => time()]);
        if ($result) {            
            $this->success('删除成功!');
        } else {
            $this->error('删除失败');
        }
    }
}
