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
use app\mobile\model\PortalPostModel;
use think\Db;

class AjaxController extends HomeBaseController
{
    /**
     * 获取彩票信息
     */
    public function getLotterys(){
    	$ids = $this->request->param('ids');
    	$ids = 	$ids ? explode(',', $ids) : array();
    	$where='status=1';
    	if($ids){
    		$where .= ' and id in('. implode(',', $ids) .')';
    	}
    	$typeModel = new TypeModel();
    	$types = $typeModel->where($where)->field('id,name,title,icon,data_ftime')->order("list_order DESC")->select();
    	if($types){
    		foreach($types as &$type){
    			$lastNumber=$this->getTypeLastNumber($type['id']);
    			$actionNumber=$this->getTypeNumber($type['id']);
    			$dataQuery = Db::name('data_'.$type['name'])->where('number', $lastNumber['action_number'])->find();
    			$type['last_number']=cmf_get_short_number($type['id'], $lastNumber['action_number']);
    			$last_data_arr=$dataQuery['data'] ? explode(',',$dataQuery['data']) : array();
    			if($type['id']==7 && $last_data_arr){
    				$last_no = array_pop($last_data_arr);
    				array_push($last_data_arr,'+');
    				array_push($last_data_arr,$last_no);
    			}
    			$type['last_data']=implode(',', $last_data_arr);
    			$type['open_time']=strtotime($actionNumber['action_time'])-time();
    			$type['diff_time']=strtotime($actionNumber['action_time'])-time()-$type['data_ftime'];
    			$type['icon']=cmf_get_image_preview_url($type['icon']);
    		}
    	}    	 
    	return json(array(
    		"status" => 1,
    		"msg"  => '成功',
    		"result" => array(
    			"items" => $types,
    			"itemCount" => count($types)
    		)
    	));
    }
    
    /**
     * 获取开奖历史
     */
    public function getDatas(){
    	$id = $this->request->param('id', 0, 'intval');
    	$page = $this->request->param('page', 1, 'intval');
    	$date = $this->request->param('date');
    	
    	$psize=10;
    	$where='status=1 and id='. $id;
    	$typeModel = new TypeModel();
    	$type = $typeModel->where($where)->field('id,name')->find();
    	
    	$where='1=1';
    	if($date && in_array($id, array(1,2,3))){
    		$where .= ' and time>='. (strtotime($date.' 00:00:00')+300) . ' and time<='. (strtotime($date.' 23:59:59')+300);
    	}
    	$historys=Db::name('data_'.$type['name'])->where($where)->order('number DESC')->limit(($page-1)*$psize, $psize)->select()->toArray();
    	if($historys){    		
    		foreach($historys as &$history){
    			$last_data_arr=$history['data'] ? explode(',',$history['data']) : array();
    			if($type['id']==7 && $last_data_arr){
    				$last_no = array_pop($last_data_arr);
    				array_push($last_data_arr,'+');
    				array_push($last_data_arr,$last_no);
    			}
    			$history['data_data']['items'] = $last_data_arr;
    			$history['data_data']['itemCount'] = count($history['data_data']['items']);
    		}
    	}
    	return json(array(
    		"status" => 1,
    		"msg"  => '成功',
    		"result" => array(
    			"items" => $historys,
    			"itemCount" => count($historys)
    		)
    	));
    }
    
