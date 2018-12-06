<?php

namespace App\Http\Controllers;

use App\Models\Post;
use App\Services\PostService;
use Illuminate\Http\Request;
use TCG\Voyager\Models\Category;

class PostsController extends Controller
{
    protected $service;

    public function __construct(PostService $service)
    {
        $this->service = $service;
    }

    public function index(Request $request)
    {
        $category = null;
        if ($request->input('category')) {
            $category = Category::find($request->input('category'));
        }

        $posts = $this->service->index($category);
        return view('posts.index', ['posts' => $posts, 'category' => $category]);
    }

    public function show(Post $post)
    {
        visits($post)->increment();
        return view('posts.show', ['post' => $post]);
    }
}
