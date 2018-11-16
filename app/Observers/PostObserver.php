<?php

namespace App\Observers;

use App\Models\Post;

class PostObserver
{
    public function saving(Post $post)
    {
        if (!$post->sub) {
            $post->sub = $post->title;
        }
        if (!$post->user_id) {
            $post->user_id = \Auth::guard('admin')->user()->id;
        }
    }
}
