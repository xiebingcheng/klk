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
use app\mobile\model\TypeModel;
use think\Db;

class HistoryController extends HomeBaseController
{
    /**
     * 首页(公开)
     */
    public function index()
    {
    	$typeModel = new TypeModel();
    	$types = $typeModel->where('status=1')->field('id,name,title,icon,data_ftime')->order("list_order DESC")->select();
    	if($types){
    		foreach($types as &$type){
    			$lastNumber=$this->getTypeLastNumber($type['id']);
    			$actionNumber=$this->getTypeNumber($type['id']);
    			$dataQuery = Db::name('data_'.$type['name'])->where('number', $lastNumber['action_number'])->find();
    			$type['last_number']=cmf_get_short_number($type['id'], $lastNumber['action_number']);
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
    		}
    	}
    	$this->assign('types', $types);
    	return $this->fetch();
    }  
	
    /**
     * 详情页(公开)
     */
    public function view(){
    	$psize=10; 	
    	$type = $this->request->param('type', 7, 'intval');
    	$where='status=1 and id='. $type;
    	$typeModel = new TypeModel();
    	$type = $typeModel->where($where)->field('id,name,title,icon,data_ftime')->find();
    	if(!$type){
    		$this->error("该彩种不存在!");
    	}
    	$lastNumber=$this->getTypeLastNumber($type['id']);
    	$actionNumber=$this->getTypeNumber($type['id']);
    	$dataQuery = Db::name('data_'.$type['name'])->where('number', $lastNumber['action_number'])->find();
    	$type['action_number']=$actionNumber['action_number'];
    	$type['last_number']=cmf_get_short_number($type['id'], $lastNumber['action_number']);
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
    	
    	$where='1=1';
    	$date = $this->request->param('date', date('Y-m-d', time()));
    	if($date && in_array($type['id'], array(1,2,3))){
    		$where .= ' and time>='. (strtotime($date.' 00:00:00')+300) . ' and time<='.(strtotime($date.' 23:59:59')+300);
    	}
    	//历史开奖
    	$historys=Db::name('data_'.$type['name'])->where($where)->order('number DESC')->limit($psize)->select()->toArray();
    	$total = Db::name('data_'.$type['name'])->where($where)->count();
    	 
    	if($historys){
    		foreach($historys as &$history){
    			$last_data_arr=$history['data'] ? explode(',',$history['data']) : array();
    			if($type['id']==7 && $last_data_arr){
    				$last_no = array_pop($last_data_arr);
    				array_push($last_data_arr,'+');
    				array_push($last_data_arr,$last_no);
    			}
    			$history['data_arr']= $last_data_arr;
    		}
    	}
    	$this->assign('type', $type);
    	$this->assign('psize', $psize);
    	$this->assign('total', $total);
    	$this->assign('date', $date);
    	$this->assign('historys', $historys);
    	return $this->fetch();
    }
}
