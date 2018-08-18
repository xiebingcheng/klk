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
use tree\Tree;

class LhcCategoryModel extends Model
{

    protected $type = [
        'more' => 'array',
    ];

    /**
     * 生成分类 select树形结构
     * @param int $selectId 需要选中的分类 id
     * @param int $currentCid 需要隐藏的分类 id
     * @return string
     */
    public function adminLhcCategoryTree($selectId = 0)
    {
        $where = ['delete_time' => 0];
        $categories = $this->order("list_order DESC")->where($where)->select()->toArray();

        $str = '';
        foreach ($categories as $item) {
            $selected = $selectId == $item['id'] ? "selected" : "";
            $str .= '<option value="'.$item["id"].'" '.$selected.'>'.$item["name"].'</option>';
        }
        return $str;
    }
    
    /**
     * @param int|array $currentIds
     * @param string $tpl
     * @return string
     */
    public function adminLhcCategoryTableTree($currentIds = 0)
    {
    	$where = ['delete_time' => 0];
    	$categories = $this->order("list_order DESC")->where($where)->select()->toArray();
    
    	if (!is_array($currentIds)) {
    		$currentIds = [$currentIds];
    	}
		
    	$str = '';
    	foreach ($categories as $item) {
    		$item['checked'] = in_array($item['id'], $currentIds) ? "checked" : "";
    		$item['str_action'] = '<a href="' . url("AdminLhcCategory/edit", ["id" => $item['id']]) . '">' . lang('EDIT') . '</a>  <a class="js-ajax-delete" href="' . url("AdminLhcCategory/delete", ["id" => $item['id']]) . '">' . lang('DELETE') . '</a> ';
    		$str .= "<tr>
                        <td><input name='list_orders[".$item['id']."]' type='text' size='3' value='".$item['list_order']."' class='input-order' ".$item['checked']."></td>
                        <td>".$item['id']."</td>
                        <td>".$item['name']."</td>
                        <td>".$item['description']."</td>
                        <td>".$item['str_action']."</td>
                    </tr>";
    	}
    
    	return $str;
    }
    
    /**
     * 添加文章分类
     * @param $data
     * @return bool
     */
    public function addLhcCategory($data)
    {
    	$result = true;
    	self::startTrans();
    	try {
    		if (!empty($data['icon'])) {
    			$data['icon'] = cmf_asset_relative_url($data['icon']);
    		}
    		$this->allowField(true)->save($data);    		
    		self::commit();
    	} catch (\Exception $e) {
    		self::rollback();
    		$result = false;
    	}
    	return $result;
    }
    
    public function editLhcCategory($data)
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