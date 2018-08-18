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
namespace app\business\validate;

use think\Validate;

class DataValidate extends Validate
{
    protected $rule = [
        'number' => 'require',
        'data'  => 'require',
    ];

    protected $message = [
        'number.require' => '期数不能为空',
        'data.require'  => '号码不能为空',
    ];

}