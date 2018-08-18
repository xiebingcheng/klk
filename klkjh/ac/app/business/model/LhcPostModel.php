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
namespace app\business\model;

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
	
	/**
	 * 添加文章分类
	 * @param $data
	 * @return bool
	 */
	public function addLhcArticle($data)
	{
		$result = true;
		self::startTrans();
		try {
			$data['create_time'] = time();
			$this->allowField(true)->save($data);
			self::commit();
		} catch (\Exception $e) {
			self::rollback();
			$result = false;
		}
		return $result;
	}
	
	public function editLhcArticle($data)
	{
		$result = true;
	
		$id          = intval($data['id']);
		$oldCategory = $this->where('id', $id)->find();
		 
		if (empty($oldCategory)) {
			$result = false;
		} else {
			if (!empty($data['icon'])) {
				$data['icon'] = cmf_asset_relative_url($data['icon']);
			}
			$this->isUpdate(true)->allowField(true)->save($data, ['id' => $id]);
		}
		return $result;
	}

}
