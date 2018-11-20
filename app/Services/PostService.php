<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/11/19
 * Time: 16:38
 */

namespace App\Services;


use App\Models\Post;

class PostService
{
    public function index()
    {
        return Post::query()->paginate(16);
    }
}