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
namespace app\api\controller;

use think\Db;
use cmf\controller\HomeBaseController;
use think\Config;

class SyxwgdController extends HomeBaseController
{
	
	public function index(){
		$this->Q(19);
		$this->Q(20);
		$this->Q(21);
	}

    /**
     * 第几球
     */
    private function Q($play_id)
    {
    	$number=$this->getTypeNumber(3);
    	$date=intval(substr($number['action_number'],0,8));
    	$currentNumber=intval(substr($number['action_number'],8));
    	
    	if(!$currentNumber) exit;
    	
    	$from_number=0;
    	$to_number=0;
    	
    	//当前期数为1
    	if($currentNumber == 1){
    		$from_number = 1;
    		$to_number= 3;
    	}else{
    		$plan = Db::name('plan_syxwgd')->where('played_id='.$play_id.' and date='. $date .' and from_number<='. $number['action_number'] .' and to_number>='. $number['action_number'])->order("from_number DESC")->find();
    		if(!$plan){
    			$from_number = $currentNumber;
    			$to_number= $currentNumber+2;
    		}elseif($plan['number']!=''){
    			$from_number = intval(substr($plan['number'],8))+1;
    			$to_number= intval(substr($plan['number'],8))+3;
    		}
    	}
    	 
    	if($from_number > 0 && $to_number > 0 && $play_id > 0){
    		$_from_number=$date.str_pad($from_number,3,'0',STR_PAD_LEFT);
    		$_to_number=$date.str_pad($to_number,3,'0',STR_PAD_LEFT);
    		
    		$plan = Db::name('plan_syxwgd')->where('played_id='.$play_id.' and date='. $date .' and from_number='. $_from_number .' and to_number='.$_to_number)->find();
    		if(!$plan){
    			$data['played_id'] = $play_id;
    			$data['date'] = $date;
    			$data['plan_number'] = cmf_get_short_number(3, str_pad($from_number,3,'0',STR_PAD_LEFT)).'-'.cmf_get_short_number(3, str_pad($to_number,3,'0',STR_PAD_LEFT));
    			$data['from_number'] = $_from_number;
    			$data['to_number'] = $_to_number;
    			$data['data'] = $this->getRandNumber(3,5);
    			$data['create_time'] = time();
    			Db::name('plan_syxwgd')->insert($data);
    		}
    	}	   	
    }
}
