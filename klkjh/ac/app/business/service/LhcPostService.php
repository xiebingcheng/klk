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
namespace app\business\service;

use app\business\model\LhcPostModel;

class LhcPostService
{

    public function adminLhcArticleList($filter)
    {
        return $this->adminLhcPostList($filter);
    }

    public function adminLhcPageList($filter)
    {
        return $this->adminLhcPostList($filter, true);
    }

    public function adminLhcPostList($filter, $isPage = false)
    {

        $where = [
            'a.create_time' => ['>=', 0],
            'a.delete_time' => 0,
            'c.status' => 1,
            'c.delete_time' => 0
        ];
        
        $join = [
        	['__LHC_CATEGORY__ c', 'a.category_id = c.id']
        ];

        $field = 'a.*,c.name as category_name';

        $category = empty($filter['category']) ? 0 : intval($filter['category']);
        if (!empty($category)) {
            $where['a.category_id'] = ['eq', $category];            
        }

        $startTime = empty($filter['start_time']) ? 0 : strtotime($filter['start_time']);
        $endTime   = empty($filter['end_time']) ? 0 : strtotime($filter['end_time']);
        if (!empty($startTime) && !empty($endTime)) {
            $where['a.create_time'] = [['>= time', $startTime], ['<= time', $endTime]];
        } else {
            if (!empty($startTime)) {
                $where['a.create_time'] = ['>= time', $startTime];
            }
            if (!empty($endTime)) {
                $where['a.create_time'] = ['<= time', $endTime];
            }
        }
        $number = empty($filter['number']) ? '' : $filter['number'];
        $keyword = empty($filter['keyword']) ? '' : $filter['keyword'];
        
        if (!empty($number)) {
        	$where['a.post_number'] = ['like', "%$number%"];
        }
        
        if (!empty($keyword)) {
            $where['a.post_title'] = ['like', "%$keyword%"];
        }

        $lhcPostModel = new LhcPostModel();
        $articles        = $lhcPostModel->alias('a')->field($field)
        	->join($join)
            ->where($where)
            ->order('a.post_number', 'DESC')
            ->paginate(10);

        return $articles;

    }

    public function publishedLhcArticle($postId, $categoryId = 0)
    {
        $lhcPostModel = new LhcPostModel();

        if (empty($categoryId)) {

            $where = [
                'post.post_type'      => 1,
                'post.published_time' => [['< time', time()], ['> time', 0]],
                'post.post_status'    => 1,
                'post.delete_time'    => 0,
                'post.id'             => $postId
            ];

            $article = $lhcPostModel->alias('post')->field('post.*')
                ->where($where)
                ->find();
        } else {
            $where = [
                'post.post_type'       => 1,
                'post.published_time'  => [['< time', time()], ['> time', 0]],
                'post.post_status'     => 1,
                'post.delete_time'     => 0,
                'relation.category_id' => $categoryId,
                'relation.post_id'     => $postId
            ];

            $join    = [
                ['__PORTAL_CATEGORY_POST__ relation', 'post.id = relation.post_id']
            ];
            $article = $lhcPostModel->alias('post')->field('post.*')
                ->join($join)
                ->where($where)
                ->find();
        }


        return $article;
    }

    public function publishedLhcPage($pageId)
    {

        $where = [
            'post_type'      => 2,
            'published_time' => [['< time', time()], ['> time', 0]],
            'post_status'    => 1,
            'delete_time'    => 0,
            'id'             => $pageId
        ];

        $lhcPostModel = new LhcPostModel();
        $page            = $lhcPostModel
            ->where($where)
            ->find();

        return $page;
    }

}