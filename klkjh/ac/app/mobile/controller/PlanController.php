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

class PlanController extends HomeBaseController
{
    /**
     * 首页(公开)
     */
    public function index()
    {  
    	$typeModel = new TypeModel();
    	$types = $typeModel->where('status=1')->field('id,title,icon')->order("list_order DESC")->select()->toArray();
    	$icons = array();
    	if($types){
    		foreach($types as &$type){    			
    			$icons[$type['id']]=cmf_get_image_preview_url($type['icon']);
    		}
    	}
    	$playedes = array(
    		'0'=>array('type'=>1, 'title'=>'后二直选', 'icon'=> isset($icons[1]) ? $icons[1] : '', 'plan_ids'=> '1,2,3', 'plan_names'=> '高手计划一,高手计划二,高手计划三'),
    		'1'=>array('type'=>1, 'title'=>'后三直选', 'icon'=> isset($icons[1]) ? $icons[1] : '', 'plan_ids'=> '4,5,6', 'plan_names'=> '高手计划一,高手计划二,高手计划三'),
    		'2'=>array('type'=>1, 'title'=>'不定位五星', 'icon'=> isset($icons[1]) ? $icons[1] : '', 'plan_ids'=> '7,8,9', 'plan_names'=> '高手计划一,高手计划二,高手计划三'),
    		'3'=>array('type'=>1, 'title'=>'个位定位胆', 'icon'=> isset($icons[1]) ? $icons[1] : '', 'plan_ids'=> '10,11,12', 'plan_names'=> '高手计划一,高手计划二,高手计划三'),
    		'4'=>array('type'=>1, 'title'=>'后三组六', 'icon'=> isset($icons[1]) ? $icons[1] : '', 'plan_ids'=> '13,14,15', 'plan_names'=> '高手计划一,高手计划二,高手计划三'),
    		'5'=>array('type'=>2, 'title'=>'冠军', 'icon'=> isset($icons[2]) ? $icons[2] : '', 'plan_ids'=> '16,17,18', 'plan_names'=> '高手计划一,高手计划二,高手计划三'),
    		'6'=>array('type'=>3, 'title'=>'第一球', 'icon'=> isset($icons[3]) ? $icons[3] : '', 'plan_ids'=> '19,20,21', 'plan_names'=> '高手计划一,高手计划二,高手计划三'),
    		'7'=>array('type'=>4, 'title'=>'不定胆三星', 'icon'=> isset($icons[4]) ? $icons[4] : '', 'plan_ids'=> '22,23,24', 'plan_names'=> '高手计划一,高手计划二,高手计划三'),
    		'8'=>array('type'=>5, 'title'=>'不定胆三星', 'icon'=> isset($icons[5]) ? $icons[5] : '', 'plan_ids'=> '25,26,27', 'plan_names'=> '高手计划一,高手计划二,高手计划三'),
    	);   	

    	$this->assign('playedes', $playedes);
    	return $this->fetch();
    }
    
    /**
     * 查看(公开)
     */
    public function view()
    {
    	$played_id = $this->request->param('played_id', 0, 'intval');
    	$psize=10;

    	//计划
    	$played = Db::name('played')->where('status=1 and id='.$played_id)->field('id,type,name')->order("list_order DESC,id ASC")->find();
    	if(!$played){
    		$this->error("该精准计划不存在!");
    	}
    	$played_names = $played['name'] ? explode('-', $played['name']) : array();
    	$played['play_name']=isset($played_names[0]) ? $played_names[0] : '';
    	$where='status=1 and id='. $played['type'];
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
    	
    	$where = 'played_id='. $played_id;
    	if(in_array($type['id'], array(1,2,3))){
    		$where .= ' and date='.date('Ymd', time());
    	}
    	$plans = Db::name('plan_'.$type['name'])->where($where)->order("from_number DESC,id DESC")->limit(20)->select()->toArray();
    	$total = Db::name('plan_'.$type['name'])->where($where)->count();
    	if($plans){
    		foreach ($plans as &$plan){
    			$plan['plan_data']= in_array($type['id'],array(1,4,5)) ? '【'.str_replace(',', '',$plan['data']).'】' : '【'.str_replace(',', ' ',$plan['data']).'】';
    			$plan['kj_data']= $plan['kj_data'] ? explode(',', $plan['kj_data']):array();
    		}
    	}
    	$this->assign('type', $type);
    	$this->assign('played', $played);
    	$this->assign('total', $total);
    	$this->assign('psize', $psize);
    	$this->assign('played_id', $played_id);
    	$this->assign('plans', $plans);
    	return $this->fetch();
    }
}
