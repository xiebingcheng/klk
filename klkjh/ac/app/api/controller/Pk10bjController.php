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

class Pk10bjController extends HomeBaseController
{
	
	public function index(){
		$this->NO(16);
		$this->NO(17);
		$this->NO(18);
	}

    /**
     * 第几名
     */
    private function NO($play_id=16)
    {
    	$number=$this->getTypeNumber(2);
    	$date=date('Ymd', time());
    	$currentNumber=intval($number['action_number']);
		
    	if(!$currentNumber) exit;
    	
    	$from_number=0;
    	$to_number=0;
    	$played_id=0;
    	
    	$plan = Db::name('plan_pk10bj')->where('played_id='.$play_id.' and date='. $date .' and from_number<='. $number['action_number'] .' and to_number>='. $number['action_number'])->order("from_number DESC")->find();
    	if(!$plan){
    		$from_number = $currentNumber;
    		$to_number= $currentNumber+2;
    	}elseif($plan['number']!=''){
    		$from_number = intval($plan['number'])+1;
    		$to_number= intval($plan['number'])+3;
    	}   
    	 
    	if($from_number > 3 && $to_number > 3 && $play_id > 0){
    		$plan = Db::name('plan_pk10bj')->where('played_id='.$play_id.' and date='. $date .' and from_number='. $from_number .' and to_number='.$to_number)->find();
    		if(!$plan){
    			$data['played_id'] = $play_id;
    			$data['date'] = $date;
    			$data['plan_number'] = cmf_get_short_number(2, $from_number).'-'.cmf_get_short_number(2, $to_number);
    			$data['from_number'] = $from_number;
    			$data['to_number'] = $to_number;
    			$data['data'] = $this->getRandNumber(2,5);
    			$data['create_time'] = time();
    			Db::name('plan_pk10bj')->insert($data);
    		}
    	}	   	
    }
}
