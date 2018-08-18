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

class Pl3Controller extends HomeBaseController
{
	
	public function index(){
		$this->BDD(25);
		$this->BDD(26);
		$this->BDD(27);
	}

    /**
     * 独胆
     */
    private function BDD($play_id=25)
    {
    	$number=$this->getTypeNumber(5);
    	$date=date('Ymd', time());
    	$_date=date('Ymd', strtotime("-15 day"));
    	$currentNumber=intval($number['action_number']);
    	
    	if(!$currentNumber) exit;
    	 
    	$from_number=0;
    	$to_number=0;
    	
    	$plan = Db::name('plan_pl3')->where('played_id='.$play_id.' and date>='.$_date.' and from_number<='. $number['action_number'] .' and to_number>='. $number['action_number'])->order("from_number DESC")->find();
    	if(!$plan){
    		$from_number = $currentNumber;
    		$to_number = $currentNumber+2;
    	}elseif($plan['number']!=''){
    		$from_number = intval($plan['number'])+1;
    		$to_number = intval($plan['number'])+3;
    	}
    	
    	if($from_number > 3 && $to_number > 3){
    		$_from_number=$from_number;
    		$_to_number=$to_number;
    		 
    		$plan = Db::name('plan_pl3')->where('played_id='.$play_id.' and date>='.$_date.' and from_number='.$_from_number.' and to_number='.$_to_number)->find();
    		if(!$plan){
    			$data['played_id'] = $play_id;
    			$data['date'] = $date;
    			$data['plan_number'] = cmf_get_short_number(5, $_from_number).'-'.cmf_get_short_number(5, $_to_number);
    			$data['from_number'] = $_from_number;
    			$data['to_number'] = $_to_number;
    			$data['data'] = $this->getRandNumber(4,3);
    			$data['create_time'] = time();
    			Db::name('plan_pl3')->insert($data);
    		}
    	} 	
    }
}
