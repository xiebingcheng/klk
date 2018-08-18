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

class SsccqController extends HomeBaseController
{
	
	public function index(){
		$this->H2ZX(1);
		$this->H2ZX(2);
		$this->H2ZX(3);
		$this->H3ZX(4);
		$this->H3ZX(5);
		$this->H3ZX(6);
		$this->H3Z6(13);
		$this->H3Z6(14);
		$this->H3Z6(15);
		$this->BDW5X(7);
		$this->BDW5X(8);
		$this->BDW5X(9);
		$this->DWGW(10);
		$this->DWGW(11);
		$this->DWGW(12);
	}

    /**
     * 后二直选
     */
    private function H2ZX($play_id=1)
    {
    	$number=$this->getTypeNumber(1);
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
    		$plan = Db::name('plan_ssccq')->where('played_id='.$play_id.' and date='. $date .' and from_number<='. $number['action_number'] .' and to_number>='. $number['action_number'])->order("from_number DESC")->find();
    		if(!$plan){
    			$from_number = $currentNumber;
    			$to_number= $currentNumber+2;
    		}elseif($plan['number']!=''){
    			$from_number = intval(substr($plan['number'],8))+1;
    			$to_number= intval(substr($plan['number'],8))+3;
    		}
    	}
    	
    	if($from_number > 0 && $to_number > 0){
    		$_from_number=$date.str_pad($from_number,3,'0',STR_PAD_LEFT);
    		$_to_number=$date.str_pad($to_number,3,'0',STR_PAD_LEFT);
    		
    		$plan = Db::name('plan_ssccq')->where('played_id='.$play_id.' and date='. $date .' and from_number='.$_from_number.' and to_number='.$_to_number)->find();
    		if(!$plan){
    			$data['played_id'] = $play_id;
    			$data['date'] = $date;
    			$data['plan_number'] = cmf_get_short_number(1, str_pad($from_number,3,'0',STR_PAD_LEFT)).'-'.cmf_get_short_number(1,str_pad($to_number,3,'0',STR_PAD_LEFT));
    			$data['from_number'] = $_from_number;
    			$data['to_number'] = $_to_number;
    			$data['data'] = $this->getRandNumber(1,7).'-'.$this->getRandNumber(1,7);
    			$data['create_time'] = time();
    			Db::name('plan_ssccq')->insert($data);
    		}
    	}    	   	
    }
    
    /**
     * 后三直选
     */
    private function H3ZX($play_id=4)
    {
    	$number=$this->getTypeNumber(1);
    	$date=intval(substr($number['action_number'],0,8));
    	$currentNumber=intval(substr($number['action_number'],8));
    	 
    	$from_number=0;  	
    	$to_number=0;
		
    	//当前期数为1
    	if($currentNumber == 1){
    		$from_number = 1;  
    		$to_number= 3;
    	}else{
    		$plan = Db::name('plan_ssccq')->where('played_id='.$play_id.' and date='. $date .' and from_number<='. $number['action_number'] .' and to_number>='. $number['action_number'])->order("from_number DESC")->find();
    		if(!$plan){
    			$from_number = $currentNumber;
    			$to_number= $currentNumber+2;
    		}elseif($plan['number']!=''){
    			$from_number = intval(substr($plan['number'],8))+1;
    			$to_number= intval(substr($plan['number'],8))+3;
    		}
    	}
    	 
    	if($from_number > 0 && $to_number > 0){
    		$_from_number=$date.str_pad($from_number,3,'0',STR_PAD_LEFT);
    		$_to_number=$date.str_pad($to_number,3,'0',STR_PAD_LEFT);
    		
    		$plan = Db::name('plan_ssccq')->where('played_id='.$play_id.' and date='. $date .' and from_number='. $_from_number .' and to_number='.$_to_number)->find();
    		if(!$plan){
    			$data['played_id'] = $play_id;
    			$data['date'] = $date;
    			$data['plan_number'] = cmf_get_short_number(1, str_pad($from_number,3,'0',STR_PAD_LEFT)).'-'.cmf_get_short_number(1, str_pad($to_number,3,'0',STR_PAD_LEFT));
    			$data['from_number'] = $_from_number;
    			$data['to_number'] = $_to_number;
    			$data['data'] = $this->getRandNumber(1,8).'-'.$this->getRandNumber(1,8).'-'.$this->getRandNumber(1,8);
    			$data['create_time'] = time();
    			Db::name('plan_ssccq')->insert($data);
    		}
    	}
    }
    
    /**
     * 后三组六
     */
    private function H3Z6($play_id=13)
    {
    	$number=$this->getTypeNumber(1);
    	$date=intval(substr($number['action_number'],0,8));
    	$currentNumber=intval(substr($number['action_number'],8));
    
    	$from_number=0;
    	$to_number=0;
    
    	//当前期数为1
    	if($currentNumber == 1){
    		$from_number = 1;
    		$to_number= 3;
    	}else{
    		$plan = Db::name('plan_ssccq')->where('played_id='.$play_id.' and date='. $date .' and from_number<='. $number['action_number'] .' and to_number>='. $number['action_number'])->order("from_number DESC")->find();
    		if(!$plan){
    			$from_number = $currentNumber;
    			$to_number= $currentNumber+2;
    		}elseif($plan['number']!=''){
    			$from_number = intval(substr($plan['number'],8))+1;
    			$to_number= intval(substr($plan['number'],8))+3;
    		}
    	}
    
    	if($from_number > 0 && $to_number > 0){
    		$_from_number=$date.str_pad($from_number,3,'0',STR_PAD_LEFT);
    		$_to_number=$date.str_pad($to_number,3,'0',STR_PAD_LEFT);
    
    		$plan = Db::name('plan_ssccq')->where('played_id='.$play_id.' and date='. $date .' and from_number='. $_from_number .' and to_number='.$_to_number)->find();
    		if(!$plan){
    			$data['played_id'] = $play_id;
    			$data['date'] = $date;
    			$data['plan_number'] = cmf_get_short_number(1, str_pad($from_number,3,'0',STR_PAD_LEFT)).'-'.cmf_get_short_number(1, str_pad($to_number,3,'0',STR_PAD_LEFT));
    			$data['from_number'] = $_from_number;
    			$data['to_number'] = $_to_number;
    			$data['data'] = $this->getRandNumber(1,9);
    			$data['create_time'] = time();
    			Db::name('plan_ssccq')->insert($data);
    		}
    	}
    }
    
    /**
     * 不定位五星
     */
    private function BDW5X($play_id=7){
    	$number=$this->getTypeNumber(1);
    	$date=intval(substr($number['action_number'],0,8));
    	$currentNumber=intval(substr($number['action_number'],8));
    	
    	$from_number=0;
    	$to_number=0;
		
    	//当前期数为1
    	if($currentNumber == 1){
    		$from_number = 1;  
    		$to_number= 3;
    	}else{
    		$plan = Db::name('plan_ssccq')->where('played_id='.$play_id.' and date='. $date .' and from_number<='. $number['action_number'] .' and to_number>='. $number['action_number'])->order("from_number DESC")->find();
    		if(!$plan){
    			$from_number = $currentNumber;
    			$to_number= $currentNumber+2;
    		}elseif($plan['number']!=''){
    			$from_number = intval(substr($plan['number'],8))+1;
    			$to_number= intval(substr($plan['number'],8))+3;
    		}
    	}
    	
    	if($from_number > 0 && $to_number > 0){
    		$_from_number=$date.str_pad($from_number,3,'0',STR_PAD_LEFT);
    		$_to_number=$date.str_pad($to_number,3,'0',STR_PAD_LEFT);    		
    		
    		$plan = Db::name('plan_ssccq')->where('played_id='.$play_id.' and date='. $date .' and from_number='. $_from_number .' and to_number='.$_to_number)->find();
    		if(!$plan){
    			$data['played_id'] = $play_id;
    			$data['date'] = $date;
    			$data['plan_number'] = cmf_get_short_number(1, str_pad($from_number,3,'0',STR_PAD_LEFT)).'-'.cmf_get_short_number(1, str_pad($to_number,3,'0',STR_PAD_LEFT));
    			$data['from_number'] = $_from_number;
    			$data['to_number'] = $_to_number;
    			$data['data'] = $this->getRandNumber(1,1);
    			$data['create_time'] = time();
    			Db::name('plan_ssccq')->insert($data);
    		}
    	}
    }
    
    /**
     * 个位定位胆
     */
    private function DWGW($play_id=10){
    	$number=$this->getTypeNumber(1);
    	$date=intval(substr($number['action_number'],0,8));
    	$currentNumber=intval(substr($number['action_number'],8));
    	 
    	$from_number=0;  	
    	$to_number=0;
		
    	//当前期数为1
    	if($currentNumber == 1){
    		$from_number = 1;  
    		$to_number= 3;
    	}else{
    		$plan = Db::name('plan_ssccq')->where('played_id='.$play_id.' and date='. $date .' and from_number<='. $number['action_number'] .' and to_number>='. $number['action_number'])->order("from_number DESC")->find();
    		if(!$plan){
    			$from_number = $currentNumber;
    			$to_number= $currentNumber+2;
    		}elseif($plan['number']!=''){
    			$from_number = intval(substr($plan['number'],8))+1;
    			$to_number= intval(substr($plan['number'],8))+3;
    		}
    	}
    	 
    	if($from_number > 0 && $to_number > 0){
    		$_from_number=$date.str_pad($from_number,3,'0',STR_PAD_LEFT);
    		$_to_number=$date.str_pad($to_number,3,'0',STR_PAD_LEFT);
    		
    		$plan = Db::name('plan_ssccq')->where('played_id='.$play_id.' and date='. $date .' and from_number='. $_from_number .' and to_number='.$_to_number)->find();
    		if(!$plan){
    			$data['played_id'] = $play_id;
    			$data['date'] = $date;
    			$data['plan_number'] = cmf_get_short_number(1, str_pad($from_number,3,'0',STR_PAD_LEFT)).'-'.cmf_get_short_number(1, str_pad($to_number,3,'0',STR_PAD_LEFT));
    			$data['from_number'] = $_from_number;
    			$data['to_number'] = $_to_number;
    			$data['data'] = $this->getRandNumber(1,5);
    			$data['create_time'] = time();
    			Db::name('plan_ssccq')->insert($data);
    		}
    	}
    }
}
