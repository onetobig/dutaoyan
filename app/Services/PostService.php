<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/11/19
 * Time: 16:38
 */

namespace App\Services;


use App\Models\Post;
use TCG\Voyager\Models\Category;

class PostService
{
    public function index($category)
    {
        $query = Post::query()->with(['category'])->orderby('id', 'desc');
        if ($category) {
            $query->where('category_id', $category->id);
        }
        return $query->paginate(16);
    }
}