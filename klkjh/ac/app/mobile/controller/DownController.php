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

class DownController extends HomeBaseController
{
    /**
     * 首页(公开)
     */
    public function index()
    {
    	return $this->fetch();
    }    
}
