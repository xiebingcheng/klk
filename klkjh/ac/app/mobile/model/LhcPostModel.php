<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2018 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 老猫 <thinkcmf@126.com>
// +----------------------------------------------------------------------
namespace app\mobile\model;

use app\admin\model\RouteModel;
use think\Model;
use think\Db;

class LhcPostModel extends Model
{
	/**
	 * post_content 自动转化
	 * @param $value
	 * @return string
	 */
	public function getPostContentAttr($value)
	{
		return cmf_replace_content_file_url(htmlspecialchars_decode($value));
	}
	
	/**
	 * post_content 自动转化
	 * @param $value
	 * @return string
	 */
	public function setPostContentAttr($value)
	{
		return htmlspecialchars(cmf_replace_content_file_url(htmlspecialchars_decode($value), true));
	}

}