    /**
     * 走势图
     */
    public function getZst(){
    	$id = $this->request->param('id', 1, 'intval');
    	$pos = $this->request->param('pos', 1, 'intval');
    	$count = $this->request->param('count', 50, 'intval');    	
    	
    	if(empty($id) || empty($pos)){
    		return json(array(
    			"status" => 0,
    			"msg"  => '失败',
    			"result" => 0
    		));
    	}		
    	$type = Db::name('type')->where('id='.$id)->field('id,title,name,code_list')->find();
    	$datas = Db::name('data_'.$type['name'])->field('number,data')->order("number DESC")->limit($count)->select()->toArray();
    	if(empty($type['code_list'])){
    		return null;
    	}    	
    	$number = explode(',',$type['code_list']);
    	foreach ($number as &$value) {    	
    		if($value < 10 && strlen($value) == 2){
    			$zero = substr($value,0,1);
    			if($zero == 0){
    				$value = substr($value,1,1);
    			}
    		}
    	}    	
    	$yl = array();
    	$zd = array();
    	$list = array();
    	foreach ($datas as $kdata => $val_data) {
    		$num = explode(',',$val_data['data']);
    		$dqnum = $num[$pos-1];
    		foreach ($number as $knum => $vnum) {
    			if ($dqnum == $vnum) {
    				$zd[$vnum] = isset($yl[$vnum]) ? $yl[$vnum] : 0;
    				$yl[$vnum] = 0;
    				$iOpenNum = $dqnum;
    				$list[$kdata]['iYL'.$vnum] = $yl[$vnum];
    			}else{
    				$yl[$vnum] = (isset($yl[$vnum]) ? $yl[$vnum] : 0)+1;
    				$zd[$vnum] = $yl[$vnum];
    				$list[$kdata]['iYL'.$vnum] = $yl[$vnum];
    			}
    		}
    	
    		$list[$kdata]['iOpenNum'] = $iOpenNum;
    		$list[$kdata]['sGamePeriod'] = $val_data['number'];
    	} 

    	$json = array(
    		"status" => 1,
    		"msg"  => '成功',
    		"result" => array(
    			"items" => $list,
    			"itemCount" => count($datas)
    		)
    	);    	
    	foreach ($number as $knum1 => $vnum1) {
    		$json["result"]["iYLAvg".$vnum1] = $yl[$vnum1]/2;
    	}    	
    	foreach ($number as $knum2 => $vnum2) {
    		$json["result"]["iYLMax".$vnum2] = $zd[$vnum2];
    	}   	
    	return json($json);
    }
    
    /**
     * 获取计划列表
     */
    public function getPlans(){
    	$id = $this->request->param('id', 0, 'intval');
    	$page = $this->request->param('page', 1, 'intval');
    	$played_id = $this->request->param('played_id', 0, 'intval');
    	if (empty($id) || empty($played_id)) {
    		return json(array(
    			"status" => 0,
    			"msg"  => '失败',
    			"result" => 0
    		));
    	}
    	$psize=10;    	
    	$where='status=1 and id='. $id;
    	$typeModel = new TypeModel();
    	$type = $typeModel->where($where)->field('id,name')->find();
    	
	   	$isSplit=0;
    	$played = Db::name('played')->where('status=1 and id='.$played_id)->field('is_split')->find();
		if($played){
			$isSplit=$played['is_split'];
		}    
		$where = 'played_id='.$played_id;
		if(in_array($id, array(1,2,3))){
			$where .= ' and date='.date('Ymd', time());
		}
    	$plans = Db::name('plan_'.$type['name'])->where($where)->order("from_number DESC,id DESC")->limit(($page-1)*$psize, $psize)->select()->toArray();
    	if($plans){
    		foreach ($plans as &$plan){
    			$plan['plan_data']= in_array($type['id'],array(1,4,5)) ? '【'.str_replace(',', '',$plan['data']).'】' : '【'.str_replace(',', ' ',$plan['data']).'】';
    			$plan['kj_data']= $plan['kj_data'] ? explode(',', $plan['kj_data']):array();
    		}
    	}
    	return json(array(
    		"status" => 1,
    		"msg"  => '成功',
    		"result" => array(
    			"items" => $plans,
    			"itemCount" => count($plans)
    		)
    	));
    }
    
    /**
     * 获取微信QQ
     */
    public function getWeixinQQ(){
    	$site_info=cmf_get_option('site_info');
    	return json(array(
    		"status" => 1,
    		"msg"  => '成功',
    		"result" => array(
    			"weixin" => $site_info['weixin'],
    			"qq" => $site_info['qq']
    		)
    	));
    }
}
