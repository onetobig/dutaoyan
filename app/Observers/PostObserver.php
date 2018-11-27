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
        if (!$post->published_at) {
            $post->published_at = now();
        }
        $post->excerpt = make_excerpt($post->content);
    }
}
