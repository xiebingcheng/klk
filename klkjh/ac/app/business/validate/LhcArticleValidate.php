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

class LhcArticleValidate extends Validate
{
    protected $rule = [
        'category_id' => 'require',
        'post_number' => 'require',
        'post_title' => 'require',
    ];
    protected $message = [
        'category_id.require' => '请指定文章分类！',
        'post_number.require' => '文章期数不能为空！',
        'post_title.require' => '文章标题不能为空！'
    ];

    protected $scene = [
//        'add'  => ['user_login,user_pass,user_email'],
//        'edit' => ['user_login,user_email'],
    ];
}