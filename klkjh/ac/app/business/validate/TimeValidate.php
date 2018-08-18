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

class TimeValidate extends Validate
{
    protected $rule = [
        'action_number' => 'require',
        'action_time'  => 'require',
    ];

    protected $message = [
        'action_number.require' => '期数不能为空',
        'action_time.require'  => '开奖时间不能为空',
    ];

}