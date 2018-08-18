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
namespace app\mobile\controller;

use cmf\controller\HomeBaseController;
use app\mobile\model\LhcPostModel;
use app\mobile\model\TypeModel;
use think\Db;

class IndexController extends HomeBaseController
{
	public $type;
	public function _initialize(){
		parent::_initialize();
		$id = $this->request->param('type', 7, 'intval');
		$where='status=1 and id='. $id;
		$typeModel = new TypeModel();
		$type = $typeModel->where($where)->field('id,name,title,icon,data_ftime')->find();
		if(!$type){
			$this->error("该彩种不存在!");
		}
		$lastNumber=$this->getTypeLastNumber($type['id']);
		$actionNumber=$this->getTypeNumber($type['id']);
		$dataQuery = Db::name('data_'.$type['name'])->where('number', $lastNumber['action_number'])->find();
		$type['action_number']=$actionNumber['action_number'];
		$type['last_number']= cmf_get_short_number($type['id'], $lastNumber['action_number']);
		$type['last_data']=$dataQuery['data'] ? $dataQuery['data'] : '';
		$last_data_arr=$dataQuery['data'] ? explode(',',$dataQuery['data']) : array();
		if($type['id']==7 && $last_data_arr){
			$last_no = array_pop($last_data_arr);
			array_push($last_data_arr,'+');
			array_push($last_data_arr,$last_no);
		}
		$type['last_data_arr']=$last_data_arr;
		$type['open_time']=strtotime($actionNumber['action_time'])-time();
		$type['diff_time']=strtotime($actionNumber['action_time'])-time()-$type['data_ftime'];
		$type['icon']=cmf_get_image_preview_url($type['icon']);
		$this->type = $type;
	}
	
    /**
     * 首页(公开)
     */
    public function index()
    {    	
    	$type = $this->type;
    	$slides = Db::name('slide_item')->where('status=1 and slide_id=1')->order('list_order ASC')->select();
    	if($slides){
    		foreach($slides as &$slide){
    			$slide['image']=cmf_get_image_preview_url($slide['image']);
    		}
    	}
    	    	
    	$categorys = Db::name('lhc_category')->where('status=1 and delete_time=0')->order('list_order DESC')->select()->toArray();
    	if($categorys){
    		foreach($categorys as &$category){
    			$category['icon']=cmf_get_image_preview_url($category['icon']);
    		}
    	}    	
    	$this->assign('type', $type);
    	$this->assign('slides', $slides);
    	$this->assign('categorys', $categorys);
    	return $this->fetch(':index');
    } 

    /**
     * 六合彩资料(公开)
     */
    public function article()
    {
    	$type = $this->type;
    	$category_id = $this->request->param('category_id', 0, 'intval');
    	$lhc_category = Db::name('lhc_category')->where('status=1 and delete_time=0 and id='. $category_id)->find();
    	if(!$lhc_category){
    		$this->error("该资料不存在!");
    	}
    	$typeModel = new TypeModel();
    	$actionNumber=$this->getTypeNumber(7);
    	$lhcPostModel = new LhcPostModel();
    	$count=$lhcPostModel->where('post_number='. $actionNumber['action_number'] .' and category_id='. $lhc_category['id'] .' and post_status=1 and delete_time=0')->count();
    	if($count>0){
    		$lhc_articles = $lhcPostModel->where('post_number='. $actionNumber['action_number'] .' and category_id='. $lhc_category['id'] .' and post_status=1 and delete_time=0')->order('list_order DESC')->select()->toArray();
    	}else{
    		$lhc_articles = $lhcPostModel->where('category_id='. $lhc_category['id'] .' and post_status=1 and delete_time=0')->order('list_order DESC')->select()->toArray();
    	}    	
    	$this->assign('type', $type);
    	$this->assign('lhc_category', $lhc_category);
    	$this->assign('lhc_articles', $lhc_articles);
    	return $this->fetch();
    }
    
    /**
     * 六合彩资料查看(公开)
     */
    public function articleView()
    {
    	$type = $this->type;
    	$post_id = $this->request->param('post_id', 0, 'intval');
		$lhcPostModel = new LhcPostModel();
		$article = $lhcPostModel->where('post_status=1 and delete_time=0 and id='. $post_id)->find();
		if(!$article){
			$this->error("该文章不存在!");
		}
    	$lhcPostModel = new LhcPostModel();
    	$article['post_content']=$lhcPostModel->getPostContentAttr($article['post_content']);
    	$this->assign('type', $type);
    	$this->assign('article', $article);
    	return $this->fetch();
    }
    
    /**
     * 走势图(公开)
     */
    public function zst()
    {
    	$type = $this->type;
    	$this->assign('type', $type);
    	return $this->fetch();
    }
}
